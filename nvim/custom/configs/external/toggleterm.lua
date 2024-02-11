local status_ok, toggleterm = pcall(require, "toggleterm")

if not status_ok then
    return
end

toggleterm.setup {
    -- size can be a number or function which is passed the current terminal
    size = function(term)
        if term.direction == "horizontal" then
            return 15
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.40
        end
    end,
    on_open = function()
        -- Prevent infinite calls from freezing neovim.
        -- Only set these options specific to this terminal buffer.
        vim.api.nvim_set_option_value("foldmethod", "manual", { scope = "local" })
        vim.api.nvim_set_option_value("foldexpr", "0", { scope = "local" })
    end,
    highlights = {
        Normal = {
            link = "Normal",
        },
        NormalFloat = {
            link = "NormalFloat",
        },
        FloatBorder = {
            link = "FloatBorder",
        },
    },
    open_mapping = false,
    hide_numbers = true, -- hide the number column in toggleterm buffers
    shade_filetypes = {},
    shade_terminals = false,
    shading_factor = "1", -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
    start_in_insert = true,
    insert_mappings = true, -- whether or not the open mapping applies in insert mode
    persist_size = true,
    direction = "float",
    close_on_exit = true, -- close the terminal window when the process exits
    shell = vim.o.shell, -- change the default shell
    float_opts = {
        -- The border key is *almost* the same as 'nvim_open_win'
        -- see :h nvim_open_win for details on borders however
        -- the 'curved' border is a custom border type
        -- not natively supported but implemented in this plugin.
        border = "curved",
        -- like `size`, width, height, row, and col can be a number or function which is passed the current terminal
        width = 180,
        height = 50,
        -- row = <value>,
        -- col = <value>,
        -- winblend = 3,
        -- zindex = <value>,
        title_pos = "center",
    },
}
