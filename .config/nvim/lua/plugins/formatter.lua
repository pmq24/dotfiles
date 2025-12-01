local M = {
	"mhartington/formatter.nvim",
	event = { "VeryLazy" },
	main = "formatter",
	opts = function()
		return {
			filetype = {
				css = {
					require("formatter.filetypes.css").prettier,
				},
				eruby = {
					require("formatter.filetypes.eruby").erbformatter,
				},
				go = {
					require("formatter.filetypes.go").gofmt,
				},
				javascript = {
					require("formatter.filetypes.javascript").prettier,
				},
				javascriptreact = {
					require("formatter.filetypes.javascript").prettier,
				},
				lua = {
					require("formatter.filetypes.lua").stylua,
				},
				markdown = {
					require("formatter.filetypes.javascript").prettier,
				},
				ruby = {
					require("formatter.filetypes.ruby").rubocop,
					function()
						return {
							"--auto-correct",
						}
					end,
				},
				typescript = {
					require("formatter.filetypes.typescript").prettier,
				},
				typescriptreact = {
					require("formatter.filetypes.typescriptreact").prettier,
				},
				yaml = {
					require("formatter.filetypes.yaml").prettierd,
				},
				["*"] = {
					require("formatter.filetypes.any").remove_trailing_whitespace,
				},
			},
			logging = false,
		}
	end,
}

function M.config(spec, opts)
	require(spec.main).setup(opts)

	-- vim.api.nvim_create_autocmd("BufWritePost", {
	-- 	command = ":FormatWrite",
	-- 	pattern = "*",
	-- })
end

return M
