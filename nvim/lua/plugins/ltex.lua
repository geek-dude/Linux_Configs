return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Disable old LTEX too, just in case something still refers to it.
        ltex = {
          enabled = false,
        },

        -- This is the actual LTEX-plus server.
        ltex_plus = {
          enabled = false,
          filetypes = {
            "bib",
            "gitcommit",
            "markdown",
            "org",
            "plaintex",
            "rst",
            "rnoweb",
            "tex",
            "pandoc",
          },
          settings = {
            ltex = {
              language = "en-US",
            },
          },
        },
      },
    },
    keys = {
      {
        "<leader>ue",
        function()
          vim.lsp.enable("ltex_plus", true)
          vim.notify("Enabled LTEX-plus for current and future matching buffers")
        end,
        desc = "Enable LTEX-plus",
      },
      {
        "<leader>uE",
        function()
          vim.lsp.enable("ltex_plus", false)
          vim.notify("Disabled LTEX-plus")
        end,
        desc = "Disable LTEX-plus",
      },
    },
  },
}
