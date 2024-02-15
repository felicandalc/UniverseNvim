local Utils = require("universenvim.utils.core")
local Constants = require("universenvim.config.constants")

return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		local status_ok, indent_blankline = pcall(require, "ibl")
		if not status_ok then
			Utils.error("Indent blankline could not be loaded!")
			return
		end

		indent_blankline.setup({
			indent = {
				char = "│",
				tab_char = "│",
			},
			scope = { enabled = false },
			exclude = {
				filetypes = Constants.indent_filetype_exclude,
			},
		})
	end,
}
