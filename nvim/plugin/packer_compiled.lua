-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = true
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/morde/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/morde/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/morde/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/morde/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/morde/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["barbar.nvim"] = {
    loaded = true,
    path = "/home/morde/.local/share/nvim/site/pack/packer/start/barbar.nvim"
  },
  ["bracey.vim"] = {
    loaded = true,
    path = "/home/morde/.local/share/nvim/site/pack/packer/start/bracey.vim"
  },
  ["compe-tabnine"] = {
    after_files = { "/home/morde/.local/share/nvim/site/pack/packer/opt/compe-tabnine/after/plugin/compe_tabnine.vim" },
    load_after = {
      ["snippets.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/morde/.local/share/nvim/site/pack/packer/opt/compe-tabnine"
  },
  ["galaxyline.nvim"] = {
    loaded = true,
    path = "/home/morde/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/morde/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  kommentary = {
    loaded = false,
    needs_bufread = false,
    path = "/home/morde/.local/share/nvim/site/pack/packer/opt/kommentary"
  },
  ["lsp-rooter.nvim"] = {
    loaded = true,
    path = "/home/morde/.local/share/nvim/site/pack/packer/start/lsp-rooter.nvim"
  },
  ["lsp-trouble.nvim"] = {
    loaded = true,
    path = "/home/morde/.local/share/nvim/site/pack/packer/start/lsp-trouble.nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/morde/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/home/morde/.local/share/nvim/site/pack/packer/start/lush.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\1\2Ø\1\0\0\3\1\t\2\0314\0\0\0007\0\1\0007\0\2\0>\0\1\2\b\0\0\0T\0\21€4\0\0\0007\0\1\0007\0\3\0>\0\1\0027\0\4\0\b\0\1\0T\0\t€4\0\0\0007\0\1\0007\0\5\0+\1\0\0007\1\6\1%\2\a\0>\1\2\0?\0\0\0T\0\b€+\0\0\0007\0\6\0%\1\a\0@\0\2\0T\0\3€+\0\0\0007\0\b\0@\0\1\0G\0\1\0\1À\17autopairs_cr\t<cr>\besc\18compe#confirm\rselected\18complete_info\15pumvisible\afn\bvim\0þÿÿÿ\31£\2\1\0\a\0\17\0\0294\0\0\0007\0\1\0007\0\2\0004\1\3\0%\2\4\0>\1\2\0024\2\3\0%\3\4\0>\2\2\0027\2\5\2>\2\1\0014\2\6\0002\3\0\0:\3\a\0024\2\0\0007\2\b\2%\3\n\0:\3\t\0024\2\a\0001\3\f\0:\3\v\2\16\2\0\0%\3\r\0%\4\14\0%\5\15\0003\6\16\0>\2\5\0010\0\0€G\0\1\0\1\0\2\texpr\2\fnoremap\2&v:lua.MUtils.completion_confirm()\t<CR>\6i\0\23completion_confirm\5\27completion_confirm_key\6g\vMUtils\a_G\nsetup\19nvim-autopairs\frequire\20nvim_set_keymap\bapi\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/morde/.local/share/nvim/site/pack/packer/opt/nvim-autopairs"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/morde/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    after = { "snippets.nvim" },
    after_files = { "/home/morde/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe.vim" },
    config = { "\27LJ\1\2«\4\0\0\5\0\26\0\0294\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\5\0003\3\4\0:\3\6\0023\3\a\0:\3\b\0023\3\t\0:\3\n\0023\3\v\0:\3\f\0023\3\r\0:\3\14\0023\3\15\0:\3\16\0023\3\17\0:\3\18\0023\3\19\0:\3\20\0023\3\22\0003\4\21\0:\4\23\3:\3\24\2:\2\25\1>\0\2\1G\0\1\0\vsource\nemoji\14filetypes\1\0\0\1\3\0\0\rmarkdown\ttext\18snippets_nvim\1\0\1\tkind\n ï— \nspell\1\0\1\tkind\n ï‘ˆ \rnvim_lua\1\0\1\tkind\n îŸ… \rnvim_lsp\1\0\1\tkind\n îœ– \nvsnip\1\0\1\tkind\n ï— \tcalc\1\0\1\tkind\n ï‡¬ \vbuffer\1\0\1\tkind\n ïŽ \tpath\1\0\1\ftabnine\2\1\0\1\tkind\n ï›— \1\0\f\17autocomplete\2\19source_timeout\3È\1\fenabled\2\ndebug\1\14preselect\venable\19max_abbr_width\3d\21incomplete_delay\3\3\19max_menu_width\3d\19max_kind_width\3d\15min_length\3\1\18throttle_time\3P\18documentation\2\nsetup\ncompe\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/morde/.local/share/nvim/site/pack/packer/opt/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/morde/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    config = { "\27LJ\1\2¢\1\0\0\b\0\6\0\0244\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\0014\0\0\0%\1\1\0>\0\2\0027\0\3\0>\0\1\0024\1\4\0\16\2\0\0>\1\2\4D\4\a€4\6\0\0%\a\5\0>\6\2\0026\6\5\0067\6\2\0062\a\0\0>\6\2\1B\4\3\3N\4÷G\0\1\0\14lspconfig\npairs\22installed_servers\nsetup\15lspinstall\frequire5\0\0\2\1\3\0\a+\0\0\0>\0\1\0014\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0\0À\fbufdo e\bcmd\bvimV\1\0\3\0\5\0\n1\0\0\0\16\1\0\0>\1\1\0014\1\1\0%\2\2\0>\1\2\0021\2\4\0:\2\3\0010\0\0€G\0\1\0\0\22post_install_hook\15lspinstall\frequire\0\0" },
    loaded = true,
    path = "/home/morde/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-papadark"] = {
    loaded = true,
    path = "/home/morde/.local/share/nvim/site/pack/packer/start/nvim-papadark"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/morde/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/morde/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/home/morde/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag"
  },
  ["nvim-web-devicons"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/morde/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/morde/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/home/morde/.local/share/nvim/site/pack/packer/start/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/morde/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/morde/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["snippets.nvim"] = {
    after = { "compe-tabnine" },
    load_after = {
      ["nvim-compe"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/morde/.local/share/nvim/site/pack/packer/opt/snippets.nvim"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope" },
    config = { "\27LJ\1\2¥\1\0\0\a\0\r\0\0184\0\0\0%\1\1\0>\0\2\0024\1\0\0%\2\2\0>\1\2\0027\1\3\0013\2\v\0003\3\t\0003\4\a\0003\5\5\0007\6\4\0:\6\6\5:\5\b\4:\4\n\3:\3\f\2>\1\2\1G\0\1\0\rdefaults\1\0\0\rmappings\1\0\0\6i\1\0\0\n<esc>\1\0\0\nclose\nsetup\14telescope\22telescope.actions\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/morde/.local/share/nvim/site/pack/packer/opt/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\1\2ö\a\0\0\5\0*\00014\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\a\0003\3\4\0003\4\5\0:\4\6\3:\3\b\0023\3\t\0:\3\n\0023\3\v\0:\3\f\0023\3\r\0003\4\14\0:\4\6\3:\3\15\0023\3\16\0003\4\17\0:\4\6\3:\3\18\0023\3\19\0003\4\20\0:\4\6\3:\3\21\2:\2\22\0013\2\23\0002\3\0\0:\3\24\2:\2\25\0013\2\27\0003\3\26\0:\3\28\0023\3\29\0:\3\30\0023\3\31\0:\3 \0023\3!\0:\3\"\0023\3#\0:\3$\2:\2%\0013\2&\0003\3'\0:\3(\2:\2)\1>\0\2\1G\0\1\0\vsearch\targs\1\6\0\0\18--color=never\17--no-heading\20--with-filename\18--line-number\r--column\1\0\2\fpattern\19\\b(KEYWORDS)\\b\fcommand\arg\vcolors\fdefault\1\3\0\0\15Identifier\f#7C3AED\thint\1\3\0\0\30LspDiagnosticsDefaultHint\f#10B981\tinfo\1\3\0\0%LspDiagnosticsDefaultInformation\f#2563EB\fwarning\1\4\0\0!LspDiagnosticsDefaultWarning\15WarningMsg\f#FBBF24\nerror\1\0\0\1\4\0\0\31LspDiagnosticsDefaultError\rErrorMsg\f#DC2626\14highlight\fexclude\1\0\6\fpattern\21.*<(KEYWORDS)\\s*\fkeyword\twide\17max_line_len\3\3\vbefore\5\18comments_only\2\nafter\afg\rkeywords\tNOTE\1\2\0\0\tINFO\1\0\2\ncolor\thint\ticon\tï¡§ \tPERF\1\4\0\0\nOPTIM\16PERFORMANCE\rOPTIMIZE\1\0\1\ticon\tï™‘ \tWARN\1\3\0\0\fWARNING\bXXX\1\0\2\ncolor\fwarning\ticon\tï± \tHACK\1\0\2\ncolor\fwarning\ticon\tï’ \tTODO\1\0\2\ncolor\tinfo\ticon\tï€Œ \bFIX\1\0\0\balt\1\5\0\0\nFIXME\bBUG\nFIXIT\nISSUE\1\0\2\ncolor\nerror\ticon\tï†ˆ \1\0\3\18sign_priority\3\1\19merge_keywords\2\nsigns\2\nsetup\18todo-comments\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/morde/.local/share/nvim/site/pack/packer/opt/todo-comments.nvim"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/home/morde/.local/share/nvim/site/pack/packer/start/vim-floaterm"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/home/morde/.local/share/nvim/site/pack/packer/start/vim-startify"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\1\2^\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\1>\0\2\1G\0\1\0\vwindow\1\0\0\1\0\1\vborder\vsingle\nsetup\14which-key\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/morde/.local/share/nvim/site/pack/packer/opt/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^nvim%-web%-devicons"] = "nvim-web-devicons",
  ["^telescope"] = "telescope.nvim"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat)then
      to_load[#to_load + 1] = plugin_name
    end
  end

  require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Config for: nvim-lspinstall
time([[Config for nvim-lspinstall]], true)
try_loadstring("\27LJ\1\2¢\1\0\0\b\0\6\0\0244\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\0014\0\0\0%\1\1\0>\0\2\0027\0\3\0>\0\1\0024\1\4\0\16\2\0\0>\1\2\4D\4\a€4\6\0\0%\a\5\0>\6\2\0026\6\5\0067\6\2\0062\a\0\0>\6\2\1B\4\3\3N\4÷G\0\1\0\14lspconfig\npairs\22installed_servers\nsetup\15lspinstall\frequire5\0\0\2\1\3\0\a+\0\0\0>\0\1\0014\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0\0À\fbufdo e\bcmd\bvimV\1\0\3\0\5\0\n1\0\0\0\16\1\0\0>\1\1\0014\1\1\0%\2\2\0>\1\2\0021\2\4\0:\2\3\0010\0\0€G\0\1\0\0\22post_install_hook\15lspinstall\frequire\0\0", "config", "nvim-lspinstall")
time([[Config for nvim-lspinstall]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
vim.cmd [[command! -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufWinEnter * ++once lua require("packer.load")({'which-key.nvim', 'kommentary'}, { event = "BufWinEnter *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-autopairs', 'nvim-compe', 'todo-comments.nvim'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
