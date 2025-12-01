local M = {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"L3MON4D3/LuaSnip",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/nvim-cmp",
		"onsails/lspkind.nvim",
	},
	event = "InsertEnter",
	main = "cmp",
	opts = function(spec)
		local cmp = require(spec.main)
		local lspkind = require("lspkind")

		return {
			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol",
					ellipsis_char = "...",
					show_labelDetails = true,
					symbol_map = {
						Codeium = "󰫢",
					},
				}),
			},
			mapping = {
				["<A-l>"] = function(fallback)
					if cmp.visible() and cmp.get_selected_entry() == nil then
						cmp.select_next_item()

						if #(cmp.get_entries()) == 1 then
							cmp.confirm()
						end
					else
						fallback()
					end
				end,
				h = function(fallback)
					if cmp.get_selected_entry() ~= nil then
						cmp.abort()
					else
						fallback()
					end
				end,
				j = function(fallback)
					if cmp.get_selected_entry() ~= nil then
						cmp.select_next_item()
					else
						fallback()
					end
				end,
				k = function(fallback)
					if cmp.get_selected_entry() ~= nil then
						cmp.select_prev_item()
					else
						fallback()
					end
				end,
				l = function(fallback)
					if cmp.get_selected_entry() ~= nil then
						cmp.confirm()
					else
						fallback()
					end
				end,
			},
			performance = {
				max_view_entries = 10,
			},
			preselect = cmp.PreselectMode.None,
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			sources = cmp.config.sources({
				{ max_item_count = 3, name = "codeium" },
			}, {
				{ max_item_count = 5, name = "nvim_lsp" },
			}),
			view = {
				docs = {
					auto_open = true,
				},
			},
		}
	end,
}

function M.config(spec, opts)
	local cmp = require(spec.main)

	cmp.setup(opts)

	cmp.setup.cmdline({ "/", "?" }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
		},
	})

	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "cmdline" },
		}, {
			{ name = "path" },
		}),
	})

	table.insert(opts.sources, {
		name = "lazydev",
		group_index = 0, -- set group index to 0 to skip loading LuaLS completions
	})
end

return M
