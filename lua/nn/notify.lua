local status_ok, nvim_notify = pcall(require, "notify")

if not status_ok then
  vim.notify("Notify could not be loaded!", "error")
	return
end

vim.notify = nvim_notify
