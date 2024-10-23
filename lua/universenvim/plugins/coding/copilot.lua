local Utils = require("universenvim.utils")

return {
	recommended = true,
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		build = ":Copilot auth",
		opts = {
			suggestion = { enabled = false },
			panel = { enabled = false },
			filetypes = {
				markdown = true,
				help = true,
			},
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		optional = true,
		event = "VeryLazy",
		opts = function(_, opts)
			local colors = {
				[""] = { fg = vim.api.nvim_get_hl(0, { name = "Special", link = false }) },
				["Normal"] = { fg = vim.api.nvim_get_hl(0, { name = "Special", link = false }) },
				["Warning"] = { fg = vim.api.nvim_get_hl(0, { name = "DiagnosticError", link = false }) },
				["InProgress"] = { fg = vim.api.nvim_get_hl(0, { name = "DiagnosticWarn", link = false }) },
			}

			opts.sections = opts.sections or {}
			opts.sections.lualine_x = opts.sections.lualine_x or {}
			table.insert(opts.sections.lualine_x, 2, {
				function()
					local icon = " "
					local status = require("copilot.api").status.data
					return icon .. (status.message or "")
				end,
				cond = function()
					if not package.loaded["copilot"] then
						return
					end
					local ok, clients = pcall(Utils.lsp.get_clients, { name = "copilot", bufnr = 0 })
					if not ok then
						return false
					end
					return ok and #clients > 0
				end,
				color = function()
					if not package.loaded["copilot"] then
						return
					end
					local status = require("copilot.api").status.data
					return colors[status.status] or colors[""]
				end,
			})
		end,
	},

	{
		"nvim-cmp",
		dependencies = {
			{
				"zbirenbaum/copilot-cmp",
				dependencies = "copilot.lua",
				opts = {},
				config = function(_, opts)
					local copilot_cmp = require("copilot_cmp")
					copilot_cmp.setup(opts)

					Utils.lsp.on_attach(function()
						copilot_cmp._on_insert_enter({})
					end, "copilot")
				end,
			},
		},
		---@param opts cmp.ConfigSchema
		opts = function(_, opts)
			opts.sources = opts.sources or {}
			table.insert(opts.sources, 1, {
				name = "copilot",
				group_index = 1,
				priority = 100,
			})
		end,
	},
}
