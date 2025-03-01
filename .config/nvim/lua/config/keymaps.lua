-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Set leader key to space
vim.g.mapleader = " "

-- Normal mode mappings
-- Move lines up and down (including selected ranges)
-- Note: On macOS, <M-> corresponds to the Option (⌥) key.
keymap('n', '<M-j>', ':m .+1<CR>==')             -- Move the current line down
keymap('n', '<M-k>', ':m .-2<CR>==')             -- Move the current line up
keymap('v', '<M-j>', ":m '>+1<CR>gv=gv")         -- Move the selected lines down
keymap('v', '<M-k>', ":m '<-2<CR>gv=gv")         -- Move the selected lines up

-- Optimized window navigation (Ctrl + h/j/k/l)
keymap('n', '<C-h>', '<C-w>h', opts)             -- Move to the left window
keymap('n', '<C-j>', '<C-w>j', opts)             -- Move to the window below
keymap('n', '<C-k>', '<C-w>k', opts)             -- Move to the window above
keymap('n', '<C-l>', '<C-w>l', opts)             -- Move to the right window

-- Save file
keymap('n', '<C-s>', '<cmd>w<cr><esc>', opts)    -- Saves the file's content at that moment

-- Split window
keymap('n', '<C-,>', ':split<Return><C-w>w')     -- Split window horizontally and switch to it
keymap('n', '<C-.>', ':vsplit<Return><C-w>w')    -- Split window vertically and switch to it

-- Terminal mode mappings
-- Optimized terminal window navigation (Ctrl + t + h/j/k/l)
keymap('t', '<C-t>h', '<C-\\><C-n><C-w>h', opts) -- Move to the left window
keymap('t', '<C-t>j', '<C-\\><C-n><C-w>j', opts) -- Move to the window below
keymap('t', '<C-t>k', '<C-\\><C-n><C-w>k', opts) -- Move to the window above
keymap('t', '<C-t>l', '<C-\\><C-n><C-w>l', opts) -- Move to the right window
