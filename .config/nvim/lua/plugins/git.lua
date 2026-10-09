return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "\u{258e}" },
        change = { text = "\u{258e}" },
        delete = { text = "\u{f0da}" },
        topdelete = { text = "\u{f0da}" },
        changedelete = { text = "\u{258e}" },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, lhs, rhs, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, lhs, rhs, opts)
        end

        map("n", "]h", function()
          if vim.wo.diff then
            return "]h"
          end

          vim.schedule(function()
            gs.next_hunk()
          end)

          return "<Ignore>"
        end, { expr = true, desc = "Next Git Hunk" })

        map("n", "[h", function()
          if vim.wo.diff then
            return "[h"
          end

          vim.schedule(function()
            gs.prev_hunk()
          end)

          return "<Ignore>"
        end, { expr = true, desc = "Prev Git Hunk" })

        map("n", "<leader>hp", gs.preview_hunk, { desc = "Preview Git Hunk" })
      end,
    },
  },
}
