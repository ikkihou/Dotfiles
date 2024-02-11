local M = {}
local icons = {
    kind = require("custom.configs.utils.icons").get "kind",
    type = require("custom.configs.utils.icons").get "type",
    cmp = require("custom.configs.utils.icons").get "cmp",
}
local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

------------------ cmp -------------------
M.cmp = {
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "nvim_lua" },
        { name = "path" },
    },
    formatting = {
        fields = { "abbr", "kind", "menu" },
        format = function(entry, vim_item)
            local lspkind_icons = vim.tbl_deep_extend("force", icons.kind, icons.type, icons.cmp)
            vim_item.kind = string.format(" %s  %s", lspkind_icons[vim_item.kind] or icons.cmp.undefined,
                vim_item.kind or "")
            vim_item.menu = setmetatable({
                cmp_tabnine = "[TN]",
                copilot = "[CPLT]",
                buffer = "[BUF]",
                orgmode = "[ORG]",
                nvim_lsp = "[LSP]",
                nvim_lua = "[LUA]",
                path = "[PATH]",
                tmux = "[TMUX]",
                treesitter = "[TS]",
                luasnip = "[SNIP]",
                spell = "[SPELL]",
            }, {
                __index = function()
                    return "[BTN]"
                end,
            })[entry.source.name]

            local label = vim_item.abbr
            local truncated_label = vim.fn.strcharpart(label, 0, 80)
            if truncated_label ~= label then
                vim_item.abbr = truncated_label .. "..."
            end

            return vim_item
        end,
    },
    mapping = {
        ["<C-d>"] = require("cmp").mapping.scroll_docs(-4),
        ["<C-f>"] = require("cmp").mapping.scroll_docs(4),
        ["<C-j>"] = require("cmp").mapping.select_next_item(),
        ["<C-k>"] = require("cmp").mapping.select_prev_item(),
        -- ["<Tab>"] = require("cmp").mapping.confirm {
        --     behavior = require("cmp").ConfirmBehavior.insert,
        --     select = true,
        -- },
        ["<C-e>"] = require("cmp").mapping.close(),
        ["<Tab>"] = require("cmp").mapping(function(fallback)
            local cmp = require "cmp"
            if cmp.visible() then
                cmp.confirm {
                    select = true,
                    behavior = cmp.ConfirmBehavior.insert,
                }
            elseif require("luasnip").expand_or_locally_jumpable() then
                vim.fn.feedkeys(t "<Plug>luasnip-expand-or-jump")
            else
                fallback()
            end
        end, { "i", "s" }),
    },
}
------------------ indent-blankline ---------------------
M.blankline = {
    char = "│",
    context_char = "┃",
    space_char_blankline = " ",
    show_first_indent_level = true,
    show_current_context = true,
    show_current_context_start = true,
    show_trailing_blankline_indent = false,
    filetype_exclude = {
        "",
        "qf",
        "tmol",
        "sagacodeaction",
        "dashboard",
        "dotooagenda",
        "flutterToolsOutline",
        "fugitive",
        "git",
        "gitcommit",
        "help",
        "json",
        "log",
        "markdown",
        "NvimTree",
        "peekaboo",
        "startify",
        "TelescopePrompt",
        "todoist",
        "txt",
        "undotree",
        "vimwiki",
        "vista",
    },
    buftype_exclude = { "terminal", "nofile" },
    use_treesitter = true,
}

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
        enable = true,
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
-------------------- mason --------------------------
M.mason = {
    ensure_installed = {
        --rust
        "rust-analyzer",
        -- go
        "gopls",
        "gofumpt",
        "golangci_lint",
        -- json
        "jq",
        "json-lsp",
        "jsonlint",
        -- bash
        "shellcheck",
        "shfmt",
        -- lua stuff
        "lua-language-server",
        "stylua",
        "luacheck",
        -- python staff
        "debugpy",
        -- "pyright",
        "black",
        "ruff",
        -- c/cpp stuff
        "clangd",
        "clang-format",
        "cmake-language-server",
        "cmakelang",
        "cmakelint",
        "codelldb",
        -- latex stuff
        "texlab",
        "latexindent",
        -- complementary
        "codespell",
    },
}

------------------- nvimtree ----------------------
M.nvimtree = {
    filters = {
        dotfiles = false,
        exclude = { vim.fn.stdpath "config" .. "/lua/custom" },
    },
    hijack_directories = {
        enable = true,
        auto_open = true,
    },
    open_on_tab = false,
    disable_netrw = false,
    hijack_netrw = true,
    hijack_cursor = true,
    hijack_unnamed_buffer_when_opening = true,
    respect_buf_cwd = true,
    sync_root_with_cwd = true,
    update_focused_file = {
        enable = true,
        update_root = true,
    },
    diagnostics = {
        enable = true,
        show_on_dirs = false,
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
        prompt_prefix = "  ",
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
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
        mappings = {
            n = { ["q"] = require("telescope.actions").close },
        },
    },
    extensions_list = {
        "themes",
        "terms",
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
