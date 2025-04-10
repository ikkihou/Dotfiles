local M = {}

-- Path to overriding theme and highlights files
local highlights = require("highlights")
-- highlights.get_alpha_hl()
--
M.base46 = {
	theme = "catppuccin", -- default theme
	hl_add = {},
	hl_override = {},
	integrations = {},
	changed_themes = {},
	transparency = false,
	theme_toggle = { "catppuccin", "one_light" },
}

M.ui = {

	-- cmp themeing
	cmp = {
		icons = true,
		lspkind_text = true,
		style = "default", -- default/flat_light/flat_dark/atom/atom_colored
		border_color = "default", -- only applicable for "default" style, use color names from base30 variables
		selected_item_bg = "colored", -- colored / simple
	},

	telescope = { style = "bordered" },
}

-------------------- mason --------------------------
M.mason = {
	pkgs = {
		--bash
		"bash-language-server",
		--rust
		"rust-analyzer",
		-- go
		"gopls",
		"gofumpt",
		-- json
		-- "jq",
		"json-lsp",
		-- "jsonlint",
		-- bash
		"shellcheck",
		"shfmt",
		-- lua stuff
		"lua-language-server",
		"stylua",
		"selene",
		-- python staff
		"debugpy",
		-- "pyright",
		"black",
		-- "ruff",
		-- c/cpp stuff
		"clangd",
		"clang-format",
		"cmake-language-server",
		"cmakelang",
		"cmakelint",
		"codelldb",
		-- latex stuff
		"texlab",
		-- "latexindent",
		-- complementary
		"codespell",
		"taplo",
	},
}

M.term = {
	sizes = { vsp = 0.4 },
}

return M
