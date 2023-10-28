-- This is where all the lazy plugins go

return
{
    -- Command key suggestions
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = require ("which-key_options"),
    },

    -- File explorer - nvim-tree
    {
        "nvim-tree/nvim-tree.lua",
        cmd = "NvimTreeToggle",
        dependencies = 'nvim-tree/nvim-web-devicons',
        init = function()
            -- disable netrw at the very start of your init.lua
            -- This avoids any potential conflict with nvim-tree
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1
        end,
        opts = require("nvim-tree_options")
    },

    -- Refer this website for good color schemes
    -- https://vimcolorschemes.com/
    -- Color scheme Tranquility
    {
        "jqno/tranquility.nvim",
        event = "VeryLazy",
        config = function()
            -- load the colorscheme here
            vim.cmd([[colorscheme green-tranquility]])
        end,
    },

    -- Statusline plugin
    {
        'nvim-lualine/lualine.nvim',
        event = "VeryLazy",
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = { options = { theme = "16color" }, },
    },

    -- Multi cursor plugin
    {
        "smoka7/multicursors.nvim",
        dependencies = {
            'smoka7/hydra.nvim',
        },
        opts = {},
        cmd = { 'MCstart', 'MCvisual', 'MCclear', 'MCpattern', 'MCvisualPattern', 'MCunderCursor' },
        keys =
        {
                {
                    mode = { 'v', 'n' },
                    '<Leader>m',
                    '<cmd>MCstart<cr>',
                    desc = 'Create a selection for selected text or word under the cursor',
                },
        },
    },

    -- Comment plugin
    {
        'numToStr/Comment.nvim',
        event = "VeryLazy",
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
