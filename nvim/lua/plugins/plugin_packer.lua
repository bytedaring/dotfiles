local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim",
      install_path })
end

-- Autocommand that reloads neovim whenever you save the init.lua file
-- vim.cmd [[packadd packer.nvim]]
-- vim.cmd [[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost init.lua PackerCompile
--   augroup end
-- ]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function ()
      return require('packer.util').float({ border = 'rounded' })
    end
  }
})

-- Insert your plugins here
packer.startup({ function (use)
  use"wbthomason/packer.nvim"
  use"lewis6991/impatient.nvim"
  use{
    "nvim-lua/plenary.nvim",
    event = { 'BufRead', 'BufNewFile' }
  }

  --  A lua fork of vim-devicons. This plugin provides the same icons as well as colors for each icon.
  use{
    "kyazdani42/nvim-web-devicons",
    event = { 'BufRead', 'BufNewFile' },
    config = function ()
      require'nvim-web-devicons'.setup{
        override = {
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
  }

  use{
    'nvim-lualine/lualine.nvim',
    event = { "BufRead", "BufNewFile" },
    config = function ()
      require("lualine").setup({
        options = {
          theme = 'auto',
          icons_enabled = true,
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
        }
      })
    end
  }

  -- color scheme
  use{
    'tanvirtin/monokai.nvim',
    config = function ()
      local monokai = require('monokai')
      local palette = monokai.pro
      monokai.setup{
        palette = require('monokai').pro,
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
  }

  --  文件浏览器 File Explorer
  use{
    "kyazdani42/nvim-tree.lua",
    -- after = "nvim-web-devicons",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    config = require('plugins.configs.nvim-tree-cfg').config,
  }

  --  telescope 扩展插件
  use{
    "nvim-telescope/telescope.nvim",
    requires = { { "nvim-lua/plenary.nvim" } },
    cmd = { "Telescope" },
    config = require('plugins.configs.telescope-cfg').config,
  }

  use{
    "nvim-telescope/telescope-fzf-native.nvim",
    after = "telescope.nvim",
    run = "make",
    config = function ()
      require("telescope").load_extension("fzf")
    end
  }

  --  文档大纲-缩略图
  -- use{
  --   'stevearc/aerial.nvim',
  --   cmd = { 'AerialOpen', 'AerialToggle', 'AerialOpenAll' },
  --   config = function ()
  --     require('aerial').setup({
  --       layout = {
  --         min_width = 30,
  --       },
  --       icons = require("core.icons").lspkind
  --     })
  --     local ok, telescope = pcall(require, 'telescope')
  --     if ok then
  --       telescope.load_extension('aerial')
  --     end
  --   end
  -- }

  --  Insert or delete brackets, parens, quotes in pair.
  use{
    "windwp/nvim-autopairs",
    config = require("plugins.configs.autopairs-cfg").setup,
    after = "nvim-cmp"
  }
  -- Use treesitter to auto close and auto rename html tag
  use{
    'windwp/nvim-ts-autotag',
    ft = { 'javascript', 'html' },
    config = function ()
      require('nvim-ts-autotag').setup()
    end
  }

  --  Surround 环绕的标签修改插件
  use{ 'kylechui/nvim-surround',
    event = { 'BufRead', 'BufNewFile' },
    config = function ()
      require('nvim-surround').setup()
    end
  }
  --  `.` 重复上次操作
  use{ "tpope/vim-repeat", event = "InsertEnter" }

  --  Git 文件git状态、Blame text
  use{
    "f-person/git-blame.nvim",
    event = 'InsertEnter'
  }
  --  Git diffs for all modified files
  use{
    'sindrets/diffview.nvim',
    cmd = {
      'DiffviewLog',
      'DiffviewOpen',
      'DiffviewClose',
      'DiffviewRefresh',
      'DiffviewFocusFiles',
      'DiffviewToggleFiles',
      'DiffviewFileHistory'
    }
  }

  -- indentation guides to all lines
  use{
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    config = function ()
      vim.g.indentLine_char_list = { '|', '¦', '┆', '┊' }
      vim.opt.termguicolors = true
      vim.opt.list = true
      require("indent_blankline").setup{
        space_char_blankline = " ",
        show_current_context = true,
        show_current_context_start = false,
      }
    end
  }

  --  注释插件
  use{
    "numToStr/Comment.nvim",
    config = function ()
      require("Comment").setup()
    end,
    ft = { "html", "typescriptreact", "typescript", "javascript", "css", "less", "lua", "python", "go", "vim",
      "sh", "zig", "zsh" }
  }

  -- Markdown预览
  use{
    "iamcco/markdown-preview.nvim", run = "cd app && yarn install",
    ft = { "markdown" },
    cmd = "MarkdownPreview"
  }

  --  高性能的十六进制文本颜色高亮
  use{
    "norcalli/nvim-colorizer.lua",
    config = function ()
      require"colorizer".setup({
        "less",
        "css",
        "go",
        "lua",
        "javascript",
        html = { mode = "foreground" },
      }, { mode = "background" })
    end,
    ft = { "html", "css", "less", "lua", "go" }
  }

  --  终端控制
  use{
    "akinsho/toggleterm.nvim",
    cmd = "ToggleTerm",
    config = require("plugins.configs.toggleterm-cfg").setup,
  }

  --  插件提供基于 tree-sitter 的多个基础功能，它可以让你在 nvim 中高效的实现 代码高亮，增量选择 等功能。
  use{
    "nvim-treesitter/nvim-treesitter",
    run = function ()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
    event = { "BufRead", "BufNewFile" },
    config = function ()
      require"nvim-treesitter.configs".setup{
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
  }

  -- LSP
  use{
    "neovim/nvim-lspconfig",
    event = { "BufRead", "BufNewFile" },
  }
  -- use{
  -- "andymass/vim-matchup",
  -- event = { "BufRead", "BufNewFile" }
  -- }

  --  增强代码自动完成
  -- load luasnips + cmp related in insert mode only
  -- snippet source
  use{
    "rafamadriz/friendly-snippets",
    event = { "BufRead", "BufNewFile" },
  }
  -- nvim-cmp source neovim's built-in language server client.
  -- completion engine
  use{
    "hrsh7th/nvim-cmp",
    event = { "BufRead", "BufNewFile" },
  }
  use{
    "hrsh7th/cmp-nvim-lsp",
    event = { "BufRead", "BufNewFile" },
  }
  use{
    "hrsh7th/cmp-buffer",
    event = { "BufRead", "BufNewFile" },
  }
  use{
    "hrsh7th/cmp-path",
    event = { "BufRead", "BufNewFile" },
  }
  use{
    'hrsh7th/cmp-cmdline',
    event = { "BufRead", "BufNewFile" },
  }

  -- snippet engine
  use{
    "L3MON4D3/LuaSnip",
    after = "nvim-cmp",
    event = { "BufRead", "BufNewFile" },
  }

  use{
    "saadparwaiz1/cmp_luasnip",
    event = "InsertEnter",
    cmd = "Lspsaga",
    config = function ()
      require("plugins.configs.cmp-cfg").setup()
      require("plugins.configs.lspconfig-cfg").setup()
    end
  }

  -- LSP signature hint as you type
  use{
    "ray-x/lsp_signature.nvim",
    after = "cmp_luasnip",
    config = require('plugins.configs.others').signature
  }
  -- LSP plugin
  use{
    "glepnir/lspsaga.nvim",
    after = "cmp_luasnip",
    branch = "main",
    config = require("plugins.configs.others").lspsaga
  }

  --  用于VIM的多语言图形调试器
  -- use{
  --   "puremourning/vimspector",
  --   ft = { "rust" }
  -- }
  -- 另一种通用图形调试器
  use{
    "mfussenegger/nvim-dap",
    event = { "BufRead", "BufNewFile" },
    ft = { 'go', 'rust' }
  }
  use{
    "rcarriga/nvim-dap-ui",
    after = "nvim-dap",
    requires = { "mfussenegger/nvim-dap" },
  }
  use{ "theHamsta/nvim-dap-virtual-text", after = "nvim-dap", opt = true }
  use{
    'simrat39/rust-tools.nvim',
    ft = 'rust',
    config = require("plugins.configs.others").rusttools,
  }
  use{
    "ray-x/go.nvim",
    ft = 'go',
    config = function ()
      require("go").setup({
        lsp_cfg = false,
        lsp_keymaps = true,
        go = 'go1.19',
        icons = { breakpoint = "🍄", currentpos = "🔥" }, --🔴🤡🌕🚨
        run_in_floaterm = false,
        dap_debug_gui = {
          layouts = {
            {
              -- You can change the order of elements in the sidebar
              elements = {
                -- Provide IDs as strings or tables with "id" and "size" keys
                { id = "scopes",      size = 0.25 },
                { id = "breakpoints", size = 0.25 },
                { id = "stacks",      size = 0.25 },
                { id = "watches",     size = 0.25 },
              },
              size = 40,
              position = "left", -- Can be "left" or "right"
            },
            {
              elements = {
                "repl",

              },
              size = 10,
              position = "bottom", -- Can be "bottom" or "top"
            },
          },
        }
      })
    end,
  }
  use{ 'ray-x/guihua.lua', ft = { 'go' } }
  -- 测试插件
  use{
    "vim-test/vim-test",
    cmd = { "TestFile", "TestLast", "TestNearest", "TestSuite" }
  }
  -- use { "rcarriga/vim-ultest", ft = { "go", "python" }, requires = {"vim-test/vim-test"}, run = ":UpdateRemotecore" }
  -- use{ "antoinemadec/FixCursorHold.nvim", ft = { "go" } }
  use{
    "nvim-neotest/neotest",
    cmd = { "NeotestToggleSummary", "NeotestToggleOutputPanel", "NeotestRun", "NeotestRunFile" },
    requires = { "nvim-neotest/neotest-go", opt = true },
    config = function ()
      require("plugins.configs.others").neotest()
      local neotest_ns = vim.api.nvim_create_namespace("neotest")
      vim.diagnostic.config({
        virtual_text = {
          format = function (diagnostic)
            local message =
              diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
            return message
          end,
        },
      }, neotest_ns)
      require("neotest").setup({
        adapters = {
          require("neotest-go"),
        },
      })
    end
  }

  --  Quick fix
  use{
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    config = function ()
      require("trouble").setup{}
    end
  }

  -- lint
  use{
    'mfussenegger/nvim-lint',
    ft = {
      'javascript', 'typescriptreact', 'typescript', 'less',
      'html', 'css', 'sh', 'lua', 'vim', 'rust', 'python',
      'go', "zig"
    },
    config = require('plugins.configs.others').lint
  }

  -- TODO
  use{
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    cmd = { "TodoQuickFix", "TodoLocList", "TodoTelescope", "TroubleToggle" },
    config = function ()
      require("todo-comments").setup{}
    end,
  }

  -----Utility-----
  use{
    'rcarriga/nvim-notify',
    event = { "BufRead", "BufNewFile" },
    config = function ()
      local notify = require('notify')
      notify.setup({ timeout = 1000 })
      vim.notify = notify
    end
  }

  -- highlight cursor words and lines
  use{
    'xiyaowong/nvim-cursorword',
    event = { "BufRead", "BufNewFile" },
    config = function ()
      vim.cmd[[hi default CursorWord cterm=underline gui=underline]]
    end
  }

  -- Automatically set up your configuration after cloning packer.nvim Put this at the end after all core
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end })
