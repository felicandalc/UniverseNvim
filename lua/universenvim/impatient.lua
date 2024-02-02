local status_ok, impatient = pcall(require, "impatient")
if not status_ok then
	vim.notify("Impatient could not be loaded!", "error")
	return
end

impatient.enable_profile()
