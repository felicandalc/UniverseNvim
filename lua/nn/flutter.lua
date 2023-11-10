local status_ok, flutter_tools = pcall(require, "flutter-tools")
if not status_ok then
	vim.notify("Flutter tools could not be loaded!", "error")
	return
end

flutter_tools.setup({})
