local M = {
	"Exafunction/windsurf.nvim",
	cmd = { "Codeium" },
	event = "BufReadPost",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
	},
	main = "codeium",
	opts = {},
}

return M
