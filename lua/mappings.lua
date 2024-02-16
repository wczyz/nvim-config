local map = vim.api.nvim_set_keymap
local options = { noremap = true }

map("t", "<Esc>", "<C-\\><C-n>", options) -- Terminal mode
