" 不导入空白的macos.vim 配置文件，以提高启动速度
" if has("unix")
"     let s:uname = system("uname -s")
"     " Do mac stuff
"     if s:uname == "Darwin\n"
"         runtime ./macos.vim
"     endif
" endif

" 导入lua 配置
" lua require('plugins')

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

" 当文件在外部被修改时，自动重新读取
" set autoread

" 显示行号、 显示当前行行号，其它行的行号都是以当前行为基准从 1 开始增加（即相对行号）
set number relativenumber
" 禁止自动换行
set nowrap

" 开启真彩色
set termguicolors

filetype plugin indent on

" vim记住的历史操作的数量，默认的是20
set history=40 
" 搜索时忽略大小写
set ignorecase


" 防止图标和文件名重叠
let g:defx_icons_column_length = 2


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
autocmd BufEnter * silent! lcd %:p:h

" 保存代码时自动导入包
" autocmd BufWritePre *.go lua goimports(1000)


runtime ./plug.vim
runtime ./maps.vim

" 启用语法高亮
syntax on

" 设置配色方案
colorscheme monokai_soda " monokai_pro gruvbox
" 使用黑色主题-light dark 
set bg=dark 

" 设置indent样式为¦
"let g:indentLine_char = '¦'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" nvim-cursorline 配置高亮当前行出现的延迟时间
let g:cursorline_timeout=0
