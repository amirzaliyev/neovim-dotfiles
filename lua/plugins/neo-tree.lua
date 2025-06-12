return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
        {
            "3rd/image.nvim",
            opts = {},
        },
    },
    lazy = false,
    opts = {},
    config = function()
        require("neo-tree").setup({
            filesystem = {
                filtered_items = {
                    visible = true,
                    hide_gitignored = false,
                    hide_dotfiles = false,
                    never_show = { ".git" },
                },
            },
        })
        vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {})
        vim.keymap.set("n", "<leader>cf", ":Neotree close<CR>", {})
    end,
}
