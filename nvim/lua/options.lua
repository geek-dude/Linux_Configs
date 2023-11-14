-- Setting hybrid line numbers
vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.list = true -- show non printable characters (tab)

-- Tab and indentation options for full explanation refer the below link
-- https://vim.fandom.com/wiki/Indenting_source_code#:~:text='smarttab'%20affects%20how%20%3CTAB,'softtabstop'%20are%20used%20elsewhere.
vim.opt.smarttab = false -- Only enable when tab characters in the body text or code (That is not at the start of the line)
vim.opt.autoindent = true -- automatically indents first line of function or code block
vim.opt.expandtab = true -- enables soft tabbing
vim.opt.shiftwidth = 4 -- Length used for autoindent and shifting code blocks with shift+>/<
vim.opt.softtabstop = 4 -- No of spaces introduced by pressing the tab key. Normally kept same as shiftwidth
vim.opt.tabstop = 8 -- Hard tabbing width. Takes effect only when soft tabbing is disabled

-- Vim command autocompletion options
-- Longest completes only till the matching part (partial match)
-- List just shows suggestions and full tabs through the suggestion list
vim.opt.wildmode = "longest:full,full"
vim.opt.wildmenu = true -- Full won't work if this is disabled

vim.opt.cursorline = true -- Highlights the current line under the cursor
vim.opt.scrolloff = 8 -- Minimum number of lines to be displayed above and below the cursor
vim.opt.signcolumn = 'yes' -- Always show sign column even not in debugging mode

-- Search options with / and ?
vim.opt.hlsearch = false -- Do not highlight the item being searched
vim.opt.incsearch = true -- Incrementally highlight the item being searched
vim.opt.ignorecase = true -- Case insensitive search
vim.opt.smartcase = true -- Over-ride ignorecase when the search item contains capital letters
vim.opt.wrap = true -- Wrap back to the first search after the last one

-- Fold options
vim.opt.foldenable = false -- Unfold everything by default
vim.opt.foldmethod = "indent" -- Set fold method to indent

-- split windows
vim.opt.splitright = true -- split vertical window to the right
vim.opt.splitbelow = true -- split horizontal window to the bottom

vim.opt.termguicolors = true -- Uses true color (More than the 16 colors of the terminal. Required by most themes)
