local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("nn.lsp.lsp-installer")
require("nn.lsp.handlers").setup()
require "nn.lsp.null-ls"
