local Utils = require("universenvim.utils.core")

return {
	"numToStr/Comment.nvim",
	lazy = false,
	dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
	config = function()
		local status_ok, comment = pcall(require, "Comment")
		if not status_ok then
			Utils.error("Comment could not be loaded")
			return
		end
		local U = require("Comment.utils")

		local status_ok_ts_context_commentstring, ts_context_commentstring = pcall(require, "ts_context_commentstring")
		if not status_ok_ts_context_commentstring then
			Utils.error("TS context commentstring could not be loaded")
			return
		end

		comment.setup({
			padding = true,
			sticky = true,
			ignore = "",
			toggler = {
				line = "gcc",
				block = "gbc",
			},
			opleader = {
				line = "gc",
				block = "gb",
			},
			extra = {
				above = "gcO",
				below = "gco",
				eol = "gcA",
			},
			mappings = {
				basic = true,
				extra = true,
			},
			pre_hook = function(ctx)
				local location = nil
				if ctx.ctype == U.ctype.blockwise then
					location = ts_context_commentstring.utils.get_cursor_location() or { 0, 0 }
				elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
					location = ts_context_commentstring.utils.get_visual_start_location() or { 0, 0 }
				end

				return ts_context_commentstring.internal.calculate_commentstring({
					key = ctx.ctype == U.ctype.linewise and "__default" or "__multiline",
					location = location or { 0, 0 },
				}) or "/* %s */"
			end,
			post_hook = function() end,
		})
	end,
}
