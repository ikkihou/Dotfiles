-----------------------------------------------------------
-- Autocommand functions
-----------------------------------------------------------

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

autocmd("BufEnter", {
  command = "lua require('lazygit.utils').project_root_dir()",
})
