local status_ok, project = pcall(require, "project")

if not status_ok then
	return
end

project.setup({
	manual_mode = false,
	patterns = { ".git", "_darcs", "src", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
	exclude_dirs = {},
	show_hidden = true,
	silent_chdir = true,
	scope_chdir = "global",
	datapath = vim.fn.stdpath("data"),
	telescope = {
		enabled = true,
	},
	lsp = {
		enabled = true,
		ignore = { "copilot" },
	},
})
