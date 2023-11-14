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
            wk.setup(configuration)
            wk.register (mapper)
        end,
    },

    -- File explorer - nvim-tree
    {
        "nvim-tree/nvim-tree.lua",
        cmd = "NvimTreeToggle",
        dependencies = { 'nvim-tree/nvim-web-devicons', 'loctvl842/monokai-pro.nvim' },
        init = function()
            -- disable netrw at the very start of your init.lua
            -- This avoids any potential conflict with nvim-tree
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1
        end,
        opts = require("nvim-tree_opts")
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
                filter = "classic", -- classic | octagon | pro | machine | ristretto | spectrum
                background_clear = {
                    -- "float_win",
                    -- "toggleterm",
                    -- "telescope",
                    "which-key",
                    -- "renamer",
                    -- "notify",
                    "nvim-tree",
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
        config = function()
            require("gruvbox").setup {
                transparent_mode = true,
            }
            -- load the colorscheme here
            -- vim.cmd([[colorscheme gruvbox]])
        end,
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

    -- Mason - LSP server manager
    {
        "williamboman/mason.nvim",
        dependencies = { '/neovim/nvim-lspconfig', 'williamboman/mason-lspconfig.nvim', 
                        'mfussenegger/nvim-dap', 'rcarriga/nvim-dap-ui', 
                        'mfussenegger/nvim-lint', 'mhartington/formatter.nvim' },
        init = function()
            require("mason").setup({
            ui = 
                {
                icons =
                    {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            })
        end,
    },

    -- plugins/telescope.lua:
    {
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons', 'BurntSushi/ripgrep', 'sharkdp/fd', 'nvim-treesitter/nvim-treesitter' },
    },
}
