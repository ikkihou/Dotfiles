require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<leader>fm", function()
	require("conform").format()
	require("notify")("File formatted with conform")
end, { desc = "File Format with conform" })

map("i", "jk", "<ESC>", { desc = "Escape insert mode" })

local M = {}

-- <C> -> Ctrl
-- <leader> -> Space
-- <S> -> shift
-- <kPoint> -> Keypad Point (.)
-- <kEqual> -> Keypad Equal (=)
-- <kPlus> -> Keypad Plus (+)
-- <kMinus> -> Keypad Minus (-)
--

---------------------------------------------------------------------------
-- M.disabled = {
-- 	n = {
-- 		["<leader>lq"] = "",
-- 		-- ["gd"] = "",
-- 		["K"] = "",
-- 		["<leader>ca"] = "",
-- 		-- ["<tab>"] = "",
-- 		-- ["<S-tab>"] = "",
-- 		-- ["<leader>x"] = "",
-- 		["<leader>b"] = "",
-- 		["gr"] = "",
-- 		["<leader>th"] = "",
-- 		["<leader>/"] = "",
-- 	},
-- }

---------------------------------------------------------------------------
M.dap = {
	n = {
		["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>", "DapToggleBreakpoint" },
		["<leader>dr"] = { "<cmd> DapContinue <CR>", "Start or continue the debugger" },
	},
}

M.dap_python = {
	n = {
		["<leader>dpr"] = {
			function()
				require("dap-python").test_method()
			end,
			"Debug for python",
		},
	},
}

M.general = {
	n = {
		-- ["<leader>t"] = { "<cmd> ToggleTerm direction=horizontal <CR>", "Toggle terminal horizontally" },
		-- ["<leader>/"] = { "<cmd> ToggleTerm direction=vertical <CR>", "Toggle terminal vertically" },
		-- [";"] = { ":", "enter command mode", opts = { nowait = true } },
		["<C-]>"] = { "<cmd> vertical resize -4 <CR>", "window: Resize -4 vertically" },
		["<C-[>"] = { "<cmd> vertical resize +4 <CR>", "window: Resize +4 vertically" },
		["<C-;>"] = { "<cmd> resize -2 <CR>", "window: Resize -2 horizontally" },
		["<C-'>"] = { "<cmd> resize +2 <CR>", "window: Resize +2 horizontally" },
		["<leader>w"] = { ":w<CR>", "save buffer" },
		["<leader>fn"] = { "<cmd> enew <CR>", "Create new file" },
		-- ["<leader>se"] = {
		--   function()
		--     require("swenv.api").pick_venv_2()
		--   end,
		--   "pick conda venv",
		-- },
	},

	t = {
		["qq"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "Escape terminal mode" },
		["jk"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "Escape terminal mode" },
		["<C-]>"] = { "<cmd> vertical resize -4 <CR>", "window: Resize -4 vertically" },
		["<C-[>"] = { "<cmd> vertical resize +4 <CR>", "window: Resize +4 vertically" },
		["<C-;>"] = { "<cmd> resize -2 <CR>", "window: Resize -2 horizontally" },
		["<C-'>"] = { "<cmd> resize +2 <CR>", "window: Resize +2 horizontally" },
	},
	i = {
		["<C-]>"] = { "<cmd> vertical resize -4 <CR>", "window: Resize -4 vertically" },
		["<C-'>"] = { "<cmd> resize +2 <CR>", "window: Resize +2 horizontally" },
	},
}

M.neogen = {
	n = {
		["<leader>dg"] = { "<cmd> Neogen <CR>", "Generating Doctring" },
	},
}

M.boole = {
	n = {
		["<leader>i"] = { "<cmd> Boole {increment | decrement} <CR>", "Toggle or cycle up or down" },
	},
}

-- M.toggleterm = {
-- 	plugin = true,
-- 	n = {
-- 		["<C-\\>"] = { "<cmd> ToggleTerm direction=horizontal <CR>", "Toggle terminal horizontally" },
-- 		["<C-/>"] = { "<cmd> ToggleTerm direction=vertical <CR>", "Toggle terminal vertically" },
-- 		["<C-f>"] = { "<cmd> ToggleTerm direction=float <CR>", "Toggle terminal float" },
-- 	},
-- 	i = {
-- 		["<C-\\>"] = { "<cmd> ToggleTerm direction=horizontal <CR>", "Toggle terminal horizontally" },
-- 		["<C-/>"] = { "<cmd> ToggleTerm direction=vertical <CR>", "Toggle terminal vertically" },
-- 		["<C-f>"] = { "<cmd> ToggleTerm direction=float <CR>", "Toggle terminal float" },
-- 	},
-- 	t = {
-- 		["qq"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "Escape terminal mode" },
-- 		["jk"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "Escape terminal mode" },
-- 		["<C-\\>"] = { "<cmd> ToggleTerm direction=horizontal <CR>", "Toggle terminal horizontally" },
-- 		["<C-/>"] = { "<cmd> ToggleTerm direction=vertical <CR>", "Toggle terminal vertically" },
-- 		["<C-f>"] = { "<cmd> ToggleTerm direction=float <CR>", "Toggle terminal float" },
-- 	},
-- }

M.telescope = {
	n = {
		["<leader>fr"] = { "<cmd> Telescope frecency <CR> ", "Find files given frecency" },
		["<leader>fp"] = { "<cmd> Telescope projects theme=dropdown <CR>", "Find projects" },
		-- ["<leader>ft"] = { "<cmd> Telescope themes <CR>", "NcChad themes " },
	},
}

-- M.gitsigns = {
--   plugin = true,
--   n = {
--     ["<leader>gl"] = {
--       function()
--         require("gitsigns").toggle_current_line_blame()
--       end,
--     },
--     "toggle_current_line_blame",
--   },
-- }

-- more keybinds!
M.accelerated_jk = {
	n = {
		k = { "<Plug>(accelerated_jk_gk)", "accelerated up movement" },
		j = { "<Plug>(accelerated_jk_gj)", "accelerated down movement" },
	},
}

M.lspsaga = {
	n = {
		["gn"] = { "<cmd> Lspsaga rename <CR>", "Rename" },
		["<leader>."] = { "<cmd>Lspsaga code_action<CR>", "󰅱 Code Action" },
		["gh"] = {
			"<cmd>Lspsaga finder ref+def<cr>",
			"Lspsaga Lsp_Finder",
		},
		["gd"] = {
			"<cmd>Lspsaga goto_definition<cr>",
			"Go to definition",
		},
		["<leader>lp"] = {
			"<cmd>Lspsaga peek_definition<cr>",
			"Peek definition",
		},
		["<leader>k"] = {
			"<Cmd>Lspsaga hover_doc<cr>",
			"Hover lsp",
		},
		["<leader>o"] = { "<cmd>Lspsaga outline<CR>", " Show Outline" },
		--  LSP
		["gr"] = { "<cmd>Telescope lsp_references<CR>", " Lsp references" },
		["[d"] = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", " Prev Diagnostic" },
		["]d"] = { "<cmd>Lspsaga diagnostic_jump_next<CR>", " Next Diagnostic" },
		["<leader>lq"] = {
			function()
				vim.diagnostic.setloclist()
			end,
			"󰁨 Lsp Quickfix",
		},
	},
}

for _, maps in pairs(M) do
	for mode, data in pairs(maps) do
		for key, val in pairs(data) do
			map(mode, key, val[1], { desc = val[2] })
		end
	end
end
