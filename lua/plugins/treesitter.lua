return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
		vim.opt.foldmethod = "expr"
		vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
		vim.opt.foldenable = true
		vim.opt.foldlevel = 99
		vim.opt.foldcolumn = "1"
	end,
}
