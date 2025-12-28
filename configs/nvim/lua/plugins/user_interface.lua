return {
	-- Rose-pine Colortheme
	{
		"rose-pine/neovim",
		event = "VeryLazy",
		name = "rose-pine",
		opts = { styles = { transparency = true } },
		init = function()
			vim.cmd("colorscheme rose-pine")
		end,
	},

	-- Mini Git diff signs, Arround and Surround
	{
		"echasnovski/mini.diff",
		dependencies = {
			{ "echasnovski/mini.ai", opts = { n_lines = 25 } },
			{ "echasnovski/mini.surround", opts = { n_lines = 25 } },
		},
		event = "VeryLazy",
		opts = { view = { style = "sign", signs = { add = "+", change = "~", delete = "_" } } },
		keys = { { "<leader>gm", "<cmd>lua MiniDiff.toggle_overlay()<cr>", desc = "Toggle Git MiniDiff View" } },
	},

	-- Looks of command mode, which key and highlights
	{
		"folke/noice.nvim",
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "MunifTanjim/nui.nvim" },
			{ "nvim-lua/plenary.nvim" },
			{ "folke/which-key.nvim", opts = {} },
			{ "folke/todo-comments.nvim", opts = {} },
		},
		event = "VeryLazy",
		opts = {
			cmdline = {
				format = {
					search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
					search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
				},
			},
		},
	},
}
