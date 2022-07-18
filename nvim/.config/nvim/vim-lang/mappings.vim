nnoremap <silent> <C-h> :lua require'nvim-tmux-navigation'.NvimTmuxNavigateLeft()<cr>
nnoremap <silent> <C-j> :lua require'nvim-tmux-navigation'.NvimTmuxNavigateDown()<cr>
nnoremap <silent> <C-k> :lua require'nvim-tmux-navigation'.NvimTmuxNavigateUp()<cr>
nnoremap <silent> <C-l> :lua require'nvim-tmux-navigation'.NvimTmuxNavigateRight()<cr>
nnoremap <silent> <C-\> :lua require'nvim-tmux-navigation'.NvimTmuxNavigateLastActive()<cr>
nnoremap <silent> <C-Space> :lua require'nvim-tmux-navigation'.NvimTmuxNavigateNext()<cr>


" Really strange behavior in expanding snippets
" When you have a suggestion for a snippet you are in Select
" mode, so I remap 'p' to not paste, but to really just be 'p'
snoremap p a<Esc>sp
snoremap <backspace> a<backspace><backspace>

autocmd FileType netrw setl bufhidden=wipe
let g:netrw_fastbrowse = 0
