return {
  "gaoDean/autolist.nvim",
  ft = { "markdown", "vimwiki", "text" },
  config = function()
    require("autolist").setup()

    vim.keymap.set("i", "<CR>", "<CR><cmd>AutolistNewBullet<cr>", { silent = true })
    vim.keymap.set("n", "o", "o<cmd>AutolistNewBullet<cr>", { silent = true })
    vim.keymap.set("n", "O", "O<cmd>AutolistNewBulletBefore<cr>", { silent = true })
  end,
}
