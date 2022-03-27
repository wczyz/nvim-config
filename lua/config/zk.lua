local zk = require("zk")
local commands = require("zk.commands")
local util = require("zk.util")

zk.setup({
    picker = "telescope",
    -- create user commands such as :ZkNew
    create_user_commands = true,

    lsp = {
      -- `config` is passed to `vim.lsp.start_client(config)`
      config = {
        cmd = { "zk", "lsp" },
        name = "zk",
        -- init_options = ...
        -- on_attach = ...
        -- etc, see `:h vim.lsp.start_client()`
      },

      -- automatically attach buffers in a zk notebook that match the given filetypes
      auto_attach = {
        enabled = true,
        filetypes = { "markdown" },
      },
    },
})

local function make_edit_fn(defaults, picker_options)
  return function(options)
    options = vim.tbl_extend("force", defaults, options or {})
    zk.edit(options, picker_options)
  end
end

commands.add("ZkOrphans", make_edit_fn({ orphan = true }, { title = "Zk Orphans" }))
commands.add("ZkRecents", make_edit_fn({ createdAfter = "2 weeks ago" }, { title = "Zk Recents" }))

commands.add("ZkLink", function(options)
  local location = vim.api.nvim_win_get_cursor(0)
  -- zk.new(vim.tbl_extend("force", { insertLinkAtLocation = location, }, options or {}))
  zk.pick_notes({}, {}, function(x) print(x) end)
end)
