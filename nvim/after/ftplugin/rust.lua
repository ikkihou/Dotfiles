local bufnr = vim.api.nvim_get_current_buf()

vim.keymap.set("n", "<leader>a", function()
	vim.cmd.RustLsp("codeAction") -- supports rust-analyzer's grouping
	-- or vim.lsp.buf.codeAction() if you don't want grouping.
end, { silent = true, buffer = bufnr })

-- vim.keymap.set(
-- 	"n",
-- 	"K", -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
-- 	function()
-- 		vim.cmd.RustLsp({ "hover", "actions" })
-- 	end,
-- 	{ silent = true, buffer = bufnr }
-- )

vim.keymap.set("n", "<leader>fm", function()
	vim.lsp.buf.format()
	vim.notify("File formatted with rust-analyzer")
end, { silent = false, buffer = bufnr, desc = "Format rust code" })

vim.keymap.set("n", "<leader>rr", function()
	vim.cmd.RustLsp("runnables")
end, { silent = false, buffer = bufnr, desc = "Cargo run" })

vim.keymap.set("n", "<leader>rt", function()
	vim.cmd.RustLsp("testables")
end, { silent = false, buffer = bufnr, desc = "Cargo test" })

vim.g.rustaceanvim = {
	-- Plugin configuration
	tools = {},
	-- LSP configuration
	server = {
		on_attach = function(client, bufnr) end,
		default_settings = {
			-- rust-analyzer language server configuration
			["rust-analyzer"] = {
				cargo = {
					features = "all", -- Add parentheses here
				}, -- Add closing braces where necessary
				files = {
					excludeDirs = {
						"_build",
						".dart_tool",
						".flatpak-builder",
						".git",
						".github",
						".gitlab",
						".gitlab-ci",
						".gradle",
						".idea",
						".next",
						".project",
						".cursor",
						".vscode",
						".scannerwork",
						".settings",
						".venv",
						"archetype-resources",
						"bin",
						"hooks",
                        "web",
						"node_modules",
						"po",
						"screenshots",
						"target",
						"migrations",
					},
				},
			},
		},
	},
	-- DAP configuration
	dap = {},
}
