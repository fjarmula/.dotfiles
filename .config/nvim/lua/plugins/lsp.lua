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
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
        callback = function(event)
          local opts = { buffer = event.buf }
          local builtin = require("telescope.builtin")

          opts.desc = "Go to Definition"
          vim.keymap.set("n", "gd", builtin.lsp_definitions, opts)

          opts.desc = "Go to Declaration"
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

          opts.desc = "Go to Implementation"
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

          opts.desc = "Find References"
          vim.keymap.set("n", "gr", builtin.lsp_references, opts)

          opts.desc = "Show Hover Documentation"
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        end,
      })

      if vim.fn.exists(":LspInfo") == 0 then
        vim.api.nvim_create_user_command("LspInfo", function()
          vim.cmd("checkhealth vim.lsp")
        end, { desc = "Show LSP status" })
      end

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
