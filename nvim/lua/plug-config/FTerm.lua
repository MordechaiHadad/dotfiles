return function()
    local keymap = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }

    keymap("n", "<F12>", '<CMD>lua require("FTerm").toggle()<CR>', opts)
    keymap("t", "<F12>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)
end
