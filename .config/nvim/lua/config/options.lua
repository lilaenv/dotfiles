-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

-- Encoding
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'

-- Line numbers
opt.number = true           -- Show line numbers
opt.relativenumber = false  -- Disable relative line number display

-- Line wrapping
opt.wrap = true             -- Wrap long lines to display

-- Mouse support
-- opt.mouse = "a"             -- Enable mouse in all modes

-- Search settings
opt.ignorecase = true       -- Ignore case when searching
opt.smartcase = true        -- Override ignorecase if search contains uppercase

-- Tabs & Indentation
opt.tabstop = 2             -- 2 spaces for tabs
opt.shiftwidth = 2          -- 2 spaces for indent width
opt.expandtab = true        -- Expand tabs to spaces
opt.autoindent = true       -- Copy indent from current line when starting a new line

-- Updatetime for CursorHold
opt.updatetime = 300        -- Faster completion
