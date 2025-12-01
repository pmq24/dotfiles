local M = {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	event = "VeryLazy",
	main = "harpoon",
}

function M.config(spec)
	local harpoon = require(spec.main)

	harpoon.setup()
	
	vim.keymap.set("n", "<C-a>", function() harpoon:list():add() end, { desc = "Harpoon: Add file" })
	vim.keymap.set("n", "<C-m>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon: Menu" })

	vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end, { desc = "Harpoon: H File" })
	vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end, { desc = "Harpoon: J File" })
	vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end, { desc = "Harpoon: K File" })
	vim.keymap.set("n", "<C-l>", function() harpoon:list():select(3) end, { desc = "Harpoon: L File" })
end

return M
