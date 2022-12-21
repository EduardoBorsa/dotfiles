local map = vim.api.nvim_set_keymap

map('n', 'Y', 'Vy', { noremap = true, silent = false })
map('n', '<leader>,', ':nohlsearch<cr>', { noremap = true, silent = false })

-- use ESC to turn off search highlighting
map("n", "<Esc>", "<cmd> :noh <CR>", { noremap = true, silent = false })

map("n", "L", "<cmd> :bn<CR>", { noremap = true, silent = true })
map("n", "H", "<cmd> :bp<CR>", { noremap = true, silent = true })
--
-- navigation between windows
map('n', '<C-h>', '<C-w>h', { noremap = true, silent = false })
map('n', '<C-l>', '<C-w>l', { noremap = true, silent = false })
map('n', '<C-j>', '<C-w>j', { noremap = true, silent = false })
map('n', '<C-k>', '<C-w>k', { noremap = true, silent = false })

map("n", "<C-c>", "<cmd> :%y+ <CR>", { noremap = true, silent = false }) -- copy whole file content
--[[ map("n", "<S-t>", "<cmd> :enew <CR>", {noremap = true, silent = false}) -- new buffer ]]
map("n", "<leader>n", "<cmd> :set nu! <CR>", { noremap = true, silent = false })
map("n", "<leader>rn", "<cmd> :set rnu! <CR>", { noremap = true, silent = false }) -- relative line numbers

-- LSP in normal mode
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>',
  { noremap = true, silent = false })
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>',
  { noremap = true, silent = false })
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>',
  { noremap = true, silent = false })
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>',
  { noremap = true, silent = false })

-- Prime
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
