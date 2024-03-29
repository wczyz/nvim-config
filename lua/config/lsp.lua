local nvim_lsp = require("lspconfig")

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

nvim_lsp.ccls.setup {
    capabilities = capabilities,
    init_options = {
        compilationDatabaseDirectory = "build";
        index = {
            threads = 0;
        };
        clang = {
            extraArgs = { "-std=c++20" };
        };
        filetypes = {"c", "cc", "cpp", "c++", "objc", "objcpp"};
    }
}

nvim_lsp.gopls.setup {
    capabilities = capabilities,
    cmd = {"gopls", "serve"},
    settings = {
        gopls = {
            analyses = {
                unusedparams = true
            },
            staticcheck = true,
        },
    }
}

nvim_lsp.elmls.setup{}

local util = require 'lspconfig.util'
local function get_typescript_server_path(root_dir)

  local global_ts = '/home/wiktor/.nvm/versions/node/v18.7.0/lib/node_modules/typescript/lib'
  -- Alternative location if installed as root:
  -- local global_ts = '/usr/local/lib/node_modules/typescript/lib'
  local found_ts = ''
  local function check_dir(path)
    found_ts =  util.path.join(path, 'node_modules', 'typescript', 'lib')
    if util.path.exists(found_ts) then
      return path
    end
  end
  if util.search_ancestors(root_dir, check_dir) then
    return found_ts
  else
    return global_ts
  end
end

require'lspconfig'.volar.setup{
  on_new_config = function(new_config, new_root_dir)
    new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
  end,
}

nvim_lsp.tsserver.setup{
    capabilities = capabilities,
}

nvim_lsp.jsonls.setup{
    capabilities = capabilities,
}

nvim_lsp.pyright.setup{
    capabilities = capabilities,
}

nvim_lsp.docker_compose_language_service.setup{}

nvim_lsp.dockerls.setup{}

-- nvim_lsp.hls.setup{
--     capabilities = capabilities,
-- }
--
local ht = require('haskell-tools')
local def_opts = { noremap = true, silent = true, }
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

vim.g.haskell_tools = {
  ---@type HaskellLspClientOpts
  hls = {
    capabilities=capabilities,
    -- See nvim-lspconfig's  suggested configuration for keymaps, etc.
    on_attach = function(client, bufnr)
      local opts = vim.tbl_extend('keep', def_opts, { buffer = bufnr, })
      -- haskell-language-server relies heavily on codeLenses,
      -- so auto-refresh (see advanced configuration) is enabled by default
      vim.keymap.set('n', '<space>ca', vim.lsp.codelens.run, opts)
      vim.keymap.set('n', '<space>hs', ht.hoogle.hoogle_signature, opts)
      -- default_on_attach(client, bufnr)  -- if defined, see nvim-lspconfig
    end,
    settings = {
        haskell = {
            formattingProvider = 'fourmolu',
        }
    },
  },
}

-- Suggested keymaps that do not depend on haskell-language-server
-- Toggle a GHCi repl for the current package
vim.keymap.set('n', '<leader>rr', ht.repl.toggle, def_opts)
-- Toggle a GHCi repl for the current buffer
vim.keymap.set('n', '<leader>rf', function()
  ht.repl.toggle(vim.api.nvim_buf_get_name(0))
end, def_opts)
vim.keymap.set('n', '<leader>rq', ht.repl.quit, def_opts)
vim.keymap.set('n', '<space>ca', vim.lsp.codelens.run, opts) 

nvim_lsp.texlab.setup{
    capabilities = capabilities,
    settings = {
        texlab = {
            build = {onSave = true}
        }
    }
}

require('idris2').setup({})

require('rust-tools').setup({
    settings = {
        ["rust-analyzer"] = {
            diagnostics = {
                disabled = {"unresolved-proc-macro"}
            },
        }
    }
})

-- nvim_lsp.ltex.setup{}

-- zk-nvim plugins does it for us
-- nvim_lsp.zk.setup{
--     capabilities = capabilities,
-- }


