local M = {
	"nvim-tree/nvim-tree.lua",
	event = "VeryLazy",
	main = "nvim-tree",
	opts = {
		filters = {
			custom = { "^\\.git", "^node_modules" },
			git_ignored = false,
		},
		git = {
			enable = false,
			ignore = false,
			timeout = 500,
		},
		sort = {
			sorter = "case_sensitive",
		},
		view = {
			relativenumber = true,
			width = 40,
		},
		renderer = {
			full_name = true,
			highlight_opened_files = "all",
			icons = {
				show = {
					file = false,
					folder = false,
				},
			},
			indent_markers = {
				enable = true,
			},
			root_folder_label = false,
			special_files = {},
		},
		update_focused_file = {
			enable = true,
		},
	},
}

function M.config(spec, opts)
	require(spec.main).setup(opts)

	vim.keymap.set(
		"n",
		"<C-n>",
			function()
				local nvimtree_api = require("nvim-tree.api").tree

				if not nvimtree_api.is_tree_buf() then
					nvimtree_api.focus()
				else
					nvimtree_api.close()
				end
			end,
		{ desc = "NvimTree: Toggle" }
	)
end

return M
