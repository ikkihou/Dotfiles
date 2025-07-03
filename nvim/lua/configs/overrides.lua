local M = {}

------------------ treesitter ---------------------
M.treesitter = {
	ensure_installed = {
		"vim",
		"lua",
		"json",
		"go",
		"html",
		"css",
		"javascript",
		"typescript",
		"tsx",
		"c",
		"cpp",
		"cmake",
		"python",
		"latex",
		"markdown",
		"markdown_inline",
		"rust",
		"toml",
	},
	indent = {
		disable = {
			"python",
		},
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	autotag = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			node_incremental = "v",
			node_decremental = "V",
		},
	},
}

------------------- nvimtree ----------------------
M.nvimtree = {
	filters = {
		dotfiles = false,
	},
	hijack_directories = {
		enable = true,
		auto_open = true,
	},
	open_on_tab = false,
	disable_netrw = false,
	hijack_netrw = true,
	hijack_unnamed_buffer_when_opening = true,
	respect_buf_cwd = true,
	sync_root_with_cwd = true,
	update_focused_file = {
		enable = true,
		update_root = true,
	},
	diagnostics = {
		enable = true,
		show_on_dirs = true,
		debounce_delay = 50,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	view = {
		adaptive_size = false,
		side = "left",
		width = 30,
		preserve_window_proportions = true,
		signcolumn = "yes",
		float = {
			enable = true,
			open_win_config = {
				relative = "editor",
				border = "rounded",
				width = 40,
				height = 30,
				row = 1,
				col = 1,
			},
		},
	},
	git = {
		enable = true,
		ignore = false,
		show_on_dirs = true,
		timeout = 400,
	},
	filesystem_watchers = {
		enable = true,
	},
	actions = {
		use_system_clipboard = true,

		open_file = {
			resize_window = false,
			quit_on_open = false,
		},
		change_dir = {
			enable = true,
			global = false,
		},
	},
	renderer = {
		root_folder_label = ":.:s?.*?/..?",
		highlight_git = true,
		highlight_opened_files = "none",
		special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md", "CMakeLists.txt" },
		indent_markers = {
			enable = true,
			icons = {
				corner = "└ ",
				edge = "│ ",
				item = "│ ",
				none = "  ",
			},
		},
		icons = {
			webdev_colors = true,
			git_placement = "after",
			padding = " ",
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = false,
			},
			glyphs = {
				default = "󰈚",
				symlink = "",
				folder = {
					default = "",
					empty = "",
					empty_open = "",
					open = "",
					symlink = "",
					symlink_open = "",
					arrow_open = "",
					arrow_closed = "",
				},
				git = {
					unstaged = "✗",
					staged = "✓",
					unmerged = "",
					renamed = "➜",
					untracked = "★",
					deleted = "",
					ignored = "◌",
				},
			},
		},
	},
	log = {
		enable = false,
		truncate = false,
		types = {
			all = false,
			config = false,
			copy_paste = false,
			dev = false,
			diagnostics = false,
			git = false,
			profile = false,
			watcher = false,
		},
	},
}

------------------ telescope -------------------------
M.telescope = {
	defaults = {
		vimgrep_arguments = {
			"rg",
			"-L",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},
		file_ignore_patterns = { ".git/", ".cache", "build/", "%.class", "%.pdf", "%.mkv", "%.mp4", "%.zip" },
		selection_caret = "  ",
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "ascending",
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.55,
				results_width = 0.8,
			},
			vertical = {
				mirror = false,
			},
			width = 0.87,
			height = 0.80,
			preview_cutoff = 120,
		},
		path_display = { "truncate" },
		winblend = 0,
		border = {},
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		color_devicons = true,
		set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
	},
	extensions_list = {
		"notify",
		"frecency",
		"undo",
		"projects",
		"lazy",
	},
	extensions = {
		frecency = {
			show_scores = true,
			show_unindexed = true,
			ignore_patterns = { "*.git/*", "*/tmp/*" },
		},
		live_grep_args = {
			auto_quoting = true,
			mappings = {},
		},
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
		lazy = {
			-- Whether or not to show the icon in the first column
			show_icon = true,
			-- Mappings for the actions
			mappings = {
				open_in_browser = "<C-o>",
				open_in_file_browser = "<M-b>",
				open_in_find_files = "<C-f>",
				open_in_live_grep = "<C-g>",
				open_plugins_picker = "<C-b>", -- Works only after having called first another action
				open_lazy_root_find_files = "<C-r>f",
				open_lazy_root_live_grep = "<C-r>g",
			},
			-- Other telescope configuration options
		},
	},
}

-----------------------------------------------------------------------
return M
