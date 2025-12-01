local M = {
	"petertriho/nvim-scrollbar",
	dependencies = {
		"kevinhwang91/nvim-hlslens",
		"lewis6991/gitsigns.nvim",
	},
	event = { "BufReadPost" },
	main = "scrollbar",
	opts = {
		handlers = {
			cursor = true,
			diagnostic = true,
			handle = true,
			search = true,
		},
	},
}

return M
