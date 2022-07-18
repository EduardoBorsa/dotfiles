local ls = require("luasnip")

local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.expand_conditions")

local function copy(args)
	return args[1]
end

local same = function(index)
	return f(function(arg)
		return arg[1]
	end, {index})
end

local M = {
	ls.parser.parse_snippet("expand", "-- this is what was expanded!"),
	ls.parser.parse_snippet("lf", "local $1 = function($2)\n $0\nend"),
	s("reqfoo", fmt("local {} = requiiiire('{}')", {i(1, "default"), rep(1)})),
	s("modtest", fmt([[
  #[cfg(test)]
  mod test {{
    {}
    
        {}
  }}
  ]], {c(1, {t("    use super::*;"), t("")}), i(0)})),
	s("curtime", f(function()
		return os.date("%D - %H:%M")
	end)),
	s("sametest", fmt([[example: {}, function: {}]], {i(1), same(1)})),
	s("reqtop", fmt([[local {} = require {}]], {
		f(function(import_name)
			local parts = vim.split(import_name[1][1], ".", true)
			return parts[#parts] or ""
		end, {1}),
		i(1)
	}))
}

return M
