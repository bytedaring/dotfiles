let g:plug_home = stdpath('data') . '/plugged'

call plug#begin()

" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'
" Make sure you use single quotes

" 自动根目录识别
Plug 'airblade/vim-rooter'

" 文件浏览器 File Explorer
" The NERDTree is a file system explorer for the Vim editor. 
" Plug 'preservim/nerdtree'
" Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
" defx 文件管理配上图标
" Plug 'kristijanhusak/defx-icons'
" 文件上标上git状态
" Plug 'kristijanhusak/defx-git'
Plug 'kyazdani42/nvim-tree.lua'

" indentation guides to all lines
Plug 'lukas-reineke/indent-blankline.nvim'

" fzf
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'

" fuzzy finder over lists
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" telescope 扩展插件
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
" Plug 'nvim-telescope/telescope-fzy-native.nvim'

" 状态栏美化
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-lualine/lualine.nvim'

" 文档大纲-缩略图
" Plug 'majutsushi/tagbar'
Plug 'simrat39/symbols-outline.nvim'

" vim开屏页美化插件，可以记录最近编辑的文件，使用对应数字编号就可以快速打开文件，使用起来非常方便。
Plug 'mhinz/vim-startify'
" Plug 'goolord/alpha-nvim'

" deoplete 代码自动补全
"Plug 'Shougo/deoplete.nvim'
" Python deoplete
"Plug 'deoplete-plugins/deoplete-jedi'
"let g:deoplete#enable_at_startup = 1

" Insert or delete brackets, parens, quotes in pair.
Plug 'jiangmiao/auto-pairs'
" Plug 'glepnir/dashboard-nvim'

" 配色方案
"Plug 'morhetz/gruvbox'
" Plug 'tanvirtin/monokai.nvim'
" Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
" Plug 'joshdick/onedark.vim'
Plug 'Mofiqul/dracula.nvim',  { 'as': 'dracula' }

" 插件提供基于 tree-sitter 的多个基础功能，它可以让你在 nvim 中高效的实现 代码高亮，增量选择 等功能。
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  

" A lua fork of vim-devicons. This plugin provides the same icons as well as colors for each icon.
Plug 'kyazdani42/nvim-web-devicons'

" Git
Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-rhubarb'
" Git 文件git状态、Blame text
Plug 'nvim-lua/plenary.nvim'
" Plug 'lewis6991/gitsigns.nvim'
Plug 'f-person/git-blame.nvim'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

" 增强代码自动完成
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
" 9000+ Snippets
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}

" 轻量级UI优化内置lsp功能
" Plug 'glepnir/lspsaga.nvim'

" 用于VIM的多语言图形调试器
Plug 'puremourning/vimspector'

" 高性能的十六进制文本颜色高亮
Plug 'norcalli/nvim-colorizer.lua'

" 注释插件
Plug 'numToStr/Comment.nvim'

" 终端控制
Plug 'akinsho/toggleterm.nvim'

" 高亮游标下文本
" Plug 'RRethy/vim-illuminate'
Plug 'yamatsum/nvim-cursorline'

" 标签栏 bufferline[暂时禁用-不好用]
" Plug 'akinsho/bufferline.nvim'

" EasyMotion
Plug 'phaazon/hop.nvim'

" Quick fix
Plug 'folke/trouble.nvim'

" Surround 环绕的标签修改插件
Plug 'tpope/vim-surround'
" `.` 重复上次操作
Plug 'tpope/vim-repeat'

"Markdown预览
Plug 'iamcco/markdown-preview.nvim' 


call plug#end()
