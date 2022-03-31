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
local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
end

-- vim.cmd [[packadd packer.nvim]]
-- vim.cmd [[
--   augroup Packer
--     autocmd!
--     autocmd BufWritePost init.lua PackerCompile
--   augroup end
-- ]]

require("packer").startup({function(use)
  use "lewis6991/impatient.nvim"
  use "nvim-lua/plenary.nvim"
  use "nathom/filetype.nvim"

  use "wbthomason/packer.nvim"

  --  A lua fork of vim-devicons. This plugin provides the same icons as well as colors for each icon.
  use "kyazdani42/nvim-web-devicons"

  --  vim开屏页美化插件，可以记录最近编辑的文件，使用对应数字编号就可以快速打开文件，使用起来非常方便。
  use {
    "goolord/alpha-nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
    config = function ()
      require"alpha".setup(require"alpha.themes.startify".config)
    end
  }

  --  文件浏览器 File Explorer
  use {
    "kyazdani42/nvim-tree.lua",
    after = "nvim-web-devicons",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    config = function ()
      local g = vim.g
      g.nvim_tree_respect_buf_cwd = 1
      g.nvim_tree_indent_markers = 1

      require"nvim-tree".setup {
        disable_netrw       = true,
        hijack_netrw        = true,
        open_on_setup       = true,
        open_on_tab         = false,
        hijack_cursor       = false,
        update_cwd          = true,
        update_focused_file = {
          enable      = true,
          update_cwd  = false,
          ignore_list = {}
        },
        git = {
          timeout = 300,
        },
        view = {
          width = 40,
        },
        filters = {
          dotfiles = true
        }
      }
    end,
    setup = function ()
      require("core.mappings").nvimtree()
    end
  }

  --  telescope 扩展插件
  use {
    "nvim-telescope/telescope.nvim",
    requires = { {"nvim-lua/plenary.nvim" } },
    cmd = "Telescope",
    config = function ()
      require("telescope").setup {
        extensions = {
          fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "ignore_case",        -- or "ignore_case" or "respect_case"
          }
        }
      }
    end,
    setup = function ()
      require("core.mappings").telescope()
    end
  }

  use {
    "nvim-telescope/telescope-fzf-native.nvim",
    after = "telescope.nvim",
    run = "make",
    config = function ()
      require("telescope").load_extension("fzf")
    end
  }

  --  状态栏美化
  use {
    "feline-nvim/feline.nvim",
    after = "nvim-web-devicons",
    config = function()
      require("feline").setup()
    end
  }

  --  文档大纲-缩略图
  use {
    "simrat39/symbols-outline.nvim",
    cmd = { "SymbolsOutline" },
    config = function ()
      require"symbols-outline".setup{
        auto_close = true,
        width = 45,
      }
    end,
    setup = function ()
      require("core.mappings").symbol()
    end
  }

  --  Insert or delete brackets, parens, quotes in pair.
  use {
    "windwp/nvim-autopairs",
    config = require("plugins.configs.autopairs-cfg").setup,
    event = "BufRead"
  }

  --  Surround 环绕的标签修改插件
  use { "tpope/vim-surround", event = "BufRead" }
  --  `.` 重复上次操作
  use { "tpope/vim-repeat", event = "BufRead" }

  --  Git 文件git状态、Blame text
  use {
    "f-person/git-blame.nvim",
    opt = true,
    setup = function ()
      require("core.utils").packer_lazy_load "git-blame.nvim"
    end
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
    ft = { "html", "javascript", "lua", "css", "less", "lua", "python", "go", "vim", "sh" }
  }

  -- Markdown预览
  use {
    "iamcco/markdown-preview.nvim", run = "cd app && yarn install",
    ft = {"markdown"},
    cmd = "MarkdownPreview"
  }

  --  高性能的十六进制文本颜色高亮
  use {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require "colorizer".setup ({
          "less";
          "css";
          "javascript";
          html = { mode = "foreground"};
        }, { mode = "background"})
    end,
    ft = { "html", "css", "less" }
  }

  --  终端控制
  use {
    "akinsho/toggleterm.nvim",
    -- event = "BufRead",
    cmd = "ToggleTerm",
    config = require("plugins.configs.toggleterm-cfg").setup,
    setup = function ()
      require("core.mappings").toggleTerm()
    end
  }

  -- color scheme
  -- Plug "morhetz/gruvbox"
  -- Plug "tanvirtin/monokai.nvim"
  -- Plug "folke/tokyonight.nvim", { "branch": "main" }
  -- Plug "joshdick/onedark.vim"
  -- use "Mofiqul/dracula.nvim"
  -- use "Mofiqul/vscode.nvim",
  -- use {
    -- "bluz71/vim-nightfly-guicolors",
    -- config = function ()
      -- vim.cmd[[colorscheme nightfly]]
    -- end
  -- }
  
  use {
    "Mofiqul/dracula.nvim",
    config = function ()
      vim.cmd[[colorscheme dracula]]
    end
  }

  --  插件提供基于 tree-sitter 的多个基础功能，它可以让你在 nvim 中高效的实现 代码高亮，增量选择 等功能。
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpade",
    event = { "BufRead", "BufNewFile" },
    config = function ()
      require"nvim-treesitter.configs".setup {
        highlight = {
          enable = true,
          disable = {},
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = false,
          disable = {},
        },
        ensure_installed = {},
      }
    end
  }

  -- load luasnips + cmp related in insert mode only
  --  LSP
  use {
    "neovim/nvim-lspconfig",
    opt = true,
    setup = function ()
      require("core.utils").packer_lazy_load "nvim-lspconfig"
      -- reload the current file so lsp actually starts for it
      vim.defer_fn(function ()
        vim.cmd 'if &ft == "packer" | echo "" | else | silent! e %'
      end, 0)
    end
  }
  use {
    "williamboman/nvim-lsp-installer",
    cmd = { "LspInstallInfo", "LspInstall" }
  }

  -- LSP signature hint as you type
  use {
    "ray-x/lsp_signature.nvim",
    after = "nvim-lspconfig",
    config = function ()
      require("lsp_signature").setup()
    end
  }

  use {
    "andymass/vim-matchup",
    opt = true,
    setup = function ()
      require("core.utils").packer_lazy_load "vim-matchup"
    end
  }

  -- snippet source
  use {
    "rafamadriz/friendly-snippets",
    event = "InsertEnter"
  }
  --  增强代码自动完成
  use {
    "hrsh7th/nvim-cmp",
    after = "friendly-snippets",
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
    "hrsh7th/cmp-nvim-lsp",
    after = "cmp_luasnip",
    config = require("plugins.configs.luasnip-cfg").setup
  }
  use {
    "hrsh7th/cmp-buffer",
    after = "cmp-nvim-lsp"
  }
  use {
    "hrsh7th/cmp-path",
    after = "cmp-buffer"
  }

  --  用于VIM的多语言图形调试器
  use {
    "puremourning/vimspector",
    ft = { "rust", "lua", "python" },
    setup = function ()
      require("core.mappings").vimspector()
    end
  }
  -- 另一种通用图形调试器
  use {
    "mfussenegger/nvim-dap",
    ft = { "go" },
    config = function ()
    end
  }
  use {
    "rcarriga/nvim-dap-ui",
    after = "nvim-dap",
    requires = {"mfussenegger/nvim-dap"},
    config = function ()
        require("dapui").setup()
    end
  }
  use { "theHamsta/nvim-dap-virtual-text", ft = { "go" }, after = "nvim-dap" }
  -- go development ide plugin
  -- use { "fatih/vim-go", ft =  { "go" }}
  use { "ray-x/guihua.lua", ft = { "go" } }
  use {
    "ray-x/go.nvim", ft = { "go" },
    config = function()
      require("go").setup({
        icons = {breakpoint="🔴", currentpos="👉"},
        lsp_cfg = false,
        run_in_floaterm = true
      })
    end,
    setup = function ()
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
  use { "rcarriga/vim-ultest", ft = { "go", "python" }, requires = {"vim-test/vim-test"}, run = ":UpdateRemotecore" }

  --  Quick fix
  use  {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup{ }
    end,
    ft = { "javascript", "go", "rust", "lua", "python", "vim", "sh", "html" },
    setup = function ()
      require("core.mappings").trouble()
    end
  }

  -- Lua Development for Neovim
  use { "tjdevries/nlua.nvim", ft =  { "lua" }}

  -- Bash Development for Neovim
  use {
    "jose-elias-alvarez/null-ls.nvim",
    ft = { "sh" },
    config = function()
      require("null-ls").setup{
        sources = {
          require("null-ls").builtins.diagnostics.shellcheck,
          require("null-ls").builtins.formatting.shfmt,
        }
      }
    end
  }

  -- TODO
  use {
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
      cmd = { "TodoQuickFix", "TodoLocList", "TodoTelescope", "TroubleToggle" },
      config = function()
          require("todo-comments").setup {}
      end,
      setup = function ()
        require("core.mappings").todo()
      end
  }

  -- Automatically set up your configuration after cloning packer.nvim Put this at the end after all core
  if PACKER_BOOTSTRAP then
      require("packer").sync()
  end
end})



