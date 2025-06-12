return {
	"barrett-ruth/live-server.nvim",
	build = "pnpm add -g live-server",
	ft = "html",
	config = function()
		require("live-server").setup({})
		vim.keymap.set("n", "<leader>m", function()
			vim.cmd("LiveServerStart")
		end, { noremap = true, silent = true })
		vim.keymap.set("n", "<leader>n", function()
			vim.cmd("LiveServerStop")
		end, { noremap = true, silent = true })
	end,
}
