-- if vim.g.snippets ~= "luasnip" or not pcall(require, "luasnip") then return end
local rust_snippets = require('nvim-luasnip-config/snips/rust')
local elixir_snippets = require('nvim-luasnip-config/snips/elixir')
local generic_snippets = require('nvim-luasnip-config/snips/all')
local solidity_snippets = require('nvim-luasnip-config/snips/solidity')
local javascript_snippets = require('nvim-luasnip-config/snips/javascript')

local ls = require("luasnip")
local types = require "luasnip.util.types"
ls.config.set_config {
	-- This tells LuaSnip to remember to keep around the last snippet.
	-- You can jump back into it even if you move outside of the selection
	history = true,

	-- This one is cool cause if you have dynamic snippets, it updates as you type!
	updateevents = "TextChanged,TextChangedI",

	-- Autosnippets:
	enable_autosnippets = true,

	-- Crazy highlights!!
	-- #vid3
	-- ext_opts = nil,
	ext_opts = {
		[types.choiceNode] = {
			active = {virt_text = {{" <- Current Choice", "NonTest"}}}
		}
	}
}

ls.add_snippets("all", generic_snippets)
ls.add_snippets("elixir", elixir_snippets)
ls.add_snippets("rust", rust_snippets)
ls.add_snippets("solidity", solidity_snippets)
ls.add_snippets("javascript", javascript_snippets)

require("luasnip.loaders.from_vscode").lazy_load()

-- <c-k> is my expansion key
-- this will expand the current item or jump to the next item within the snippet.
vim.keymap.set({"i", "s"}, "<c-j>", function()
	-- if ls.expand_or_jumpable() then ls.expand_or_jump() end
	if ls.jumpable(1) then
		ls.jump(1)
	end
end, {silent = true})

-- <c-j> is my jump backwards key.
-- this always moves to the previous item within the snippet
vim.keymap.set({"i", "s"}, "<c-k>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, {silent = true})

-- <c-l> is selecting within a list of options.
-- This is useful for choice nodes (introduced in the forthcoming episode 2)
vim.keymap.set("i", "<c-l>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end)

vim.keymap.set("i", "<c-u>", require "luasnip.extras.select_choice")

-- shorcut to source my luasnips file again, which will reload my snippets
vim.keymap.set("n", "\\s",
               "<cmd>source ~/projects/dotfiles/config/nvim/after/plugin/luasnip.lua<CR>")
