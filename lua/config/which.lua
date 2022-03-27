local wk = require("which-key")
default_options = {noremap = true, silent = true}

-- register non leader based mappings
wk.register({
    ga = {"<Plug>(EasyAlign)", "Align", mode = "x"},
    [";"] = {
        "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'fd', '--type', 'file', '--follow'}})<cr>",
        "Find File"
    },
    gd = {"<cmd>lua vim.lsp.buf.definition()<cr>", "Go To Definition"},
    K = {"<cmd>lua vim.lsp.buf.hover()<cr>", "Hover Commands"},
})

-- Register all leader based mappings
wk.register({
    ["<Tab>"] = {"<cmd>e#<cr>", "Switch to previously opened buffer"},
    b = {
        name = "Buffers",
        b = {
            "<cmd>lua require'telescope.builtin'.buffers({ sort_mru = true, ignore_current_buffer = true })<cr>",
            "Find buffer"
        },
        d = {"<cmd>Bdelete!<CR>", "Close Buffer"},
        f = {"<cmd>BufferLinePick<cr>", "Pick buffer"},
        l = {"<cmd>BufferLineCloseLeft<cr>", "close all buffers to the left"},
        p = {"<cmd>BufferLineMovePrev<cr>", "Move buffer prev"},
        n = {"<cmd>BufferLineMoveNext<cr>", "Move buffer next"},
        r = {
            "<cmd>BufferLineCloseRight<cr>",
            "close all BufferLines to the right"
        },
        x = {
            "<cmd>BufferLineSortByDirectory<cr>",
            "sort BufferLines automatically by directory"
        },
        L = {
            "<cmd>BufferLineSortByExtension<cr>",
            "sort BufferLines automatically by extension"
        }
    },
    f = {
        name = "Files",
        b = {"<cmd>Telescope file_browser<cr>", "File browser"},
        c = {"<cmd>Telescope file_browser path=%:p:h<cr>", "File browser"},
        f = {
            "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'fd', '--hidden', '--type', 'file', '--follow'}})<cr>",
            "Find File"
        },
        l = {"<cmd>Lf<cr>", "Open LF"},
        p = {"<cmd>NvimTreeToggle<cr>", "Toogle Tree"},
        r = {"<cmd>Telescope oldfiles<cr>", "Open Recent File"},
        s = {"<cmd>w<cr>", "Save Buffer"},
        T = {"<cmd>NvimTreeFindFile<CR>", "Find in Tree"},
        z = {"<cmd>Telescope zoxide list<CR>", "Zoxide"}
    },
    g = {
        name = "Git",
        j = {"<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk"},
        k = {"<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk"},
        p = {"<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk"},
        r = {"<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk"},
        R = {"<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer"},
        s = {"<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk"},
        t = "Open Gitui", -- comand in toggleterm.lua
        n = {"<cmd>Neogit<cr>", "Open Neogit"},
        u = {
            "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
            "Undo Stage Hunk"
        },
        g = {"<cmd>Telescope git_status<cr>", "Open changed file"},
        b = {"<cmd>Telescope git_branches<cr>", "Checkout branch"},
        B = {"<cmd>GitBlameToggle<cr>", "Toogle Blame"},
        c = {"<cmd>Telescope git_commits<cr>", "Checkout commit"},
        C = {
            "<cmd>Telescope git_bcommits<cr>",
            "Checkout commit(for current file)"
        }
    },
    h = {
        name = "Harpoon",
        a = {"<cmd>lua require('harpoon.mark').add_file()<cr>", "Add file"},
        u = {
            "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
            "Open Menu"
        },
        ["1"] = {
            "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", "Open File 1"
        },
        ["2"] = {
            "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", "Open File 2"
        },
        ["3"] = {
            "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", "Open File 3"
        },
        ["4"] = {
            "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", "Open File 4"
        }
    },
    j = {
        name = "jump",
        c = {"<cmd>lua require'hop'.hint_char2()<cr>", "2 Chars"},
        l = {"<cmd>lua require'hop'.hint_lines()<cr>", "Lines"},
        w = {"<cmd>lua require'hop'.hint_words()<cr>", "Words"}
    },
    l = {
        name = "LSP",
        A = {
            "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>",
            "Add Workspace Folder"
        },
        D = {"<cmd>lua vim.lsp.buf.declaration()<cr>", "Go To Declaration"},
        I = {
            "<cmd>lua vim.lsp.buf.implementation()<cr>", "Show implementations"
        },
        K = {"<cmd>lua vim.lsp.buf.hover()<cr>", "Hover Commands"},
        L = {
            "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>",
            "List Workspace Folders"
        },
        R = {"<cmd>lua vim.lsp.buf.rename()<cr>", "Rename"},
        S = {
            "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
            "Workspace Symbols"
        },
        W = {
            "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>",
            "Remove Workspace Folder"
        },
        a = {"<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action"},
        d = {"<cmd>lua vim.lsp.buf.definition()<cr>", "Go To Definition"},
        e = {"<cmd>Telescope diagnostics bufnr=0<cr>", "Document Diagnostics"},
        f = {"<cmd>lua vim.lsp.buf.formatting()<cr>", "Format"},
        i = {"<cmd><cr>", "Connected Language Servers"},
        k = {"<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help"},
        l = {
            "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>",
            "Line diagnostics"
        },
        n = {"<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic"},
        p = {"<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic"},
        q = {"<cmd>lua vim.diagnostic.set_loclist()<cr>", "Quickfix"},
        r = {"<cmd>lua vim.lsp.buf.references()<cr>", "References"},
        s = {"<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols"},
        t = {"<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type Definition"},
        w = {"<cmd>Telescope diagnostics<cr>", "Workspace Diagnostics"}
    },
    m = {"<cmd>MarkdownPreview<CR>", "Markdown Preview"},
    -- m = {
    --     name = "Misc",
    --     t = {"<cmd>FloatermNew --autoclose=2<cr>", "New Floaterm"},
    --     s = {"<cmd>SymbolsOutline<cr>", "Toggle SymbolsOutline"},
    --     z = {"<cmd>ZenMode<cr>", "Toggle ZenMode"}
    -- },
    s = {
        name = "Search",
        c = {"<cmd>Telescope colorscheme<cr>", "Colorscheme"},
        h = {"<cmd>Telescope help_tags<cr>", "Find Help"},
        H = {"<cmd>Telescope heading<cr>", "Find Header"},
        M = {"<cmd>Telescope man_pages<cr>", "Man Pages"},
        R = {"<cmd>Telescope registers<cr>", "Registers"},
        t = {"<cmd>Telescope live_grep<cr>", "Text"},
        s = {"<cmd>Telescope grep_string<cr>", "Text under cursor"},
        k = {"<cmd>Telescope keymaps<cr>", "Keymaps"},
        C = {"<cmd>Telescope commands<cr>", "Commands"},
        p = {"<cmd>Telescope projects<cr>", "Projects"},
        P = {
            "<cmd>lua require('telescope.builtin.internal').colorscheme({enable_preview = true})<cr>",
            "Colorscheme with Preview"
        }
    },
    t = {
        name = "Trouble",
        w = {
            "<cmd>Trouble lsp_workspace_diagnostics<cr>",
            "Workspace Diagnostics"
        },
        d = {"<cmd>Trouble lsp_document_diagnostics<cr>", "Document Diagnostic"},
        l = {"<cmd>Trouble loclist<cr>", "Loclist"},
        q = {"<cmd>Trouble quickfix<cr>", "Quickfix"},
        t = {"<cmd>TodoTrouble<cr>", "Todos"},
        r = {"<cmd>Trouble lsp_references<cr>", "LSP References"}
    },
    w = {
        name = "Window",
        q = {"<cmd>:q<cr>", "Close"},
        s = {"<cmd>:split<cr>", "Horizontal Split"},
        t = {"<c-w>t", "Move to new tab"},
        ["="] = {"<c-w>=", "Equally size"},
        v = {"<cmd>:vsplit<cr>", "Verstical Split"},
        w = {"<c-w>x", "Swap"}
    },
    x = {
        name = "LanguageTool",
        c = {"<cmd>GrammarousCheck<cr>", "Grammar check"},
        i = {"<Plug>(grammarous-open-info-window)", "Open the info window"},
        r = {"<Plug>(grammarous-reset)", "Reset the current check"},
        f = {"<Plug>(grammarous-fixit)", "Fix the error under the cursor"},
        x = {
            "<Plug>(grammarous-close-info-window)",
            "Close the information window"
        },
        e = {
            "<Plug>(grammarous-remove-error)",
            "Remove the error under the cursor"
        },
        n = {
            "<Plug>(grammarous-move-to-next-error)",
            "Move cursor to the next error"
        },
        p = {
            "<Plug>(grammarous-move-to-previous-error)",
            "Move cursor to the previous error"
        },
        d = {
            "<Plug>(grammarous-disable-rule)",
            "Disable the grammar rule under the cursor"
        }
    },
    z = {
        name = "Spelling",
        n = {"]s", "Next"},
        p = {"[s", "Previous"},
        a = {"zg", "Add word"},
        f = {"1z=", "Use 1. correction"},
        l = {"<cmd>Telescope spell_suggest<cr>", "List corrections"},
        c = {"<cmd>lua require('zk').new()<CR>", "Create new note"},
        n = {"<cmd>lua require('zk.commands').get('ZkNotes')()<CR>", "List notes"},
        o = {"<cmd>ZkOrphans<CR>", "List orphans"},
        b = {"<cmd>ZkBacklinks<CR>", "Backlinks"},
        l = {"<cmd>ZkLinks<CR>", "Links"},
        t = {"<cmd>ZkTags<CR>", "Tags"}
    }
}, {prefix = "<leader>", mode = "n", default_options})

wk.register({
    z = {
        c = {":'<'>ZkNewFromTitleSelection<CR>", "Create new link"},
    }
}, {prefix = "<leader>", mode = "x", default_options})
