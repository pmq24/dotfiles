local M = {
	"tpope/vim-rails",
	cond = function()
		return vim.fn.filereadable("Gemfile") == 1
	end,
	event = "VeryLazy",
}

function M.init()
	vim.keymap.set("n", "<leader>ra", ":A<CR>")
	vim.keymap.set("n", "<leader>rr", ":R<CR>")

	vim.keymap.set("n", "<leader>rv", ":Eview<CR>")
	vim.keymap.set("n", "<leader>rc", ":Econtroller<CR>")
end

return M
