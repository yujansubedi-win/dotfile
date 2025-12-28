return {
	-- Auto Complete html tags
	{ "windwp/nvim-ts-autotag", ft = "html", opts = { per_filetype = { ["html"] = { enable_close = true } } } },

	-- Highlight colors
	{ "brenoprata10/nvim-highlight-colors", ft = "css", cmd = "HighlightColors", opts = {} },

	-- typst-preview
	{
		"chomosuke/typst-preview.nvim",
		ft = "typst", -- only load on typst files
		version = "1.*",
		opts = {}, -- lazy.nvim will implicitly calls `setup {}`
	},

	--  Markdown Render and Preview
	{
		"toppair/peek.nvim",
		dependencies = {
			"MeanderingProgrammer/render-markdown.nvim",
			{ "SCJangra/table-nvim", opts = { mappings = { delete_column = "<A-S-d>" } } },
		},
		ft = "markdown", -- only load on markdown files
		build = "deno task --quiet build:fast",
		config = function()
			local peek = require("peek")
			peek.setup({ app = "C:\\Program Files\\Zen Browser\\zen.exe" })
			-- peek.setup({ app = "zen-browser", theme = "light" })
			vim.api.nvim_create_user_command("PeekOpen", peek.open, {})
			vim.api.nvim_create_user_command("PeekClose", peek.close, {})
		end,
	},
}
