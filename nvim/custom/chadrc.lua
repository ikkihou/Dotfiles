---@typeChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "gruvbox",
  theme_toggle = { "gruvbox", "one_light" },

  transparency = false,

  hl_override = highlights.override,
  hl_add = highlights.add,

  -- extended_interations = { "alpha", "notify" },

  -- cmp themeing
  cmp = {
    icons = true,
    lspkind_text = true,
    style = "default", -- default/flat_light/flat_dark/atom/atom_colored
    border_color = "default", -- only applicable for "default" style, use color names from base30 variables
    selected_item_bg = "colored", -- colored / simple
  },

  telescope = { style = "bordered" },

  ----------------- statusline -----------------
  statusline = {
    -- theme = "vscode_colored",
    -- separator_style = "default",
  },

  -- tabufline
  tabufline = {
    -- overriden_modules = function()
    --     local modules = require "nvchad_ui.tabufline.modules"
    --     return {
    --         buttons = function()
    --             return modules.buttons() .. "close "
    --         end,
    --         -- or buttons = "" , this will hide the buttons
    --     }
    -- end,
  },

  -- nvdash
  -- nvdash = {
  --   load_on_startup = false,
  --
  -- },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M