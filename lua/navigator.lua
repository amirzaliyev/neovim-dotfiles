return {
  "numToStr/Navigator.nvim",
  config = function()
    require("Navigator").setup({})
    vim.keymap.set({ "n", "t" }, "<A-h>", ":NavigatorLeft<CR>")
    vim.keymap.set({ "n", "t" }, "<A-l>", ":NavigatorRight<CR>")
    vim.keymap.set({ "n", "t" }, "<A-k>", ":NavigatorUp<CR>")
    vim.keymap.set({ "n", "t" }, "<A-j>", ":NavigatorDown<CR>")
    vim.keymap.set({ "n", "t" }, "<A-p>", ":NavigatorPrevious<CR>")
  end,
}
