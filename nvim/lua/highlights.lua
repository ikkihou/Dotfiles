-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
	-- Normal = {
	-- 	-- bg = "",
	-- },
	FloatBorder = {
		fg = "light_grey",
	},
	-- Comment = {
	--     italic = true,
	--     fg = "light_grey",
	-- },
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
	-- CursorLine = {
	--   bg = "lightbg",
	-- },
	["@comment"] = { italic = true },
	["@function"] = { italic = true },
	["@function.call"] = { italic = true },
	["@keyword"] = { italic = true },
	["@keyword.return"] = { italic = true },
	["@keyword.Define"] = { italic = true },
	["@function_definition"] = { italic = true },
	["@string"] = { italic = true },
	["@storageclass"] = { italic = true },
	["@type"] = { italic = true },
	["@type.qualifier"] = { italic = true },
	["@type.builtin"] = { italic = true },
	["@type.identifier"] = { italic = true },
	["@repeat"] = { italic = true },
	["@parameter"] = { italic = true },

	["@property"] = { italic = true },
	["@variable.builtin"] = { italic = true },
}

return M
