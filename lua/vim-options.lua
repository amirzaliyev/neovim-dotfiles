-- python run commands
vim.keymap.set("n", "<leader>r", function()
	vim.cmd("! python main.py")
end)
vim.keymap.set("n", "<leader>rc", function()
	local file = vim.fn.expand("%")

	if vim.bo.filetype == "python" then
		vim.cmd("!python3 " .. file)
	else
		print("This is not a Python file!")
	end
end, { desc = "Run Python file", noremap = true })

vim.keymap.set("n", "<leader>dj", function()
	vim.cmd("! python manage.py runserver 0.0.0.0:8000")
end)

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})

-- Restart Lsp
vim.keymap.set("n", "<leader>lr", function()
	vim.cmd("LspRestart")
end)

-- Set filetype from 'html' to 'djangohtml'
vim.keymap.set("n", "<leader>fc", function()
	if vim.bo.filetype == "html" then
		vim.cmd("set filetype=htmldjango")
	end
end)

-- nvim terminal --
vim.keymap.set("n", "<leader>t", function()
	vim.cmd("terminal")
end)
