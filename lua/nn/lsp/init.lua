require("nn.lsp.mason")

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	vim.notify("LSPConfig could not be loaded!", "error")
	return
end

local handlers = require("nn.lsp.handlers")

handlers.setup()

lspconfig["html"].setup({
	capabilities = handlers.capabilities,
	on_attach = handlers.on_attach,
})

lspconfig["tsserver"].setup({
	capabilities = handlers.capabilities,
	on_attach = handlers.on_attach,
})

lspconfig["tailwindcss"].setup({
	capabilities = handlers.capabilities,
	on_attach = handlers.on_attach,
})

lspconfig["cssls"].setup({
	capabilities = handlers.capabilities,
	on_attach = handlers.on_attach,
})

lspconfig["emmet_ls"].setup({
	capabilities = handlers.capabilities,
	on_attach = handlers.on_attach,
	filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
})

lspconfig["lua_ls"].setup({
	capabilities = handlers.capabilities,
	on_attach = handlers.on_attach,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})
