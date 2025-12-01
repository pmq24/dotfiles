local M = {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	build = ":MasonToolsInstall",
	dependencies = {
		"williamboman/mason.nvim",
	},
	main = "mason-tool-installer",
	lazy = false,
	opts = {
		ensure_installed = {
			"eslint-lsp",
			"gopls",
			"html-lsp",
			"json-lsp",
			"lua-language-server",
			"prettier",
			"ruby-lsp",
			"stylua",
			"tailwindcss-language-server",
			"typescript-language-server",
			"vue-language-server",
			"yaml-language-server",
		},
		log_level = vim.log.levels.WARN,
	},
}

return M
