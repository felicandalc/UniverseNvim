local M = { format = {} }
local root = M.format
local Utils = require("universenvim.utils.core")

root.formatters = {}

function root.register(formatter)
	root.formatters[#root.formatters + 1] = formatter
	table.sort(root.formatters, function(a, b)
		return a.priority > b.priority
	end)
end

function root.enabled(buf)
	buf = (buf == nil or buf == 0) and vim.api.nvim_get_current_buf() or buf
	local gaf = vim.g.autoformat
	local baf = vim.b[buf].autoformat

	if baf ~= nil then
		return baf
	end

	return gaf == nil or gaf
end

function root.resolve(buf)
	buf = buf or vim.api.nvim_get_current_buf()
	local have_primary = false
	return vim.tbl_map(function(formatter)
		local sources = formatter.sources(buf)
		local active = #sources > 0 and (not formatter.primary or not have_primary)
		have_primary = have_primary or (active and formatter.primary) or false
		return setmetatable({
			active = active,
			resolved = sources,
		}, { __index = formatter })
	end, root.formatters)
end

function root.info(buf)
	buf = buf or vim.api.nvim_get_current_buf()
	local gaf = vim.g.autoformat == nil or vim.g.autoformat
	local baf = vim.b[buf].autoformat
	local enabled = root.enabled(buf)
	local lines = {
		"# Status",
		("- [%s] global **%s**"):format(gaf and "x" or " ", gaf and "enabled" or "disabled"),
		("- [%s] buffer **%s**"):format(
			enabled and "x" or " ",
			baf == nil and "inherit" or baf and "enabled" or "disabled"
		),
	}
	local have = false
	for _, formatter in ipairs(root.resolve(buf)) do
		if #formatter.resolved > 0 then
			have = true
			lines[#lines + 1] = "\n# " .. formatter.name .. (formatter.active and " ***(active)***" or "")
			for _, line in ipairs(formatter.resolved) do
				lines[#lines + 1] = ("- [%s] **%s**"):format(formatter.active and "x" or " ", line)
			end
		end
	end
	if not have then
		lines[#lines + 1] = "\n***No formatters available for this buffer.***"
	end
	Utils[enabled and "info" or "warn"](
		table.concat(lines, "\n"),
		{ title = "UniverseNvimFormat (" .. (enabled and "enabled" or "disabled") .. ")" }
	)
end

function root.format(opts)
	opts = opts or {}
	local buf = opts.buf or vim.api.nvim_get_current_buf()
	if not ((opts and opts.force) or root.enabled(buf)) then
		return
	end

	local done = false
	for _, formatter in ipairs(root.resolve(buf)) do
		if formatter.active then
			done = true
			Utils.try(function()
				return formatter.format(buf)
			end, { msg = "Formatter `" .. formatter.name .. "` failed" })
		end
	end

	if not done and opts and opts.force then
		Utils.warn("No formatter available", { title = "UniverseNvim" })
	end
end

function root.setup()
	vim.api.nvim_create_autocmd("BufWritePre", {
		group = vim.api.nvim_create_augroup("UniverseNvimFormat", {}),
		callback = function(event)
			root.format({ buf = event.buf })
		end,
	})

	vim.api.nvim_create_user_command("UniverseNvimFormat", function()
		root.format({ force = true })
	end, { desc = "Format selection or buffer" })

	vim.api.nvim_create_user_command("UniverseNvimFormatInfo", function()
		root.info()
	end, { desc = "Show info about the formatters for the current buffer" })
end

return M
