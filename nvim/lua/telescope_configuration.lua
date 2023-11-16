return {
    tel_config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            defaults = {
                layout_config = {
                    horizontal = {
                        height = 99999,
                        width = 99999,
                        preview_width = 0.6,
                    },
                },
                path_display = { "truncate " },
                mappings = {
                    i = {
                        ["<C-h>"] = "which_key",
                    },
                },
            },
        })

        telescope.load_extension("fzf")
    end,
}
