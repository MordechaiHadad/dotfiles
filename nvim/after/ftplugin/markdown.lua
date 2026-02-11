-- Soft wrap settings
vim.opt_local.wrap = true
vim.opt_local.linebreak = true
vim.opt_local.breakindent = true

-- Better navigation for wrapped lines
vim.keymap.set('n', 'j', 'gj', { buffer = true })  -- Move by visual line
vim.keymap.set('n', 'k', 'gk', { buffer = true })
vim.keymap.set('n', '0', 'g0', { buffer = true })  -- Start of visual line
vim.keymap.set('n', '$', 'g$', { buffer = true })  -- End of visual line
