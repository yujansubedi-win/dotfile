-- Meson build language snippets
local ls = require("luasnip")
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt
local s = ls.snippet
local i = ls.insert_node

return {
	s(
		"c_executable_init",
		fmt(
			[[
project('{}', 'cpp', default_options: ['cpp_std=c++23'])

sources = [ 'main.cpp' ]

executable('{}', sources)
				]],
			{ i(1, "Myapp"), rep(1) }
		)
	),

	s(
		"c_shared_init",
		fmt(
			[[
project('{}', 'cpp', default_options: ['cpp_std=c++23'])

sources = [ 'main.cpp' ]

shared_library('{}', sources)
				]],
			{ i(1, "Myapp"), rep(1) }
		)
	),
}
