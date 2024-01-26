local status_ok, mason = pcall(require, "mason")
if not status_ok then
	vim.notify("Mason could not be loaded!", "error")
	return
end

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

local status_ok, mason_lsp_config = pcall(require, "mason-lspconfig")
if not status_ok then
	vim.notify("Mason LSPConfig could not be loaded!", "error")
	return
end

mason_lsp_config.setup({
	ensure_installed = { "lua_ls", "tsserver" },
})
mason_lsp_config.setup_handlers({})

local status_ok, mason_null_ls = pcall(require, "mason-null-ls")
if not status_ok then
	vim.notify("Mason Null LS could not be loaded!", "error")
	return
end

mason_null_ls.setup()
