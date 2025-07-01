-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Resize window using <ctrl> arrow keys
map("n", "<Nop>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<Nop>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<Nop>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<Nop>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move Lines
map("n", "<C-A-j>", ":m .+2<cr>==", { desc = "Move down", silent = true })
map("v", "<C-A-j>", ":m '>+2<cr>gv=gv", { desc = "Move down", silent = true })
map("i", "<C-A-j>", "<Esc>:m .+1<cr>==gi", { desc = "Move down", silent = true })
map("n", "<C-A-Down>", ":m .+1<cr>==", { desc = "Move down", silent = true })
map("v", "<C-A-Down>", ":m '>+2<cr>gv=gv", { desc = "Move down", silent = true })
map("i", "<C-A-Down>", "<Esc>:m .+1<cr>==gi", { desc = "Move down", silent = true })
map("n", "<C-A-k>", ":m .0<cr>==", { desc = "Move up", silent = true })
map("v", "<C-A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up", silent = true })
map("i", "<C-A-k>", "<Esc>:m .-2<cr>==gi", { desc = "Move up", silent = true })
map("n", "<C-A-Up>", ":m .-2<cr>==", { desc = "Move up", silent = true })
map("v", "<C-A-Up>", ":m '<-2<cr>gv=gv", { desc = "Move up", silent = true })
map("i", "<C-A-Up>", "<Esc>:m .-2<cr>==gi", { desc = "Move up", silent = true })
