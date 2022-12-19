require'nvim-treesitter.configs'.setup {
	ensure_installed = {
		"html",
		"javascript",
		"rust",
		"typescript",
		"tsx",
		"solidity",
		"eex",
		"elixir",
		"erlang",
		"heex",
		"html",
		"surface"
	},
	highlight = {enable = true, additional_vim_regex_highlighting = false},
	context_commentstring = {enable = true, enable_autocmd = false}
}
