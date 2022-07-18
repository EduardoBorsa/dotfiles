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
	s("function", fmt([[
      /**
      * @notice Description for the function
      * @param {}: Description for arg.
      */
      function {}({} {}) public {} {{
        {}
        {}
      }}
		]], {
		same(3),
		i(1, "function_name"),
		i(2, "type"),
		i(3, "arg0"),
		c(4, {t("returns (uint256[] memory)"), t("")}),
		i(0),
		c(5, {t("return something;"), t("")})
	})),
	s("constructor", fmt([[
      /**
      * @notice Description for the constructor
      * @param {}: Description for arg.
      */
      constructor({} {}) {} {{
        {}
      }}
		]], {same(2), i(1, "type"), i(2, "arg0"), i(3), i(0)})),
	s("mapping", fmt([[
      mapping({} => {}) public {};
		]], {i(1, "type"), i(2, "type"), i(3, "mapping_name")})),
	ls.parser.parse_snippet("address", "address"),
	ls.parser.parse_snippet("string", "string memory")

}

return M
