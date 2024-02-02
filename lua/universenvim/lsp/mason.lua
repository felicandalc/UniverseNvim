local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then
	vim.notify("Mason could not be loaded!", "error")
	return
end

local mason_lsp_config_status_ok, mason_lsp_config = pcall(require, "mason-lspconfig")
if not mason_lsp_config_status_ok then
	vim.notify("Mason LSPConfig could not be loaded!", "error")
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

mason_lsp_config.setup({
	ensure_installed = { "lua_ls", "tsserver", "html", "cssls", "tailwindcss", "emmet_ls", "prismals", "graphql" },
	automatic_installation = true,
})
mason_lsp_config.setup_handlers({})

local mason_null_ls_status_ok, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status_ok then
	vim.notify("Mason Null LS could not be loaded!", "error")
	return
end

mason_null_ls.setup()
