local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

-- ==========================================
-- 1. FONT & WINDOW (Matches your Alacritty)
-- ==========================================
-- config.font = wezterm.font("CaskaydiaCove Nerd Font Mono")
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 13.0
config.scrollback_lines = 100000

config.window_padding = {
	left = 10,
	right = 10,
	top = 10,
	bottom = 10,
}

config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"

-- ==========================================
-- 2. COLOR SCHEME
-- ==========================================
config.color_scheme = "Monokai Remastered"

config.colors = {
	background = "#000000",
}
-- ==========================================
-- 3. KEY TABLES (Copy & Search Logic)
-- ==========================================
config.key_tables = {
	copy_mode = {
		-- Exit with 'i' (Alacritty style)
		{ key = "i", mods = "NONE", action = act.CopyMode("Close") },
		{ key = "q", mods = "NONE", action = act.CopyMode("Close") },
		{ key = "Escape", mods = "NONE", action = act.CopyMode("Close") },

		-- VIM Navigation
		{ key = "h", mods = "NONE", action = act.CopyMode("MoveLeft") },
		{ key = "j", mods = "NONE", action = act.CopyMode("MoveDown") },
		{ key = "k", mods = "NONE", action = act.CopyMode("MoveUp") },
		{ key = "l", mods = "NONE", action = act.CopyMode("MoveRight") },

		-- Line Navigation
		{ key = "0", mods = "NONE", action = act.CopyMode("MoveToStartOfLine") },
		{ key = "^", mods = "SHIFT", action = act.CopyMode("MoveToStartOfLineContent") },
		{ key = "$", mods = "SHIFT", action = act.CopyMode("MoveToEndOfLineContent") },

		-- Word Navigation (Lower Case)
		{ key = "w", mods = "NONE", action = act.CopyMode("MoveForwardWord") },
		{ key = "b", mods = "NONE", action = act.CopyMode("MoveBackwardWord") },
		{ key = "e", mods = "NONE", action = act.CopyMode("MoveForwardWordEnd") },

		-- Word Navigation (Upper Case / Big Words)
		-- We use MoveForwardWord for these; WezTerm handles 'W' logic
		-- naturally with these built-in word movements.
		{ key = "W", mods = "SHIFT", action = act.CopyMode("MoveForwardWord") },
		{ key = "B", mods = "SHIFT", action = act.CopyMode("MoveBackwardWord") },
		{ key = "E", mods = "SHIFT", action = act.CopyMode("MoveForwardWordEnd") },

		-- Scrollback Navigation
		{ key = "G", mods = "SHIFT", action = act.CopyMode("MoveToScrollbackBottom") },
		{ key = "g", mods = "NONE", action = act.CopyMode("MoveToScrollbackTop") },

		-- PAGE Navigation (Vim style)
		{ key = "u", mods = "CTRL", action = act.CopyMode("PageUp") },
		{ key = "d", mods = "CTRL", action = act.CopyMode("PageDown") },
		{ key = "b", mods = "CTRL", action = act.CopyMode("PageUp") },
		{ key = "f", mods = "CTRL", action = act.CopyMode("PageDown") },

		-- SEARCH ITERATION (Alacritty style)
		-- After searching with '/', use 'n' and 'N' to hop through matches
		{ key = "n", mods = "NONE", action = act.CopyMode("NextMatch") },
		{ key = "N", mods = "SHIFT", action = act.CopyMode("PriorMatch") },

		-- Selection / Copy / Search Start
		{ key = "v", mods = "NONE", action = act.CopyMode({ SetSelectionMode = "Cell" }) },
		{ key = "V", mods = "SHIFT", action = act.CopyMode({ SetSelectionMode = "Line" }) },
		{ key = "y", mods = "NONE", action = act.CopyTo("ClipboardAndPrimarySelection") },
		{ key = "/", mods = "NONE", action = act.Search("CurrentSelectionOrEmptyString") },
	},

	-- When the search bar is actually open (typing your query)
	search_mode = {
		{ key = "Enter", mods = "NONE", action = act.CopyMode("AcceptPattern") },
		{ key = "Escape", mods = "NONE", action = act.CopyMode("Close") },
		-- Allows iterating forward/backward WHILE the search bar is still open
		{ key = "n", mods = "CTRL", action = act.CopyMode("NextMatch") },
		{ key = "p", mods = "CTRL", action = act.CopyMode("PriorMatch") },
	},
}

return config
