local opt = vim.opt
local g = vim.g
local o = vim.o
local wo = vim.wo

opt.lazyredraw = true
-- 不兼容模式
vim.cmd [[set nocompatible ]]
--设置leader键
-- g.mapleader=","
-- 启用鼠标
o.mouse = 'a'

vim.cmd [[set autowrite]]
opt.list = true

-- 递归搜索文件路径
-- opt.path+="**"
opt.encoding="utf-8"
opt.tabstop=2
opt.softtabstop=2
opt.shiftwidth=2
-- 表示Tab自动转换成空格
opt.expandtab=true

-- 表示换行后自动缩进
opt.autoindent=true
-- 智能对齐
opt.smartindent=true

-- 禁用netrw插件
g.loaded_netrw=1
g.loaded_netrwPlugin=1

-- 设置折叠方式
opt.foldmethod="indent"
vim.cmd [[ set nofoldenable ]]
opt.foldlevel=2

-- indentLine
g.indentLine_char = '¦'

-- 当文件在外部被修改时，自动重新读取
-- set autoread

-- 显示行号、 显示当前行行号，其它行的行号都是以当前行为基准从 1 开始增加（即相对行号）
wo.number=true
opt.relativenumber=false
-- 允许自动换行
opt.wrap=true
opt.linebreak=true

-- 开启真彩色
o.termguicolors = true

-- 搜索时忽略大小写
o.ignorecase=true

-- vim操作作用到系统clipboard
vim.cmd [[ set clipboard+=unnamedplus ]]

-- vimspector 图形调试器
g.vimspector_enable_mappings='HUMAN'
vim.cmd [[ let g:vimspector_install_gadgets = [ 'debugpy', 'delve', 'CodeLLDB' ] ]]

---------------Color scheme-----------------
-- 启用语法高亮
-- syntax on
-- 使用黑色主题 设置配色方案
opt.bg="dark"
-- vim.cmd [[ colorscheme dracula ]] --monokai_soda  "dracula onedark  monokai_pro gruvbox

--------------- Blame -----------------
g.gitblame_message_template = '<date> • <author> • <summary>'
g.gitblame_date_format = '%r'

--------------- Python3 -----------------
g.python_host_prog = '/Users/xiaoxiwang/opt/miniconda3/bin/python'
g.python_host_skip_check=1
g.python3_host_skip_check=1
g.python3_host_prog = '/Users/xiaoxiwang/opt/miniconda3/bin/python3'


--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
g.mapleader = ' '
g.maplocalleader = ' '

-- Required for nvim-compe
opt.completeopt="menu,menuone,noselect"

--
-- Description: Keymaps
--
local map = vim.api.nvim_set_keymap

map('n', '<F7>', [[<Cmd>:SymbolsOutline<CR>]], {noremap = true, silent = true })

-- Find files using Telescope command-line sugar.
map('n', 'ff', [[<Cmd>Telescope find_files<CR>]], { noremap = true, silent = true })
map('n', 'fg', [[<Cmd>Telescope live_grep<CR>]], { noremap = true, silent = true })
map('n', 'fb', [[<Cmd>Telescope buffers<CR>]], { noremap = true, silent = true })
map('n', 'fh', [[<Cmd>Telescope help_tags<CR>]], { noremap = true, silent = true })

-- nvim-tree NvimTreeFindFileToggle
-- nnoremap fi :<C-u>:NvimTreeFindFileToggle<CR>
map('n', 'fi', [[<Cmd>NvimTreeToggle<CR>]], { noremap = true, silent = true })

-- vimspector
map('n','<leader>dd', [[<Cmd>:call vimspector#Launch()<CR>]], { noremap = true, silent = true })
map('n','<leader>dx', [[<Cmd>:VimspectorReset<CR>]], { noremap = true, silent = true })
map('n','<leader>de', [[<Cmd>:VimspectorEval<CR>]],  { noremap = true, silent = true })
map('n','<leader>dw', [[<Cmd>:VimspectorWatch<CR>]], { noremap = true, silent = true })
map('n','<leader>do', [[<Cmd>:VimspectorShowOutput<CR>]], { noremap = true, silent = true })


-- Trouble
map('n','<leader>xx', [[<Cmd>TroubleToggle<CR>]], { noremap = true, silent = true })
map('n','<leader>xw', [[<Cmd>TroubleToggle workspace_diagnostics<CR>]], { noremap = true, silent = true })
map('n','<leader>xd', [[<Cmd>TroubleToggle document_diagnostics<CR>]], { noremap = true, silent = true })
map('n','<leader>xq', [[<Cmd>TroubleToggle quickfix<CR>]], { noremap = true, silent = true })
map('n','<leader>xl', [[<Cmd>TroubleToggle loclist<CR>]], { noremap = true, silent = true })

-- ToggleTerm
map('n','<C-\\>', [[<Cmd>ToggleTerm<CR>]], {noremap = true, silent = true })

--------------------- autocmd for go.nvim --------------------
vim.cmd [[
  autocmd!
  autocmd FileType go nmap <F9> :GoBreakToggle<CR>
  autocmd FileType go nmap <leader>dd :GoDebug<CR>
  autocmd FileType go nmap <leader>dx :GoDebug -s<CR>
  autocmd FileType go nmap <leader>dt :GoDebug -t<CR>
  autocmd FileType go nmap <leader>t :Ultest<CR>
]]

