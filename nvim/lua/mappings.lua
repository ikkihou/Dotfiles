require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set

map({ "n" }, "<S-l>", "$", { desc = "Move cursor to end of the line" })
map({ "n" }, "<S-h>", "^", { desc = "Move cursor to beginning of the line" })
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
		["<C-]>"] = { "<cmd> vertical resize -4 <CR>", "window: Resize -4 vertically" },
		["<C-[>"] = { "<cmd> vertical resize +4 <CR>", "window: Resize +4 vertically" },
		["<C-;>"] = { "<cmd> resize -2 <CR>", "window: Resize -2 horizontally" },
		["<C-'>"] = { "<cmd> resize +2 <CR>", "window: Resize +2 horizontally" },
		["<leader>w"] = { ":w<CR>", "save buffer" },
		["<leader>fn"] = { "<cmd> enew <CR>", "Create new file" },
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

M.telescope = {
	n = {
		["<leader>fr"] = { "<cmd> Telescope frecency <CR> ", "Find files given frecency" },
		["<leader>fp"] = { "<cmd> Telescope projects theme=dropdown <CR>", "Find projects" },
		["<leader>ft"] = {
			function()
				require("nvchad.themes").open()
			end,
			"NvChad themes ",
		},
	},
}

M.lsp = {
	n = {
		["gn"] = { vim.lsp.buf.rename, "Rename" },
		["gd"] = {
			vim.lsp.buf.definition,
			"Go to definition",
		},
		["gD"] = {
			vim.lsp.buf.declaration,
			"Go to definition",
		},
		["<leader>k"] = {
			vim.lsp.buf.hover,
			"Hover lsp",
		},
		["<leader>wa"] = {
			vim.lsp.buf.add_workspace_folder,
			"Add workspace folder",
		},
		["<leader>wr"] = {
			vim.lsp.buf.remove_workspace_folder,
			"Remove workspace folder",
		},
		["<leader>wl"] = {
			function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end,
			"List workspace folders",
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

-- more keybinds!
map("n", "j", "<Plug>(accelerated_jk_gj)", { desc = "accelerated up movement" })
map("n", "k", "<Plug>(accelerated_jk_gk)", { desc = "accelerated down movement" })
map({ "n", "t" }, "<leader>tf", function()
	require("nvchad.term").toggle({ pos = "float", id = "floatTerm" })
end, { desc = "Terminal Toggle Floating term" })

---- menu ----
-- Keyboard users
vim.keymap.set("n", "<C-t>", function()
	require("menu").open("default")
end, {})
-- mouse users + nvimtree users!
vim.keymap.set("n", "<RightMouse>", function()
	vim.cmd.exec('"normal! \\<RightMouse>"')
	local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
	require("menu").open(options, { mouse = true })
end, {})
