-- Plugin management with Packer
require("plugins")

-- Mappings, documented in lua/config/which.lua
require("mappings")

-- Non plugin related options
require("options")

-- Vim autocommands/autogroups
require("autocmd")


-- markdown-preview plugin setup with vim-plug for now
-- local Plug = vim.fn['plug#']
-- vim.call('plug#begin', '~/.config/nvim/autoload/plugged')
--     Plug('iamcco/markdown-preview.nvim', { ['do'] = 'cd app && yarn install' })
-- vim.call('plug#end')
