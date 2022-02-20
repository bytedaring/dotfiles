-- -----------------------------------------------------------------------------
--       _                                                       _
-- __  _(_)_      ____ _ _ __   __ _       _ __   ___  _____   _(_)_ __ ___
-- \ \/ / \ \ /\ / / _` | '_ \ / _` |_____| '_ \ / _ \/ _ \ \ / / | '_ ` _ \
--  >  <| |\ V  V / (_| | | | | (_| |_____| | | |  __/ (_) \ V /| | | | | | |
-- /_/\_\_| \_/\_/ \__,_|_| |_|\__, |     |_| |_|\___|\___/ \_/ |_|_| |_| |_|
--                            |___/                     _                        _
--
-- -----------------------------------------------------------------------------

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- vim.cmd [[packadd packer.nvim]]
-- vim.cmd [[
--   augroup Packer
--     autocmd!
--     autocmd BufWritePost init.lua PackerCompile
--   augroup end
-- ]]

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    --  自动根目录识别
    use 'airblade/vim-rooter'

    --  文件浏览器 File Explorer
    --  The NERDTree is a file system explorer for the Vim editor
    --  Plug 'preservim/nerdtree'
    --  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
    --  defx 文件管理配上图标
    --  Plug 'kristijanhusak/defx-icons'
    --  文件上标上git状态
    --  Plug 'kristijanhusak/defx-git'
    use 'kyazdani42/nvim-tree.lua'

    --  fzf
    --  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    --  Plug 'junegunn/fzf.vim'
    --  fuzzy finder over lists
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    --  telescope 扩展插件
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    --  Plug 'nvim-telescope/telescope-fzy-native.nvim'
    --  状态栏美化
    -- Plug 'vim-airline/vim-airline'
    -- Plug 'vim-airline/vim-airline-themes'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function()
            require('lualine').setup()
        end
    }

    --  文档大纲-缩略图
    --  Plug 'majutsushi/tagbar'
    use 'simrat39/symbols-outline.nvim'

    --  vim开屏页美化插件，可以记录最近编辑的文件，使用对应数字编号就可以快速打开文件，使用起来非常方便。
    use 'mhinz/vim-startify'
    --  Plug 'goolord/alpha-nvim'

    --  deoplete 代码自动补全
    -- Plug 'Shougo/deoplete.nvim'
    --  Python deoplete
    -- Plug 'deoplete-plugins/deoplete-jedi'
    -- let g:deoplete#enable_at_startup = 1

    --  Insert or delete brackets, parens, quotes in pair.
    use 'jiangmiao/auto-pairs'
    --  Plug 'glepnir/dashboard-nvim'

    --  配色方案
    -- Plug 'morhetz/gruvbox'
    --  Plug 'tanvirtin/monokai.nvim'
    --  Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
    --  Plug 'joshdick/onedark.vim'
    use 'Mofiqul/dracula.nvim'

    --  插件提供基于 tree-sitter 的多个基础功能，它可以让你在 nvim 中高效的实现 代码高亮，增量选择 等功能。
    use 'nvim-treesitter/nvim-treesitter'

    --  A lua fork of vim-devicons. This plugin provides the same icons as well as colors for each icon.
    use 'kyazdani42/nvim-web-devicons'

    --  Git
    -- use 'tpope/vim-fugitive'
    --  Plug 'tpope/vim-rhubarb'
    --  Git 文件git状态、Blame text
    --  Plug 'lewis6991/gitsigns.nvim'
    use 'f-person/git-blame.nvim'

    -- indentation guides to all lines
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require("indent_blankline").setup {
                show_current_context_start = true,
            }
        end
    }

    --  LSP
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'

    --  增强代码自动完成
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    -- For snippy users.
    use 'dcampos/nvim-snippy'
    use'dcampos/cmp-snippy'
    --  轻量级UI优化内置lsp功能
    --  Plug 'glepnir/lspsaga.nvim'

    --  用于VIM的多语言图形调试器
    use 'puremourning/vimspector'

    --  高性能的十六进制文本颜色高亮
    use {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require 'colorizer'.setup ({
                    'less';
                    'css';
                    'javascript';
                    html = { mode = 'foreground'};
                }, { mode = 'background'})
        end
    }

    --  注释插件
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    --  终端控制
    use 'akinsho/toggleterm.nvim'

    --  高亮游标下文本
    --  Plug 'RRethy/vim-illuminate'
    use 'yamatsum/nvim-cursorline'

    --  Quick fix
    use  {
        'folke/trouble.nvim',
        config = function()
            require("trouble").setup{ }
        end
    }
    --  Surround 环绕的标签修改插件
    use 'tpope/vim-surround'
    --  `.` 重复上次操作
    use 'tpope/vim-repeat'

    -- Markdown预览

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require('packer').sync()
    end
end)

require('plugins.configs.nvim-tree-cfg')
require('plugins.configs.toggleterm-cfg')
require('plugins.configs.lspconfig-cfg')
require('plugins.configs.web-icons-cfg')
require('plugins.configs.treesitter-cfg')
require('plugins.configs.symbols-cfg')
require('plugins.configs.telescope-cfg')

