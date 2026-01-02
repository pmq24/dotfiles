local M = {
	"tpope/vim-rails",
	cond = function()
		return vim.fn.filereadable("Gemfile") == 1
	end,
	event = "VeryLazy",
}

function M.init()
	vim.keymap.set("n", "<leader>ra", ":A<CR>zz")
	vim.keymap.set("n", "<leader>rr", ":R<CR>zz")

	vim.keymap.set("n", "<leader>rv", ":Eview<CR>zz")
	vim.keymap.set("n", "<leader>rc", ":Econtroller<CR>zz")
end

return M
