require'nvim-treesitter.configs'.setup {
	ensure_installed = {
		"html",
		"javascript",
		"rust",
		"typescript",
		"tsx",
		"solidity"
	},
	highlight = {enable = true, additional_vim_regex_highlighting = false},
	context_commentstring = {enable = true, enable_autocmd = false}
}
