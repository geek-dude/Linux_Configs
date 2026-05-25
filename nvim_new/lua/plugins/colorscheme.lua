return {
  {
    "polirritmico/monokai-nightasty.nvim",
    priority = 1000,
    opts = {
      dark_style_background = "default",
      light_style_background = "default",
      transparent = false,

      on_highlights = function(highlights, colors)
        local black = "#000000"

        -- Main editor
        highlights.Normal = { fg = colors.fg, bg = black }
        highlights.NormalNC = { fg = colors.fg, bg = black }
        highlights.SignColumn = { bg = black }
        highlights.LineNr = { fg = colors.comment, bg = black }
        highlights.CursorLineNr = { fg = colors.yellow, bg = black }
        highlights.EndOfBuffer = { fg = black, bg = black }

        -- Floating windows / popups
        highlights.NormalFloat = { fg = colors.fg, bg = black }
        highlights.FloatBorder = { fg = colors.comment, bg = black }
        highlights.FloatTitle = { fg = colors.yellow, bg = black }

        -- Lazy.nvim window
        highlights.LazyNormal = { fg = colors.fg, bg = black }
        highlights.LazyButton = { fg = colors.fg, bg = black }
        highlights.LazyButtonActive = { fg = colors.yellow, bg = black }

        -- Neo-tree
        highlights.NeoTreeNormal = { fg = colors.fg, bg = black }
        highlights.NeoTreeNormalNC = { fg = colors.fg, bg = black }
        highlights.NeoTreeEndOfBuffer = { fg = black, bg = black }
        highlights.NeoTreeWinSeparator = { fg = colors.comment, bg = black }

        -- Telescope, if you use it
        highlights.TelescopeNormal = { fg = colors.fg, bg = black }
        highlights.TelescopeBorder = { fg = colors.comment, bg = black }
        highlights.TelescopePromptNormal = { fg = colors.fg, bg = black }
        highlights.TelescopePromptBorder = { fg = colors.comment, bg = black }
        highlights.TelescopeResultsNormal = { fg = colors.fg, bg = black }
        highlights.TelescopeResultsBorder = { fg = colors.comment, bg = black }
        highlights.TelescopePreviewNormal = { fg = colors.fg, bg = black }
        highlights.TelescopePreviewBorder = { fg = colors.comment, bg = black }

        -- Snacks picker/explorer, used by newer LazyVim setups
        highlights.SnacksPicker = { fg = colors.fg, bg = black }
        highlights.SnacksPickerBorder = { fg = colors.comment, bg = black }
        highlights.SnacksPickerInput = { fg = colors.fg, bg = black }
        highlights.SnacksPickerList = { fg = colors.fg, bg = black }
        highlights.SnacksPickerPreview = { fg = colors.fg, bg = black }
        highlights.SnacksExplorerNormal = { fg = colors.fg, bg = black }

        -- Completion menu
        highlights.Pmenu = { fg = colors.fg, bg = black }
        highlights.PmenuSel = { fg = black, bg = colors.yellow }
        highlights.PmenuSbar = { bg = black }
        highlights.PmenuThumb = { bg = colors.comment }

        -- Which-key popup
        highlights.WhichKeyNormal = { fg = colors.fg, bg = black }
        highlights.WhichKeyBorder = { fg = colors.comment, bg = black }

        -- Statusline / tabline-ish backgrounds
        -- highlights.StatusLine = { fg = colors.fg, bg = black }
        -- highlights.StatusLineNC = { fg = colors.comment, bg = black }
        highlights.WinSeparator = { fg = colors.comment, bg = black }
        highlights.TabLine = { fg = colors.comment, bg = black }
        highlights.TabLineFill = { bg = black }
        highlights.TabLineSel = { fg = colors.yellow, bg = black }
      end,
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "monokai-nightasty",
    },
  },
}
