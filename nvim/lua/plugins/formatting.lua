return {
  {
    "stevearc/conform.nvim",
    config = function()
      local conform = require("conform")

      conform.setup({
        formatters_by_ft = {
          python = { "ruff_format", "black", stop_after_first = true },
        },
      })

      vim.keymap.set("n", "<leader>r", function()
        conform.format({
          bufnr = vim.api.nvim_get_current_buf(),
          async = false,
          timeout_ms = 3000,
          lsp_format = "fallback",
        })
      end, {
        desc = "Format Code",
      })
    end,
  },
}
