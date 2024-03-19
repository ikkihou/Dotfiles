local overrides = require("configs.overrides")
local plugins = {
    ------------ ui -----------------
    {
        "swenv.nvim",
        ft = { "python" },
        dir = "~/Documents/coding/vscode/lua_space/swenv.nvim/",
        enabled = false,
    },
    {
        "linux-cultist/venv-selector.nvim",
        dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
        opts = {
            -- Your options go here
            -- name = "venv",
            -- auto_refresh = false
            -- anaconda_base_path = "/Users/baoyihui/anaconda3",
            anaconda_envs_path = "/Users/baoyihui/anaconda3/envs",
        },
        -- event = "VeryLazy", -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
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
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
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
            -- dofile(vim.g.base46_cache .. "alpha")
            require("configs.external.alpha")
        end,
    },
    -- Standalone UI for nvim-LSP progress
    {
        "j-hui/fidget.nvim",
        tag = "legacy",
        event = "LspAttach",
        config = function()
            require("fidget").setup()
        end,
    },
    ------------------ override plugin configs---------------------
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            -- format & linting
            -- {
            --     "nvimtools/none-ls.nvim",
            --     config = function()
            --         require("configs.none-ls")
            --     end,
            -- },
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
            -- "HiPhish/nvim-ts-rainbow2",
            "HiPhish/rainbow-delimiters.nvim",
            config = function(_, opts)
                require("configs.external.rainbow")
            end,
        },
    },
    {
        "hrsh7th/nvim-cmp",
        opts = overrides.cmp,
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
    -- {
    --     "NvChad/nvterm",
    --     enabled = false,
    -- },

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
                config = function()
                    require("telescope").load_extension("frecency")
                end,
                -- dependencies = { "kkharji/sqlite.lua" },
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
        dependencies = "mfussenegger/nvim-dap",
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
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end,
    },
    -- {
    --   "kdheepak/lazygit.nvim",
    --   -- optional for floating window border decoration
    --   cmd = { "LazyGit" },
    --   dependencies = {
    --     "nvim-telescope/telescope.nvim",
    --     "nvim-lua/plenary.nvim",
    --   },
    --   config = function()
    --     require("telescope").load_extension "lazygit"
    --   end,
    -- },
    {
        "folke/todo-comments.nvim",
        event = "LspAttach",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    },
    {
        "nat-418/boole.nvim",
        event = "BufReadPost",
        init = function()
            -- require("core.utils").load_mappings "boole"
        end,
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
            -- require("core.utils").load_mappings "neogen"
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
        "akinsho/toggleterm.nvim",
        version = "*",
        cmd = {
            "ToggleTerm",
            "ToggleTermSetName",
            "ToggleTermToggleAll",
            "ToggleTermSendVisualLines",
            "ToggleTermSendCurrentLine",
            "ToggleTermSendVisualSelection",
        },
        config = function()
            require("configs.external.toggleterm")
            require("core.utils").load_mappings("toggleterm")
        end,
        enabled = false,
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
            require("configs.external.notify")
        end,
    },
    -- {
    --   "AckslD/swenv.nvim",
    --   ft = "python",
    --   config = function()
    --     require "configs.external.swenv"
    --   end,
    -- },
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
        version = "^3", -- Recommended
        ft = { "rust" },
    },
}

return plugins
