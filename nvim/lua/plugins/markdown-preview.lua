return {
  "iamcco/markdown-preview.nvim",
  ft = { "markdown", "vimwiki" },
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
  init = function()
    vim.g.mkdp_filetypes = { "markdown", "vimwiki" }
  end,
}
