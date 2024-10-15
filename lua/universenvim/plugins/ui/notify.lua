local Utils = require("universenvim.utils.core")

return {
	"rcarriga/nvim-notify",
	keys = {
		{
			"<leader>un",
			function()
				require("notify").dismiss({ silent = true, pending = true })
			end,
			desc = "Dismiss all Notifications",
		},
	},
	opts = {
		timeout = 3000,
		max_height = function()
			return math.floor(vim.o.lines * 0.75)
		end,
		max_width = function()
			return math.floor(vim.o.columns * 0.75)
		end,
		on_open = function(win)
			vim.api.nvim_win_set_config(win, { zindex = 100 })
		end,
	},
	init = function()
		local status_ok, nvim_notify = pcall(require, "notify")
		if not status_ok then
			Utils.error("Notify could not be loaded!")
			return
		end

		-- Check if noice is available
		local has_noice = pcall(require, "noice")
		if not has_noice then
			vim.notify = nvim_notify
		end
	end,
}
