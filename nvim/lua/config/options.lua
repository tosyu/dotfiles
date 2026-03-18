-- vim.o.nocompatible = true
vim.o.encoding = "UTF-8"
vim.o.syntax = "on"
vim.o.filetype = "on"

vim.o.spell = true
vim.o.spelllang = "en_us"
vim.o.tags = "./tags,tags,.tags;$HOME"
vim.o.termguicolors = true
-- vim.o.t_Co = 256

vim.o.expandtab = false
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true

vim.o.showmode = true
vim.o.showcmd = true
vim.o.ruler = true
vim.o.laststatus = 2
vim.o.mouse = "a"
vim.o.history = 1000
vim.o.swapfile = false
vim.o.backup = false

vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.ignorecase = true

vim.o.winborder = "rounded"

vim.diagnostic.config({
  virtual_text = true,
  virtual_lines = false,
  severity_sort = true,
  float = {
    header = "",
    source = true,
    focusable = false,
    style = "minimal",
    border = "rounded",
    prefix = "",
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '✘',
      [vim.diagnostic.severity.WARN] = '▲',
      [vim.diagnostic.severity.HINT] = '⚑',
      [vim.diagnostic.severity.INFO] = '»',
    },
  },
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

