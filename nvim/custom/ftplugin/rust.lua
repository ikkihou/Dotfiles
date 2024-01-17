vim.g.rustaceanvim = {
    server = {
        on_attach = function(client, bufnr)
            require("lsp_signature").on_attach({
                bind = true,
                handler_opts = {
                    border = "rounded",
                },
            }, bufnr)
        end,
    },
}
