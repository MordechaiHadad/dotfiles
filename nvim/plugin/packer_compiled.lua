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
  ["FTerm.nvim"] = {
    config = { '\27LJ\1\2Ù\1\0\0\a\0\t\0\0174\0\0\0007\0\1\0007\0\2\0003\1\3\0\16\2\0\0%\3\4\0%\4\5\0%\5\6\0\16\6\1\0>\2\5\1\16\2\0\0%\3\a\0%\4\5\0%\5\b\0\16\6\1\0>\2\5\1G\0\1\0005<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>\6t+<CMD>lua require("FTerm").toggle()<CR>\n<F12>\6n\1\0\2\vsilent\2\fnoremap\2\20nvim_set_keymap\bapi\bvim\0' },
    loaded = true,
    path = "/home/morde/.local/share/nvim/site/pack/packer/start/FTerm.nvim"
  },
  LuaSnip = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/morde/.local/share/nvim/site/pack/packer/opt/LuaSnip"
  },
  ["barbar.nvim"] = {
    config = { "\27LJ\1\2¿\1\0\0\5\0\n\0\0174\0\0\0007\0\1\0007\0\2\0%\1\3\0%\2\4\0%\3\5\0003\4\6\0>\0\5\0014\0\0\0007\0\1\0007\0\2\0%\1\3\0%\2\a\0%\3\b\0003\4\t\0>\0\5\1G\0\1\0\1\0\2\vsilent\2\fnoremap\2\24:BufferPrevious<CR>\f<S-TAB>\1\0\2\vsilent\2\fnoremap\2\20:BufferNext<CR>\n<TAB>\6n\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    path = "/home/morde/.local/share/nvim/site/pack/packer/start/barbar.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/morde/.local/share/nvim/site/pack/packer/start/cmp-buffer"
  },
  ["cmp-calc"] = {
    after_files = { "/home/morde/.local/share/nvim/site/pack/packer/opt/cmp-calc/after/plugin/cmp_calc.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/morde/.local/share/nvim/site/pack/packer/opt/cmp-calc"
  },
  ["cmp-nvim-lsp"] = {
    after_files = { "/home/morde/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/morde/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    after_files = { "/home/morde/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua/after/plugin/cmp_nvim_lua.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/morde/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    after_files = { "/home/morde/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/morde/.local/share/nvim/site/pack/packer/opt/cmp-path"
  },
  cmp_luasnip = {
    after_files = { "/home/morde/.local/share/nvim/site/pack/packer/opt/cmp_luasnip/after/plugin/cmp_luasnip.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/morde/.local/share/nvim/site/pack/packer/opt/cmp_luasnip"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\1\2Ø\1\0\0\6\3\v\0\0314\0\0\0007\0\1\0007\0\2\0%\1\3\0+\2\0\0007\2\4\2%\3\5\0+\4\1\0004\5\0\0007\5\6\0057\5\a\5>\5\1\0026\4\5\4\14\0\4\0T\5\2€+\4\0\0007\4\b\4$\1\4\1>\0\2\1%\0\t\0+\1\2\0004\2\0\0007\2\6\0027\2\a\2>\2\1\0026\1\2\1\14\0\1\0T\2\1€%\1\n\0$\0\1\0H\0\2\0\1À\2À\3À\nError\a  \bred\tmode\afn\f guibg=\nblack\27hi GalaxyViMode guifg=\17nvim_command\bapi\bvim\22\0\0\1\0\1\0\2%\0\0\0H\0\2\0\v  îœ¥ 2\0\0\2\1\2\0\6+\0\0\0007\0\0\0>\0\1\2%\1\1\0$\0\1\0H\0\2\0\6À\6 \19get_git_branch3\0\0\2\1\2\0\6+\0\0\0007\0\0\0>\0\1\2%\1\1\0$\0\1\0H\0\2\0\aÀ\6 \20get_file_format/\0\0\2\1\2\0\6+\0\0\0007\0\0\0>\0\1\2%\1\1\0$\0\1\0H\0\2\0\aÀ\6 \16line_column”\1\0\0\4\2\b\0\0184\0\0\0007\0\1\0007\0\2\0%\1\3\0+\2\0\0004\3\0\0007\3\4\0037\3\5\3>\3\1\0026\2\3\2\14\0\2\0T\3\2€+\2\1\0007\2\6\2$\1\2\1>\0\2\1%\0\a\0H\0\2\0\2À\1À\bâ–Š\bred\tmode\afn hi GalaxyRightViMode guifg=\17nvim_command\bapi\bvimÁ\14\1\0\r\0M\0Ò\0014\0\0\0%\1\1\0>\0\2\0023\1\2\0003\2\4\0007\3\3\1:\3\5\0027\3\6\1:\3\a\0027\3\b\1:\3\t\0027\3\n\1:\3\v\0027\3\b\1:\3\f\0027\3\r\1:\3\14\0023\3\15\0004\4\0\0%\5\16\0>\4\2\0027\5\17\0004\6\0\0%\a\18\0>\6\2\0024\a\0\0%\b\19\0>\a\2\0023\b\21\0:\b\20\0007\b\22\0053\t\28\0003\n\24\0001\v\23\0:\v\25\n2\v\3\0007\f\r\1;\f\1\v7\f\26\1;\f\2\v:\v\27\n:\n\29\t;\t\1\b7\b\22\0053\t\"\0003\n\31\0007\v\30\4:\v \n1\v!\0:\v\25\n2\v\3\0007\f\3\1;\f\1\v7\f\26\1;\f\2\v:\v\27\n:\n#\t;\t\2\b7\b\22\0053\t'\0003\n$\0007\v\30\4:\v \n1\v%\0:\v\25\n2\v\3\0007\f&\1;\f\1\v7\f\26\1;\f\2\v:\v\27\n:\n(\t;\t\3\b7\b\22\0053\t*\0003\n)\0007\v\30\4:\v \n2\v\3\0007\f\6\1;\f\1\v7\f\26\1;\f\2\v:\v\27\n:\n+\t;\t\4\b7\b\22\0053\t-\0003\n,\0007\v\30\4:\v \n2\v\3\0007\f\n\1;\f\1\v7\f\26\1;\f\2\v:\v\27\n:\n.\t;\t\5\b7\b\22\0053\t1\0003\n/\0007\v\30\4:\v \n2\v\3\0007\f\r\1;\f\1\v7\f\26\1;\f\2\v:\v\27\n2\v\3\0007\f\3\1;\f\1\v7\f\26\1;\f\2\v:\v0\n:\n2\t;\t\6\b7\b\22\0053\t4\0003\n3\0002\v\3\0007\f\r\1;\f\1\v7\f\26\1;\f\2\v:\v\27\n:\n5\t;\t\a\b7\b\22\0053\t7\0003\n6\0002\v\3\0007\f\n\1;\f\1\v7\f\26\1;\f\2\v:\v\27\n:\n8\t;\t\b\b7\b9\0053\t<\0003\n;\0001\v:\0:\v\25\n2\v\3\0007\f&\1;\f\1\v7\f\26\1;\f\2\v:\v\27\n:\n=\t;\t\1\b7\b9\0053\t?\0003\n>\0002\v\3\0007\f&\1;\f\1\v7\f\26\1;\f\2\v:\v\27\n2\v\3\0007\f\3\1;\f\1\v7\f\26\1;\f\2\v:\v0\n:\n@\t;\t\2\b7\b9\0053\tC\0003\nB\0001\vA\0:\v\25\n2\v\3\0007\f&\1;\f\1\v7\f\26\1;\f\2\v:\v\27\n:\nD\t;\t\3\b7\b9\0053\tG\0003\nF\0001\vE\0:\v\25\n2\v\3\0007\f\r\1;\f\1\v7\f\26\1;\f\2\v:\v\27\n:\nH\t;\t\4\b7\b\17\0007\bI\b3\tK\0003\nJ\0002\v\3\0007\f&\1;\f\1\v7\f\26\1;\f\2\v:\v\27\n:\nL\t;\t\1\b0\0\0€G\0\1\0\rFileName\1\0\0\1\0\1\rprovider\rFileName\20short_line_left\16RightViMode\1\0\0\1\0\0\0\15LineColumn\1\0\0\1\0\0\0\16LinePercent\1\0\0\1\0\2\14separator\6|\rprovider\16LinePercent\15FileFormat\1\0\0\1\0\0\0\nright\19DiagnosticWarn\1\0\0\1\0\2\ticon\tï”© \rprovider\19DiagnosticWarn\20DiagnosticError\1\0\0\1\0\2\ticon\tï™™ \rprovider\20DiagnosticError\15DiffRemove\1\0\0\24separator_highlight\1\0\3\14separator\a| \rprovider\15DiffRemove\ticon\n ï‘˜ \17DiffModified\1\0\0\1\0\2\ticon\n ï‘™ \rprovider\17DiffModified\fDiffAdd\1\0\0\1\0\2\ticon\n ï‘— \rprovider\fDiffAdd\14GitBranch\1\0\0\15foreground\0\1\0\0\fGitIcon\1\0\0\0\14condition\1\0\0\24check_git_workspace\vViMode\1\0\0\14highlight\15line_color\rprovider\1\0\0\0\tleft\1\5\0\0\rNvimTree\vpacker\rstartify\15LspTrouble\20short_line_list!galaxyline.provider_fileinfo\28galaxyline.provider_vcs\fsection\25galaxyline.condition\1\0\6\6V\tïœ‡ \6c\tîž• \6v\tïœ‡ \6\22\btf \6n\tïŸ› \6i\tï£ª \6\22\bred\6V\6c\vyellow\6v\vpurple\6i\ngreen\6n\1\0\0\tblue\1\0\f\tblue\f#5d8ac2\nblack\f#2b2e36\15light_blue\f#8fc6e3\tgrey\f#3B4048\ngreen\f#98C379\15foreground\f#E5E9F0\15blue_green\f#4EC9B0\vyellow\f#d4d198\15line_color\f#353c4a\15background\f#2E3440\bred\f#d94848\vpurple\f#c487b9\15galaxyline\frequire\0" },
    loaded = true,
    path = "/home/morde/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\1\0026\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/morde/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  kommentary = {
    loaded = false,
    needs_bufread = false,
    path = "/home/morde/.local/share/nvim/site/pack/packer/opt/kommentary"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/home/morde/.local/share/nvim/site/pack/packer/start/lush.nvim"
  },
  neorg = {
    config = { "\27LJ\1\2Æ\2\0\0\6\0\20\0\0274\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\18\0003\2\3\0002\3\0\0:\3\4\0023\3\6\0003\4\5\0:\4\a\3:\3\b\0022\3\0\0:\3\t\0023\3\r\0003\4\v\0003\5\n\0:\5\f\4:\4\a\3:\3\14\0023\3\16\0003\4\15\0:\4\a\3:\3\17\2:\2\19\1>\0\2\1G\0\1\0\tload\1\0\0\25core.norg.completion\1\0\0\1\0\1\vengine\rnvim-cmp\21core.norg.dirman\1\0\0\15workspaces\1\0\0\1\0\1\17my_workspace\f~/neorg\24core.norg.concealer\18core.keybinds\vconfig\1\0\0\1\0\1\21default_keybinds\2\18core.defaults\1\0\0\nsetup\nneorg\frequire\0" },
    loaded = false,
    needs_bufread = true,
    path = "/home/morde/.local/share/nvim/site/pack/packer/opt/neorg"
  },
  ["nvim-autopairs"] = {
    config = { '\27LJ\1\2œ\1\0\0\2\0\6\0\r4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\0014\0\0\0%\1\4\0>\0\2\0027\0\2\0003\1\5\0>\0\2\1G\0\1\0\1\0\2\17map_complete\2\vmap_cr\2"nvim-autopairs.completion.cmp\1\0\1\rcheck_ts\2\nsetup\19nvim-autopairs\frequire\0' },
    loaded = false,
    needs_bufread = false,
    path = "/home/morde/.local/share/nvim/site/pack/packer/opt/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "cmp-nvim-lsp", "cmp_luasnip", "cmp-nvim-lua", "cmp-path", "LuaSnip", "cmp-calc" },
    loaded = true,
    only_config = true
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/morde/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/morde/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspmanager"] = {
    config = { "\27LJ\1\0028\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\15lspmanager\frequire\0" },
    loaded = true,
    path = "/home/morde/.local/share/nvim/site/pack/packer/start/nvim-lspmanager"
  },
  ["nvim-papadark"] = {
    loaded = true,
    path = "/home/morde/.local/share/nvim/site/pack/packer/start/nvim-papadark"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle" },
    config = { "\27LJ\1\0026\0\0\2\0\3\0\0054\0\0\0007\0\1\0'\1\1\0:\1\2\0G\0\1\0\25nvim_tree_auto_close\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/morde/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\1\2Ä\4\0\0\5\0\24\0!4\0\0\0%\1\1\0>\0\2\0023\1\3\0:\1\2\0004\0\0\0%\1\4\0>\0\2\0027\0\5\0>\0\1\0023\1\n\0003\2\a\0003\3\b\0:\3\t\2:\2\v\1:\1\6\0004\1\0\0%\2\f\0>\1\2\0027\1\r\0013\2\14\0003\3\15\0003\4\16\0:\4\17\3:\3\18\0023\3\19\0002\4\0\0:\4\20\3:\3\21\0023\3\22\0:\3\23\2>\1\2\1G\0\1\0\fautotag\1\0\1\venable\2\15playground\fdisable\1\0\3\15updatetime\3\25\20persist_queries\1\venable\2\14highlight\20custom_captures\1\0\2\19primitive.type\fKeyword\20escape.sequence\rFunction\1\0\1\venable\2\1\0\1\21ensure_installed\ball\nsetup\28nvim-treesitter.configs\17install_info\1\0\0\nfiles\1\3\0\0\17src/parser.c\19src/scanner.cc\1\0\2\vbranch\tmain\burl3https://github.com/nvim-neorg/tree-sitter-norg\tnorg\23get_parser_configs\28nvim-treesitter.parsers\1\2\0\0\nclang\14compilers\28nvim-treesitter.install\frequire\0" },
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
  ["package-info.nvim"] = {
    loaded = true,
    path = "/home/morde/.local/share/nvim/site/pack/packer/start/package-info.nvim"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/morde/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["persistence.nvim"] = {
    config = { "\27LJ\1\0029\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\16persistence\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/morde/.local/share/nvim/site/pack/packer/opt/persistence.nvim"
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
  ["project.nvim"] = {
    config = { "\27LJ\1\2:\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\17project_nvim\frequire\0" },
    loaded = true,
    path = "/home/morde/.local/share/nvim/site/pack/packer/start/project.nvim"
  },
  ["sql.nvim"] = {
    loaded = true,
    path = "/home/morde/.local/share/nvim/site/pack/packer/start/sql.nvim"
  },
  ["tabout.nvim"] = {
    config = { "\27LJ\1\0024\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\vtabout\frequire\0" },
    loaded = true,
    path = "/home/morde/.local/share/nvim/site/pack/packer/start/tabout.nvim"
  },
  ["telescope-frecency.nvim"] = {
    config = { "\27LJ\1\2M\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0%\1\3\0>\0\2\1G\0\1\0\rfrecency\19load_extension\14telescope\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/morde/.local/share/nvim/site/pack/packer/opt/telescope-frecency.nvim"
  },
  ["telescope.nvim"] = {
    after = { "telescope-frecency.nvim" },
    commands = { "Telescope" },
    config = { "\27LJ\1\2Õ\1\0\0\a\0\15\0\0244\0\0\0%\1\1\0>\0\2\0024\1\0\0%\2\2\0>\1\2\0027\1\3\0013\2\v\0003\3\t\0003\4\a\0003\5\5\0007\6\4\0:\6\6\5:\5\b\4:\4\n\3:\3\f\2>\1\2\0014\1\0\0%\2\2\0>\1\2\0027\1\r\1%\2\14\0>\1\2\1G\0\1\0\rprojects\19load_extension\rdefaults\1\0\0\rmappings\1\0\0\6i\1\0\0\n<esc>\1\0\0\nclose\nsetup\14telescope\22telescope.actions\frequire\0" },
    loaded = false,
    needs_bufread = true,
    path = "/home/morde/.local/share/nvim/site/pack/packer/opt/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\1\2;\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\18todo-comments\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/morde/.local/share/nvim/site/pack/packer/opt/todo-comments.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\1\2S\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1G\0\1\0\1\0\2\14auto_open\2\15auto_close\2\nsetup\ftrouble\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/morde/.local/share/nvim/site/pack/packer/opt/trouble.nvim"
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
  ["^persistence"] = "persistence.nvim"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\1\2Ä\4\0\0\5\0\24\0!4\0\0\0%\1\1\0>\0\2\0023\1\3\0:\1\2\0004\0\0\0%\1\4\0>\0\2\0027\0\5\0>\0\1\0023\1\n\0003\2\a\0003\3\b\0:\3\t\2:\2\v\1:\1\6\0004\1\0\0%\2\f\0>\1\2\0027\1\r\0013\2\14\0003\3\15\0003\4\16\0:\4\17\3:\3\18\0023\3\19\0002\4\0\0:\4\20\3:\3\21\0023\3\22\0:\3\23\2>\1\2\1G\0\1\0\fautotag\1\0\1\venable\2\15playground\fdisable\1\0\3\15updatetime\3\25\20persist_queries\1\venable\2\14highlight\20custom_captures\1\0\2\19primitive.type\fKeyword\20escape.sequence\rFunction\1\0\1\venable\2\1\0\1\21ensure_installed\ball\nsetup\28nvim-treesitter.configs\17install_info\1\0\0\nfiles\1\3\0\0\17src/parser.c\19src/scanner.cc\1\0\2\vbranch\tmain\burl3https://github.com/nvim-neorg/tree-sitter-norg\tnorg\23get_parser_configs\28nvim-treesitter.parsers\1\2\0\0\nclang\14compilers\28nvim-treesitter.install\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\1\2é\1\0\2\4\1\a\0\18+\2\0\0007\3\0\0016\2\3\2:\2\0\0013\2\2\0007\3\3\0007\3\4\0036\2\3\2:\2\1\0013\2\6\0007\3\3\0007\3\4\0036\2\3\2\14\0\2\0T\3\1€'\2\0\0:\2\5\1H\1\2\0\1À\1\0\3\tpath\3\1\rnvim_lsp\3\0\vbuffer\3\1\bdup\tname\vsource\1\0\6\fluasnip\14(Snippet)\nneorg\f(Neorg)\rnvim_lsp\n(LSP)\vbuffer\r(Buffer)\tcalc\17(Calculator)\tpath\v(Path)\tmenu\tkindC\0\1\3\0\4\0\a4\1\0\0%\2\1\0>\1\2\0027\1\2\0017\2\3\0>\1\2\1G\0\1\0\tbody\15lsp_expand\fluasnip\frequire§\a\1\0\b\0'\0A4\0\0\0%\1\1\0>\0\2\0023\1\2\0007\2\3\0003\3\5\0003\4\4\0:\4\6\0033\4\b\0001\5\a\0:\5\t\4:\4\n\0033\4\r\0007\5\v\0007\5\f\5'\6üÿ>\5\2\2:\5\14\0047\5\v\0007\5\f\5'\6\4\0>\5\2\2:\5\15\0047\5\v\0007\5\16\5>\5\1\2:\5\17\0047\5\v\0007\5\18\5>\5\1\2:\5\19\0047\5\v\0007\5\20\0053\6\23\0007\a\21\0007\a\22\a:\a\24\6>\5\2\2:\5\25\4:\4\v\0033\4\27\0001\5\26\0:\5\28\4:\4\29\0032\4\t\0003\5\30\0;\5\1\0043\5\31\0;\5\2\0043\5 \0;\5\3\0043\5!\0;\5\4\0043\5\"\0;\5\5\0043\5#\0;\5\6\0043\5$\0;\5\a\0043\5%\0;\5\b\4:\4&\3>\2\2\0010\0\0€G\0\1\0\fsources\1\0\1\tname\tcalc\1\0\1\tname\nneorg\1\0\1\tname\tpath\1\0\1\tname\ftabnine\1\0\1\tname\rnvim_lua\1\0\1\tname\fluasnip\1\0\1\tname\vbuffer\1\0\1\tname\rnvim_lsp\fsnippet\vexpand\1\0\0\0\t<CR>\rbehavior\1\0\1\vselect\2\fReplace\20ConfirmBehavior\fconfirm\n<C-e>\nclose\14<C-Space>\rcomplete\n<C-f>\n<C-d>\1\0\0\16scroll_docs\fmapping\15formatting\vformat\1\0\0\0\15completion\1\0\0\1\0\1\16completeopt\21menuone,noselect\nsetup\1\0\25\tText\bï¾\vMethod\bÆ’ \rOperator\bïš”\14Interface\tï°® \nColor\tîˆ« \vModule\tï£– \nEvent\bïƒ§\rFunction\tï‚š \16Constructor\tîˆ \15EnumMember\tï… \rProperty\tî˜¤ \rConstant\tîˆ¬ \vStruct\tïƒŠ \rVariable\bï”ª\fSnippet\tï¬Œ \vFolder\tï„• \tUnit\bï¥¬\nValue\tï¢Ÿ \18TypeParameter\5\tFile\bïœ˜\nClass\tîƒ \nField\bï° \tEnum\täº† \fKeyword\tï … \14Reference\bïœ†\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: barbar.nvim
time([[Config for barbar.nvim]], true)
try_loadstring("\27LJ\1\2¿\1\0\0\5\0\n\0\0174\0\0\0007\0\1\0007\0\2\0%\1\3\0%\2\4\0%\3\5\0003\4\6\0>\0\5\0014\0\0\0007\0\1\0007\0\2\0%\1\3\0%\2\a\0%\3\b\0003\4\t\0>\0\5\1G\0\1\0\1\0\2\vsilent\2\fnoremap\2\24:BufferPrevious<CR>\f<S-TAB>\1\0\2\vsilent\2\fnoremap\2\20:BufferNext<CR>\n<TAB>\6n\20nvim_set_keymap\bapi\bvim\0", "config", "barbar.nvim")
time([[Config for barbar.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\1\0026\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: galaxyline.nvim
time([[Config for galaxyline.nvim]], true)
try_loadstring("\27LJ\1\2Ø\1\0\0\6\3\v\0\0314\0\0\0007\0\1\0007\0\2\0%\1\3\0+\2\0\0007\2\4\2%\3\5\0+\4\1\0004\5\0\0007\5\6\0057\5\a\5>\5\1\0026\4\5\4\14\0\4\0T\5\2€+\4\0\0007\4\b\4$\1\4\1>\0\2\1%\0\t\0+\1\2\0004\2\0\0007\2\6\0027\2\a\2>\2\1\0026\1\2\1\14\0\1\0T\2\1€%\1\n\0$\0\1\0H\0\2\0\1À\2À\3À\nError\a  \bred\tmode\afn\f guibg=\nblack\27hi GalaxyViMode guifg=\17nvim_command\bapi\bvim\22\0\0\1\0\1\0\2%\0\0\0H\0\2\0\v  îœ¥ 2\0\0\2\1\2\0\6+\0\0\0007\0\0\0>\0\1\2%\1\1\0$\0\1\0H\0\2\0\6À\6 \19get_git_branch3\0\0\2\1\2\0\6+\0\0\0007\0\0\0>\0\1\2%\1\1\0$\0\1\0H\0\2\0\aÀ\6 \20get_file_format/\0\0\2\1\2\0\6+\0\0\0007\0\0\0>\0\1\2%\1\1\0$\0\1\0H\0\2\0\aÀ\6 \16line_column”\1\0\0\4\2\b\0\0184\0\0\0007\0\1\0007\0\2\0%\1\3\0+\2\0\0004\3\0\0007\3\4\0037\3\5\3>\3\1\0026\2\3\2\14\0\2\0T\3\2€+\2\1\0007\2\6\2$\1\2\1>\0\2\1%\0\a\0H\0\2\0\2À\1À\bâ–Š\bred\tmode\afn hi GalaxyRightViMode guifg=\17nvim_command\bapi\bvimÁ\14\1\0\r\0M\0Ò\0014\0\0\0%\1\1\0>\0\2\0023\1\2\0003\2\4\0007\3\3\1:\3\5\0027\3\6\1:\3\a\0027\3\b\1:\3\t\0027\3\n\1:\3\v\0027\3\b\1:\3\f\0027\3\r\1:\3\14\0023\3\15\0004\4\0\0%\5\16\0>\4\2\0027\5\17\0004\6\0\0%\a\18\0>\6\2\0024\a\0\0%\b\19\0>\a\2\0023\b\21\0:\b\20\0007\b\22\0053\t\28\0003\n\24\0001\v\23\0:\v\25\n2\v\3\0007\f\r\1;\f\1\v7\f\26\1;\f\2\v:\v\27\n:\n\29\t;\t\1\b7\b\22\0053\t\"\0003\n\31\0007\v\30\4:\v \n1\v!\0:\v\25\n2\v\3\0007\f\3\1;\f\1\v7\f\26\1;\f\2\v:\v\27\n:\n#\t;\t\2\b7\b\22\0053\t'\0003\n$\0007\v\30\4:\v \n1\v%\0:\v\25\n2\v\3\0007\f&\1;\f\1\v7\f\26\1;\f\2\v:\v\27\n:\n(\t;\t\3\b7\b\22\0053\t*\0003\n)\0007\v\30\4:\v \n2\v\3\0007\f\6\1;\f\1\v7\f\26\1;\f\2\v:\v\27\n:\n+\t;\t\4\b7\b\22\0053\t-\0003\n,\0007\v\30\4:\v \n2\v\3\0007\f\n\1;\f\1\v7\f\26\1;\f\2\v:\v\27\n:\n.\t;\t\5\b7\b\22\0053\t1\0003\n/\0007\v\30\4:\v \n2\v\3\0007\f\r\1;\f\1\v7\f\26\1;\f\2\v:\v\27\n2\v\3\0007\f\3\1;\f\1\v7\f\26\1;\f\2\v:\v0\n:\n2\t;\t\6\b7\b\22\0053\t4\0003\n3\0002\v\3\0007\f\r\1;\f\1\v7\f\26\1;\f\2\v:\v\27\n:\n5\t;\t\a\b7\b\22\0053\t7\0003\n6\0002\v\3\0007\f\n\1;\f\1\v7\f\26\1;\f\2\v:\v\27\n:\n8\t;\t\b\b7\b9\0053\t<\0003\n;\0001\v:\0:\v\25\n2\v\3\0007\f&\1;\f\1\v7\f\26\1;\f\2\v:\v\27\n:\n=\t;\t\1\b7\b9\0053\t?\0003\n>\0002\v\3\0007\f&\1;\f\1\v7\f\26\1;\f\2\v:\v\27\n2\v\3\0007\f\3\1;\f\1\v7\f\26\1;\f\2\v:\v0\n:\n@\t;\t\2\b7\b9\0053\tC\0003\nB\0001\vA\0:\v\25\n2\v\3\0007\f&\1;\f\1\v7\f\26\1;\f\2\v:\v\27\n:\nD\t;\t\3\b7\b9\0053\tG\0003\nF\0001\vE\0:\v\25\n2\v\3\0007\f\r\1;\f\1\v7\f\26\1;\f\2\v:\v\27\n:\nH\t;\t\4\b7\b\17\0007\bI\b3\tK\0003\nJ\0002\v\3\0007\f&\1;\f\1\v7\f\26\1;\f\2\v:\v\27\n:\nL\t;\t\1\b0\0\0€G\0\1\0\rFileName\1\0\0\1\0\1\rprovider\rFileName\20short_line_left\16RightViMode\1\0\0\1\0\0\0\15LineColumn\1\0\0\1\0\0\0\16LinePercent\1\0\0\1\0\2\14separator\6|\rprovider\16LinePercent\15FileFormat\1\0\0\1\0\0\0\nright\19DiagnosticWarn\1\0\0\1\0\2\ticon\tï”© \rprovider\19DiagnosticWarn\20DiagnosticError\1\0\0\1\0\2\ticon\tï™™ \rprovider\20DiagnosticError\15DiffRemove\1\0\0\24separator_highlight\1\0\3\14separator\a| \rprovider\15DiffRemove\ticon\n ï‘˜ \17DiffModified\1\0\0\1\0\2\ticon\n ï‘™ \rprovider\17DiffModified\fDiffAdd\1\0\0\1\0\2\ticon\n ï‘— \rprovider\fDiffAdd\14GitBranch\1\0\0\15foreground\0\1\0\0\fGitIcon\1\0\0\0\14condition\1\0\0\24check_git_workspace\vViMode\1\0\0\14highlight\15line_color\rprovider\1\0\0\0\tleft\1\5\0\0\rNvimTree\vpacker\rstartify\15LspTrouble\20short_line_list!galaxyline.provider_fileinfo\28galaxyline.provider_vcs\fsection\25galaxyline.condition\1\0\6\6V\tïœ‡ \6c\tîž• \6v\tïœ‡ \6\22\btf \6n\tïŸ› \6i\tï£ª \6\22\bred\6V\6c\vyellow\6v\vpurple\6i\ngreen\6n\1\0\0\tblue\1\0\f\tblue\f#5d8ac2\nblack\f#2b2e36\15light_blue\f#8fc6e3\tgrey\f#3B4048\ngreen\f#98C379\15foreground\f#E5E9F0\15blue_green\f#4EC9B0\vyellow\f#d4d198\15line_color\f#353c4a\15background\f#2E3440\bred\f#d94848\vpurple\f#c487b9\15galaxyline\frequire\0", "config", "galaxyline.nvim")
time([[Config for galaxyline.nvim]], false)
-- Config for: nvim-lspmanager
time([[Config for nvim-lspmanager]], true)
try_loadstring("\27LJ\1\0028\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\15lspmanager\frequire\0", "config", "nvim-lspmanager")
time([[Config for nvim-lspmanager]], false)
-- Config for: tabout.nvim
time([[Config for tabout.nvim]], true)
try_loadstring("\27LJ\1\0024\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\vtabout\frequire\0", "config", "tabout.nvim")
time([[Config for tabout.nvim]], false)
-- Config for: FTerm.nvim
time([[Config for FTerm.nvim]], true)
try_loadstring('\27LJ\1\2Ù\1\0\0\a\0\t\0\0174\0\0\0007\0\1\0007\0\2\0003\1\3\0\16\2\0\0%\3\4\0%\4\5\0%\5\6\0\16\6\1\0>\2\5\1\16\2\0\0%\3\a\0%\4\5\0%\5\b\0\16\6\1\0>\2\5\1G\0\1\0005<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>\6t+<CMD>lua require("FTerm").toggle()<CR>\n<F12>\6n\1\0\2\vsilent\2\fnoremap\2\20nvim_set_keymap\bapi\bvim\0', "config", "FTerm.nvim")
time([[Config for FTerm.nvim]], false)
-- Config for: project.nvim
time([[Config for project.nvim]], true)
try_loadstring("\27LJ\1\2:\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\17project_nvim\frequire\0", "config", "project.nvim")
time([[Config for project.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd cmp-path ]]
vim.cmd [[ packadd cmp-calc ]]
vim.cmd [[ packadd cmp_luasnip ]]
vim.cmd [[ packadd cmp-nvim-lua ]]
vim.cmd [[ packadd cmp-nvim-lsp ]]
vim.cmd [[ packadd LuaSnip ]]
time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType norg ++once lua require("packer.load")({'neorg'}, { ft = "norg" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufWinEnter * ++once lua require("packer.load")({'which-key.nvim', 'trouble.nvim', 'kommentary'}, { event = "BufWinEnter *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-autopairs', 'todo-comments.nvim'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufReadPre * ++once lua require("packer.load")({'persistence.nvim'}, { event = "BufReadPre *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/morde/.local/share/nvim/site/pack/packer/opt/neorg/ftdetect/norg.vim]], true)
vim.cmd [[source /home/morde/.local/share/nvim/site/pack/packer/opt/neorg/ftdetect/norg.vim]]
time([[Sourcing ftdetect script at: /home/morde/.local/share/nvim/site/pack/packer/opt/neorg/ftdetect/norg.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
