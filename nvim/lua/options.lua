require("nvchad.options")
-- require("diagnostic")

local M = {}

M.options = {
	statusline_func = {
		nvchad = function()
			local venv = require("venv-selector").venv()
			local venv_name = vim.fn.fnamemodify(venv, ":t") -- Shorten name of venv
			if not venv_name then
				return ""
			end

			if venv_name ~= nil then
				return " 🐍 " .. venv_name
			end
		end,
	},
}
return M
