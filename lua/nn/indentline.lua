local status_ok, indent_blankline = pcall(require, "ibl")
if not status_ok then
	vim.notify("Indent blankline could not be loaded!", "error")
	return
end

indent_blankline.setup({
	indent = {
		char = "▏",
	},
	exclude = {
		filetypes = {
			"help",
			"startify",
			"dashboard",
			"packer",
			"neogitstatus",
			"NvimTree",
			"Trouble",
		},
		buftypes = { "terminal", "nofile" },
	},
})
