" 不兼容模式
set nocompatible
"设置leader键
let mapleader=","
" 启用鼠标
set mouse+=a

" 递归搜索文件路径
set path+=**
set encoding=utf-8
set tabstop=4
set softtabstop=4
set shiftwidth=4
" 表示Tab自动转换成空格
set expandtab 

" 表示换行后自动缩进
set autoindent
" 智能对齐
set smartindent

" 设置折叠方式
set foldmethod=indent
set nofoldenable
set foldlevel=2

" 当文件在外部被修改时，自动重新读取
" set autoread

" 显示行号、 显示当前行行号，其它行的行号都是以当前行为基准从 1 开始增加（即相对行号）
set number relativenumber
" 允许自动换行
set wrap
set linebreak

" 开启真彩色
set termguicolors

filetype plugin indent on

" 搜索时忽略大小写
set ignorecase

" 配置coq自动完成插件，自启动
let g:coq_settings = { 'auto_start': v:true }

" vim操作作用到系统clipboard
set clipboard+=unnamedplus 

" vimspector 图形调试器
" Enable the default set of mappings:
let g:vimspector_enable_mappings='HUMAN'
let g:vimspector_install_gadgets = [ 'debugpy', 'delve', 'CodeLLDB' ]

" init autocmd
autocmd!
" 开始编辑vim文件时自动打开语法高亮 
autocmd BufReadPre *.vim syntax on
autocmd BufReadPre *.xml syntax on
" 自动将当前打开文件所在目录作为工作目录
" autocmd BufEnter * silent! lcd %:p:h  

" 保存代码时自动导入包
" autocmd BufWritePre *.go lua goimports(1000)

"-------------Work Directory Rooter -----------------
" let g:rooter_targets = '/,*'
let g:rooter_patterns = ['.git', 'Makefile', '*.sln', 'build/env.sh']

"------------- Plug and Maps -----------------
"
runtime ./plug.vim
runtime ./maps.vim

"-------------Color scheme-----------------
" 启用语法高亮
syntax on
" 设置配色方案
colorscheme dracula "monokai_soda  "dracula onedark  monokai_pro gruvbox
" 使用黑色主题-light dark 
set bg=dark 

"------------- Indent -----------------
" 设置indent样式为¦
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" nvim-cursorline 配置高亮当前行出现的延迟时间
" let g:cursorline_timeout=0


"------------- Blame -----------------
let g:gitblame_message_template = '<date> • <author> • <summary>'
let g:gitblame_date_format = '%r'

"------------- Python3 -----------------
let g:python3_host_prog = '/Users/xiaoxiwang/opt/miniconda3/bin/python3'
