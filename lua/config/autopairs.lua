enable_check_bracket_line = false
local status_ok = pcall(require, "nvim-autopairs")
if not status_ok then
    return
end
local npairs = require "nvim-autopairs"

npairs.setup {
    check_ts = true,
    ts_config = {
        lua = {"string"}, -- it will not add pair on that treesitter node
        javascript = {"template_string"},
        java = false -- don't check treesitter on java
    }
}

-- Think about it

---- If you want insert `(` after select function or method item
--local cmp_autopairs = require('nvim-autopairs.completion.cmp')
--local cmp = require('cmp')
--cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))
--
--
---- add a lisp filetype (wrap my-function), FYI: Hardcoded = { "clojure", "clojurescript", "fennel", "janet" }
--cmp_autopairs.lisp[#cmp_autopairs.lisp+1] = "racket"
