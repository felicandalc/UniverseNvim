local Utils = require("universenvim.utils.core")

local M = { lsp = { keymaps = {} } }
local root = M.lsp
local keymaps_root = root.keymaps

keymaps_root._keys = nil

function keymaps_root.get()
	if keymaps_root._keys then
		return keymaps_root._keys
	end
	keymaps_root._keys = {
		{ "<leader>cl", "<cmd>LspInfo<cr>", desc = "Lsp Info" },
		{
			"gd",
			function()
				require("telescope.builtin").lsp_definitions({ reuse_win = true })
			end,
			desc = "Goto Definition",
			has = "definition",
		},
		{ "gr", "<cmd>Telescope lsp_references<cr>", desc = "References" },
		{ "gD", vim.lsp.buf.declaration, desc = "Goto Declaration" },
		{ "gl", '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>', desc = "Diagnostics" },
		{
			"gI",
			function()
				require("telescope.builtin").lsp_implementations({ reuse_win = true })
			end,
			desc = "Goto Implementation",
		},
		{
			"gy",
			function()
				require("telescope.builtin").lsp_type_definitions({ reuse_win = true })
			end,
			desc = "Goto T[y]pe Definition",
		},
		{ "K", vim.lsp.buf.hover, desc = "Hover" },
		{ "gK", vim.lsp.buf.signature_help, desc = "Signature Help", has = "signatureHelp" },
		{ "<c-k>", vim.lsp.buf.signature_help, mode = "i", desc = "Signature Help", has = "signatureHelp" },
		{ "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" }, has = "codeAction" },
		{
			"<leader>cA",
			function()
				vim.lsp.buf.code_action({
					context = {
						only = {
							"source",
						},
						diagnostics = {},
					},
				})
			end,
			desc = "Source Action",
			has = "codeAction",
		},
	}
	if Utils.is_avaiable("inc-rename.nvim") then
		keymaps_root._keys[#keymaps_root._keys + 1] = {
			"<leader>cr",
			function()
				local inc_rename = require("inc_rename")
				return ":" .. inc_rename.config.cmd_name .. " " .. vim.fn.expand("<cword>")
			end,
			expr = true,
			desc = "Rename",
			has = "rename",
		}
	else
		keymaps_root._keys[#keymaps_root._keys + 1] =
			{ "<leader>cr", vim.lsp.buf.rename, desc = "Rename", has = "rename" }
	end
	return keymaps_root._keys
end

function keymaps_root.has(buffer, method)
	method = method:find("/") and method or "textDocument/" .. method
	local clients = root.get_clients({ bufnr = buffer })
	for _, client in ipairs(clients) do
		if client.supports_method(method) then
			return true
		end
	end
	return false
end

function keymaps_root.resolve(buffer)
	local Keys = require("lazy.core.handler.keys")
	if not Keys.resolve then
		return {}
	end
	local spec = keymaps_root.get()
	local opts = Utils.opts("nvim-lspconfig")
	local clients = root.get_clients({ bufnr = buffer })
	for _, client in ipairs(clients) do
		local maps = opts.servers[client.name] and opts.servers[client.name].keys or {}
		vim.list_extend(spec, maps)
	end
	return Keys.resolve(spec)
end

function keymaps_root.on_attach(_, buffer)
	local Keys = require("lazy.core.handler.keys")
	local keymaps = keymaps_root.resolve(buffer)

	for _, keys in pairs(keymaps) do
		if not keys.has or keymaps_root.has(buffer, keys.has) then
			local opts = Keys.opts(keys)
			opts.has = nil
			opts.silent = opts.silent ~= false
			opts.buffer = buffer
			vim.keymap.set(keys.mode or "n", keys.lhs, keys.rhs, opts)
		end
	end
end

function root.get_clients(opts)
	local ret = {}
	if vim.lsp.get_clients then
		ret = vim.lsp.get_clients(opts)
	else
		ret = vim.lsp.get_active_clients(opts)
		if opts and opts.method then
			ret = vim.tbl_filter(function(client)
				return client.supports_method(opts.method, { bufnr = opts.bufnr })
			end, ret)
		end
	end
	return opts and opts.filter and vim.tbl_filter(opts.filter, ret) or ret
end

function root.on_attach(on_attach)
	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
			local buffer = args.buf
			local client = vim.lsp.get_client_by_id(args.data.client_id)
			on_attach(client, buffer)
		end,
	})
end

function root.on_rename(from, to)
	local clients = root.get_clients()
	for _, client in ipairs(clients) do
		if client.supports_method("workspace/willRenameFiles") then
			local resp = client.request_sync("workspace/willRenameFiles", {
				files = {
					{
						oldUri = vim.uri_from_fname(from),
						newUri = vim.uri_from_fname(to),
					},
				},
			}, 1000, 0)
			if resp and resp.result ~= nil then
				vim.lsp.util.apply_workspace_edit(resp.result, client.offset_encoding)
			end
		end
	end
end

function root.get_config(server)
	local configs = require("lspconfig.configs")
	return rawget(configs, server)
end

function root.disable(server, cond)
	local lspconfig_util = require("lspconfig.util")
	local def = root.get_config(server)
	def.document_config.on_new_config = lspconfig_util.add_hook_before(
		def.document_config.on_new_config,
		function(config, root_dir)
			if cond(root_dir, config) then
				config.enabled = false
			end
		end
	)
end

function root.formatter(opts)
	opts = opts or {}
	local filter = opts.filter or {}
	filter = type(filter) == "string" and { name = filter } or filter
	local ret = {
		name = "LSP",
		primary = true,
		priority = 1,
		format = function(buf)
			root.format(Utils.merge(filter, { bufnr = buf }))
		end,
		sources = function(buf)
			local clients = root.get_clients(Utils.merge(filter, { bufnr = buf }))
			local ret = vim.tbl_filter(function(client)
				return client.supports_method("textDocument/formatting")
					or client.supports_method("textDocument/rangeFormatting")
			end, clients)
			return vim.tbl_map(function(client)
				return client.name
			end, ret)
		end,
	}
	return Utils.merge(ret, opts)
end

function root.format(opts)
	opts = vim.tbl_deep_extend("force", {}, opts or {}, Utils.opts("nvim-lspconfig").format or {})
	local ok, conform = pcall(require, "conform")
	if ok then
		opts.formatters = {}
		opts.lsp_fallback = true
		conform.format(opts)
	else
		vim.lsp.buf.format(opts)
	end
end

function root.execute(opts)
	local params = {
		command = opts.command,
		arguments = opts.arguments,
	}
	if opts.open then
		require("trouble").open({
			mode = "lsp_command",
			params = params,
		})
	else
		return vim.lsp.buf_request(0, "workspace/executeCommand", params, opts.handler)
	end
end

root.action = setmetatable({}, {
	__index = function(_, action)
		return function()
			vim.lsp.buf.code_action({
				apply = true,
				context = {
					only = { action },
					diagnostics = {},
				},
			})
		end
	end,
})

return M
