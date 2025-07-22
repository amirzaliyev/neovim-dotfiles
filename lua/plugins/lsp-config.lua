return {
  {
    "mason-org/mason.nvim",
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
    },
    opts = {
      ensure_installed = { "lua_ls", "pyright", "html", "eslint", "taplo", "ts_ls" },
      automatic_enable = {
        exclude = { "lua_ls", "pyright", "html", "eslint", "taplo" },
      },
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = { "djlint", "isort", "black", "pylint", "prettier", "debugpy", "stylua" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      vim.filetype.add({
        filename = {
          ["pyproject.toml"] = "toml",
          ["ruff.toml"] = "toml",
          [".ruff.toml"] = "toml",
        },
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })
      lspconfig.pyright.setup({
        capabilities = capabilities,
        settings = {
          python = {
            analysis = {
              extraPaths = { "." },
              diagnosticMode = "workspace",
              typeCheckingMode = "basic",
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              autoImportCompletions = true,
            },
          },
        },
        offset_encoding = "utf-8",
      })
      lspconfig.taplo.setup({
        capabilities = capabilities,
        offset_encoding = "utf-8",
      })
      lspconfig.html.setup({
        filetypes = { "html", "htmldjango", "css", "js" },
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
      lspconfig.ts_ls.setup({
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
        cmd = { "typescript-language-server", "--stdio" },
      })

      vim.lsp.set_log_level("WARN")
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
