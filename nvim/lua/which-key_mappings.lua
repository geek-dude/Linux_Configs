-- Plugin specific keybindings which will be passed to which-key
return
{
    ["<leader>e"] = { ":NvimTreeToggle<CR>", "Open file editor" },
    ['<Leader>m'] = { mode = {"n", "v"}, "<cmd>MCstart<cr>", "Create a selection for selected text or word under the cursor" },
}
