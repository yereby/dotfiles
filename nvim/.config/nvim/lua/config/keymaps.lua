vim.keymap.set("n", "<leader>w", "<Cmd>w<CR>", {})      -- Write the file
vim.keymap.set("n", "<leader>q", "<Cmd>q<CR>", {})      -- Close the buffer
vim.keymap.set("n", "<leader>h", "<Cmd>nohlsearch<CR>") -- Cleaning search highlights

-- Escaping
vim.keymap.set("i", "jk", "<Esc>", {})
vim.keymap.set("i", "jj", "<Esc>", {})

-- Navigation between panes
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Window Management
vim.keymap.set("n", "<C-Up>", "<Cmd>resize +2<CR>")
vim.keymap.set("n", "<C-Down>", "<Cmd>resize -2<CR>")
vim.keymap.set("n", "<C-Left>", "<Cmd>vertical resize +2<CR>")
vim.keymap.set("n", "<C-Right>", "<Cmd>vertical resize -2<CR>")

-- Indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
