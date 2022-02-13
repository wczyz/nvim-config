local nvim_lsp = require("lspconfig")

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

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

nvim_lsp.tsserver.setup{
    capabilities = capabilities,
}

nvim_lsp.jsonls.setup{
    capabilities = capabilities,
}

nvim_lsp.pyright.setup{
    capabilities = capabilities,
}

nvim_lsp.hls.setup{
    capabilities = capabilities,
}

nvim_lsp.texlab.setup{
    capabilities = capabilities,
    settings = {
        texlab = {
            build = {onSave = true}
        }
    }
}

require('idris2').setup({})

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
