-- Flags: https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTIN_CONFIG.md
local null_ls = require('null-ls')
local formatting = null_ls.builtins.formatting

-- if you want to set up formatting on save, you can use this as a callback
-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- add to your shared on_attach callback
-- local on_attach = function(client, bufnr)
-- 	if client.supports_method("textDocument/formatting") then
-- 		vim.api.nvim_clear_autocmds({group = augroup, buffer = bufnr})
-- 		vim.api.nvim_create_autocmd("BufWritePre", {
-- 			group = augroup,
-- 			buffer = bufnr,
-- 			callback = function()
-- 				vim.lsp.buf.format({
--         filter = function(clients)
--           -- filter out clients that you don't want to use
--           return vim.tbl_filter(function(client)
--             return client.name ~= "tsserver"
--           end, clients)
--         end,
--         bufnr = bufnr,
--         timeout_ms = 2000
--       })
-- 			end
-- 		})
-- 	end
-- end

local async_formatting = function(bufnr)
	bufnr = bufnr or vim.api.nvim_get_current_buf()

	vim.lsp.buf_request(bufnr, "textDocument/formatting",
	                    vim.lsp.util.make_formatting_params({}),
	                    function(err, res, ctx)
		if err then
			local err_msg = type(err) == "string" and err or err.message
			-- you can modify the log message / level (or ignore it completely)
			vim.notify("formatting: " .. err_msg, vim.log.levels.WARN)
			return
		end

		-- don't apply results if buffer is unloaded or has been modified
		if not vim.api.nvim_buf_is_loaded(bufnr) or
		vim.api.nvim_buf_get_option(bufnr, "modified") then
			return
		end

		if res then
			local client = vim.lsp.get_client_by_id(ctx.client_id)
			vim.lsp.util.apply_text_edits(res, bufnr,
			                              client and client.offset_encoding or "utf-16")
			vim.api.nvim_buf_call(bufnr, function()
				vim.cmd("silent noautocmd update")
			end)
		end
	end)
end

on_attach = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({group = augroup, buffer = bufnr})
		vim.api.nvim_create_autocmd("BufWritePost", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				async_formatting(bufnr)
			end
		})
	end
end

null_ls.setup({
	sources = {
		formatting.black,
		null_ls.builtins.diagnostics.credo,
		formatting.clang_format,
		formatting.cmake_format,
		formatting.dart_format,
		null_ls.builtins.diagnostics.eslint,
		null_ls.builtins.code_actions.eslint,
		null_ls.builtins.formatting.prettier.with({
			filetypes = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"css",
				"scss",
				"less",
				"html",
				"json",
				"yaml",
				"markdown",
				"markdown.mdx"
			},
			args = {"--pretty", "false", "--noEmit"}
		}),
		null_ls.builtins.diagnostics.cspell,
		formatting.mix.with({args = {"format", "$FILENAME", "-"}}),
		formatting.lua_format.with({
			extra_args = {
				'--use-tab',
				'--indent-width=1',
				'--tab-width=2',
				'--continuation-indent-width=0',
				'--chop-down-table',
				'--no-keep-simple-control-block-one-line',
				'--no-keep-simple-function-one-line'
			}
		}),
		formatting.gofmt,
		formatting.isort,
		formatting.prismaFmt,
		formatting.rustfmt,
		formatting.shfmt

	},
	on_attach = on_attach,
	cmd = {"nvim"},
	-- debounce = 250,
	debounce = 2500,
	debug = true,
	default_timeout = 300000,
	-- default_timeout = 5000,
	diagnostics_format = "#{m}",
	fallback_severity = vim.diagnostic.severity.ERROR,
	log = {enable = true, level = "warn", use_console = "async"},
	on_init = nil,
	on_exit = nil,
	update_in_insert = false
})

-- local null_ls = require "null-ls"
--
-- null_ls.setup({
-- 	sources = {
-- 		-- Javascript/Typescript
-- 		null_ls.builtins.diagnostics.eslint,
-- 		null_ls.builtins.code_actions.eslint,
-- 		null_ls.builtins.formatting.prettier,
-- 		-- Go
-- 		null_ls.builtins.diagnostics.revive,
-- 		null_ls.builtins.formatting.gofmt,
-- 		null_ls.builtins.formatting.goimports
-- 	},
-- 	on_attach = function(client)
-- 		if client.server_capabilities.document_formatting then
-- 			vim.cmd([[
-- 				augroup LspFormatting
-- 						autocmd! * <buffer>
-- 						autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 3000)
-- 				augroup END
-- 				]])
-- 		end
-- 	end
-- })
