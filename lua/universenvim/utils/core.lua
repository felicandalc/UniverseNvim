local M = {}

function M.merge(...)
	local tables = { ... }

	if #tables < 2 then
		M.error("Merge requires at least two tables")
	end

	local result = {}

	for _, currentTable in ipairs(tables) do
		for key, value in pairs(currentTable) do
			result[key] = value
		end
	end

	return result
end

function M.is_windows()
	return vim.loop.os_uname().sysname:find("Windows") ~= nil
end

function M.is_avaiable(plugin)
	local lazy_config_avail, lazy_config = pcall(require, "lazy.core.config")
	if not lazy_config_avail then
		M.error(plugin .. "could not be loaded!")
	end

	return lazy_config_avail and lazy_config.spec.plugins[plugin] ~= nil
end

function M.opts(name)
	local plugin = require("lazy.core.config").plugins[name]
	if not plugin then
		return {}
	end
	local Plugin = require("lazy.core.plugin")
	return Plugin.values(plugin, "opts", false)
end

function M.on_very_lazy(fn)
	vim.api.nvim_create_autocmd("User", {
		pattern = "VeryLazy",
		callback = function()
			fn()
		end,
	})
end

function M.on_load(name, fn)
	local Config = require("lazy.core.config")
	if Config.plugins[name] and Config.plugins[name]._.loaded then
		fn(name)
	else
		vim.api.nvim_create_autocmd("User", {
			pattern = "LazyLoad",
			callback = function(event)
				if event.data == name then
					fn(name)
					return true
				end
			end,
		})
	end
end

function M.try(fn, opts)
	opts = type(opts) == "string" and { msg = opts } or opts or {}
	local msg = opts.msg
	local error_handler = function(err)
		msg = (msg and (msg .. "\n\n") or "") .. err .. M.pretty_trace()
		if opts.on_error then
			opts.on_error(msg)
		else
			vim.schedule(function()
				M.error(msg)
			end)
		end
		return err
	end

	local ok, result = xpcall(fn, error_handler)
	return ok and result or nil
end

function M.pretty_trace(opts)
	opts = opts or {}
	local Config = require("lazy.core.config")
	local trace = {}
	local level = opts.level or 2
	while true do
		local info = debug.getinfo(level, "Sln")
		if not info then
			break
		end
		if info.what ~= "C" and (Config.options.debug or not info.source:find("lazy.nvim")) then
			local source = info.source:sub(2)
			if source:find(Config.options.root, 1, true) == 1 then
				source = source:sub(#Config.options.root + 1)
			end
			source = vim.fn.fnamemodify(source, ":p:~:.")
			local line = "  - " .. source .. ":" .. info.currentline
			if info.name then
				line = line .. " _in_ **" .. info.name .. "**"
			end
			table.insert(trace, line)
		end
		level = level + 1
	end
	return #trace > 0 and ("\n\n# stacktrace:\n" .. table.concat(trace, "\n")) or ""
end

function M.notify(msg, opts)
	if vim.in_fast_event() then
		return vim.schedule(function()
			M.notify(msg, opts)
		end)
	end

	opts = opts or {}
	if type(msg) == "table" then
		msg = table.concat(
			vim.tbl_filter(function(line)
				return line or false
			end, msg),
			"\n"
		)
	end
	if opts.stacktrace then
		msg = msg .. M.pretty_trace({ level = opts.stacklevel or 2 })
	end
	local lang = opts.lang or "markdown"
	local n = opts.once and vim.notify_once or vim.notify
	n(msg, opts.level or vim.log.levels.INFO, {
		on_open = function(win)
			local ok = pcall(function()
				vim.treesitter.language.add("markdown")
			end)
			if not ok then
				pcall(require, "nvim-treesitter")
			end
			vim.wo[win].conceallevel = 3
			vim.wo[win].concealcursor = ""
			vim.wo[win].spell = false
			local buf = vim.api.nvim_win_get_buf(win)
			if not pcall(vim.treesitter.start, buf, lang) then
				vim.bo[buf].filetype = lang
				vim.bo[buf].syntax = lang
			end
		end,
		title = opts.title or "UniverseNvim",
	})
end

function M.error(msg, opts)
	opts = opts or {}
	opts.level = vim.log.levels.ERROR
	M.notify(msg, opts)
end

function M.info(msg, opts)
	opts = opts or {}
	opts.level = vim.log.levels.INFO
	M.notify(msg, opts)
end

function M.warn(msg, opts)
	opts = opts or {}
	opts.level = vim.log.levels.WARN
	M.notify(msg, opts)
end

function M.get_plugin(name)
	return require("lazy.core.config").spec.plugins[name]
end

function M.has(plugin)
	return M.get_plugin(plugin) ~= nil
end

return M
