return function()
    require("FTerm").setup()

    local map = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }

    map('n', '<F12>', '<CMD>lua require("FTerm").toggle()<CR>', opts)
    map('t', '<F12>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)
end
