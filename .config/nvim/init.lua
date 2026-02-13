vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = " "
vim.opt.clipboard = "unnamed,unnamedplus"
vim.opt.cursorline = true
vim.o.timeout = true
vim.o.timeoutlen = 500
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.termguicolors = true
vim.wo.number = true
vim.wo.relativenumber = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
	defaults = {
		lazy = true,
	},
})

vim.cmd.colorscheme("everforest")

-- Keymaps
vim.keymap.set("n", "<A-C-S-q>", function()
	vim.cmd("wqa!")
end, { desc = "Save all files and quit Neovim" })

vim.keymap.set("n", "<C-s>", function()
	vim.cmd("w!")
end, { desc = "Save" })

vim.keymap.set("n", "<Esc>", function()
	vim.cmd("noh")
end, { desc = "Clear highlights" })

vim.keymap.set("n", "<leader>pf", function()
	local filepath = vim.fn.expand("%")
	vim.fn.setreg("+", filepath)
end, { desc = "Copy file path to clipboard" })

vim.keymap.set("n", "q", function()
	local current_buffer_is_a_file = vim.bo.buftype == ""

	if current_buffer_is_a_file then
		vim.cmd("write")
	end
	vim.cmd("bdelete")
end, { desc = "󰅖 Quit the current buffer" })

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
