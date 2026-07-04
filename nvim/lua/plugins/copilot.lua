return {
  {
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = false,
      },
      panel = {
        enabled = false,
      },
    },
    config = function(_, opts)
      require("copilot").setup(opts)

      -- Start every fresh Neovim session with Copilot disabled.
      vim.schedule(function()
        pcall(vim.cmd, "Copilot disable")
      end)
    end,
    keys = {
      {
        "<leader>ac",
        function()
          vim.cmd("Copilot enable")
          vim.notify("Copilot enabled")
        end,
        desc = "Enable Copilot",
      },
      {
        "<leader>aC",
        function()
          vim.cmd("Copilot disable")
          vim.notify("Copilot disabled")
        end,
        desc = "Disable Copilot",
      },
    },
  },

  {
    "folke/sidekick.nvim",
    opts = {
      nes = {
        enabled = false,
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        copilot = {
          enabled = false,
        },
      },
    },
  },
}
