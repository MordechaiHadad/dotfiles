-- General settings
vim.o.wrap = false -- no wraping
vim.o.number = true -- enable numbers
vim.o.clipboard = "unnamedplus" -- enable clipboard
vim.o.backup = false
vim.o.writebackup = false
vim.o.hidden = true
vim.o.exrc = true
vim.cmd("set timeoutlen=600")
vim.cmd("syntax on")
vim.cmd("set splitkeep=screen")
vim.cmd.colorscheme("papadark")

-- Indentation
vim.o.expandtab = true -- convert tabs to spaces
vim.o.autoindent = true -- tabs be smart?
vim.cmd("set smarttab")
vim.cmd("set ts=4") -- insert 4 spaces for tabs
vim.cmd("set sw=4")
vim.cmd("set undofile")

-- UI
vim.o.updatetime = 300
vim.o.showmode = false
vim.o.cursorline = true
vim.o.termguicolors = true
vim.o.pumheight = 8
vim.o.showtabline = 2

-- Completion
vim.cmd("set shortmess+=c")

-- Folds
vim.opt.foldlevel = 100

vim.opt.laststatus = 3 -- Statusline

-- Detect OS and Shell availability
local is_windows = vim.fn.has("win32") == 1

if is_windows then
    -- Check if modern PowerShell (pwsh) is installed, else use Windows PowerShell
    if vim.fn.executable("pwsh") == 1 then
        vim.o.shell = "pwsh"
    else
        vim.o.shell = "powershell"
    end

    -- Essential flags to make PowerShell play nice with Neovim
    vim.o.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
    vim.o.shellredir = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
    vim.o.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
    vim.o.shellquote = ""
    vim.o.shellxquote = ""
end
