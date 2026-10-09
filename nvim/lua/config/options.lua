vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.termguicolors = true
opt.ignorecase = true
opt.smartcase = true
opt.signcolumn = "yes"
opt.clipboard = "unnamedplus"

-- Quick escape from Insert mode
vim.keymap.set("i", "jk", "<Esc>", {
  silent = true,
  desc = "Exit Insert mode",
})

-- Clear search highlight
vim.keymap.set("n", "<leader>h", "<cmd>nohlsearch<CR>", {
  silent = true,
  desc = "Clear search highlight",
})

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", {
  silent = true,
  desc = "Clear search highlight",
})

-- Diagnostic navigation
vim.keymap.set("n", "]g", function()
  vim.diagnostic.jump({ count = 1, float = true })
end, {
  desc = "Go to next diagnostic",
})

vim.keymap.set("n", "[g", function()
  vim.diagnostic.jump({ count = -1, float = true })
end, {
  desc = "Go to previous diagnostic",
})

-- LSP code actions
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {
  desc = "Code Actions / Quick Fix",
})
