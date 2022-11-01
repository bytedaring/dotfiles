-- -----------------------------------------------------------------------------
--       _                                                       _
-- __  _(_)_      ____ _ _ __   __ _       _ __   ___  _____   _(_)_ __ ___
-- \ \/ / \ \ /\ / / _` | "_ \ / _` |_____| "_ \ / _ \/ _ \ \ / / | "_ ` _ \
--  >  <| |\ V  V / (_| | | | | (_| |_____| | | |  __/ (_) \ V /| | | | | | |
-- /_/\_\_| \_/\_/ \__,_|_| |_|\__, |     |_| |_|\___|\___/ \_/ |_|_| |_| |_|
--                            |___/                     _                        _
--
-- -----------------------------------------------------------------------------

local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim",
    install_path })
end

-- vim.cmd [[packadd packer.nvim]]
-- vim.cmd [[
--   augroup Packe
--     autocmd!
--     autocmd BufWritePost init.lua PackerCompile
--   augroup end
-- ]]

require("packer").startup({ function(use)
  use "lewis6991/impatient.nvim"
  use "nvim-lua/plenary.nvim"

  use "wbthomason/packer.nvim"

  --  A lua fork of vim-devicons. This plugin provides the same icons as well as colors for each icon.
  use "kyazdani42/nvim-web-devicons"

  -- UI Component Library for Neovim
  -- use 'MunifTanjim/nui.nvim'

  --  vim开屏页美化插件，可以记录最近编辑的文件，使用对应数字编号就可以快速打开文件，使用起来非常方便。
  use {
    "goolord/alpha-nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require "alpha".setup(require "alpha.themes.startify".config)
    end
  }

  --  状态栏美化
  -- use {
  --   "feline-nvim/feline.nvim",
  --   event = { "BufRead", "BufNewFile" },
  --   config = function()
  --     require("feline").setup()
  --   end
  -- }
  use {
    'nvim-lualine/lualine.nvim',
    event = { "BufRead", "BufNewFile" },
    config = function()
      require("lualine").setup()
    end
  }

  -- color scheme
  -- use {
  --   'Mofiqul/vscode.nvim',
  --   disable = true,
  --   config = function()
  --     vim.o.background = 'dark'
  --     vim.g.vscode_italic_comment = 0
  --     vim.cmd([[colorscheme vscode]])
  --   end
  -- }
  use {
    'glepnir/zephyr-nvim',
    config = function()
      require('zephyr')
    end
  }

  --  文件浏览器 File Explorer
  use {
    "kyazdani42/nvim-tree.lua",
    after = "nvim-web-devicons",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    config = require('plugins.configs.nvim-tree-cfg').config,
    setup = function()
      require("core.mappings").nvimtree()
    end
  }

  --  telescope 扩展插件
  use {
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/plenary.nvim" } },
    cmd = "Telescope",
    config = require('plugins.configs.telescope-cfg').config,
    setup = function()
      require("core.mappings").telescope()
    end
  }

  use {
    "nvim-telescope/telescope-fzf-native.nvim",
    after = "telescope.nvim",
    run = "make",
    config = function()
      require("telescope").load_extension("fzf")
    end
  }

  --  文档大纲-缩略图 使用lspsaga 替代
  -- use {
  --   "simrat39/symbols-outline.nvim",
  --   cmd = { "SymbolsOutline" },
  --   config = function()
  --     require "symbols-outline".setup {
  --       auto_close = true,
  --       width = 25,
  --     }
  --   end,
  --   setup = function()
  --     require("core.mappings").symbol()
  --   end
  -- }

  --  Insert or delete brackets, parens, quotes in pair.
  use {
    "windwp/nvim-autopairs",
    config = require("plugins.configs.autopairs-cfg").setup,
    after = "nvim-cmp"
  }
  -- Use treesitter to auto close and auto rename html tag
  use {
    'windwp/nvim-ts-autotag',
    ft = { 'javascript', 'html' },
    config = function()
      require('nvim-ts-autotag').setup()
    end
  }

  --  Surround 环绕的标签修改插件
  -- use { "tpope/vim-surround", event = "BufRead" }
  use { 'kylechui/nvim-surround',
    event = { 'BufRead', 'BufNewFile' },
    config = function()
      require('nvim-surround').setup()
    end
  }
  --  `.` 重复上次操作
  use { "tpope/vim-repeat", event = "InsertEnter" }

  --  Git 文件git状态、Blame text
  use {
    "f-person/git-blame.nvim", event = 'BufRead'
  }
  --  Git diffs for all modified files
  use {
    'sindrets/diffview.nvim',
    event = 'InsertEnter'
  }

  -- indentation guides to all lines
  use {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    config = function()
      require("indent_blankline").setup {
        space_char_blankline = " ",
        show_current_context = true,
        show_current_context_start = false,
      }
    end
  }

  --  注释插件
  use {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
    ft = { "html", "typescriptreact", "typescript", "javascript", "lua", "css", "less", "lua", "python", "go", "vim",
      "sh" }
  }

  -- Markdown预览
  use {
    "iamcco/markdown-preview.nvim", run = "cd app && yarn install",
    ft = { "markdown" },
    cmd = "MarkdownPreview"
  }

  --  高性能的十六进制文本颜色高亮
  use {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require "colorizer".setup({
        "less";
        "css";
        "go";
        "lua";
        "javascript";
        html = { mode = "foreground" };
      }, { mode = "background" })
    end,
    ft = { "html", "css", "less", "lua", "go" }
  }

  --  终端控制
  use {
    "akinsho/toggleterm.nvim",
    -- event = "BufRead",
    cmd = "ToggleTerm",
    config = require("plugins.configs.toggleterm-cfg").setup,
    setup = function()
      require("core.mappings").toggleTerm()
    end
  }

  -- lua development
  use {
    "folke/neodev.nvim",
  }

  --  插件提供基于 tree-sitter 的多个基础功能，它可以让你在 nvim 中高效的实现 代码高亮，增量选择 等功能。
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpade",
    event = { "BufRead", "BufNewFile" },
    config = function()
      require "nvim-treesitter.configs".setup {
        matchup = {
          enable = true
        },
        highlight = {
          enable = true,
          disable = {},
          -- additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = false,
          disable = {},
        },
        ensure_installed = {},
      }
    end
  }

  --  LSP
  use {
    "neovim/nvim-lspconfig",
    setup = function()
      require("core.utils").packer_lazy_load "nvim-lspconfig"
      -- reload the current file so lsp actually starts for it
      vim.defer_fn(function()
        vim.cmd 'if &ft == "packer" | echo "" | else | silent! e %'
      end, 0)
    end
  }
  -- use {
  --   "williamboman/mason.nvim",
  --   opt = true,
  --   event = { 'InsertEnter' },
  --   after = "nvim-lspconfig"
  -- }
  -- use {
  --   "williamboman/mason-lspconfig.nvim",
  --   after = "mason.nvim",
  --   config = function()
  --     require("mason").setup()
  --     require("mason-lspconfig").setup()
  --   end
  -- }
  -- LSP signature hint as you type
  use {
    "ray-x/lsp_signature.nvim",
    after = "nvim-lspconfig",
    event = { "BufRead", "InsertEnter", "BufNewFile" },
    config = require('plugins.configs.others').signature
  }
  -- LSP plugin
  use {
    "ray-x/guihua.lua",
    after = "nvim-lspconfig",
  }
  use {
    "glepnir/lspsaga.nvim",
    event = { "BufRead", "BufNewFile" },
    branch = "main",
    config = require("plugins.configs.lspsaga-cfg").config
  }

  use {
    "andymass/vim-matchup",
    event = { "BufRead", "BufNewFile" }
  }

  -- load luasnips + cmp related in insert mode only
  -- snippet source
  use {
    "rafamadriz/friendly-snippets",
    event = { "BufRead", "BufNewFile" }
  }
  --  增强代码自动完成
  use {
    "hrsh7th/cmp-nvim-lsp",
    after = "friendly-snippets",
    config = require("plugins.configs.cmp-cfg").setup
  }
  use {
    'RRethy/vim-illuminate',
    after = "cmp-nvim-lsp",
    config = function()
      require('illuminate').configure({
        filetypes_denylist = {
          'dirvish',
          'fugitive',
          'NvimTree'
        },
      })
      require("core.mappings").illuminate()
    end
  }
  use {
    "hrsh7th/nvim-cmp",
    after = 'friendly-snippets',
    config = require("plugins.configs.lspconfig-cfg").setup
  }
  use {
    "L3MON4D3/LuaSnip",
    wants = "friendly-snippets",
    after = "nvim-cmp"
  }
  use {
    "saadparwaiz1/cmp_luasnip",
    after = "LuaSnip"
  }
  use {
    "hrsh7th/cmp-buffer",
    after = "cmp-nvim-lsp"
  }
  use {
    "hrsh7th/cmp-path",
    after = "cmp-buffer"
  }
  use {
    'hrsh7th/cmp-cmdline',
    after = "cmp-path"
  }

  --  用于VIM的多语言图形调试器
  use {
    "puremourning/vimspector",
    ft = { "rust", "lua" },
    event = { "BufNewFile", "InsertEnter" },
    setup = function()
      require("core.mappings").vimspector()
    end
  }
  -- 另一种通用图形调试器
  use {
    "mfussenegger/nvim-dap",
    ft = { "go" },
    config = function()
    end
  }
  use {
    "rcarriga/nvim-dap-ui",
    after = "nvim-dap",
    requires = { "mfussenegger/nvim-dap" },
    config = function()
      require("dapui").setup()
    end
  }
  use { "theHamsta/nvim-dap-virtual-text", ft = { "go" }, after = "nvim-dap" }
  -- go development ide plugin
  -- use { "fatih/vim-go", ft =  { "go" }}
  use {
    "ray-x/go.nvim", ft = { "go" },
    config = function()
      require("go").setup({
        lsp_cfg = false,
        lsp_keymaps = true,
        go = 'go1.18',
        icons = { breakpoint = "🔴", currentpos = "👉" },
        run_in_floaterm = false,
      })
    end,
    setup = function()
      require("core.mappings").gonvim()
    end
  }
  -- 另一种通用图形调试器
  -- use {
  --     "leoluz/nvim-dap-go",
  --     ft = { "go" },
  --     config = function ()
  --         require("dap-go").setup()
  --     end
  -- }
  -- 测试插件
  use { "vim-test/vim-test", ft = { "go", "python" } }
  -- use { "rcarriga/vim-ultest", ft = { "go", "python" }, requires = {"vim-test/vim-test"}, run = ":UpdateRemotecore" }
  use { "antoinemadec/FixCursorHold.nvim", ft = { "go" } }
  use {
    "nvim-neotest/neotest-go",
    ft = { "go" },
    after = "FixCursorHold.nvim"
  }
  use {
    "nvim-neotest/neotest",
    ft = { "go" },
    after = "neotest-go",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-go",
    },
    config = function()
      require('neotest').setup({
        adapters = {
          require('neotest-go'),
          -- require("neotest-python")
        }
      })
    end
  }

  --  Quick fix
  use {
    "folke/trouble.nvim",
    event = 'InsertEnter',
    config = require("plugins.configs.trouble-cfg").setup,
    ft = { "javascript", "go", "rust", "lua", "python", "vim", "sh", "html" },
    setup = function()
      require("core.mappings").trouble()
    end
  }

  -- Bash Development for Neovim, also support formatting and lintting
  -- use {
  --   "jose-elias-alvarez/null-ls.nvim",
  --   ft = { "javascript", "html", "css", "sh", "vim", "lua" },
  --   config = require("plugins.configs.null-ls-cfg").setup,
  -- }

  -- lint
  use {
    'mfussenegger/nvim-lint',
    config = require("plugins.configs.lint-cfg").config
  }

  -- TODO
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    cmd = { "TodoQuickFix", "TodoLocList", "TodoTelescope", "TroubleToggle" },
    config = function()
      require("todo-comments").setup {}
    end,
    setup = function()
      require("core.mappings").todo()
    end
  }

  -----Utility-----
  use {
    'rcarriga/nvim-notify',
    event = { "BufRead", "BufNewFile" },
    config = function()
      vim.notify = require('notify')
    end
  }

  -- Automatically set up your configuration after cloning packer.nvim Put this at the end after all core
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end })
