return {
	{
		"Exafunction/windsurf.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",
		},
		event = "BufEnter",
		config = function()
			require("codeium").setup({
				enable_chat = true,
			})
		end,
		keys = {
			{
				"<C-g>",
				function()
					return vim.fn["codeium#Accept"]()
				end,
				expr = true,
				silent = true,
				mode = "i",
				desc = "Accept Codeium suggestion",
			},
			{
				"<C-;>",
				function()
					return vim.fn["codeium#CycleCompletions"](1)
				end,
				expr = true,
				silent = true,
				mode = "i",
				desc = "Next Codeium suggestion",
			},
			{
				"<C-,>",
				function()
					return vim.fn["codeium#CycleCompletions"](-1)
				end,
				expr = true,
				silent = true,
				mode = "i",
				desc = "Previous Codeium suggestion",
			},
			{
				"<C-x>",
				function()
					return vim.fn["codeium#Clear"]()
				end,
				expr = true,
				silent = true,
				mode = "i",
				desc = "Clear Codeium suggestion",
			},
		},
	},
}