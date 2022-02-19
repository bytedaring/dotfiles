local opt = vim.opt
local g = vim.g
local o = vim.o
local wo = vim.wo

-- 不兼容模式
vim.cmd [[set nocompatible ]]
--设置leader键
-- g.mapleader=","
-- 启用鼠标
o.mouse = 'a'

wo.list = true

-- 递归搜索文件路径
-- opt.path+="**"
opt.encoding="utf-8"
opt.tabstop=4
opt.softtabstop=4
opt.shiftwidth=4
-- 表示Tab自动转换成空格
opt.expandtab=true

-- 表示换行后自动缩进
opt.autoindent=true
-- 智能对齐
opt.smartindent=true

-- 设置折叠方式
opt.foldmethod="indent"
vim.cmd [[ set nofoldenable ]]
opt.foldlevel=2

-- 当文件在外部被修改时，自动重新读取
-- set autoread

-- 显示行号、 显示当前行行号，其它行的行号都是以当前行为基准从 1 开始增加（即相对行号）
wo.number=true
opt.relativenumber=true
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
-- Enable the default set of mappings:
g.vimspector_enable_mappings='HUMAN'
vim.cmd [[ let g:vimspector_install_gadgets = [ 'debugpy', 'delve', 'CodeLLDB' ] ]]

-- init autocmd
-- 自动将当前打开文件所在目录作为工作目录
-- autocmd BufEnter * silent! lcd %:p:h
-- 保存代码时自动导入包
-- autocmd BufWritePre *.go lua goimports(1000)
-- 开始编辑vim文件时自动打开语法高亮
vim.cmd [[
    autocmd!
    autocmd BufReadPre *.vim syntax on
    autocmd BufReadPre *.xml syntax on
]]

---------------Work Directory Rooter -----------------
-- let g:rooter_targets = '/,*'
vim.cmd [[ let g:rooter_patterns = ['.git', 'Makefile', '*.sln', 'build/env.sh'] ]]

--------------- Plug and Maps -----------------

---------------Color scheme-----------------
-- 启用语法高亮
-- syntax on
-- 使用黑色主题 设置配色方案
opt.bg="dark"
vim.cmd [[ colorscheme dracula ]] --monokai_soda  "dracula onedark  monokai_pro gruvbox


--------------- Blame -----------------
g.gitblame_message_template = '<date> • <author> • <summary>'
g.gitblame_date_format = '%r'

--------------- Python3 -----------------
g.python3_host_prog = '/Users/xiaoxiwang/opt/miniconda3/bin/python3'

--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
g.mapleader = ' '
g.maplocalleader = ' '

-- Required for nvim-compe
opt.completeopt="menu,menuone,noselect"
