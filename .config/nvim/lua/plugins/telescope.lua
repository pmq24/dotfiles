local M = {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	event = "VeryLazy",
	dependencies = {
		"neovim/nvim-lspconfig",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-fzf-native.nvim",
		"nvim-telescope/telescope-live-grep-args.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	main = "telescope",
	opts = function()
		local lga = require("telescope-live-grep-args.actions")

		return {
			defaults = {
				file_ignore_patterns = {
					".git/",
				},
				layout_strategy = "vertical",
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
				live_grep_args = {
					mappings = {
						i = {
							["<C-q>"] = lga.quote_prompt(),
							["<C-t>"] = lga.quote_prompt({ postfix = " -t" }),
							["<C-T>"] = lga.quote_prompt({ postfix = " -T" }),
							["<C-i>"] = lga.quote_prompt({ postfix = " --iglob " }),
						},
					},
				},
			},
			pickers = {
				find_files = {
					hidden = true,
				},
			},
		}
	end,
}

function M.config(spec, opts)
	local telescope = require(spec.main)
	telescope.setup(opts)
	telescope.load_extension("fzf")
	telescope.load_extension("live_grep_args")
	telescope.load_extension("ui-select")

	vim.keymap.set("n", "<leader>b", ":Telescope buffers<CR>", { desc = " Telescope: buffers" })
	vim.keymap.set("n", "<leader>c", ":Telescope resume<CR>", { desc = " Telescope: continue previous search" })
	vim.keymap.set("n", "<leader>f", ":Telescope find_files<CR>", { desc = " Telescope: files" })
	vim.keymap.set("v", "<leader>f", "y<ESC>:Telescope find_files default_text=<c-r>0<CR>", { desc = "Telescope: files - with current selection" })
	vim.keymap.set(
		"n",
		"<leader>r",
		":Telescope lsp_references show_line=false<CR>",
		{ desc = " Telescope: references" }
	)
	vim.keymap.set("n", "<leader>w", function()
		telescope.extensions.live_grep_args.live_grep_args()
	end, { desc = " Telescope: words" })
	vim.keymap.set("v", "<leader>w", function()
		vim.cmd('normal! y')
		local text = vim.fn.getreg('"')
		telescope.extensions.live_grep_args.live_grep_args({ default_text = text })
	end, { desc = "Telescope: words - with current selection" })
end

return M
