require('nvim-comp-and-lsp-config/others').lsp_handlers()

local function on_attach(_, bufnr)
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	-- Enable completion triggered by <c-x><c-o>
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.documentationFormat = {
	"markdown",
	"plaintext"
}
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport =
true
capabilities.textDocument.completion.completionItem.tagSupport = {
	valueSet = {1}
}
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = {"documentation", "detail", "additionalTextEdits"}
}

local luadev = require("lua-dev").setup({
	library = {
		vimruntime = true, -- runtime path
		types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
		plugins = true -- installed opt or start plugins in packpath
		-- you can also specify the list of plugins to make available as a workspace library
		-- plugins = { "nvim-treesitter", "plenary.nvim", "telescope.nvim" },
	},
  cmd = {"/home/dado/.elixir-ls/release/language_server.sh"},
	runtime_path = false, -- enable this to get completion in require strings. Slow!
	lspconfig = {on_attach = on_attach, capabilities = capabilities}
})

local servers = {
	'cssls',
	'tsserver',
	'sumneko_lua',
	'rust_analyzer',
	'elixirls',
	'tailwindcss',
	'prismals',
	'graphql'
}

for _, lsp in pairs(servers) do
	if lsp == 'sumneko_lua' then
		require'lspconfig'.sumneko_lua.setup(luadev)
	elseif lsp == 'rust_analyzer' then
		require('lspconfig').rust_analyzer.setup {
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				["rust-analyzer"] = {
					assist = {importGranularity = "module", importPrefix = "self"},
					cargo = {loadOutDirsFromCheck = true},
					procMacro = {enable = true}
				}
			}
		}
	elseif lsp == 'elixirls' then
		require('lspconfig').elixirls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			cmd = {"/home/dado/.elixir-ls/release/language_server.sh"}
		})
	elseif lsp == 'tailwindcss' then
		require('lspconfig').tailwindcss.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			filetypes = {
				"aspnetcorerazor",
				"astro",
				"astro-markdown",
				"blade",
				"django-html",
				"htmldjango",
				"edge",
				"eelixir",
				"ejs",
				"erb",
				"eruby",
				"gohtml",
				"haml",
				"handlebars",
				"hbs",
				"html",
				"html-eex",
				"heex",
				"jade",
				"leaf",
				"liquid",
				"markdown",
				"mdx",
				"mustache",
				"njk",
				"nunjucks",
				"php",
				"razor",
				"slim",
				"twig",
				"css",
				"less",
				"postcss",
				"sass",
				"scss",
				"stylus",
				"sugarss",
				"javascript",
				"javascriptreact",
				"reason",
				"rescript",
				"typescript",
				"typescriptreact",
				"vue",
				"svelte"
			},
			cmd = {"tailwindcss-language-server", "--stdio"},
			init_options = {userLanguages = {eelixir = "html-eex"}}
		})
	else
		require('lspconfig')[lsp].setup {
			on_attach = on_attach,
			capabilities = capabilities
		}
	end
end
