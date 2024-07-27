local overrides = require("configs.overrides")
local leet_arg = "leetcode.nvim"
local icons = {
	kind = require("configs.utils.icons").get("kind"),
	type = require("configs.utils.icons").get("type"),
	cmp = require("configs.utils.icons").get("cmp"),
}

return {
	-- {
	-- 	"nvim-tree/nvim-tree.lua",
	-- 	opts = {
	-- 		git = { enable = true },
	-- 	},
	-- },
	{
		"stevearc/conform.nvim",
		config = function()
			require("configs.conform")
		end,
	},
	{
		"linux-cultist/venv-selector.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"mfussenegger/nvim-dap",
			"mfussenegger/nvim-dap-python", --optional
			{ "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
		},
		lazy = true,
		branch = "regexp", -- This is the regexp branch, use this for the new version
		config = function()
			require("configs.external.venv-selector")
		end,
		ft = { "python" },
		keys = {
			-- Keymap to open VenvSelector to pick a venv.
			{ "<leader>vs", "<cmd>VenvSelect<cr>" },
			-- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
			{ "<leader>vc", "<cmd>VenvSelectCached<cr>" },
		},
	},
	{
		"kosayoda/nvim-lightbulb",
		event = "LspAttach",
	},
	{
		"folke/noice.nvim",
		event = "VimEnter",
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			-- "rcarriga/nvim-notify",
		},
		config = function()
			require("configs.external.noice")
		end,
	},
	{
		"goolord/alpha-nvim",
		enabled = true,
		event = "VimEnter",
		config = function()
			require("configs.external.alpha")
		end,
	},
	-- Standalone UI for nvim-LSP progress
	{
		"j-hui/fidget.nvim",
		event = "LspAttach",
		config = function()
			require("configs.external.fidget")
		end,
	},
	------------------ override plugin configs---------------------
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason-lspconfig.nvim" },
			{
				"ray-x/lsp_signature.nvim",
			},
		},
		config = function()
			require("nvchad.configs.lspconfig").defaults()
			require("configs.lspconfig")
		end, -- Override to setup mason-lspconfig
	},
	------------------ Override plugin definition options----------------------
	{
		"lukas-reineke/indent-blankline.nvim",
		opts = overrides.blankline,
		dependencies = {
			"HiPhish/rainbow-delimiters.nvim",
			config = function(_, opts)
				require("configs.external.rainbow")
			end,
		},
	},
	{
		"hrsh7th/nvim-cmp",
		opts = overrides.cmp,
		config = function(_, opts)
			local cmp = require("cmp")
			opts.mapping["<C-d>"] = cmp.mapping.scroll_docs(-4)
			opts.mapping["<C-f>"] = cmp.mapping.scroll_docs(4)
			opts.mapping["<C-j>"] = cmp.mapping.select_next_item()
			opts.mapping["<C-k>"] = cmp.mapping.select_prev_item()
			opts.mapping["<C-e>"] = cmp.mapping.close()
			opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.confirm({
						select = true,
						behavior = cmp.ConfirmBehavior.insert,
					})
				elseif require("luasnip").expand_or_jumpable() then
					require("luasnip").expand_or_jumpable()
				else
					fallback()
				end
			end, { "i", "s" })
			require("cmp").setup(opts)
		end,
	},
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "CursorHold", "CursorHoldI" },
		opts = overrides.treesitter,
	},
	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},

	-----------------@telescope-------------------
	{
		"nvim-telescope/telescope.nvim",
		opts = overrides.telescope,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"debugloop/telescope-undo.nvim",
			"tsakirist/telescope-lazy.nvim",
			{
				"ahmedkhalf/project.nvim",
				event = "VeryLazy",
				config = function()
					require("configs.external.project")
				end,
			},
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
			{
				"nvim-telescope/telescope-frecency.nvim",
			},
			{ "nvim-telescope/telescope-live-grep-args.nvim" },
		},
	},

	--------------- dap ---------------------
	{
		"mfussenegger/nvim-dap",
		config = function(_, opts)
			-- require("core.utils").load_mappings("dap")
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		-- event = "VeryLazy",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		opts = {
			handler = {},
			ensure_installed = {
				--cpp
				"codelldb",
				--python
				"debugpy",
			},
		},
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
	{
		"mfussenegger/nvim-dap-python",
		ft = "python",
		dependencies = {
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui",
		},
		config = function(_, opts)
			local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
			require("dap-python").setup(path)
			-- require("core.utils").load_mappings("dap_python")
		end,
	},

	------------------tools------------------------
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
	{
		"gbprod/yanky.nvim",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "BufReadPost",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
	{
		"folke/todo-comments.nvim",
		event = "LspAttach",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
	{
		"nat-418/boole.nvim",
		event = "BufReadPost",
		config = function()
			require("configs.external.boole")
		end,
	},
	{
		"danymat/neogen",
		dependencies = "nvim-treesitter/nvim-treesitter",
		event = "LspAttach",
		config = function(_, opts)
			require("neogen").setup({ snippet_engine = "luasnip" })
		end,
	},
	{
		"lervag/vimtex",
		ft = { "tex", "cls" },
		init = function()
			vim.g.tex_flavor = "latex"
			vim.g.vimtex_view_general_viewer = "Skim"
			vim.g.vimtex_view_method = "skim"
			vim.g.vimtex_view_skim_sync = 1
			vim.g.vimtex_view_skim_activate = 1
			vim.g.vimtex_compiler_latexmk_engines = {
				_ = "-xelatex",
			}
			vim.g.tex_comment_nospell = 1
			vim.g.vimtex_compiler_progname = "nvr"
			vim.g.vimtex_view_general_options = [[--unique file:@pdf\#src:@line@tex]]
			vim.g.vimtex_fold_enabled = 1
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
	},
	{
		"iurimateus/luasnip-latex-snippets.nvim",
		-- vimtex isn't required if using treesitter
		dependencies = { "L3MON4D3/LuaSnip", "lervag/vimtex" },
		config = function()
			require("luasnip-latex-snippets").setup()
			-- or setup({ use_treesitter = true })
			require("luasnip").config.setup({ enable_autosnippets = true })
		end,
	},
	{
		"folke/flash.nvim",
		event = "LspAttach",
		opts = {},
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"S",
				mode = { "n", "x", "o" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"r",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
			{
				"R",
				mode = { "o", "x" },
				function()
					require("flash").treesitter_search()
				end,
				desc = "Treesitter Search",
			},
			{
				"<c-s>",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
				desc = "Toggle Flash Search",
			},
		},
	},
	{
		"ethanholz/nvim-lastplace",
		event = "BufReadPre",
		config = function()
			require("nvim-lastplace").setup()
		end,
	},
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},

	{
		"rainbowhxch/accelerated-jk.nvim",
		event = "VeryLazy",
		dependencies = "nvim-treesitter",
		config = function()
			require("configs.external.accelerated-jk")
		end,
	},

	{
		"abecodes/tabout.nvim",
		event = "LspAttach",
		config = function()
			require("tabout").setup()
		end,
	},
	{
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup()
		end,
	},
	-------------- lsp ---------------
	{
		"nvimdev/lspsaga.nvim",
		event = "LspAttach",
		config = function()
			require("configs.external.lspsaga")
		end,
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter" },
		},
	},
	{
		"rust-lang/rust.vim",
		ft = "rust",
		init = function(_)
			vim.g.rustfmt_autosave = true
		end,
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^4", -- Recommended
		ft = { "rust" },
	},
	{
		"kawre/leetcode.nvim",
		build = ":TSUpdate html",
		lazy = leet_arg ~= vim.fn.argv()[1],
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim", -- required by telescope
			"MunifTanjim/nui.nvim",

			-- optional
			"nvim-treesitter/nvim-treesitter",
			"rcarriga/nvim-notify",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("configs.external.leetcode")
		end,
	},
}
