local map = vim.api.nvim_set_keymap

map('v', '<', '<gv', {noremap = true, silent = false})
map('v', '>', '>gv', {noremap = true, silent = false})

-- Don't copy the replaced text after pasting in visual mode
map("v", "p", "p:let @+=@0<CR>", {noremap = true, silent = true})

vim.api.nvim_set_keymap("v", "<leader>re",
                        [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]],
                        {noremap = true, silent = true, expr = false})
