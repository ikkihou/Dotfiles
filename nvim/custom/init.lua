local opt = vim.opt
local g = vim.g

-- require "custom.autocmds"

------------------- options -------------------
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.backup = false
opt.swapfile = false
opt.scrolloff = 10
opt.relativenumber = true
opt.wrap = false
opt.cursorline = true
-- opt.cursorcolumn = true

---------- Indenting -----------
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.list = true
-- opt.listchars:append "space:⋅"

-----------number ---------------
opt.numberwidth = 4

-----------yank ---------------
vim.api.nvim_exec(
  [[
  augroup highlight_on_yank
    autocmd!
    autocmd TextYankPost * lua vim.highlight.on_yank()
  augroup end
]],
  false
)
g.highlightedyank_highlight_duration = 2000

------------ custom snippets --------------
g.vscode_snippets_path = vim.fn.stdpath "config" .. "/lua/custom/snippets"

-------------- custom python provider ---------------
local function isempty(s)
  return s == nil or s == ""
end

g.loaded_python3_provider = 1
local conda_prefix = os.getenv "CONDA_PREFIX"
if not isempty(conda_prefix) then
  g.python_host_prog = conda_prefix .. "/bin/python"
  g.python3_host_prog = conda_prefix .. "/bin/python"
else
  g.python_host_prog = "python"
  g.python3_host_prog = "python3"
end
