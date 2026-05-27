-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Full-buffer terminal toggle instead of LazyVim's bottom terminal panel

function _G.toggle_terminal_buffer()
  -- If currently in a terminal buffer, go back to alternate buffer
  if vim.bo.buftype == "terminal" then
    vim.cmd("b#")
    return
  end

  -- Reuse an existing terminal buffer if present
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buftype == "terminal" then
      vim.api.nvim_set_current_buf(buf)
      vim.cmd("startinsert")
      return
    end
  end

  -- Otherwise create a new full-buffer terminal
  vim.cmd("terminal")
  vim.cmd("startinsert")
end

-- Remove LazyVim's default Ctrl-/ terminal mappings if they exist
for _, mode in ipairs({ "n", "t" }) do
  pcall(vim.keymap.del, mode, "<C-/>")
  pcall(vim.keymap.del, mode, "<C-_>")
end

-- Normal mode
vim.keymap.set("n", "<C-/>", _G.toggle_terminal_buffer, { desc = "Toggle terminal buffer" })
vim.keymap.set("n", "<C-_>", _G.toggle_terminal_buffer, { desc = "Toggle terminal buffer" })

-- Terminal mode
vim.keymap.set("t", "<C-/>", [[<C-\><C-n><cmd>lua toggle_terminal_buffer()<cr>]], {
  desc = "Toggle terminal buffer",
})

vim.keymap.set("t", "<C-_>", [[<C-\><C-n><cmd>lua toggle_terminal_buffer()<cr>]], {
  desc = "Toggle terminal buffer",
})
