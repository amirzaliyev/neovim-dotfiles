return {
    "windwp/nvim-ts-autotag",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
        require("nvim-ts-autotag").setup({
            opts = {
                enable_close = true,
                enable_rename = true,
                enable_close_on_slash = true,
            },

            fold = {
                enable = false,
            },


            per_filetype = {
                ["html"] = {
                    enable_close = false,
                },
                ["htmldjango"] = {
                    enable_close = false,
                },
            },
        })
    end,
}
