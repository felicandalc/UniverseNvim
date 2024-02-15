local M = {}
local format = require("universenvim.utils.formatter").format

M.cache = {}

function M.init()
	vim.api.nvim_create_autocmd({ "LspAttach", "BufWritePost" }, {
		group = vim.api.nvim_create_augroup("universenvim_root_cache", { clear = true }),
		callback = function(event)
			M.cache[event.buf] = nil
		end,
	})
	format.setup()
end

return M
