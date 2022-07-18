require("bufferline").setup {}
vim.cmd [[
nnoremap <silent>L :BufferLineCycleNext<CR>
nnoremap <silent>H :BufferLineCyclePrev<CR>
]]
