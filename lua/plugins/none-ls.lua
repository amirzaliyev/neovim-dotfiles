return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.isort,
                null_ls.builtins.formatting.prettier.with({
                    filetypes = { "html", "javascript", "json" },
                    extra_args = { "--tab-width", "2" },
                }),
                null_ls.builtins.diagnostics.pylint.with({
                    extra_args = { "--disable=import-error,C0114,C0115,C0116,R0903,C0112,W0611,W0612,W0613" },
                }),
                null_ls.builtins.diagnostics.djlint.with({}),
                null_ls.builtins.formatting.djlint.with({}),
            },
        })

        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
}
