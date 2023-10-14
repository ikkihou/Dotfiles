---@diagnostic disable: different-requires
local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lsp_config = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "pyright", "clangd", "bashls", "cmake", "jsonls", "tsserver", "texlab" }

for _, lsp in ipairs(servers) do
    lsp_config[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
end

lsp_config.texlab.setup {
    on_attach = function(client, bufnr)
        require("lsp_signature").on_attach({
            bind = true,
            handler_opts = {
                border = "rounded",
            },
        }, bufnr)
    end,
    filetypes = { "tex", "cls" },
}

lsp_config.texlab.setup {
    on_attach = function(client, bufnr)
        require("lsp_signature").on_attach({
            bind = true,
            handler_opts = {
                border = "rounded",
            },
        }, bufnr)
    end,
    filetypes = { "tex", "cls" },
}

------------ deno ----------------
lsp_config.tsserver.setup {
    on_attach = function(client, bufnr)
        require("lsp_signature").on_attach({
            bind = true,
            handler_opts = {
                border = "rounded",
            },
        }, bufnr)
    end,
    filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
    cmd = {
        "typescript-language-server",
        "--stdio",
    },
}

------------ pyright ----------------
-- local pylance = "/Users/baoyihui/.vscode/extensions/ms-python.vscode-pylance-2023.8.50/dist/server.bundle.js"
-- if vim.fn.filereadable(pylance) ~= 0 then
-- vim.notify "pylance load successfully..."
-- lsp_config.pyright.setup {
--     capabilities = capabilities,
--     on_attach = function(client, bufnr)
--         require("lsp_signature").on_attach({
--             bind = true,
--             handler_opts = {
--                 border = "rounded",
--             },
--         }, bufnr)
--     end,
--     single_file_support = true,
--     cmd = { "node", pylance, "--stdio" },
-- }
-- else
lsp_config.pyright.setup {
    on_attach = function(client, bufnr)
        require("lsp_signature").on_attach({
            bind = true,
            handler_opts = {
                border = "rounded",
            },
        }, bufnr)
    end,
    disableOrganiseImports = true,
    filetype = { "python" },
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "off",
                typeCheckingMode = "off",
                -- useLibraryCodeForTypes = true,
            },
        },
    },
    single_file_support = true,
}
-- end

---------- clangd ------------
local function switch_source_header_splitcmd(bufnr, splitcmd)
    bufnr = require("lspconfig").util.validate_bufnr(bufnr)
    local clangd_client = require("lspconfig").util.get_active_client_by_name(bufnr, "clangd")
    local params = { uri = vim.uri_from_bufnr(bufnr) }
    if clangd_client then
        clangd_client.request("textDocument/switchSourceHeader", params, function(err, result)
            if err then
                error(tostring(err))
            end
            if not result then
                require "notify"(
                    "Corresponding file can’t be determined",
                    vim.log.levels.ERROR,
                    { title = "LSP Error!" }
                )
                return
            end
            vim.api.nvim_command(splitcmd .. " " .. vim.uri_to_fname(result))
        end)
    else
        require "notify"(
            "Method textDocument/switchSourceHeader is not supported by any active server on this buffer",
            vim.log.levels.ERROR,
            { title = "LSP Error!" }
        )
    end
end

local function get_binary_path_list(binaries)
    local path_list = {}
    for _, binary in ipairs(binaries) do
        local path = vim.fn.exepath(binary)
        if path ~= "" then
            table.insert(path_list, path)
        end
    end
    return table.concat(path_list, ",")
end

lsp_config.clangd.setup {
    on_attach = function(client, bufnr)
        client.server_capabilities.signatureHelpProvider = false
        require("lsp_signature").on_attach({
            bind = true,
            handler_opts = {
                border = "rounded",
            },
        }, bufnr)
    end,
    capabilities = vim.tbl_deep_extend("keep", { offsetEncoding = "utf-8" }, capabilities),
    filetype = { "c", "cpp" },
    single_file_support = true,
    cmd = {
        "clangd",
        "-j=12",
        "--enable-config",
        "--background-index",
        "--pch-storage=memory",
        -- You MUST set this arg ↓ to your c/cpp compiler location (if not included)!
        "--query-driver=" .. get_binary_path_list { "clang++", "clang", "gcc", "g++" },
        "--clang-tidy",
        "--all-scopes-completion",
        "--completion-style=detailed",
        "--header-insertion-decorators",
        "--header-insertion=iwyu",
        "--limit-references=3000",
        "--limit-results=350",
    },
    commands = {
        ClangdSwitchSourceHeader = {
            function()
                switch_source_header_splitcmd(0, "edit")
            end,
            description = "Open source/header in current buffer",
        },
        ClangdSwitchSourceHeaderVSplit = {
            function()
                switch_source_header_splitcmd(0, "vsplit")
            end,
            description = "Open source/header in a new vsplit",
        },
        ClangdSwitchSourceHeaderSplit = {
            function()
                switch_source_header_splitcmd(0, "split")
            end,
            description = "Open source/header in a new split",
        },
    },
}

lsp_config.bashls.setup {
    on_attach = function(client, bufnr)
        require("lsp_signature").on_attach({
            bind = true,
            handler_opts = {
                border = "rounded",
            },
        }, bufnr)
    end,
    filetype = { "sh", "zsh" },
}
