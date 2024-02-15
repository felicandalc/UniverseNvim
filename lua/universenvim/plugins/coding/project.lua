local Utils = require("universenvim.utils.core")

return {
	"ahmedkhalf/project.nvim",
	config = function()
		local status_ok, project = pcall(require, "project_nvim")
		if not status_ok then
			Utils.error("Project could not be loaded!")
			return
		end

		project.setup({
			active = true,
			on_config_done = nil,
			manual_mode = false,
			detection_methods = { "pattern" },
			patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
			show_hidden = false,
			silent_chdir = true,
			ignore_lsp = {},
			datapath = vim.fn.stdpath("data"),
		})

		local tele_status_ok, telescope = pcall(require, "telescope")
		if not tele_status_ok then
			Utils.error("Telescope could not be loaded!")
			return
		end

		telescope.load_extension("projects")
	end,
}
