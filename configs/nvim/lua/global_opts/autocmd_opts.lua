-- File specific options and keybindings:

-- Create an autocommand group for options
local filetype_opts = vim.api.nvim_create_augroup("filetype_opts", { clear = true })

-- Markdown
vim.api.nvim_create_autocmd("FileType", {
	group = filetype_opts,
	pattern = "markdown",
	callback = function()
		vim.api.nvim_buf_set_keymap(0, "n", "<A-m>", "<cmd>PeekOpen<cr>", { desc = "Markdown Preview" })
	end,
})

-- Typst
vim.api.nvim_create_autocmd("FileType", {
	group = filetype_opts,
	pattern = "typst",
	callback = function()
		vim.api.nvim_buf_set_keymap(0, "n", "<A-m>", "<cmd>TypstPreviewToggle<cr>", { desc = "Markdown Preview" })
	end,
})
