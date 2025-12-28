return {
	-- Config nvim with lua
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = { library = { { path = "luvit-meta/library", words = { "vim%.uv" } } } },
	},

	-- Formatter
	{
		"stevearc/conform.nvim",
		event = "VeryLazy",
		config = function()
			local conform = require("conform")

			conform.setup({
				formatters_by_ft = {
					asm = { "asmfmt" },
					lua = { "stylua" },
					-- python = { "yapf" },
					-- markdown = { "markdownlint" },
					-- javascript = { "prettier" },
					-- typescript = { "prettier" },
					-- html = { "prettier" },
					-- jsx = { "prettier" },
				},
				-- format_on_save = { lsp_fallback = true, async = false, timeout_ms = 375 },
			})

			vim.keymap.set({ "n", "v" }, "<leader>mf", function()
				conform.format({ lsp_fallback = true, async = false, timeout_ms = 1000 })
			end, { desc = "Format the current buffer" })
		end,
	},
}
