local M = {}

M.icons = {
	diagnostics = {
		Error = " ",
		Warn = " ",
		Hint = " ",
		Info = " ",
	},
	dap = {
		Stopped = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
		Breakpoint = " ",
		BreakpointCondition = " ",
		BreakpointRejected = { " ", "DiagnosticError" },
		LogPoint = ".>",
	},
}

M.indent_filetype_exclude = {
	"help",
	"dashboard",
	"mason",
	"NvimTree",
	"Trouble",
	"trouble",
	"toggleterm",
	"notify",
	"lazy",
}

return M
