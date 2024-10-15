local Utils = require("universenvim.utils.core")

return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				tailwindcss = {
					filetypes_exclude = { "markdown" },
					filetypes_include = {},
				},
			},
			setup = {
				tailwindcss = function(_, opts)
					local tailwindServerName = "tailwindcss"
					local status_ok, tw = pcall(require, "lspconfig.configs" .. tailwindServerName)
					if not status_ok then
						local server_status_ok, tw_server =
							pcall(require, "lspconfig.server_configurations" .. tailwindServerName)
						if not server_status_ok then
							Utils.error("LSPConfig - TailwindCSS could not be loaded!")
							return
						end
						tw = tw_server
					end
					opts.filetypes = opts.filetypes or {}

					vim.list_extend(opts.filetypes, tw.default_config.filetypes)

					opts.filetypes = vim.tbl_filter(function(ft)
						return not vim.tbl_contains(opts.filetypes_exclude or {}, ft)
					end, opts.filetypes)

					vim.list_extend(opts.filetypes, opts.filetypes_include or {})
				end,
			},
		},
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{ "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
		},
		opts = function(_, opts)
			local format_kinds_icons = opts.formatting.format
			opts.formatting.format = function(entry, item)
				format_kinds_icons(entry, item)
				return require("tailwindcss-colorizer-cmp").formatter(entry, item)
			end
		end,
	},
}
