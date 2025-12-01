local M = {
	"rcarriga/nvim-notify",
	enabled = false,
	lazy = false,
	main = "notify",
	opts = {
		max_width = 50,
		top_down = false,
	},
}

function M.config(plugin_spec, opts)
	require(plugin_spec.main).setup(opts)
	vim.notify = require("notify")
end

return M
