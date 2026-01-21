---@diagnostic disable: different-requires
local on_init = require("nvchad.configs.lspconfig").on_init
local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

require("nvchad.configs.lspconfig").defaults()

-- if you just want default config for the servers then put them in a table
local servers = {
	"pyright",
	-- "ty",
	"clangd",
	"bashls",
	"cmake",
	"jsonls",
	"texlab",
	"gopls",
	"taplo",
	"julials",
	-- "vue_ls",
	"vtsls",
}

for _, lsp in ipairs(servers) do
	vim.lsp.config(lsp, { on_attach = on_attach, on_init = on_init, capabilities = capabilities })
end

-- ---------------- vue_ls ----------------
local vue_language_server_path = vim.fn.stdpath("data")
	.. "/mason/packages/vue-language-server/node_modules/@vue/language-server"
local vue_plugin = {
	name = "@vue/typescript-plugin",
	location = vue_language_server_path,
	languages = { "vue" },
	configNamespace = "typescript",
}
vim.lsp.config["vtsls"] = {

	settings = {
		vtsls = {
			tsserver = {
				globalPlugins = {
					vue_plugin,
				},
			},
		},
	},
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
}

-- ---------------- ts_ls ----------------
-- ---------------- cmake ----------------
vim.lsp.config["cmake"] = {
	on_attach = function(client, bufnr)
		require("lsp_signature").on_attach(bufnr, {
			bind = true,
			handler_opts = {
				border = "rounded",
			},
		})
	end,
	filetypes = { "cmake" },
}

-- ---------------- go ----------------
-- lsp_config.gopls.setup({
-- 	on_attach = function(client, bufnr)
-- 		require("lsp_signature").on_attach(bufnr, {
-- 			bind = true,
-- 			handler_opts = {
-- 				border = "rounded",
-- 			},
-- 		})
-- 	end,
-- 	cmd = { "gopls" },
-- 	filetypes = { "go", "gomod", "gowork", "gotmpl" },
-- 	root_dir = util.root_pattern("go.work", "go.mod", ".git"),
-- 	settings = {
-- 		gopls = {
-- 			completeUnimported = true,
-- 			usePlaceholders = true,
-- 			analyses = {
-- 				unusedparams = true,
-- 			},
-- 		},
-- 	},
-- })
--
-- ------------------ latex ----------------------
-- lsp_config.texlab.setup({
-- 	on_attach = function(client, bufnr)
-- 		require("lsp_signature").on_attach({
-- 			bind = true,
-- 			handler_opts = {
-- 				border = "rounded",
-- 			},
-- 		}, bufnr)
-- 	end,
-- 	filetypes = { "tex", "cls" },
-- })
--
-- ------------ deno ----------------
-- lsp_config.ts_ls.setup({
-- 	on_attach = function(client, bufnr)
-- 		require("lsp_signature").on_attach({
-- 			bind = true,
-- 			handler_opts = {
-- 				border = "rounded",
-- 			},
-- 		}, bufnr)
-- 	end,
-- 	filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
-- 	cmd = {
-- 		"typescript-language-server",
-- 		"--stdio",
-- 	},
-- })
--
-- ------------ pyright ----------------
--
vim.lsp.config("pyright", {
	on_attach = function(client, bufnr)
		require("lsp_signature").on_attach({
			bind = true,
			handler_opts = {
				border = "rounded",
			},
		}, bufnr)
	end,
	filetype = { "python" },
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "off",
				typeCheckingMode = "off",
			},
		},
	},
	single_file_support = true,
	cmd = {
		"delance-langserver",
		"--stdio",
	},
})

-- vim.lsp.config["ty"] = {
-- 	filetypes = { "python" },
-- }

-- ---------- clangd ------------
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
				vim.notify("Corresponding file can’t be determined", vim.log.levels.ERROR, { title = "LSP Error!" })
				return
			end
			vim.api.nvim_command(splitcmd .. " " .. vim.uri_to_fname(result))
		end)
	else
		vim.notify(
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

vim.lsp.config["clangd"] = {
	on_attach = function(client, bufnr)
		-- client.server_capabilities.signatureHelpProvider = false
		require("lsp_signature").on_attach({
			bind = true,
			handler_opts = {
				border = "rounded",
			},
		}, bufnr)
	end,
	capabilities = vim.tbl_deep_extend("keep", { offsetEncoding = "utf-8" }, capabilities),
	filetype = { "c", "cpp", "cuda" },
	single_file_support = true,
	cmd = {
		"clangd",
		"-j=12",
		"--enable-config",
		"--background-index",
		"--pch-storage=memory",
		-- You MUST set this arg ↓ to your c/cpp compiler location (if not included)!
		"--query-driver=" .. get_binary_path_list({ "clang++", "clang", "gcc", "g++" }),
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
--
-- lsp_config.bashls.setup({
-- 	on_attach = function(client, bufnr)
-- 		require("lsp_signature").on_attach({
-- 			bind = true,
-- 			handler_opts = {
-- 				border = "rounded",
-- 			},
-- 		}, bufnr)
-- 	end,
-- 	filetype = { "sh", "zsh" },
-- })
--
-- lsp_config.taplo.setup({
-- 	on_attach = function(client, bufnr)
-- 		require("lsp_signature").on_attach({
-- 			bind = true,
-- 			handler_opts = {
-- 				border = "rounded",
-- 			},
-- 		}, bufnr)
-- 	end,
-- 	filetype = { "toml" },
-- })
--
-- lsp_config.julials.setup({ filetype = { "jl" } })

vim.lsp.enable(servers)
