vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.opt.number = true
vim.opt.relativenumber = false

vim.g.mapleader = " "
-- python run commands
vim.keymap.set("n", "<leader>r", function()
    vim.cmd("! python main.py")
end)
vim.keymap.set("n", "<leader>t", function()
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

-- automatically change the foldmethod to indent
vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        vim.opt_local.foldmethod = "indent"
        vim.opt_local.foldenable = true
        vim.opt_local.foldlevel = 99
    end,
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


-- Store fold states
vim.api.nvim_create_autocmd("BufWinLeave", {
    pattern = { "*.py", "*.js", "*.lua", "*.json" },
    command = "mkview"
})


vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = { "*.py", "*.js", "*.lua", "*.json" },
    command = "silent! loadview"
})
