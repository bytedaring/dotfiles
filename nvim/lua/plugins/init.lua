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

require('packer').startup({function(use)
    use 'wbthomason/packer.nvim'

    use 'lewis6991/impatient.nvim'

    --  A lua fork of vim-devicons. This plugin provides the same icons as well as colors for each icon.
    use {
        'kyazdani42/nvim-web-devicons',
        config = function ()
            require'nvim-web-devicons'.setup {
                override = {
                    fish = {
                        icon = "",
                        color = "#51a0cf",
                        cterm_color = "66",
                        name = "Fish"
                    }
                };
                default = true;
            }
        end
    }

    --  vim开屏页美化插件，可以记录最近编辑的文件，使用对应数字编号就可以快速打开文件，使用起来非常方便。
    use {
        'goolord/alpha-nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = function ()
            require'alpha'.setup(require'alpha.themes.startify'.config)
        end
    }

    --  自动根目录识别
    -- use {
    --     "ahmedkhalf/project.nvim",
    --     config = function()
    --         require("project_nvim").setup {}
    --     end
    -- }

    --  文件浏览器 File Explorer
    use 'kyazdani42/nvim-tree.lua'

    --  fuzzy finder over lists
    use 'nvim-lua/popup.nvim'
    --  telescope 扩展插件
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim' } },
    }

    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    --  状态栏美化
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = function()
            require('lualine').setup()
        end
    }

    --  文档大纲-缩略图
    use {
        'simrat39/symbols-outline.nvim',
        cmd = { 'SymbolsOutline' },
        config = function ()
            require'symbols-outline'.setup{
                auto_close = true,
                width = 45,
                }
        end
    }

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
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpade',
        config = function ()
            require'nvim-treesitter.configs'.setup {
                highlight = {
                    enable = true,
                    disable = {},
                    additional_vim_regex_highlighting = false,
                },
                indent = {
                    enable = false,
                    disable = {},
                },
                ensure_installed = {
                    "toml",
                    "fish",
                    "json",
                    "go",
                    "html",
                    "scss",
                    "javascript"
                },
            }
        end
    }

    --  Git 文件git状态、Blame text
    use 'f-person/git-blame.nvim'

    -- indentation guides to all lines
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require("indent_blankline").setup {
                space_char_blankline = " ",
                show_current_context = true,
                show_current_context_start = false,
            }
        end
    }

    --  LSP
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'

    --  增强代码自动完成
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    -- 代码片段 For lussnip users.
    use { 'saadparwaiz1/cmp_luasnip', ft = { 'lua' } }
    use 'L3MON4D3/LuaSnip'
    -- snippet source
    use "rafamadriz/friendly-snippets"

    --  用于VIM的多语言图形调试器
    use {
        'puremourning/vimspector',
        ft = { 'rust', 'lua', 'python' }
    }
    -- 另一种通用图形调试器
    use {
        'mfussenegger/nvim-dap',
        ft = { 'go' },
        config = function ()
        end
    }
    use {
        'rcarriga/nvim-dap-ui',
        ft = { 'go' },
        requires = {"mfussenegger/nvim-dap"},
        config = function ()
            require("dapui").setup()
        end
    }
    use { 'theHamsta/nvim-dap-virtual-text', ft = { 'go' } }
    -- go development ide plugin
    -- use { 'fatih/vim-go', ft =  { 'go' }}
    use { 'ray-x/guihua.lua', ft = { 'go' } }
    use {
      'ray-x/go.nvim', ft = { 'go' },
      config = function()
        require('go').setup({
          icons = {breakpoint='🔴', currentpos='👉'},
          lsp_cfg = false,
          run_in_floaterm = true
        })
      end
    }
    -- 另一种通用图形调试器
    -- use {
    --     'leoluz/nvim-dap-go',
    --     ft = { 'go' },
    --     config = function ()
    --         require('dap-go').setup()
    --     end
    -- }
    -- 测试插件
    use { 'vim-test/vim-test', ft = { 'go', 'python' } }
    use { "rcarriga/vim-ultest", ft = { 'go', 'python' }, requires = {"vim-test/vim-test"}, run = ":UpdateRemotePlugins" }
   
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
        end,
        ft = { 'html', 'css', 'less' }
    }

    --  注释插件
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end,
        ft = { 'html', 'javascript', 'lua', 'css', 'less', 'lua', 'python', 'go', 'vim' }
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
        end,
        ft = { 'javascript', 'go', 'rust', 'lua', 'python', 'vim' }
    }
    --  Surround 环绕的标签修改插件
    use 'tpope/vim-surround'
    --  `.` 重复上次操作
    use 'tpope/vim-repeat'

    -- Markdown预览
    use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', ft = {'markdown'}, cmd = 'MarkdownPreview'}

    -- Lua Development for Neovim 
    use { 'tjdevries/nlua.nvim', ft =  { 'lua' }}

    -- TODO
    -- use {
    --     'folke/todo-comments.nvim',
    --     requires = "nvim-lua/plenary.nvim",
    --     config = function()
    --         require("todo-comments").setup {}
    --     end
    -- }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require('packer').sync()
    end
end})

require('plugins.configs.nvim-tree-cfg')
require('plugins.configs.toggleterm-cfg')
require('plugins.configs.lspconfig-cfg')
require('plugins.configs.telescope-cfg')
