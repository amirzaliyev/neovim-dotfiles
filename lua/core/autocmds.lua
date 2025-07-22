local autocmd = vim.api.nvim_create_autocmd

local function set_indent_size(size)
	vim.api.nvim_buf_set_option(0, "shiftwidth", size)
	vim.api.nvim_buf_set_option(0, "tabstop", size)
	vim.api.nvim_buf_set_option(0, "softtabstop", size)
end

autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		vim.highlight.on_yank()
	end,
	group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
})

autocmd("BufWinEnter", {
	pattern = "*",
	callback = function()
		vim.api.nvim_buf_set_option(
			0,
			"formatoptions",
			(string.gsub(vim.api.nvim_buf_get_option(0, "formatoptions"), "[cro]", ""))
		)
	end,
})

autocmd("FileType", {
	pattern = { "python" },
	callback = function()
		set_indent_size(4)
	end,
})

autocmd("FileType", {
	pattern = "make",
	callback = function()
		set_indent_size(4)
		vim.api.nvim_buf_set_option(0, "expandtab", false)
	end,
})

autocmd("FileType", {
	pattern = { "lua", "html", "htmldjango" },
	callback = function()
		set_indent_size(2)
	end,
})

autocmd("FileType", {
	pattern = "python",
	callback = function()
		vim.opt_local.foldmethod = "indent"
		vim.opt_local.foldenable = true
		vim.opt_local.foldlevel = 99
	end,
})

autocmd("BufWinLeave", {
	pattern = { "*.py", "*.js", "*.lua", "*.json" },
	command = "mkview",
})

autocmd("BufWinEnter", {
	pattern = { "*.py", "*.js", "*.lua", "*.json" },
	command = "silent! loadview",
})

-- auto format on save --
-- autocmd("BufWritePre", {
--   callback = function()
--     vim.lsp.buf.format({ async = false })
--   end,
-- })
