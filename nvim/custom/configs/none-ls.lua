local present, null_ls = pcall(require, "null-ls")
local augroup = vim.api.nvim_create_augroup("LspFomatting", {})

if not present then
    return
end

local b = null_ls.builtins

local sources = {

    -- all
    -- b.diagnostics.codespell,

    -- go--
    b.diagnostics.golangci_lint,
    b.formatting.gofumpt,

    -- Lua
    b.diagnostics.luacheck,
    b.formatting.stylua.with {
        filetypes = { "lua" },
    },

    -- cpp
    b.formatting.clang_format.with {
        filetypes = { "c", "cpp" },
    },

    -- cmake
    b.formatting.cmake_format,
    b.diagnostics.cmake_lint,

    -- python
    -- b.diagnostics.mypy.with {
    --     -- extra_args = { "--ignore-missing-imports" },
    -- },
    b.diagnostics.ruff.with {
        args = { "--ignore-E501" }, -- ignore the Line-too-long error
    },
    b.formatting.black.with {
        filetypes = { "python" },
    },

    -- bash
    b.formatting.shfmt,
    b.diagnostics.shellcheck,

    -- json
    b.diagnostics.jsonlint,
    b.formatting.jq,

    -- JS&TS
    b.formatting.prettier,

    -- latex
    b.formatting.latexindent,
}

null_ls.setup {
    -- debug = true,
    border = "rounded",

    sources = sources,
    -- you can reuse a shared lspconfig on_attach callback here
    on_attach = function(client, bufnr)
        if client.supports_method "textDocument/formatting" then
            vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
                    vim.lsp.buf.format { bufnr = bufnr }
                    -- vim.lsp.buf.formatting_sync()
                end,
            })
        end
    end,
}
