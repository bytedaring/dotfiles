local opt = vim.opt
local g = vim.g
local o = vim.o
local wo = vim.wo

opt.shada = "'50,<400,s100,:200"
opt.lazyredraw = true
-- 不兼容模式
vim.cmd [[set nocompatible ]]
--设置leader键
-- g.mapleader=","
-- 启用鼠标
o.mouse = 'a'

-- 0: 不显示 1: 启动显示转态行 2: 总是显示状态行 3: 总是显示且显示最后一个windows的状态行
o.laststatus = 3

vim.cmd [[set autowrite]]
opt.list = true

-- 递归搜索文件路径
-- opt.path+="**"

-- 设置默认编码格式
opt.encoding = "utf-8"
-- 缩进配置为2空格
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
-- 表示Tab自动转换成空格
opt.expandtab = true

-- 表示换行后自动缩进
opt.autoindent = true
-- 智能对齐
opt.smartindent = true

-- 禁用netrw等默认内置插件
g.loaded_2html_plugin = 1
g.loaded_gzip = 1
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.loaded_netrwSettings = 1
g.loaded_netrwFileHandlers = 1
g.loaded_tar = 1
g.loaded_tarPlugin = 1
g.loaded_zip = 1
g.loaded_zipPlugin = 1
g.loaded_spellfile_plugin = 1
g.loaded_matchparen = 1
g.loaded_matchit = 1
g.loaded_logiPat = 1
g.loaded_rrhelper = 1
-- g.loaded_remote_plugins=1
g.loaded_tutor_mode_plugin = 1
g.vimball = 1
g.vimballPlugin = 1
g.getscriptPlugin = 1
g.getscript = 1
g.loaded_shada_plugin = 1
-- 禁用filetype
--g.did_load_filetypes = 0

-- 设置折叠方式
opt.foldmethod = "indent"
vim.cmd [[ set nofoldenable ]]
opt.foldlevel = 2

-- indentLine
g.indentLine_char = '¦'

-- 当文件在外部被修改时，自动重新读取
-- set autoread

-- 显示行号、 显示当前行行号，其它行的行号都是以当前行为基准从 1 开始增加（即相对行号）
wo.number = true
opt.relativenumber = true
-- 允许自动换行
opt.wrap = true
opt.linebreak = true

-- 开启真彩色
opt.termguicolors = true

-- 搜索时忽略大小写
o.ignorecase = true

-- vim操作作用到系统clipboard
vim.cmd [[ set clipboard+=unnamedplus ]]

-- vimspector 图形调试器
g.vimspector_enable_mappings = 'HUMAN'
vim.cmd [[ let g:vimspector_install_gadgets = [ 'debugpy', 'delve', 'CodeLLDB' ] ]]

---------------Color scheme-----------------
-- 启用语法高亮、拼写检查
--syntax on
vim.cmd [[
  augroup syntax
  autocmd!
  autocmd FileType awk syntax on
  " autocmd BufRead,BufNewFile * setlocal spell spelllang=en_us
  " autocmd FileType proto syntax on
  augroup end
]]

-- 使用黑色主题 设置配色方案
opt.bg = "dark"
-- vim.cmd [[ colorscheme dracula ]] --monokai_soda  "dracula onedark  monokai_pro gruvbox

--------------- Blame -----------------
g.gitblame_message_template = '<date> • <author> • <summary>'
g.gitblame_date_format = '%r'
g.gitblame_ignored_filetypes = { 'NvimTree', 'packer', 'Trouble' }

--------------- Python3 -----------------
g.python3_host_skip_check = 1
g.python3_host_prog = '/Users/xiaoxiwang/opt/miniconda3/bin/python3'


--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
g.mapleader = ' '
g.maplocalleader = ' '

-- Required for nvim-compe
opt.completeopt = "menu,menuone,noselect"
