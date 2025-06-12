return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "pyright", "html" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.pyright.setup({
				capabilities = capabilities,
				settings = {
					python = {
						analysis = {
							diagnosticMode = "workspace",
						},
					},
				},
			})
			lspconfig.html.setup({
				filetypes = { "html", "htmldjango" },
				capabilities = capabilities,
				init_options = {
					configurationSection = { "html", "css", "javascript" },
					embeddedLanguages = {
						css = true,
						javascript = true,
					},
					provideFormatter = true,
					html = {
						options = {
							["bem.enabled"] = true,
						},
					},
				},
				settings = {
					html = {
						format = {
							templating = true,
							wrapLineLength = 120,
							wrapAttributes = "auto",
						},
					},
				},
				root_dir = require("lspconfig.util").root_pattern("package.json", ".git", "manage.py"),
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
