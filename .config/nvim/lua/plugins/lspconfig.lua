-- SUPPORTED LANGUAGES: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

local LANGUAGE_SERVERS = {
	"dockerls",
	"gopls",
	"html",
	"jsonls",
	"lua_ls",
	"rubocop",
	"ruby_lsp",
	"tailwindcss",
	"ts_ls",
	"volar",
	"yamlls",
}

local M = {
	"neovim/nvim-lspconfig",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	event = "BufReadPost",
}

function M.config()
	local lsp = require("lspconfig")

	for _, server in ipairs(LANGUAGE_SERVERS) do
		vim.lsp.config(
			server,
			{
				capabilities = capabilities,
			}
		)
	end

	vim.lsp.config(
		"lua_ls",
		{
			settings = {
				Lua = {
					completion = {
						callSnippet = "Replace",
					},
				},
			},
		}
	)

	vim.lsp.config(
		"ts_ls",
		{
			init_options = {
				plugins = {
					{
						name = "@vue/typescript-plugin",
						location = vim.fn.expand("$MASON/packages")
							.. "/vue-language-server"
							.. "/node_modules/@vue/language-server",
						languages = { "vue" },
					},
				},
			},
		}
	)


	vim.keymap.set(
		"n",
		"K",
			function()
				vim.lsp.buf.hover()
			end,
		{ desc = "LSP: Hover" }
	)
end

return M
