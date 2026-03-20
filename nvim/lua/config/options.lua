-- vim.o.nocompatible = true
vim.o.encoding = "UTF-8"
vim.o.syntax = "on"
vim.o.filetype = "on"

vim.o.spell = true
vim.o.spelllang = "en_us"
vim.o.tags = "./tags,tags,.tags;$HOME"
vim.o.termguicolors = true
-- vim.o.t_Co = 256

vim.o.colorcolumn = "120"
vim.o.wrap = false
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

vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = false,
  severity_sort = true,
  signs = true,
  float = {
    border = "single",
    format = function(diagnostic)
      return string.format("%s (%s) [%s]", diagnostic.message, diagnostic.soure, diagnostic.code or diagnostic.user_data.lsp.code)
    end,
  },
})

vim.api.nvim_command("filetype plugin on")
vim.api.nvim_command("set shortmess-=F")

vim.api.nvim_command("set completeopt=menu,menuone,fuzzy,noinsert")

