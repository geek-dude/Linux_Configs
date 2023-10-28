-- <Space> as leader
vim.g.mapleader = ' '

-- Move visual mode selection
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move visual mode selection down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move visual mode selection up' })

-- Window navigation
vim.keymap.set("n", "<A-h>", "<C-w>h")
vim.keymap.set("n", "<A-j>", "<C-w>j")
vim.keymap.set("n", "<A-k>", "<C-w>k")
vim.keymap.set("n", "<A-l>", "<C-w>l")
vim.keymap.set("n", "<A-H>", "<C-w>H")
vim.keymap.set("n", "<A-J>", "<C-w>J")
vim.keymap.set("n", "<A-K>", "<C-w>K")
vim.keymap.set("n", "<A-L>", "<C-w>L")
vim.keymap.set("n", "<A-T>", "<C-w>T")


-- Commandline mode movement
vim.keymap.set('c', '<C-F>', '<Right>', { desc = 'move [F]orward' })
vim.keymap.set('c', '<C-B>', '<Left>', { desc = 'move [B]ackward' })
