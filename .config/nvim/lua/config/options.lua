-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt
local o = vim.o

vim.filetype.add({
	filename = {
		[".sqlfluff"] = "toml",
	},
})

opt.number = false
opt.relativenumber = false
opt.listchars:append({
	-- eol = '↲',
	space = " ",
	tab = "→\\ ",
	trail = "_",
	nbsp = "␣",
	extends = "›",
	precedes = "‹",
})
opt.scrolloff = 0

-- UFO
o.foldcolumn = "1"
o.foldlevel = 99
o.foldlevelstart = 99
o.foldenable = true
o.pumblend = 0
o.winblend = 0
