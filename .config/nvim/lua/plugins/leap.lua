local M = {
	"ggandor/leap.nvim",
	dependencies = {
		"tpope/vim-repeat",
	},
	-- Lazy loading is redundant, as Leap lazily loads itself.
	-- https://github.com/ggandor/leap.nvim#installation
	lazy = false,
	main = "leap",
	opts = {},
}

function M.init()
	vim.keymap.set({ "n", "v" }, "s", "<PLug>(leap)", { desc = "Leap" })
end

return M
