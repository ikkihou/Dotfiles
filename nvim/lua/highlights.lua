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
	-- AlphaButtons = { fg = "#cba6f7", italic = true, default = true },
	-- AlphaHeader = { fg = "#89b4fa", default = true },
}

-- -Alpha highlight
function M.get_alpha_hl()
	if vim.g.nvchad_theme == "catppuccin" then
		M.override.AlphaButtons = { fg = "#cba6f7", italic = true, default = true }
		M.override.AlphaHeader = { fg = "#89b4fa", default = true }
	elseif vim.g.nvchad_theme == "gruvbox" then
		M.override.AlphaButtons = { fg = "#83a589", italic = true, default = true }
		M.override.AlphaHeader = { fg = "#fabd2f", default = true }
	elseif vim.g.nvchad_theme == "everforest" then
		M.override.AlphaButtons = { fg = "#83a589", italic = true, default = true }
		M.override.AlphaHeader = { fg = "#89b4fa", default = true }
	else
		return
	end
end

return M
