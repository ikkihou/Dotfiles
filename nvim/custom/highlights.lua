-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
  Comment = {
    italic = true,
    fg = "light_grey",
  },
  TelescopeResultsTitle = {
    fg = "sun",
    bg = "NONE",
  },
  TelescopePromptTitle = {
    fg = "red",
    bg = "NONE",
  },
  TelescopePreviewTitle = {
    bg = "NONE",
    fg = "teal",
  },
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "purple", bold = false },
}

---Alpha highlight
function M.get_alpha_hl()
  local set_hl = vim.api.nvim_set_hl
  if vim.g.nvchad_theme == "catppuccin" then
    set_hl(0, "AlphaShortcut", { fg = "#5c8984", italic = true, default = true })
    set_hl(0, "AlphaButtons", { fg = "#cba6f7", italic = true, default = true })
    set_hl(0, "AlphaHeader", { fg = "#89b4fa", default = true })
    set_hl(0, "AlphaFooter", { fg = "pink", default = true })
  elseif vim.g.nvchad_theme == "gruvbox" then
    set_hl(0, "AlphaShortcut", { fg = "#5c8984", italic = true, default = true })
    set_hl(0, "AlphaButtons", { fg = "#d3869b", italic = true, default = true })
    set_hl(0, "AlphaHeader", { fg = "orange", default = true })
    set_hl(0, "AlphaFooter", { fg = "#fe8019", default = true })
  else
    set_hl(0, "AlphaShortcut", { italic = true, default = true })
    set_hl(0, "AlphaButtons", { italic = true, default = true })
    set_hl(0, "AlphaHeader", { default = true })
    set_hl(0, "AlphaFooter", { default = true })
  end
end

return M
