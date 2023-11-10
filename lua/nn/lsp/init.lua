require("nn.lsp.mason")

local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	vim.notify("LSPConfig could not be loaded!", "error")
	return
end

require("nn.lsp.handlers").setup()
