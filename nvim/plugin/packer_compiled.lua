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
  ["cmp-path"] = {
    after_files = { "/home/morde/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/morde/.local/share/nvim/site/pack/packer/opt/cmp-path"
  },
  cmp_luasnip = {
    after_files = { "/home/morde/.local/share/nvim/site/pack/packer/opt/cmp_luasnip/after/plugin/cmp_luasnip.lua", "/home/morde/.local/share/nvim/site/pack/packer/opt/cmp_luasnip/after/plugin/cmp_luasnip.vim" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/morde/.local/share/nvim/site/pack/packer/opt/cmp_luasnip"
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
  ["lua-dev.nvim"] = {
    loaded = true,
    path = "/home/morde/.local/share/nvim/site/pack/packer/start/lua-dev.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\1\2\\\0\0\3\0\5\1\0154\0\0\0007\0\1\0007\0\2\0004\1\0\0007\1\1\0017\1\3\1%\2\4\0>\1\2\0=\0\0\2\t\0\0\0T\0\2€)\0\1\0T\1\1€)\0\2\0H\0\2\0\b%:t\vexpand\nempty\afn\bvim\2G\0\0\2\0\3\0\f4\0\0\0007\0\1\0007\0\2\0'\1\0\0>\0\2\2'\1P\0\0\1\0\0T\0\2€)\0\1\0T\1\1€)\0\2\0H\0\2\0\rwinwidth\afn\bvim–\1\0\0\5\0\a\0\0274\0\0\0007\0\1\0007\0\2\0%\1\3\0>\0\2\0024\1\0\0007\1\1\0017\1\4\1%\2\5\0\16\3\0\0%\4\6\0$\3\4\3>\1\3\2\r\2\1\0T\2\v€\19\2\1\0'\3\0\0\1\3\2\0T\2\4€\19\2\1\0\19\3\0\0\0\2\3\0T\2\2€)\2\1\0T\3\1€)\2\2\0H\2\2\0\6;\t.git\ffinddir\n%:p:h\vexpand\afn\bvimD\0\0\1\0\4\0\t4\0\0\0007\0\1\0007\0\2\0\6\0\3\0T\0\2€)\0\1\0T\1\1€)\0\2\0H\0\2\0\rstartify\rfiletype\abo\bvimI\0\1\4\1\4\0\b4\1\0\0007\1\1\1+\2\0\0007\2\2\0027\2\3\2\16\3\0\0>\1\3\1G\0\1\0\4À\14lualine_c\rsections\vinsert\ntableI\0\1\4\1\4\0\b4\1\0\0007\1\1\1+\2\0\0007\2\2\0027\2\3\2\16\3\0\0>\1\3\1G\0\1\0\4À\14lualine_x\rsections\vinsert\ntableÛ\3\0\0\6\1%\0J3\0\1\0+\1\0\0007\1\0\1:\1\2\0+\1\0\0007\1\3\1:\1\4\0+\1\0\0007\1\5\1:\1\6\0+\1\0\0007\1\0\1:\1\a\0+\1\0\0007\1\b\1:\1\t\0+\1\0\0007\1\n\1:\1\v\0+\1\0\0007\1\f\1:\1\r\0+\1\0\0007\1\f\1:\1\14\0+\1\0\0007\1\f\1:\1\15\0+\1\0\0007\1\b\1:\1\16\0+\1\0\0007\1\17\1:\1\18\0+\1\0\0007\1\17\1:\1\19\0+\1\0\0007\1\n\1:\1\20\0+\1\0\0007\1\n\1:\1\21\0+\1\0\0007\1\22\1:\1\23\0+\1\0\0007\1\22\1:\1\24\0+\1\0\0007\1\22\1:\1\25\0+\1\0\0007\1\n\1:\1\26\0+\1\0\0007\1\n\1:\1\27\0004\1\28\0007\1\29\0017\1\30\1%\2\31\0004\3\28\0007\3 \0037\3!\3>\3\1\0026\3\3\0%\4\"\0+\5\0\0007\5#\5$\2\5\2>\1\2\1%\1$\0H\1\2\0\1À\bâ–Š\15line_color\f guibg=\tmode\afn\27hi! LualineMode guifg=\17nvim_command\bapi\bvim\6t\6!\ar?\arm\6r\tcyan\ace\acv\aRv\6R\vviolet\aic\5\6S\6s\vorange\ano\bred\6c\vyellow\6V\6v\vpurple\6i\ngreen\6n\1\0\0\tblue\24\0\0\1\0\1\0\2%\0\0\0H\0\2\0\rStartify\19\0\0\1\0\1\0\2%\0\0\0H\0\2\0\bîœ¥\17\0\0\1\0\1\0\2%\0\0\0H\0\2\0\6|>\0\0\2\0\5\0\0064\0\0\0007\0\1\0004\1\2\0007\1\3\0017\1\4\1@\0\2\0\15fileformat\abo\bvim\nupper\vstring\17\0\0\1\0\1\0\2%\0\0\0H\0\2\0\6|@\0\0\2\0\5\0\0064\0\0\0007\0\1\0004\1\2\0007\1\3\0017\1\4\1@\0\2\0\17fileencoding\abo\bvim\nupper\vstrings\0\0\4\1\a\0\17+\0\0\0004\1\0\0007\1\1\0017\1\2\0016\0\1\0\14\0\0\0T\1\t€4\0\0\0007\0\1\0007\0\2\0\16\1\0\0007\0\3\0%\2\4\0004\3\5\0007\3\6\3>\0\4\2H\0\2\0\2À\nupper\vstring\b^%l\tgsub\rfiletype\abo\bvimÛ\3\0\0\6\1%\0J3\0\1\0+\1\0\0007\1\0\1:\1\2\0+\1\0\0007\1\3\1:\1\4\0+\1\0\0007\1\5\1:\1\6\0+\1\0\0007\1\0\1:\1\a\0+\1\0\0007\1\b\1:\1\t\0+\1\0\0007\1\n\1:\1\v\0+\1\0\0007\1\f\1:\1\r\0+\1\0\0007\1\f\1:\1\14\0+\1\0\0007\1\f\1:\1\15\0+\1\0\0007\1\b\1:\1\16\0+\1\0\0007\1\17\1:\1\18\0+\1\0\0007\1\17\1:\1\19\0+\1\0\0007\1\n\1:\1\20\0+\1\0\0007\1\n\1:\1\21\0+\1\0\0007\1\22\1:\1\23\0+\1\0\0007\1\22\1:\1\24\0+\1\0\0007\1\22\1:\1\25\0+\1\0\0007\1\n\1:\1\26\0+\1\0\0007\1\n\1:\1\27\0004\1\28\0007\1\29\0017\1\30\1%\2\31\0004\3\28\0007\3 \0037\3!\3>\3\1\0026\3\3\0%\4\"\0+\5\0\0007\5#\5$\2\5\2>\1\2\1%\1$\0H\1\2\0\1À\bâ–Š\15line_color\f guibg=\tmode\afn\27hi! LualineMode guifg=\17nvim_command\bapi\bvim\6t\6!\ar?\arm\6r\tcyan\ace\acv\aRv\6R\vviolet\aic\5\6S\6s\vorange\ano\bred\6c\vyellow\6V\6v\vpurple\6i\ngreen\6n\1\0\0\tblueŽ\15\1\0\f\0j\0Õ\0014\0\0\0%\1\1\0>\0\2\0023\1\2\0003\2\3\0003\3\5\0001\4\4\0:\4\6\0031\4\a\0:\4\b\0031\4\t\0:\4\n\0031\4\v\0:\4\f\0033\4\26\0003\5\r\0003\6\20\0003\a\18\0003\b\15\0007\t\14\1:\t\14\b7\t\16\1:\t\17\b:\b\19\a:\a\21\0063\a\23\0003\b\22\0007\t\14\1:\t\14\b7\t\17\1:\t\17\b:\b\19\a:\a\24\6:\6\25\5:\5\27\0043\5\28\0002\6\0\0:\6\29\0052\6\0\0:\6\30\0052\6\0\0:\6\31\0052\6\0\0:\6 \0052\6\0\0:\6!\0052\6\0\0:\6\"\5:\5#\0043\5$\0002\6\0\0:\6\29\0052\6\0\0:\6%\0052\6\0\0:\6\31\0052\6\0\0:\6 \0052\6\0\0:\6!\0052\6\0\0:\6\"\5:\5&\0043\5'\0:\5(\0041\5)\0001\6*\0\16\a\5\0003\b,\0001\t+\0;\t\1\b3\t-\0:\t.\b>\a\2\1\16\a\5\0003\b1\0001\t/\0;\t\1\b3\t0\0:\t.\b7\t\f\3:\t2\b>\a\2\1\16\a\5\0003\b3\0007\t\n\3:\t2\b1\t4\0;\t\1\b3\t5\0:\t.\b3\t7\0007\n6\1:\n\14\t:\t8\b>\a\2\1\16\a\5\0003\b9\0007\t\n\3:\t2\b3\t:\0:\t.\b>\a\2\1\16\a\5\0003\b;\0003\t<\0:\t=\b3\t@\0003\n?\0007\v>\1:\v\14\n:\nA\t3\nC\0007\vB\1:\v\14\n:\nD\t3\nF\0007\vE\1:\v\14\n:\nG\t:\tH\b7\t\n\3:\t2\b3\tI\0:\t.\b>\a\2\1\16\a\5\0003\bJ\0007\t\n\3:\t2\b1\tK\0;\t\1\b3\tL\0007\n6\1:\n\14\t:\t8\b>\a\2\1\16\a\5\0003\bM\0003\tN\0:\tO\b3\tP\0:\t=\b3\tR\0003\nQ\0007\vE\1:\v\14\n:\nS\t3\nT\0007\vB\1:\v\14\n:\nU\t:\tV\b3\tW\0:\t.\b>\a\2\1\16\a\6\0003\bY\0001\tX\0;\t\1\b7\t\6\3:\t2\b3\tZ\0:\t.\b>\a\2\1\16\a\6\0003\b[\0007\t\6\3:\t2\b1\t\\\0;\t\1\b3\t]\0007\n6\1:\n\14\t:\t8\b3\t^\0:\t.\b>\a\2\1\16\a\6\0003\b_\0007\t\6\3:\t2\b>\a\2\1\16\a\6\0003\ba\0001\t`\0;\t\1\b7\t\6\3:\t2\b3\tb\0:\t.\b>\a\2\1\16\a\6\0003\bd\0001\tc\0;\t\1\b7\t\6\3:\t2\b3\te\0:\t.\b>\a\2\1\16\a\6\0003\bg\0001\tf\0;\t\1\b3\th\0:\t.\b>\a\2\0017\ai\0\16\b\4\0>\a\2\0010\0\0€G\0\1\0\nsetup\1\0\1\nright\3\0\1\0\1\ncolor\16LualineMode\0\1\0\2\tleft\3\0\nright\3\1\1\0\0\0\1\0\2\tleft\3\0\nright\3\1\1\0\0\0\1\2\0\0\rlocation\1\0\1\tleft\3\1\1\0\0\0\1\0\0\1\0\1\nright\3\0\1\0\0\0\1\0\1\tleft\3\0\22diagnostics_color\15color_warn\1\0\0\16color_error\1\0\0\1\0\0\1\0\2\twarn\tï”© \nerror\tï™™ \fsources\1\2\0\0\rnvim_lsp\1\2\1\0\16diagnostics\21update_in_insert\2\1\0\0\0\1\0\0\1\0\2\tleft\3\1\nright\3\0\15diff_color\fremoved\1\0\0\bred\rmodified\1\0\0\vyellow\nadded\1\0\0\1\0\0\ngreen\fsymbols\1\0\3\nadded\tï‘— \rmodified\tï‘™ \fremoved\tï‘˜ \1\2\0\0\tdiff\1\0\1\tleft\3\0\1\2\1\0\vbranch\ticon\5\ncolor\1\0\0\tblue\1\0\2\tleft\3\0\nright\3\0\0\1\0\0\tcond\1\0\0\1\0\2\tleft\3\0\nright\3\0\0\fpadding\1\0\2\tleft\3\0\nright\3\1\1\0\1\ncolor\16LualineMode\0\0\0\15extensions\1\2\0\0\14nvim-tree\22inactive_sections\14lualine_v\1\0\0\rsections\14lualine_x\14lualine_c\14lualine_z\14lualine_y\14lualine_b\14lualine_a\1\0\0\foptions\1\0\0\ntheme\rinactive\1\0\0\1\0\0\vnormal\1\0\0\6c\1\0\0\abg\15line_color\1\0\0\afg\1\0\2\23section_separators\5\25component_separators\5\16if_startify\0\24check_git_workspace\0\18hide_in_width\0\21buffer_not_empty\1\0\0\0\1\0\2\bcpp\bC++\acs\aC#\1\0\f\tblue\f#5d8ac2\nblack\f#2b2e36\15light_blue\f#8fc6e3\tgrey\f#3B4048\ngreen\f#98C379\abg\f#2E3440\15blue_green\f#4EC9B0\vyellow\f#d4d198\15line_color\f#353c4a\afg\f#E5E9F0\bred\f#d94848\vpurple\f#c487b9\flualine\frequire\0" },
    loaded = true,
    path = "/home/morde/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/home/morde/.local/share/nvim/site/pack/packer/start/lush.nvim"
  },
  neorg = {
    config = { '\27LJ\1\2ã\3\0\2\a\0\r\0\0247\2\0\1%\3\1\0003\4\b\0002\5\a\0003\6\2\0;\6\1\0053\6\3\0;\6\2\0053\6\4\0;\6\3\0053\6\5\0;\6\4\0053\6\6\0;\6\5\0053\6\a\0;\6\6\5:\5\t\0042\5\3\0003\6\n\0;\6\1\5:\5\v\0043\5\f\0>\2\4\1G\0\1\0\1\0\2\fnoremap\2\vsilent\2\6i\1\3\0\0\n<C-l>,core.integrations.telescope.insert_link\6n\1\0\0\1\3\0\0\r<CR><CR>"core.norg.esupports.goto_link\1\3\0\0\aZZ\30core.norg.dirman.new.note\1\3\0\0\14<C-Space>-core.norg.qol.todo_items.todo.task_cycle\1\3\0\0\bgtp/core.norg.qol.todo_items.todo.task_pending\1\3\0\0\bgtu.core.norg.qol.todo_items.todo.task_undone\1\3\0\0\bgtd,core.norg.qol.todo_items.todo.task_done\tnorg\22map_event_to_modeþ\3\1\0\6\0\29\0(4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\23\0003\2\3\0002\3\0\0:\3\4\0023\3\6\0003\4\5\0:\4\a\3:\3\b\0022\3\0\0:\3\t\0023\3\r\0003\4\v\0003\5\n\0:\5\f\4:\4\a\3:\3\14\0023\3\16\0003\4\15\0:\4\a\3:\3\17\0023\3\21\0003\4\18\0003\5\19\0:\5\20\4:\4\a\3:\3\22\2:\2\24\1>\0\2\0014\0\0\0%\1\25\0>\0\2\0027\1\26\0%\2\27\0001\3\28\0>\1\3\1G\0\1\0\0)core.keybinds.events.enable_keybinds\ron_event\20neorg.callbacks\tload\1\0\0\18core.gtd.base\1\0\0\fexclude\1\2\0\0\25file_to_exclude.norg\1\0\1\14workspace\bgtd\25core.norg.completion\1\0\0\1\0\1\vengine\rnvim-cmp\21core.norg.dirman\1\0\0\15workspaces\1\0\0\1\0\2\bgtd\n~/gtd\tmain\f~/neorg\24core.norg.concealer\18core.keybinds\vconfig\1\0\0\1\0\1\21default_keybinds\1\18core.defaults\1\0\0\nsetup\nneorg\frequire\0' },
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
    after = { "cmp-nvim-lsp", "cmp_luasnip", "LuaSnip", "cmp-path", "cmp-calc" },
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
    config = { "\27LJ\1\2¼\1\0\0\3\0\t\0\0214\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\0014\0\0\0%\1\3\0>\0\2\0027\0\2\0003\1\5\0003\2\4\0:\2\6\1>\0\2\0024\1\0\0%\2\a\0>\1\2\0027\1\b\0017\1\2\1\16\2\0\0>\1\2\1G\0\1\0\16sumneko_lua\14lspconfig\flibrary\1\0\0\1\0\3\fplugins\1\ntypes\2\15vimruntime\2\flua-dev\nsetup\15lspmanager\frequire\0" },
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
try_loadstring("\27LJ\1\2é\1\0\2\4\1\a\0\18+\2\0\0007\3\0\0016\2\3\2:\2\0\0013\2\2\0007\3\3\0007\3\4\0036\2\3\2:\2\1\0013\2\6\0007\3\3\0007\3\4\0036\2\3\2\14\0\2\0T\3\1€'\2\0\0:\2\5\1H\1\2\0\1À\1\0\3\tpath\3\1\rnvim_lsp\3\0\vbuffer\3\1\bdup\tname\vsource\1\0\6\fluasnip\14(Snippet)\nneorg\f(Neorg)\rnvim_lsp\n(LSP)\vbuffer\r(Buffer)\tcalc\17(Calculator)\tpath\v(Path)\tmenu\tkindC\0\1\3\0\4\0\a4\1\0\0%\2\1\0>\1\2\0027\1\2\0017\2\3\0>\1\2\1G\0\1\0\tbody\15lsp_expand\fluasnip\frequireŽ\a\1\0\b\0&\0?4\0\0\0%\1\1\0>\0\2\0023\1\2\0007\2\3\0003\3\5\0003\4\4\0:\4\6\0033\4\b\0001\5\a\0:\5\t\4:\4\n\0033\4\r\0007\5\v\0007\5\f\5'\6üÿ>\5\2\2:\5\14\0047\5\v\0007\5\f\5'\6\4\0>\5\2\2:\5\15\0047\5\v\0007\5\16\5>\5\1\2:\5\17\0047\5\v\0007\5\18\5>\5\1\2:\5\19\0047\5\v\0007\5\20\0053\6\23\0007\a\21\0007\a\22\a:\a\24\6>\5\2\2:\5\25\4:\4\v\0033\4\27\0001\5\26\0:\5\28\4:\4\29\0032\4\b\0003\5\30\0;\5\1\0043\5\31\0;\5\2\0043\5 \0;\5\3\0043\5!\0;\5\4\0043\5\"\0;\5\5\0043\5#\0;\5\6\0043\5$\0;\5\a\4:\4%\3>\2\2\0010\0\0€G\0\1\0\fsources\1\0\1\tname\tcalc\1\0\1\tname\nneorg\1\0\1\tname\tpath\1\0\1\tname\ftabnine\1\0\1\tname\fluasnip\1\0\1\tname\vbuffer\1\0\1\tname\rnvim_lsp\fsnippet\vexpand\1\0\0\0\t<CR>\rbehavior\1\0\1\vselect\2\fReplace\20ConfirmBehavior\fconfirm\n<C-e>\nclose\14<C-Space>\rcomplete\n<C-f>\n<C-d>\1\0\0\16scroll_docs\fmapping\15formatting\vformat\1\0\0\0\15completion\1\0\0\1\0\1\16completeopt\21menuone,noselect\nsetup\1\0\25\tText\bï¾\vMethod\bÆ’ \rOperator\bïš”\14Interface\tï°® \nColor\tîˆ« \vModule\tï£– \nEvent\bïƒ§\rFunction\tï‚š \16Constructor\tîˆ \15EnumMember\tï… \rProperty\tî˜¤ \rConstant\tîˆ¬ \vStruct\tïƒŠ \rVariable\bï”ª\fSnippet\tï¬Œ \vFolder\tï„• \tUnit\bï¥¬\nValue\tï¢Ÿ \18TypeParameter\5\tFile\bïœ˜\nClass\tîƒ \nField\bï° \tEnum\täº† \fKeyword\tï … \14Reference\bïœ†\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: barbar.nvim
time([[Config for barbar.nvim]], true)
try_loadstring("\27LJ\1\2¿\1\0\0\5\0\n\0\0174\0\0\0007\0\1\0007\0\2\0%\1\3\0%\2\4\0%\3\5\0003\4\6\0>\0\5\0014\0\0\0007\0\1\0007\0\2\0%\1\3\0%\2\a\0%\3\b\0003\4\t\0>\0\5\1G\0\1\0\1\0\2\vsilent\2\fnoremap\2\24:BufferPrevious<CR>\f<S-TAB>\1\0\2\vsilent\2\fnoremap\2\20:BufferNext<CR>\n<TAB>\6n\20nvim_set_keymap\bapi\bvim\0", "config", "barbar.nvim")
time([[Config for barbar.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\1\0026\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\1\2\\\0\0\3\0\5\1\0154\0\0\0007\0\1\0007\0\2\0004\1\0\0007\1\1\0017\1\3\1%\2\4\0>\1\2\0=\0\0\2\t\0\0\0T\0\2€)\0\1\0T\1\1€)\0\2\0H\0\2\0\b%:t\vexpand\nempty\afn\bvim\2G\0\0\2\0\3\0\f4\0\0\0007\0\1\0007\0\2\0'\1\0\0>\0\2\2'\1P\0\0\1\0\0T\0\2€)\0\1\0T\1\1€)\0\2\0H\0\2\0\rwinwidth\afn\bvim–\1\0\0\5\0\a\0\0274\0\0\0007\0\1\0007\0\2\0%\1\3\0>\0\2\0024\1\0\0007\1\1\0017\1\4\1%\2\5\0\16\3\0\0%\4\6\0$\3\4\3>\1\3\2\r\2\1\0T\2\v€\19\2\1\0'\3\0\0\1\3\2\0T\2\4€\19\2\1\0\19\3\0\0\0\2\3\0T\2\2€)\2\1\0T\3\1€)\2\2\0H\2\2\0\6;\t.git\ffinddir\n%:p:h\vexpand\afn\bvimD\0\0\1\0\4\0\t4\0\0\0007\0\1\0007\0\2\0\6\0\3\0T\0\2€)\0\1\0T\1\1€)\0\2\0H\0\2\0\rstartify\rfiletype\abo\bvimI\0\1\4\1\4\0\b4\1\0\0007\1\1\1+\2\0\0007\2\2\0027\2\3\2\16\3\0\0>\1\3\1G\0\1\0\4À\14lualine_c\rsections\vinsert\ntableI\0\1\4\1\4\0\b4\1\0\0007\1\1\1+\2\0\0007\2\2\0027\2\3\2\16\3\0\0>\1\3\1G\0\1\0\4À\14lualine_x\rsections\vinsert\ntableÛ\3\0\0\6\1%\0J3\0\1\0+\1\0\0007\1\0\1:\1\2\0+\1\0\0007\1\3\1:\1\4\0+\1\0\0007\1\5\1:\1\6\0+\1\0\0007\1\0\1:\1\a\0+\1\0\0007\1\b\1:\1\t\0+\1\0\0007\1\n\1:\1\v\0+\1\0\0007\1\f\1:\1\r\0+\1\0\0007\1\f\1:\1\14\0+\1\0\0007\1\f\1:\1\15\0+\1\0\0007\1\b\1:\1\16\0+\1\0\0007\1\17\1:\1\18\0+\1\0\0007\1\17\1:\1\19\0+\1\0\0007\1\n\1:\1\20\0+\1\0\0007\1\n\1:\1\21\0+\1\0\0007\1\22\1:\1\23\0+\1\0\0007\1\22\1:\1\24\0+\1\0\0007\1\22\1:\1\25\0+\1\0\0007\1\n\1:\1\26\0+\1\0\0007\1\n\1:\1\27\0004\1\28\0007\1\29\0017\1\30\1%\2\31\0004\3\28\0007\3 \0037\3!\3>\3\1\0026\3\3\0%\4\"\0+\5\0\0007\5#\5$\2\5\2>\1\2\1%\1$\0H\1\2\0\1À\bâ–Š\15line_color\f guibg=\tmode\afn\27hi! LualineMode guifg=\17nvim_command\bapi\bvim\6t\6!\ar?\arm\6r\tcyan\ace\acv\aRv\6R\vviolet\aic\5\6S\6s\vorange\ano\bred\6c\vyellow\6V\6v\vpurple\6i\ngreen\6n\1\0\0\tblue\24\0\0\1\0\1\0\2%\0\0\0H\0\2\0\rStartify\19\0\0\1\0\1\0\2%\0\0\0H\0\2\0\bîœ¥\17\0\0\1\0\1\0\2%\0\0\0H\0\2\0\6|>\0\0\2\0\5\0\0064\0\0\0007\0\1\0004\1\2\0007\1\3\0017\1\4\1@\0\2\0\15fileformat\abo\bvim\nupper\vstring\17\0\0\1\0\1\0\2%\0\0\0H\0\2\0\6|@\0\0\2\0\5\0\0064\0\0\0007\0\1\0004\1\2\0007\1\3\0017\1\4\1@\0\2\0\17fileencoding\abo\bvim\nupper\vstrings\0\0\4\1\a\0\17+\0\0\0004\1\0\0007\1\1\0017\1\2\0016\0\1\0\14\0\0\0T\1\t€4\0\0\0007\0\1\0007\0\2\0\16\1\0\0007\0\3\0%\2\4\0004\3\5\0007\3\6\3>\0\4\2H\0\2\0\2À\nupper\vstring\b^%l\tgsub\rfiletype\abo\bvimÛ\3\0\0\6\1%\0J3\0\1\0+\1\0\0007\1\0\1:\1\2\0+\1\0\0007\1\3\1:\1\4\0+\1\0\0007\1\5\1:\1\6\0+\1\0\0007\1\0\1:\1\a\0+\1\0\0007\1\b\1:\1\t\0+\1\0\0007\1\n\1:\1\v\0+\1\0\0007\1\f\1:\1\r\0+\1\0\0007\1\f\1:\1\14\0+\1\0\0007\1\f\1:\1\15\0+\1\0\0007\1\b\1:\1\16\0+\1\0\0007\1\17\1:\1\18\0+\1\0\0007\1\17\1:\1\19\0+\1\0\0007\1\n\1:\1\20\0+\1\0\0007\1\n\1:\1\21\0+\1\0\0007\1\22\1:\1\23\0+\1\0\0007\1\22\1:\1\24\0+\1\0\0007\1\22\1:\1\25\0+\1\0\0007\1\n\1:\1\26\0+\1\0\0007\1\n\1:\1\27\0004\1\28\0007\1\29\0017\1\30\1%\2\31\0004\3\28\0007\3 \0037\3!\3>\3\1\0026\3\3\0%\4\"\0+\5\0\0007\5#\5$\2\5\2>\1\2\1%\1$\0H\1\2\0\1À\bâ–Š\15line_color\f guibg=\tmode\afn\27hi! LualineMode guifg=\17nvim_command\bapi\bvim\6t\6!\ar?\arm\6r\tcyan\ace\acv\aRv\6R\vviolet\aic\5\6S\6s\vorange\ano\bred\6c\vyellow\6V\6v\vpurple\6i\ngreen\6n\1\0\0\tblueŽ\15\1\0\f\0j\0Õ\0014\0\0\0%\1\1\0>\0\2\0023\1\2\0003\2\3\0003\3\5\0001\4\4\0:\4\6\0031\4\a\0:\4\b\0031\4\t\0:\4\n\0031\4\v\0:\4\f\0033\4\26\0003\5\r\0003\6\20\0003\a\18\0003\b\15\0007\t\14\1:\t\14\b7\t\16\1:\t\17\b:\b\19\a:\a\21\0063\a\23\0003\b\22\0007\t\14\1:\t\14\b7\t\17\1:\t\17\b:\b\19\a:\a\24\6:\6\25\5:\5\27\0043\5\28\0002\6\0\0:\6\29\0052\6\0\0:\6\30\0052\6\0\0:\6\31\0052\6\0\0:\6 \0052\6\0\0:\6!\0052\6\0\0:\6\"\5:\5#\0043\5$\0002\6\0\0:\6\29\0052\6\0\0:\6%\0052\6\0\0:\6\31\0052\6\0\0:\6 \0052\6\0\0:\6!\0052\6\0\0:\6\"\5:\5&\0043\5'\0:\5(\0041\5)\0001\6*\0\16\a\5\0003\b,\0001\t+\0;\t\1\b3\t-\0:\t.\b>\a\2\1\16\a\5\0003\b1\0001\t/\0;\t\1\b3\t0\0:\t.\b7\t\f\3:\t2\b>\a\2\1\16\a\5\0003\b3\0007\t\n\3:\t2\b1\t4\0;\t\1\b3\t5\0:\t.\b3\t7\0007\n6\1:\n\14\t:\t8\b>\a\2\1\16\a\5\0003\b9\0007\t\n\3:\t2\b3\t:\0:\t.\b>\a\2\1\16\a\5\0003\b;\0003\t<\0:\t=\b3\t@\0003\n?\0007\v>\1:\v\14\n:\nA\t3\nC\0007\vB\1:\v\14\n:\nD\t3\nF\0007\vE\1:\v\14\n:\nG\t:\tH\b7\t\n\3:\t2\b3\tI\0:\t.\b>\a\2\1\16\a\5\0003\bJ\0007\t\n\3:\t2\b1\tK\0;\t\1\b3\tL\0007\n6\1:\n\14\t:\t8\b>\a\2\1\16\a\5\0003\bM\0003\tN\0:\tO\b3\tP\0:\t=\b3\tR\0003\nQ\0007\vE\1:\v\14\n:\nS\t3\nT\0007\vB\1:\v\14\n:\nU\t:\tV\b3\tW\0:\t.\b>\a\2\1\16\a\6\0003\bY\0001\tX\0;\t\1\b7\t\6\3:\t2\b3\tZ\0:\t.\b>\a\2\1\16\a\6\0003\b[\0007\t\6\3:\t2\b1\t\\\0;\t\1\b3\t]\0007\n6\1:\n\14\t:\t8\b3\t^\0:\t.\b>\a\2\1\16\a\6\0003\b_\0007\t\6\3:\t2\b>\a\2\1\16\a\6\0003\ba\0001\t`\0;\t\1\b7\t\6\3:\t2\b3\tb\0:\t.\b>\a\2\1\16\a\6\0003\bd\0001\tc\0;\t\1\b7\t\6\3:\t2\b3\te\0:\t.\b>\a\2\1\16\a\6\0003\bg\0001\tf\0;\t\1\b3\th\0:\t.\b>\a\2\0017\ai\0\16\b\4\0>\a\2\0010\0\0€G\0\1\0\nsetup\1\0\1\nright\3\0\1\0\1\ncolor\16LualineMode\0\1\0\2\tleft\3\0\nright\3\1\1\0\0\0\1\0\2\tleft\3\0\nright\3\1\1\0\0\0\1\2\0\0\rlocation\1\0\1\tleft\3\1\1\0\0\0\1\0\0\1\0\1\nright\3\0\1\0\0\0\1\0\1\tleft\3\0\22diagnostics_color\15color_warn\1\0\0\16color_error\1\0\0\1\0\0\1\0\2\twarn\tï”© \nerror\tï™™ \fsources\1\2\0\0\rnvim_lsp\1\2\1\0\16diagnostics\21update_in_insert\2\1\0\0\0\1\0\0\1\0\2\tleft\3\1\nright\3\0\15diff_color\fremoved\1\0\0\bred\rmodified\1\0\0\vyellow\nadded\1\0\0\1\0\0\ngreen\fsymbols\1\0\3\nadded\tï‘— \rmodified\tï‘™ \fremoved\tï‘˜ \1\2\0\0\tdiff\1\0\1\tleft\3\0\1\2\1\0\vbranch\ticon\5\ncolor\1\0\0\tblue\1\0\2\tleft\3\0\nright\3\0\0\1\0\0\tcond\1\0\0\1\0\2\tleft\3\0\nright\3\0\0\fpadding\1\0\2\tleft\3\0\nright\3\1\1\0\1\ncolor\16LualineMode\0\0\0\15extensions\1\2\0\0\14nvim-tree\22inactive_sections\14lualine_v\1\0\0\rsections\14lualine_x\14lualine_c\14lualine_z\14lualine_y\14lualine_b\14lualine_a\1\0\0\foptions\1\0\0\ntheme\rinactive\1\0\0\1\0\0\vnormal\1\0\0\6c\1\0\0\abg\15line_color\1\0\0\afg\1\0\2\23section_separators\5\25component_separators\5\16if_startify\0\24check_git_workspace\0\18hide_in_width\0\21buffer_not_empty\1\0\0\0\1\0\2\bcpp\bC++\acs\aC#\1\0\f\tblue\f#5d8ac2\nblack\f#2b2e36\15light_blue\f#8fc6e3\tgrey\f#3B4048\ngreen\f#98C379\abg\f#2E3440\15blue_green\f#4EC9B0\vyellow\f#d4d198\15line_color\f#353c4a\afg\f#E5E9F0\bred\f#d94848\vpurple\f#c487b9\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-lspmanager
time([[Config for nvim-lspmanager]], true)
try_loadstring("\27LJ\1\2¼\1\0\0\3\0\t\0\0214\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\0014\0\0\0%\1\3\0>\0\2\0027\0\2\0003\1\5\0003\2\4\0:\2\6\1>\0\2\0024\1\0\0%\2\a\0>\1\2\0027\1\b\0017\1\2\1\16\2\0\0>\1\2\1G\0\1\0\16sumneko_lua\14lspconfig\flibrary\1\0\0\1\0\3\fplugins\1\ntypes\2\15vimruntime\2\flua-dev\nsetup\15lspmanager\frequire\0", "config", "nvim-lspmanager")
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
