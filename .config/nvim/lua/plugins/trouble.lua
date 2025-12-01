local M = {
	"folke/trouble.nvim",
	cmd = {
		"Trouble",
		"TroubleClose",
		"TroubleRefresh",
		"TroubleToggle",
	},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		auto_close = true,
		follow = true,
	},
}

function M.init()
	vim.keymap.set(
		"n",
		"<leader>dc",
		"<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
		{ desc = "(Trouble) Toggle current buffer diagnostics" }
	)
	vim.keymap.set(
		"n",
		"<leader>da",
		"<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
		{ desc = "(Trouble) Toggle all buffers diagnostics" }
	)
end

return M
