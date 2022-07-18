vim.g.mapleader = ' '
local map = vim.api.nvim_set_keymap
require('keybindings/normal_mode')
require('keybindings/insert_mode')
require('keybindings/visual_mode')
require('keybindings/command_line_mode')
require('keybindings/terminal_mode')
