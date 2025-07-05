local status_ok, alpha = pcall(require, "alpha")

if not status_ok then
	return
end

local colors = require("base46").get_theme_tb("base_30")
local dashboard = require("alpha.themes.dashboard")

-- Header
dashboard.section.header.val = {
	[[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
	[[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⣠⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
	[[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣡⣾⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⣿⣟⠻⣿⣿⣿⣿⣿⣿⣿⣿]],
	[[⣿⣿⣿⣿⣿⣿⣿⣿⡿⢫⣷⣿⣿⣿⣿⣿⣿⣿⣾⣯⣿⡿⢧⡚⢷⣌⣽⣿⣿⣿⣿⣿⣶⡌⣿⣿⣿⣿⣿⣿]],
	[[⣿⣿⣿⣿⣿⣿⣿⣿⠇⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣮⣇⣘⠿⢹⣿⣿⣿⣿⣿⣻⢿⣿⣿⣿⣿⣿]],
	[[⣿⣿⣿⣿⣿⣿⣿⣿⠀⢸⣿⣿⡇⣿⣿⣿⣿⣿⣿⣿⣿⡟⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣻⣿⣿⣿⣿]],
	[[⣿⣿⣿⣿⣿⣿⣿⡇⠀⣬⠏⣿⡇⢻⣿⣿⣿⣿⣿⣿⣿⣷⣼⣿⣿⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⢻⣿⣿⣿⣿]],
	[[⣿⣿⣿⣿⣿⣿⣿⠀⠈⠁⠀⣿⡇⠘⡟⣿⣿⣿⣿⣿⣿⣿⣿⡏⠿⣿⣟⣿⣿⣿⣿⣿⣿⣿⣿⣇⣿⣿⣿⣿]],
	[[⣿⣿⣿⣿⣿⣿⡏⠀⠀⠐⠀⢻⣇⠀⠀⠹⣿⣿⣿⣿⣿⣿⣩⡶⠼⠟⠻⠞⣿⡈⠻⣟⢻⣿⣿⣿⣿⣿⣿⣿]],
	[[⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⢿⠀⡆⠀⠘⢿⢻⡿⣿⣧⣷⢣⣶⡃⢀⣾⡆⡋⣧⠙⢿⣿⣿⣟⣿⣿⣿⣿]],
	[[⣿⣿⣿⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⡥⠂⡐⠀⠁⠑⣾⣿⣿⣾⣿⣿⣿⡿⣷⣷⣿⣧⣾⣿⣿⣿⣿⣿⣿⣿]],
	[[⣿⣿⡿⣿⣍⡴⠆⠀⠀⠀⠀⠀⠀⠀⠀⣼⣄⣀⣷⡄⣙⢿⣿⣿⣿⣿⣯⣶⣿⣿⢟⣾⣿⣿⢡⣿⣿⣿⣿⣿]],
	[[⣿⡏⣾⣿⣿⣿⣷⣦⠀⠀⠀⢀⡀⠀⠀⠠⣭⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⣡⣾⣿⣿⢏⣾⣿⣿⣿⣿⣿]],
	[[⣿⣿⣿⣿⣿⣿⣿⣿⡴⠀⠀⠀⠀⠀⠠⠀⠰⣿⣿⣿⣷⣿⠿⠿⣿⣿⣭⡶⣫⠔⢻⢿⢇⣾⣿⣿⣿⣿⣿⣿]],
	[[⣿⣿⣿⡿⢫⣽⠟⣋⠀⠀⠀⠀⣶⣦⠀⠀⠀⠈⠻⣿⣿⣿⣾⣿⣿⣿⣿⡿⣣⣿⣿⢸⣾⣿⣿⣿⣿⣿⣿⣿]],
	[[⡿⠛⣹⣶⣶⣶⣾⣿⣷⣦⣤⣤⣀⣀⠀⠀⠀⠀⠀⠀⠉⠛⠻⢿⣿⡿⠫⠾⠿⠋⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
	[[⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣀⡆⣠⢀⣴⣏⡀⠀⠀⠀⠉⠀⠀⢀⣠⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
	[[⠿⠛⠛⠛⠛⠛⠛⠻⢿⣿⣿⣿⣿⣯⣟⠷⢷⣿⡿⠋⠀⠀⠀⠀⣵⡀⢠⡿⠋⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
	[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠛⢿⣿⣿⠂⠀⠀⠀⠀⠀⢀⣽⣿⣿⣿⣿⣿⣿⣿⣍⠛⠿⣿⣿⣿⣿⣿⣿]],
}

dashboard.section.header.opts.hl = "AlphaHeader"

-- Termcodes 缓存
local termcodes_cache = {}

local function replace_termcodes(key)
	if not termcodes_cache[key] then
		termcodes_cache[key] = vim.api.nvim_replace_termcodes(key .. "<ignore>", true, false, true)
	end
	return termcodes_cache[key]
end

-- 生成按钮
local function button(sc, txt, leader_txt, keybind, keybind_opts)
	local sc_after = sc:gsub("%s", ""):gsub(leader_txt, "<leader>")
	local opts = {
		position = "center",
		shortcut = sc,
		cursor = 5,
		width = 50,
		align_shortcut = "right",
		hl = "alphabuttons",
		hl_shortcut = "alphashortcut",
		keymap = {
			"n",
			sc_after,
			keybind or sc_after,
			keybind_opts or { noremap = true, silent = true, nowait = true },
		},
	}

	return {
		type = "button",
		val = txt,
		on_press = function()
			vim.api.nvim_feedkeys(replace_termcodes(sc_after), "t", false)
		end,
		opts = opts,
	}
end

local leader = " "
dashboard.section.buttons.val = {
	button("space f r", "  File frecency", leader, nil, {
		noremap = true,
		silent = true,
		nowait = true,
		callback = function()
			require("telescope").extensions.frecency.frecency()
		end,
	}),
	button("space f o", "󰋚  File history", leader, nil, {
		noremap = true,
		silent = true,
		nowait = true,
		callback = function()
			require("telescope.builtin").oldfiles()
		end,
	}),
	button("space f p", "  Project find", leader, nil, {
		noremap = true,
		silent = true,
		nowait = true,
		callback = function()
			-- require("telescope").extensions.projects.projects {}
			-- vim.api.nvim_command("Telescope projects theme=dropdown")
			require("telescope").extensions.projects.projects()
		end,
	}),
	button("space f f", "󰈞  File find", leader, nil, {
		noremap = true,
		silent = true,
		nowait = true,
		callback = function()
			require("telescope.builtin").find_files()
		end,
	}),
	button("space f w", "  Word find", leader, nil, {
		noremap = true,
		silent = true,
		nowait = true,
		callback = function()
			require("telescope").extensions.live_grep_args.live_grep_args()
		end,
	}),
	button("space f n", "  File new", leader, nil, {
		noremap = true,
		silent = true,
		nowait = true,
		callback = function()
			vim.api.nvim_command("enew")
		end,
	}),
	button("space f t", "  NvTheme", leader, nil, {
		noremap = true,
		silent = true,
		nowait = true,
		callback = function()
            require("nvchad.themes").open()
		end,
	}),
}

-- 生成 footer
local function footer()
	local stats = require("lazy").stats()
	local ms = string.format("%.2f", stats.startuptime)
	return "       Welcome back, Paul!\n"
		.. "󰀨 v"
		.. vim.version().major
		.. "."
		.. vim.version().minor
		.. "."
		.. vim.version().patch
		.. "  󰂖 "
		.. stats.count
		.. " plugins in "
		.. ms
		.. "ms"
end

-- 计算 padding
local head_butt_padding = 2
local occu_height = #dashboard.section.header.val + 2 * #dashboard.section.buttons.val + head_butt_padding
local header_padding = math.max(0, math.floor((vim.fn.winheight("$") - occu_height) / 4))
-- 配置 layout
dashboard.config.layout = {
	{ type = "padding", val = header_padding },
	dashboard.section.header,
	{ type = "padding", val = head_butt_padding },
	dashboard.section.buttons,
	{ type = "padding", val = 1 },
	dashboard.section.footer,
}

-- 统一高亮设置
vim.api.nvim_set_hl(0, "alphaheader", { fg = colors.green })
vim.api.nvim_set_hl(0, "alphabuttons", { fg = colors.blue, italic = true })
vim.api.nvim_set_hl(0, "align_shortcut", { fg = colors.blue, italic = true })

alpha.setup(dashboard.opts)

vim.api.nvim_create_autocmd("User", {
	pattern = "LazyVimStarted",
	callback = function()
		dashboard.section.footer.val = footer()
		pcall(vim.cmd.AlphaRedraw)
	end,
})
