local M = {
	"aznhe21/actions-preview.nvim",
	event = "VeryLazy",
	main = "actions-preview",
	opts = {},
}

function M.config(spec, opts)
	require(spec.main).setup(opts)

	vim.keymap.set(
		"n",
		"<C-space>",
		function()
			require("actions-preview").code_actions()
		end,
		{ desc = "Code action" }
	)
end

return M
