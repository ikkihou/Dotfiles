local status_ok, project = pcall(require, "project")

if not status_ok then
	return
end

project.setup({
	manual_mode = false,
    use_lsp = true,
	patterns = { ".git", "_darcs", "src", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
	ignore_lsp = { "null-ls", "copilot" },
	exclude_dirs = {},
	show_hidden = false,
	silent_chdir = true,
	scope_chdir = "global",
	datapath = vim.fn.stdpath("data"),
})
