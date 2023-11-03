local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- { "lewis6991/impatient.nvim" },
  --  A lua fork of vim-devicons. This plugin provides the same icons as well as colors for each icon.
  {
    "kyazdani42/nvim-web-devicons",
    event = { 'BufRead', 'BufNewFile' },
    config = function ()
      require 'nvim-web-devicons'.setup { override = {
        zip = {
          icon = " ",
          color = "#dad8d8",
          cterm_color = "188",
          name = "Zip"
        },
        sum = {
          icon = "",
          color = "#e44d26",
          cterm_color = "196",
          name = "GoSum",
        },
        mod = {
          icon = "",
          color = "#e44d26",
          cterm_color = "196",
          name = "GoMod",
        },
      },
      }
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    event = { "BufRead", "BufNewFile" },
    config = function ()
      require("lualine").setup({
        options = {
          theme = 'auto',
          icons_enabled = true,
          -- component_separators = { left = '', right = '' },
          -- section_separators = { left = '', right = '' },
        }
      })
    end
  },
  -- colorscheme
  {
    'tanvirtin/monokai.nvim',
    config = function ()
      local monokai = require('monokai')
      local palette = monokai.pro
      monokai.setup {
        palette = palette,
        custom_hlgroups = {
          ["@comment"] = {
            fg = palette.base6,
            -- style = 'NONE',
          },
          ["@function"] = {
            fg = palette.green,
            style = 'NONE',
          },
          ["@keyword.function"] = {
            fg = palette.aqua,
            style = 'NONE',
          },
          ["@keyword"] = {
            fg = palette.pink,
            style = 'NONE',
          },
          ["@function.builtin"] = {
            fg = palette.aqua,
            style = 'italic',
          },
          ["@type.builtin"] = {
            fg = palette.aqua,
            style = 'italic',
          },
          ["@method.call"] = {
            fg = palette.green,
          },
        }
      }
    end
  },
  --  文件浏览器 File Explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    cmd = "Neotree",
    config = function ()
      require("neo-tree").setup({
        close_if_last_window = true,
        filesystem = {
          follow_current_file = {
            enabled = true,          -- This will find and focus the file in the active buffer every time
            --               -- the current file is changed while the tree is open.
            leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
          },
        }
      })
    end
  },
  --  telescope 扩展插件
  {
    "nvim-telescope/telescope.nvim",
    cmd = { "Telescope" },
    dependencies = {
      'nvim-lua/plenary.nvim',
      "nvim-telescope/telescope.nvim"
    },
    config = function ()
      require('plugins.configs.telescope-cfg').config()
    end
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = 'make',
    lazy = true
  },
  --  Insert or delete brackets, parens, quotes in pair.
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function ()
      require("plugins.configs.autopairs-cfg").setup()
    end
  },
  -- Use treesitter to auto close and auto rename html tag
  {
    'windwp/nvim-ts-autotag',
    event = 'InsertEnter',
    config = function ()
      require('nvim-ts-autotag').setup()
    end
  },
  --  Surround 环绕的标签修改插件
  {
    'kylechui/nvim-surround',
    event = { 'BufRead', 'BufNewFile' },
    config = function ()
      require('nvim-surround').setup()
    end
  },
  --  `.` 重复上次操作
  { "tpope/vim-repeat", event = "InsertEnter" },
  --  Git 文件git状态、Blame text
  {
    "f-person/git-blame.nvim",
    event = 'InsertEnter'
  },
  --  Git diffs for all modified files
  {
    'sindrets/diffview.nvim',
    cmd = {
      'DiffviewLog', 'DiffviewOpen', 'DiffviewClose',
      'DiffviewRefresh', 'DiffviewFocusFiles',
      'DiffviewToggleFiles', 'DiffviewFileHistory'
    }
  },
  -- indentation guides to all lines
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    main = 'ibl',
    config = function ()
      require("plugins.configs.others").blankline()
    end
  },
  --  注释插件
  {
    "numToStr/Comment.nvim",
    config = function ()
      require("Comment").setup()
    end,
    ft = { "html", "typescriptreact", "typescript",
      "javascript", "css", "less", "lua",
      "python", "go", "vim", "dart", "java",
      "sh", "zig", "zsh", "conf", "astro"
    }
  },
  -- Markdown预览
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && yarn install",
    ft = { "markdown" },
    cmd = "MarkdownPreview"
  },
  --  高性能的十六进制文本颜色高亮
  {
    "norcalli/nvim-colorizer.lua",
    config = function ()
      require "colorizer".setup({
        "less",
        "css",
        "go",
        "lua",
        "javascript",
        html = { mode = "foreground" },
      }, { mode = "background" })
    end,
    ft = { "html", "css", "less", "lua", "go" }
  },
  --  终端控制
  {
    "akinsho/toggleterm.nvim",
    cmd = "ToggleTerm",
    config = function ()
      require("plugins.configs.toggleterm-cfg").setup()
    end
  },
  --  插件提供基于 tree-sitter 的多个基础功能，它可以让你在 nvim 中高效的实现 代码高亮，增量选择 等功能。
  {
    "nvim-treesitter/nvim-treesitter",
    build = function ()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
    branch = 'local-dart',
    event = { "BufRead", "BufNewFile" },
    config = function ()
      require "nvim-treesitter.configs".setup {
        textobjects = { enable = true },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false
        },
        indent = {
          enable = true,
        },
      }
    end
  },
  -- LSP
  {
    "neovim/nvim-lspconfig",
    event = { "BufRead", "BufNewFile" },
  },
  --  增强代码自动完成
  -- load luasnips + cmp related in insert mode only
  -- nvim-cmp source neovim's built-in language server client.
  -- completion engine
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline"
    },
    config = function ()
      require("plugins.configs.lspconfig-cfg").setup()
      require("plugins.configs.cmp-cfg").setup()
    end
  },
  -- snippet engine
  {
    "L3MON4D3/LuaSnip",
    event = "InsertEnter",
    build = "make install_jsregexp",
    dependencies = {
      "rafamadriz/friendly-snippets", -- snippet source
      "hrsh7th/nvim-cmp",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function ()
      require("plugins.configs.others").snippet()
    end
  },
  -- LSP signature hint as you type
  {
    "ray-x/lsp_signature.nvim",
    event = "LspAttach",
    config = function ()
      require('plugins.configs.others').signature()
    end
  },
  -- LSP plugin
  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    branch = "main",
    config = function ()
      require("plugins.configs.others").lspsaga()
    end
  },
  -- 一种通用图形调试器
  {
    "mfussenegger/nvim-dap",
    lazy         = true,
    ft           = { 'zig' },
    -- event        = { "BufRead", "BufNewFile" },
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
    },
    config       = function ()
      require("plugins.configs.dap-cfg").setup()
    end
  },
  -- go
  {
    "ray-x/go.nvim",
    ft = 'go',
    dependencies = 'ray-x/guihua.lua',
    config = function ()
      require("plugins.configs.go-cfg").setup()
    end
  },
  -- flutter
  {
    'akinsho/flutter-tools.nvim',
    ft = 'dart',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'mfussenegger/nvim-dap',
      'stevearc/dressing.nvim'
    },
    config = function ()
      require("plugins.configs.flutter-cfg").setup()
    end
  },
  -- 测试插件
  {
    "vim-test/vim-test",
    cmd = { "TestFile", "TestLast", "TestNearest", "TestSuite" }
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest-go",
      "sidlatau/neotest-dart",
      "lawrence-laz/neotest-zig",
      "antoinemadec/FixCursorHold.nvim"
    },
    cmd = { "NeotestToggleSummary", "NeotestToggleOutputPanel", "NeotestRun", "NeotestRunFile" },
    config = function ()
      require("plugins.configs.others").neotest()
    end
  },
  --  Quick fix
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    config = function ()
      require("trouble").setup {}
    end
  },
  -- lint
  {
    'mfussenegger/nvim-lint',
    ft = {
      'javascript', 'typescriptreact', 'typescript', 'less',
      'html', 'css', 'sh', 'lua', 'vim', 'rust', 'python', 'go', "zig"
    },
    config = function ()
      require('plugins.configs.others').lint()
    end
  },
  -- formatter
  {
    'mhartington/formatter.nvim',
    ft = { 'html', 'svelte', 'css', 'xml' },
    config = function ()
      require('plugins.configs.others').format()
    end
  },
  -- TODO
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    cmd          = {
      "TodoQuickFix", "TodoLocList",
      "TodoTelescope", "TroubleToggle"
    },
    config       = function ()
      require("todo-comments").setup {}
    end,
  },
  -----Utility-----
  {
    'rcarriga/nvim-notify',
    event = { "BufRead", "BufNewFile" },
    config = function ()
      local notify = require('notify')
      notify.setup({ timeout = 1000 })
      vim.notify = notify
    end
  },
  -- highlight cursor words and lines
  {
    'xiyaowong/nvim-cursorword',
    event = { "BufRead", "BufNewFile" },
    config = function ()
      vim.cmd [[hi default CursorWord cterm=underline gui=underline]]
    end
  },
})
