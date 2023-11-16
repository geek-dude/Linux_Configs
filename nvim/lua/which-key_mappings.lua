-- Plugin specific keybindings which will be passed to which-key
return
{
    ["<leader>"] = {
        e = { mode = {"n"}, "<cmd>NvimTreeToggle<CR>", "Open file editor" },
        m = { mode = {"n", "v"}, "<cmd>MCstart<CR>", "Create a selection for selected text or word under the cursor" },
        g = {
            mode = {"n"},
            name = "Git diff view",
            o = { "<cmd>:DiffviewOpen<CR>", "open" },
            c = { "<cmd>:DiffviewClose<CR>", "close" },
        },
        f = {
            mode = {"n"},
            name = "Telescope",
            f = { "<cmd>Telescope find_files<CR>", "Fuzzy find files in cwd" },
            r = { "<cmd>Telescope oldfiles<CR>", "Fuzzy find recent files" },
            s = { "<cmd>Telescope live_grep<CR>", "Find string in cwd" },
            c = { "<cmd>Telescope grep_string<CR>", "Find string under cursor in cwd" },
        },
    },
}
