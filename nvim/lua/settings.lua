-- General settings
vim.wo.wrap = false -- no wraping
vim.o.fileencoding = "utf-8"
vim.o.mouse = "a" -- enable mouse
vim.wo.number = true -- enable numbers
vim.o.clipboard = "unnamedplus" -- enable clipboard
vim.o.backup = false
vim.o.writebackup = false
vim.o.hidden = true
vim.cmd('set timeoutlen=600')

-- Indentation
vim.o.expandtab = true -- convert tabs to spaces
vim.o.autoindent = true -- tabs be smart?
vim.cmd('set smarttab')
vim.cmd('set ts=4') -- insert 4 spaces for tabs
vim.cmd('set sw=4')
vim.cmd('set list lcs=trail:·,tab:»·')
vim.cmd('set nolist')

-- UI
vim.o.updatetime = 300
vim.o.showmode = false
vim.wo.cursorline = true
vim.o.termguicolors = true
vim.o.pumheight = 8
vim.o.showtabline = 2

-- Completion
vim.o.completeopt = "menuone,noselect"
vim.cmd('set shortmess+=c')
