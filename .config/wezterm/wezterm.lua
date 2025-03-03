-- Pull in the wezterm API
local wezterm = require 'wezterm'

local act = wezterm.action -- Create shorthand for the action module
local config = {} -- Initialize empty configuration table

-- Colors
config.colors = {
  -- Basic colors
  background = "#1e2030", -- Default background
  foreground = "#a9b1d6", -- Default text

  -- ANSI colors
  ansi = {
    "#2e3440", -- black
    "#f7768e", -- red
    "#9ece6a", -- green
    "#e0af68", -- yellow
    "#7aa2f7", -- blue
    "#bb9af7", -- magenta
    "#7dcfff", -- cyan
    "#a9b1d6", -- white
  },
  brights = {
    "#3b4261", -- bright black
    "#ff7b8f", -- bright red
    "#b4f1a7", -- bright green
    "#ffc98e", -- bright yellow
    "#8bbdf7", -- bright blue
    "#ccaef7", -- bright magenta
    "#8ddfff", -- bright cyan
    "#c0caf5", -- bright white
  },
  indexed = { [136] = "#e0af68" }, -- Extended color palette

  -- Cursor
  compose_cursor = "#ffc98e", -- IME/composition state cursor
  cursor_bg = "#c0caf5", -- Cursor background
  cursor_border = "#c0caf5", -- Cursor border
  cursor_fg = "#a9b1d6", -- Text color under cursor

  -- Copy mode and selection
  copy_mode_active_highlight_bg = { Color = "#3b4261" }, -- Active copy selection background
  copy_mode_active_highlight_fg = { Color = "#c0caf5" }, -- Active copy selection text
  copy_mode_inactive_highlight_bg = { Color = "#7aa2f7" }, -- Inactive copy selection background
  copy_mode_inactive_highlight_fg = { Color = "#1e2030" }, -- Inactive copy selection text
  quick_select_label_bg = { Color = "#e0af68" }, -- Quick select label background
  quick_select_label_fg = { Color = "#1e2030" }, -- Quick select label text
  quick_select_match_bg = { Color = "#7aa2f7" }, -- Quick select match background
  quick_select_match_fg = { Color = "#c0caf5" }, -- Quick select match text
  selection_bg = "#7aa2f7", -- Selected text background
  selection_fg = "#1e2030", -- Selected text color

  -- UI elements
  scrollbar_thumb = "#3b4261", -- Scrollbar thumb
  split = "#444444", -- Split line between panes
}

-- Fonts
config.font = wezterm.font_with_fallback {
  { family = 'JetBrains Mono', weight = 'Light', italic = false },
  { family = 'Symbols Nerd Font', weight = 'Regular' },
}

-- Key Bindings
config.keys = {
  -- Horizontal split using Ctrl+,
  { key = ',', mods = 'CTRL', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }, },
  -- Vertical split using Ctrl+.
  { key = '.', mods = 'CTRL', action = act.SplitVertical { domain = 'CurrentPaneDomain' }, },
}

-- Return the configuration to Wezterm
return config
