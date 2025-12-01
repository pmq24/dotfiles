local M = {
	"williamboman/mason.nvim",
	-- mason.nvim is optimized to load as little as possible during setup.
	-- Lazy-loading the plugin, or somehow deferring the setup, is not recommended.
	-- https://github.com/williamboman/mason.nvim?tab=readme-ov-file#setup
	lazy = false,
}

function M.config()
	require("mason").setup({
		log_level = vim.log.levels.WARN,
		ui = {
			border = "rounded",
			icons = {
				package_installed = "",
				package_pending = "",
				package_uninstalled = "",
			},
		},
	})
end

return M
