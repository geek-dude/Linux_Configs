-- This is where all the lazy plugins go

return
{
    -- Command key suggestions
    {
        "folke/which-key.nvim",
        dependencies = 'loctvl842/monokai-pro.nvim',
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        config = function()
            local configuration = require ("which-key_configuration")
            local mapper = require ("which-key_mappings")
            local wk = require ("which-key")
            wk.setup (configuration)
            wk.register (mapper)
        end,
    },

    -- File explorer - nvim-tree
    {
        "nvim-tree/nvim-tree.lua",
        cmd = "NvimTreeToggle",
        dependencies = { 'nvim-tree/nvim-web-devicons', 'loctvl842/monokai-pro.nvim' },
        config = function()
            -- disable netrw at the very start of your init.lua
            -- This avoids any potential conflict with nvim-tree
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1
            require ( "nvim-tree" ).setup ( require ("nvim-tree_opts") )
        end,
    },

    -- Terminal toggle plugin
    {
        'akinsho/toggleterm.nvim', version = "*",
        keys = { mode = { 'n' }, '<C-\\>' },
        opts = {
            open_mapping = [[<c-\>]],
            size = 10,
            direction = 'tab',
        },
    },

    -- Refer this website for good color schemes
    -- https://vimcolorschemes.com/
    -- Color scheme Tranquility
    {
        "jqno/tranquility.nvim",
        lazy = true,
        config = function()
            -- load the colorscheme here
            vim.cmd([[colorscheme green-tranquility]])
        end,
    },

    -- Color scheme Catppuccin
    {
        "catppuccin/nvim",
        lazy = true,
        config = function()
            require("catppuccin").setup {
                transparent_background = true,
                term_colors = false,
            }
            -- load the colorscheme here
            vim.cmd([[colorscheme catppuccin]])
        end,
    },

    -- Color scheme Monokai-Pro
    {
        "loctvl842/monokai-pro.nvim",
        lazy = true,
        config = function()
            require("monokai-pro").setup {
                transparent_background = true,
                terminal_colors = false,
                filter = "classic", -- classic | octagon | pro | machine | ristretto | spectrum
                background_clear = {
                    -- "float_win",
                    -- "toggleterm",
                    -- "telescope",
                    "which-key",
                    -- "renamer",
                    -- "notify",
                    -- "nvim-tree",
                    -- "neo-tree",
                    -- "bufferline", -- better used if background of `neo-tree` or `nvim-tree` is cleared
                },-- "float_win", "toggleterm", "telescope", "which-key", "renamer", "neo-tree", "nvim-tree", "bufferline"
            }
            -- load the colorscheme here
            vim.cmd([[colorscheme monokai-pro]])
        end,
    },

    -- Color scheme Gruvbox
    {
        "ellisonleao/gruvbox.nvim",
        event = "VeryLazy",
        opts = {
            terminal_colors = false,
            transparent_mode = true,
        },
    },

    -- Statusline plugin
    {
        'nvim-lualine/lualine.nvim',
        event = "VeryLazy",
        dependencies = { 'nvim-tree/nvim-web-devicons', 'loctvl842/monokai-pro.nvim' },
        opts = { options = { theme = "auto" }, },
    },

    -- Top buffer line
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-tree/nvim-web-devicons", "loctvl842/monokai-pro.nvim" },
        version = "*",
        opts = {
            options = {
                mode = "tabs",
                separator_style = "slant",
            },
        },
    },

    -- Multi cursor plugin
    {
        "smoka7/multicursors.nvim",
        dependencies = {
            'smoka7/hydra.nvim',
        },
        cmd = { 'MCstart', 'MCvisual', 'MCclear', 'MCpattern', 'MCvisualPattern', 'MCunderCursor' },
        config = true,
    },

    -- Comment plugin
    {
        'numToStr/Comment.nvim',
        event = "VeryLazy",
        config = true,
    },

    -- git diffs
    {
        'sindrets/diffview.nvim',
        cmd = "DiffviewOpen",
        config = true,
    },

    -- Telescope - the fuzzy finder
    {
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        cmd = "Telescope",
        dependencies = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
            'nvim-tree/nvim-web-devicons',
            'nvim-treesitter/nvim-treesitter', build = ':TSUpdate',
        },
        config = require ("telescope_configuration").tel_config,
    },

    {
        "stevearc/dressing.nvim",
        event = "VeryLazy",
    },

    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-buffer", -- source for text in buffer
            "hrsh7th/cmp-path", -- source for file system paths
            "L3MON4D3/LuaSnip", -- snippet engine
            "saadparwaiz1/cmp_luasnip", -- for autocompletion
            "rafamadriz/friendly-snippets", -- useful snippets
            "onsails/lspkind.nvim", -- vs-code like pictograms
        },
        config = require ("completion_config").comp_config,
    },

}
