local o = vim.opt
local wo = vim.wo
local fn = vim.fn

vim.cmd "filetype indent plugin on"
-- vim.cmd "set inccommand=split"
vim.cmd "syntax on"
o.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50" -- block in normal and beam cursor in insert mode
vim.cmd "colorscheme nightfox"

vim.g.mapleader = " "   -- set leader to space

o.updatetime = 300	    -- faster completion
o.timeoutlen = 400  	-- time to wait for a mapped sequence to complete (in milliseconds)
o.ttimeoutlen = 0   	-- time in milliseconds to wait for a key code sequence to complete
o.backup = false     	-- creates a backup file
o.swapfile = true   	-- enable/disable swap file creation
o.showmode = false  	-- "-- INSERT -- " message is not needed when we have lualine
o.tabstop = 4		    -- tab width
o.shiftwidth = 4 	    -- indentation width
o.expandtab = true	    -- convert tabs to spaces
o.splitright = true 	-- force all vertical splits to show on the right
o.splitbelow = true 	-- force all horizontal split to show on the bottom
o.termguicolors = true 	-- enable term gui colors
o.number = true         -- set numbered lines
o.completeopt = {"menu", "menuone", "noselect", "noinsert"} -- comma separated list of options for Insert mode completion
o.wrap = false         -- don't wrap lines


wo.colorcolumn = "120"  -- show column width line at 120 characters
