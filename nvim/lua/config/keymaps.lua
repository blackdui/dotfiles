-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "jk", "<ESC>", { silent = true })
-- 按 ESC 取消搜索高亮
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { silent = true })
-- leader + w 保存
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })
-- leader + q 关闭buffer
vim.keymap.set("n", "<leader>q", "<cmd>bdelete<cr>", { desc = "Close buffer" })

-- 窗口切换 Ctrl+hjkl
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go down window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go up window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go right window" })
