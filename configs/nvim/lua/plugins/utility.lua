return {
	-- Code highlighting , Auto Pair, show paring and context
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"andymass/vim-matchup",
			{ "altermo/ultimate-autopair.nvim", opts = {} },
			{ "nvim-treesitter/nvim-treesitter-context", opts = { separator = "—" } },
		},
		event = "VeryLazy",
		build = ":TSUpdate",
		branch = "master",
		main = "nvim-treesitter.configs",
		opts = {
			auto_install = true,
			ignore_install = { "org", "latex", "verilog" },
			ensure_installed = { "rust", "cpp", "c", "bash", "lua", "python", "markdown" },
			highlight = { enable = true, additional_vim_regex_highlighting = { "ruby" } },
			indent = { enable = true, disable = { "ruby" } },
		},
	},

	-- Code Snippets
	{
		"L3MON4D3/LuaSnip",
		event = "VeryLazy",
		dependencies = { "rafamadriz/friendly-snippets" },
		config = function()
			local Luasnip = require("luasnip")
			-- Custom snippets
			require("luasnip.loaders.from_lua").load({ paths = "~/AppData/Local/nvim/lua/snippets" })
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},

	-- Autocompletion
	{
		"saghen/blink.cmp",
		version = "1.*",
		event = "VeryLazy",
		opts = {
			keymap = {
				-- preset = "enter",
				-- ["<Tab>"] = { "select_next", "fallback" },
				-- ["<S-Tab>"] = { "select_prev", "fallback" },
				["<A-w>"] = { "select_and_accept" },
				["<A-n>"] = { "select_next", "fallback" },
				["<A-N>"] = { "select_prev", "fallback" },
			},
			cmdline = {
				keymap = {
					["<A-w>"] = { "select_and_accept" },
					["<A-n>"] = { "select_next", "fallback" },
					["<A-N>"] = { "select_prev", "fallback" },
				},
			},
			snippets = { preset = "luasnip" },
			sources = { default = { "lsp", "path", "snippets", "buffer" } },
		},
	},
}
