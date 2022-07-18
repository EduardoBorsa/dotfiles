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

local M = {
	s("insp", {
		t({"IO.inspect(\"@@@@@@@@@@\")", ""}),
		t("IO.inspect("),
		i(0),
		t({")", ""}),
		t("IO.inspect(\"@@@@@@@@@@\")")
	}),
	s("def", {
		t("def "),
		i(1),
		t("("),
		i(2, "args"),
		t({") do", "\t"}),
		i(0),
		t({"", "end"})
	}),
	s("ok", {t("{:ok, "), i(1), t(" }")}),
	s("handle_call", {
		t({"@impl true", ""}),
		t("def handle_call("),
		i(1),
		t(", "),
		i(2),
		t(", "),
		i(3),
		t({") do", ""}),
		i(0),
		t({"", ""}),
		t({"{:reply, reply, new_state}", ""}),
		t({"end", ""})
	}),
	s("handle_cast", fmt([[
      @impl true
      def handle_cast(msg, state) do
        {}
        {{:noreply, state}}
      end
		]], {i(0)})),
	s("handle_info", fmt([[
      @impl true
      def handle_info(msg, state) do
        {}
        {{:noreply, state}}
      end
		]], {i(0)}))

}

return M