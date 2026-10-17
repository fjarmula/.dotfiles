return {
  -- Catppuccin Theme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = true,
        custom_highlights = function(colors)
          return {
            -- Keep functions distinct without changing the rest of Mocha's palette.
            ["@function.call"] = { fg = colors.blue },
            ["@function.method.call"] = { fg = colors.teal, style = { "bold" } },
            ["@lsp.type.function"] = { fg = colors.blue },
            ["@lsp.type.method"] = { fg = colors.teal, style = { "bold" } },
          }
        end,
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local treesitter = require("nvim-treesitter")
      local parsers = { "python", "lua", "bash", "json", "yaml", "markdown", "toml", "regex", "vim", "gitcommit", "git_rebase" }

      -- nvim-treesitter's current API manages parsers separately from
      -- highlighting. Missing parsers are installed asynchronously.
      if vim.fn.executable("tree-sitter") == 1 then
        treesitter.install(parsers)
      else
        vim.notify(
          "nvim-treesitter needs the tree-sitter CLI; run `brew install tree-sitter-cli` and restart Neovim.",
          vim.log.levels.WARN
        )
      end

      vim.api.nvim_create_autocmd("FileType", {
        pattern = parsers,
        callback = function(args)
          pcall(vim.treesitter.start, args.buf)
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },

-- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")

      telescope.setup({
        pickers = {
          find_files = {
            hidden = true, 
          },
        },
      })

      vim.keymap.set("n", "<leader>f", builtin.find_files, { desc = "Find Files" })
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Search Text" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
    end,
  },

-- Neo-tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      window = {
        position = "current",
      },
      filesystem = {
        hijack_netrw_behavior = "open_current",
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
    },
    config = function(_, opts)
      require("neo-tree").setup(opts)

      vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", {
        desc = "Toggle File Tree",
      })
    end,
  },
}
