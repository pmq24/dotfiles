local M = {
	"folke/which-key.nvim",
	dependencies = {
		"echasnovski/mini.icons",
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,
	main = "which-key",
	opts = {
		icons = {
			breadcrumb = "",
			group = " ",
			separator = "",
		},
	},
}

function M.config(spec, opts)
	local wk = require(spec.main)
	wk.setup(opts)
	wk.add({
		{
			"<A-C-S-q>",
			desc = "Save all files and quit Neovim",
			function()
				vim.cmd("wqa!")
			end,
		},
		{
			"<C-s>",
			desc = "Save",
			function()
				vim.cmd("w!")
			end,
		},
		{
			"<Esc>",
			desc = "Clear highlights",
			function()
				vim.cmd("noh")
			end,
		},
		{
			"<leader>pf",
			desc = "Copy file path to clipboard",
			function()
				local filepath = vim.fn.expand("%")
				vim.fn.setreg("+", filepath)
			end,
		},
		{
			"q",
			desc = "󰅖 Quit the current buffer",
			function()
				local current_buffer_is_a_file = vim.bo.buftype == ""

				if current_buffer_is_a_file then
					vim.cmd("write")
				end
				vim.cmd("bdelete")
			end,
		},
	})
end

function M.init()
	vim.o.timeout = true
	vim.o.timeoutlen = 500
end

return M
