local Utils = require("universenvim.utils.core")

return {
	{
		"folke/trouble.nvim",
		cmd = { "Trouble" },
		opts = {
			modes = {
				lsp = {
					win = { position = "right" },
				},
			},
		},
		keys = {
			{ "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
			{ "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
			{ "<leader>cs", "<cmd>Trouble symbols toggle<cr>", desc = "Symbols (Trouble)" },
			{ "<leader>cS", "<cmd>Trouble lsp toggle<cr>", desc = "LSP references/definitions/... (Trouble)" },
			{ "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
			{ "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
			{
				"[q",
				function(view)
					local trouble = require("trouble")

					if trouble.is_open() then
						trouble.prev(view, { skip_groups = true, jump = true })
					else
						local ok, err = pcall(vim.cmd.cprev)
						if not ok then
							Utils.error(err)
						end
					end
				end,
				desc = "Previous Trouble/Quickfix Item",
			},
			{
				"]q",
				function(view)
					local trouble = require("trouble")

					if trouble.is_open() then
						trouble.next(view, { skip_groups = true, jump = true })
					else
						local ok, err = pcall(vim.cmd.cnext)
						if not ok and err then
							Utils.error(err)
						end
					end
				end,
				desc = "Next Trouble/Quickfix Item",
			},
		},
	},
}
