-- SUPPORTED LANGUAGES: https://github.com/nvim-treesitter/nvim-treesitter#supported-languages

local LANGUAGES_TO_INSTALL = {
	"bash",
	"dockerfile",
	"gleam",
	"glimmer",
	"go",
	"gomod",
	"gosum",
	"html",
	"javascript",
	"json",
	"lua",
	"regex",
	"ruby",
	"typescript",
	"tsx",
	"vue",
	"yaml",
}

local M = {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = "BufReadPost",
	main = "nvim-treesitter.configs",
	opts = {
		autotag = {
			enabled = true,
		},
		ensure_installed = LANGUAGES_TO_INSTALL,
		hightlight = {
			enable = true,
		},
		indent = {
			enable = true,
		},
	},
}

function M.init()
	vim.filetype.add({
		extension = {
			hbs = "html",
		},
	})
end

return M
