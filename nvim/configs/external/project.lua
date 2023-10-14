local status_ok, project = pcall(require, "project_nvim")

if not status_ok then
    return
end

project.setup {
    manual_mode = false,
    detection_methods = { "lsp", "pattern" },
    patterns = { ".git", "_darcs", "src", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
    ignore_lsp = { "null-ls", "copilot" },
    exclude_dirs = {},
    show_hidden = false,
    silent_chdir = true,
    scope_chdir = "global",
    datapath = vim.fn.stdpath "data",
}
