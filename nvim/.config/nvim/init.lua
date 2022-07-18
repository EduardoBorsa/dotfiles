require('plugins')
require('treesitter-config')
require('lualine-config')
require('bufferline-config')
require('nvim-tree-config')
require('nvim-comment')
require('which-key-config')
require('telescope-config')
require('nvim-comp-and-lsp-config')
require('nvim-autopairs-config')
require('nvim-lspkind-config')
require('nvim-luasnip-config')
require('nvim-gitsigns-config')
require('nvim-ident-blankline-config')
require("nvim-null-ls-config")
require("nvim-vim-test-config")
require("vim-close-tag")
require("nvim-rust-tools-config")
require('options')
require('keybindings')
require('core.globals')

vim.cmd [[
  if has('python3')
    silent! python3 1
  endif

  so ~/.config/nvim/vim-lang/mappings.vim
  so ~/.config/nvim/vim-lang/plugin_configs/init.vim
]]
