local M = {
	"nvim-lualine/lualine.nvim",
	event = { "VeryLazy" },
	main = "lualine",
	opts = {
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "vim.fn.expand('%:~:.')" },
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},
	},
}

return M
