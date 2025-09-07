-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Command-S to save current buffer
vim.keymap.set({ "i", "x", "n", "s" }, "<D-s>", "<cmd>w<cr>", { desc = "Save file" })

-- Command-W to close current buffer
vim.keymap.set({ "i", "x", "n", "s" }, "<D-w>", "<cmd>q<cr>", { desc = "Close buffer" })

-- Tab controls
vim.keymap.set({ "i", "x", "n", "s" }, "<D-t>", ":tabnew<cr>", { desc = "New tab" })

-- Navigation
vim.keymap.set({ "n" }, "<C-h>", "10h", { desc = "Jump left" })
vim.keymap.set({ "n" }, "<C-j>", "5j", { desc = "Jump down" })
vim.keymap.set({ "n" }, "<C-k>", "5k", { desc = "Jump up" })
vim.keymap.set({ "n" }, "<C-l>", "10l", { desc = "Jump right" })

-- Copy & Paste
vim.keymap.set("v", "<D-c>", '"+y') -- Copy
vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
vim.keymap.set("i", "<D-v>", "<C-R>+") -- Paste insert mode

-- Yanky
vim.keymap.set("n", "<c-p>", "<Plug>(YankyPreviousEntry)")
vim.keymap.set("n", "<c-n>", "<Plug>(YankyNextEntry)")

-- Tab naviagation
vim.keymap.set("n", "<M-l>", ":tabnext<CR>")
vim.keymap.set("n", "<M-h>", ":tabprevious<CR>")
