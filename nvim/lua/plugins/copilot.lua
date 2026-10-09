return {
  {
    "github/copilot.vim",
    config = function()
      vim.g.copilot_no_tab_map = true

      vim.keymap.set(
        "i",
        "<C-f>",
        'copilot#Accept("\\<CR>")',
        {
          expr = true,
          silent = true,
          replace_keycodes = false,
          desc = "Accept Copilot suggestion",
        }
      )
    end,
  },
}
