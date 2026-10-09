return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Neovim 0.12 provides `:lsp info` natively. nvim-lspconfig therefore
      -- omits its legacy `:LspInfo` alias, so retain it for muscle memory.
      if vim.fn.exists(":LspInfo") == 0 then
        vim.api.nvim_create_user_command("LspInfo", function()
          vim.cmd("checkhealth vim.lsp")
        end, { desc = "Show LSP status" })
      end

      -- Neovim 0.11+ configures LSP servers natively. The old
      -- `require("lspconfig")[server].setup()` and Mason handlers APIs are
      -- deprecated/removed in the versions pinned by lazy-lock.json.
      vim.lsp.config("pyright", { capabilities = capabilities })
      vim.lsp.config("ruff", { capabilities = capabilities })

      require("mason-lspconfig").setup({
        ensure_installed = {
          "pyright",
          "ruff",
        },
        automatic_enable = { "pyright", "ruff" },
      })
    end,
  },
}
