local autocmd = vim.api.nvim_create_autocmd

autocmd({ "FileType" }, {
    pattern = { "help", "startuptime", "qf", "lspinfo", "man" },
    callback = function()
        vim.keymap.set("n", "q", function()
            vim.cmd([[close]])
        end, {
            noremap = true,
            silent = true,
            buffer = true,
        })
        vim.keymap.set("n", "<esc>", function()
            vim.cmd([[close]])
        end, {
            noremap = true,
            silent = true,
            buffer = true,
        })
    end,
    desc = "Map q and esc to close help, man, startuptime buffers",
})


vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
  end,
})

local group = vim.api.nvim_create_augroup("AutoRoot", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  group = group,
  callback = function(args)
    local buf = args.buf
    local name = vim.api.nvim_buf_get_name(buf)
    if name == "" then return end

    local root = vim.fs.root(buf, ".git")
    if root then
      -- Use window-local cwd so splits can have different roots if needed
      vim.fn.chdir(root) -- or vim.cmd.lcd(root) if you prefer per-window cwd
    end
  end,
})

