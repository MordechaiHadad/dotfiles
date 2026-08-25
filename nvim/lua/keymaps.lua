vim.g.mapleader = " "

local keymap = vim.keymap.set
local s = { silent = true }
local desc = function(msg)
    return { silent = true, desc = msg }
end

-- General Keymaps
keymap("n", "<Leader>e", ":Neotree focus<CR>", desc("Open/Focus Neo-tree"))   -- Focus file explorer, never closes
keymap("n", "<Leader>E", ":Neotree toggle<CR>", desc("Toggle Neo-tree"))      -- Open/close file explorer
keymap("n", "tt", "<cmd>InspectTree<CR>", s)                                  -- Toggle TreeSitter playground
keymap({ "i", "n" }, "<C-s>", "<cmd>:w<cr><esc>", s)                          -- Save file in insert mode
keymap("n", "yb", ":%y+<CR>", desc("Yank entire buffer to system clipboard")) -- Yank entire buffer to system clipboard

-- Move line in insert mode
keymap("i", "<C-Up>", ":MoveLine(-1)<CR>", s)
keymap("i", "<C-Down>", ":MoveLine(1)<CR>", s)

-- Telescope keymaps
keymap("n", "ff", ":Telescope find_files<CR>", s) -- Find files
keymap("n", "fw", ":Telescope live_grep<CR>", s)

-- LSP Keymaps
keymap("n", "gd", ":lua vim.lsp.buf.definition()<CR>", s) -- Go to Definitions
keymap("n", "gr", ":lua vim.lsp.buf.references()<CR>", s) -- Go to References
keymap("n", "<F2>", ":lua vim.lsp.buf.rename() <CR>", s)  -- Rename symbol

-- Terminal keymaps
keymap("n", "<A-t>", ":lua Snacks.terminal.toggle()<CR>", desc("Toggle terminal")) -- Toggle terminal with Alt+t

-- fuck you deleted bullshit
keymap("n", "dd", '"_dd', s)

keymap("n", "xx", function()
    local line = vim.fn.getline(".")
    vim.api.nvim_del_current_line()
    vim.fn.setreg("+", line)
end, s) -- Replace dd to yank and delete

-- Bufferline
keymap("n", "<TAB>", ":BufferLineCycleNext<CR>", s)
keymap("n", "<S-TAB>", ":BufferLineCyclePrev<CR>", s)

keymap({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>") -- Exit search mode

local whichkey_ok, whichkey = pcall(require, "which-key")

if whichkey_ok then
    -- Which key base
    whichkey.add({
        {
            "<leader>f",
            function()
                vim.lsp.buf.format({ async = true })
            end,
            desc = "format buffer",
        },
    })

    -- Which key trouble
    whichkey.add({
        { "<leader>t",  group = "trouble" },
        { "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
        {
            "<leader>tT",
            "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
            desc = "Buffer Diagnostics (Trouble)",
        },
        { "<leader>ts", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols (Trouble)" },
        {
            "<leader>tr",
            "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
            desc = "LSP Definitions / References (Trouble)",
        },
        {
            "<leader>tl",
            "<cmd>Trouble loclist toggle<cr>",
            desc = "Location List (Trouble)",
        },
        {
            "<leader>tq",
            "<cmd>Trouble qflist toggle<cr>",
            desc = "Quickfix List (Trouble)",
        },
    })

    -- which key code actions
    whichkey.add({
        { "<leader>c",  group = "code actions" },
        { "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
        { "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<cr>",      desc = "Rename Symbol" },
        { "<leader>ch", "<cmd>lua vim.lsp.buf.hover()<cr>",       desc = "Hover" },
    })

    -- Which key gitsigns
    whichkey.add({
        { "<leader>g",   group = "git" },
        {
            "<leader>gs",
            ":Gitsigns stage_hunk<cr>",
            desc = "Stage Hunk",
            mode = { "n", "v" },
        },
        {
            "<leader>gr",
            ":Gitsigns reset_hunk<cr>",
            desc = "Reset Hunk",
            mode = { "n", "v" },
        },
        { "<leader>gu",  "<cmd>Gitsigns undo_stage_hunk<cr>",           desc = "Undo Stage Hunk" },
        { "<leader>gS",  "<cmd>Gitsigns stage_buffer<cr>",              desc = "Stage Buffer" },
        { "<leader>gR",  "<cmd>Gitsigns reset_buffer<cr>",              desc = "Reset Buffer" },
        { "<leader>gp",  "<cmd>Gitsigns preview_hunk<cr>",              desc = "Preview Hunk" },
        { "<leader>gb",  "<cmd>Gitsigns blame_line<cr>",                desc = "Blame Line" },
        { "<leader>gd",  "<cmd>Gitsigns diffthis<cr>",                  desc = "Diff This" },
        { "<leader>gt",  group = "toggles" },
        { "<leader>gtb", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Toggle Line Blame" },
        { "<leader>gtd", "<cmd>Gitsigns toggle_deleted<cr>",            desc = "Toggle Deleted" },
        { "]h",          "<cmd>Gitsigns next_hunk<cr>",                 desc = "Next Hunk" },
        { "[h",          "<cmd>Gitsigns prev_hunk<cr>",                 desc = "Prev Hunk" },
    })

    -- Which key pithos
    whichkey.add({
        { "<leader>p",  group = "pithos" },
        { "<leader>ps", "<cmd>Pithos sessions<cr>", desc = "Session Picker" },
        { "<leader>pa", "<cmd>Pithos attach<cr>",   desc = "Attach Session" },
        { "<leader>pe", ":Pithos exec ",            desc = "Exec Command In Session" },
        { "<leader>pc", "<cmd>Pithos cd<cr>",       desc = "Cd To Sandbox" },
        { "<leader>pd", "<cmd>Pithos diff<cr>",     desc = "Diff Buffer Vs Sandbox" },
        { "<leader>pp", "<cmd>Pithos path<cr>",     desc = "Show Sandbox Path" },
        { "<leader>pP", "<cmd>Pithos pull<cr>",     desc = "Pull Changes" },
        { "<leader>pr", "<cmd>Pithos run<cr>",      desc = "Run" },
        { "<leader>pb", "<cmd>Pithos build<cr>",    desc = "Build Image" },
        { "<leader>pi", "<cmd>Pithos init<cr>",     desc = "Init Config" },
    })
end
