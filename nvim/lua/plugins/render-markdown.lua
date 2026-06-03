return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = { "markdown", "vimwiki" },
  init = function()
    vim.treesitter.language.register("markdown", "vimwiki")
  end,
  opts = {
    enabled = true,

    file_types = { "markdown", "vimwiki" },

    latex = {
      enabled = false,
    },

    checkbox = {
      enabled = true,
      unchecked = {
        icon = "❌ ",
        highlight = "RenderMarkdownUnchecked",
      },
      checked = {
        icon = "✅ ",
        highlight = "RenderMarkdownChecked",
      },
      custom = {
        todo = {
          raw = "[-]",
          rendered = "🚩",
          highlight = "RenderMarkdownTodo",
        },
      },
    },

    heading = {
      enabled = true,
      sign = true,
      signs = { "󰫎 " },
      icons = { "󰝤 ", "󰝤 ", "󰝤 ", "󰝤 ", "󰝤 ", "󰝤 " },
      position = "inline",
      backgrounds = {},

      foregrounds = {
        "RenderMarkdownH1",
        "RenderMarkdownH2",
        "RenderMarkdownH3",
        "RenderMarkdownH4",
        "RenderMarkdownH5",
        "RenderMarkdownH6",
      },
    },
  },

  config = function(_, opts)
    require("render-markdown").setup(opts)

    -- render-markdown heading foreground groups
    vim.api.nvim_set_hl(0, "RenderMarkdownH1", { fg = "#f92672", bold = true })
    vim.api.nvim_set_hl(0, "RenderMarkdownH2", { fg = "#fd971f", bold = true })
    vim.api.nvim_set_hl(0, "RenderMarkdownH3", { fg = "#e6db74", bold = true })
    vim.api.nvim_set_hl(0, "RenderMarkdownH4", { fg = "#a6e22e", bold = true })
    vim.api.nvim_set_hl(0, "RenderMarkdownH5", { fg = "#66d9ef", bold = true })
    vim.api.nvim_set_hl(0, "RenderMarkdownH6", { fg = "#ae81ff", bold = true })

    -- actual Markdown heading text captures
    vim.api.nvim_set_hl(0, "@markup.heading.1.markdown", { fg = "#f92672", bold = true })
    vim.api.nvim_set_hl(0, "@markup.heading.2.markdown", { fg = "#fd971f", bold = true })
    vim.api.nvim_set_hl(0, "@markup.heading.3.markdown", { fg = "#e6db74", bold = true })
    vim.api.nvim_set_hl(0, "@markup.heading.4.markdown", { fg = "#a6e22e", bold = true })
    vim.api.nvim_set_hl(0, "@markup.heading.5.markdown", { fg = "#66d9ef", bold = true })
    vim.api.nvim_set_hl(0, "@markup.heading.6.markdown", { fg = "#ae81ff", bold = true })
  end,
}