--local servers = {
--    "gopls", "bashls", "jedi_language_server", "dockerls",
--    "tsserver", "yamlls", "jsonls", "ccls"
--}
--for _, lsp in ipairs(servers) do
--    nvim_lsp[lsp].setup {
--        capabilities = capabilities,
--        settings = {
--            gopls = {analyses = {unusedparams = false}, staticcheck = true},
--            json = {
--                format = {enabled = false},
--                schemas = {
--                    {
--                        description = "ESLint config",
--                        fileMatch = {".eslintrc.json", ".eslintrc"},
--                        url = "http://json.schemastore.org/eslintrc"
--                    }, {
--                        description = "Package config",
--                        fileMatch = {"package.json"},
--                        url = "https://json.schemastore.org/package"
--                    }, {
--                        description = "Packer config",
--                        fileMatch = {"packer.json"},
--                        url = "https://json.schemastore.org/packer"
--                    }, {
--                        description = "Renovate config",
--                        fileMatch = {
--                            "renovate.json", "renovate.json5",
--                            ".github/renovate.json", ".github/renovate.json5",
--                            ".renovaterc", ".renovaterc.json"
--                        },
--                        url = "https://docs.renovatebot.com/renovate-schema"
--                    }, {
--                        description = "OpenApi config",
--                        fileMatch = {"*api*.json"},
--                        url = "https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"
--                    }
--                }
--            },
--            redhat = {telemetry = {enabled = false}},
--            texlab = {
--                auxDirectory = ".",
--                bibtexFormatter = "texlab",
--                build = {
--                    args = {
--                        "--keep-intermediates", "--keep-logs", "--synctex", "%f"
--                    },
--                    executable = "tectonic",
--                    forwardSearchAfter = false,
--                    onSave = false
--                },
--                chktex = {onEdit = false, onOpenAndSave = false},
--                diagnosticsDelay = 300,
--                formatterLineLength = 80,
--                forwardSearch = {args = {}},
--                latexFormatter = "latexindent",
--                latexindent = {modifyLineBreaks = false}
--            },
--            yaml = {
--                schemaStore = {
--                    enable = true,
--                    url = "https://www.schemastore.org/api/json/catalog.json"
--                },
--                schemas = {
--                    kubernetes = "/*.yaml",
--                    ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
--                    ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
--                    ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
--                    ["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
--                    ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
--                    ["http://json.schemastore.org/ansible-playbook"] = "*play*.{yml,yaml}",
--                    ["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
--                    ["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
--                    ["https://json.schemastore.org/gitlab-ci"] = "*gitlab-ci*.{yml,yaml}",
--                    ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",
--                    ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose.{yml,yaml}",
--                    ["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "*flow*.{yml,yaml}"
--                },
--                format = {enabled = false},
--                validate = false, -- TODO: conflicts between Kubernetes resources and kustomization.yaml
--                completion = true,
--                hover = true
--            },
--            ccls = {
--                command = "ccls",
--                args = ["--log-file=/tmp/ccls.log", "-v=1"],
--                filetypes = ["c", "cc", "cpp", "c++", "objc", "objcpp"],
--                rootPatterns = [".ccls", "compile_commands.json"],
--                initializationOptions = {
--                    cache = {
--                        directory = "/tmp/ccls"
--                    },
--                    client = {
--                        snippetSupport = true
--                    },
--                    highlight = { lsRanges = true }
--                },
--                extraArgs = [ "-std=c++20" ]
--            }
--        },
--        flags = {debounce_text_changes = 150}
--    }
--    require"lsp_signature".setup({
--        bind = true, -- This is mandatory, otherwise border config won't get registered.
--        floating_window = true, -- show hint in a floating window, set to false for virtual text only mode
--        doc_lines = 2, -- Set to 0 for not showing doc
--        hint_prefix = "🐼 ",
--        -- use_lspsaga = false,  -- set to true if you want to use lspsaga popup
--        handler_opts = {
--            border = "shadow" -- double, single, shadow, none
--        }
--    })
--end

--local sumneko_root_path = os.getenv("HOME") .. ".cache/lua-language-server"
--local sumneko_binary = "/usr/bin/lua-language-server"
--require "lspconfig".sumneko_lua.setup {
--    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
--    capabilities = capabilities,
--    on_attach = on_attach,
--    settings = {
--        Lua = {
--            runtime = {version = "LuaJIT", path = vim.split(package.path, ";")},
--            completion = {enable = true, callSnippet = "Both"},
--            diagnostics = {
--                enable = true,
--                globals = {"vim", "describe"},
--                disable = {"lowercase-global"}
--            },
--            workspace = {
--                library = {
--                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
--                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
--                    [vim.fn.expand("/usr/share/awesome/lib")] = true
--                },
--                -- adjust these two values if your performance is not optimal
--                maxPreload = 2000,
--                preloadFileSize = 1000
--            },
--            telemetry = {enable = false}
--        }
--    }
--}
