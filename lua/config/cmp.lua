-- Setup nvim-cmp.
local cmp = require "cmp"
local lspkind = require("lspkind")

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0
               and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(
                   col, col):match("%s") == nil
end

local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true),
                          mode, true)
end

lspkind.init({
    symbol_map = {
        Text = "",
        Method = "",
        Function = "",
        Constructor = "",
        Field = "ﰠ",
        Variable = "",
        Class = "ﴯ",
        Interface = "",
        Module = "",
        Property = "ﰠ",
        Unit = "塞",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "פּ",
        Event = "",
        Operator = "",
        TypeParameter = ""
    }
})

cmp.setup({
    formatting = {
        format = lspkind.cmp_format {
            with_text = false,
            maxwidth = 50,
            menu = {
                buffer = "BUF",
                nvim_lsp = "LSP",
                path = "PATH",
                vsnip = "SNIP",
                calc = "CALC",
                spell = "SPELL",
                emoji = "EMOJI"
            }
        }
    },
    experimental = {native_menu = false, ghost_text = true},
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = false
        },
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif vim.fn["vsnip#available"](1) == 1 then
                feedkey("<Plug>(vsnip-expand-or-jump)", "")
            elseif has_words_before() then
                cmp.complete()
            else
                fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
            end
        end, {"i", "s"}),
        ["<S-Tab>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item()
            elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                feedkey("<Plug>(vsnip-jump-prev)", "")
            end
        end, {"i", "s"})
    },
    sources = {
        {name = "gh_issues" },
        {name = "nvim_lua"},
        {name = "nvim_lsp"},
        {name = "path"},
        {name = "luasnip"},
        {name = "buffer", keyword_length = 5},
    }
})

-- Use buffer source for `/`.
cmp.setup.cmdline("/", {sources = {{name = "buffer"}}})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(":", {
    sources = cmp.config.sources({{name = "path"}}, {{name = "cmdline"}})
})

--local cmp = require'cmp'
--
--cmp.setup({
--snippet = {
--  -- REQUIRED - you must specify a snippet engine
--  expand = function(args)
--    -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
--        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
--    -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
--    -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
--  end,
--},
--mapping = {
--  ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
--  ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
--  ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
--  ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
--  ['<C-e>'] = cmp.mapping({
--    i = cmp.mapping.abort(),
--    c = cmp.mapping.close(),
--  }),
--  -- Accept currently selected item. If none selected, `select` first item.
--  -- Set `select` to `false` to only confirm explicitly selected items.
--  ['<CR>'] = cmp.mapping.confirm({ select = true }),
--},
--sources = cmp.config.sources({
--  { name = 'nvim_lsp' },
--  -- { name = 'vsnip' }, -- For vsnip users.
--  { name = 'luasnip' }, -- For luasnip users.
--  -- { name = 'ultisnips' }, -- For ultisnips users.
--  -- { name = 'snippy' }, -- For snippy users.
--}, {
--  { name = 'buffer' },
--})
--})
--
---- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
--cmp.setup.cmdline('/', {
--sources = {
--  { name = 'buffer' }
--}
--})
--
---- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
--cmp.setup.cmdline(':', {
--sources = cmp.config.sources({
--  { name = 'path' }
--}, {
--  { name = 'cmdline' }
--})
--})
--
