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
    --  A lua fork of vim-devicons. This plugin provides the same icons as well as colors for each icon.
    {
        "kyazdani42/nvim-web-devicons",
        -- event = { "BufRead", "BufNewFile" },
        event = "VeryLazy",
        config = function()
            require("nvim-web-devicons").setup({
                override = {
                    zip = {
                        icon = " ",
                        color = "#dad8d8",
                        cterm_color = "188",
                        name = "Zip",
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
            })
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        -- event = { "BufRead", "BufNewFile" },
        event = "VeryLazy",
        config = function()
            require("lualine").setup({
                options = {
                    theme = "auto",
                    icons_nabled = true,
                    -- component_separators = { left = '', right = '' },
                    -- section_separators = { left = '', right = '' },
                },
            })
        end,
    },
    -- colorscheme
    {
        "rebelot/kanagawa.nvim",
        -- priority = 1000, -- Ensure it loads first
        -- lazy = true,
        cmd = "colorscheme",
        config = function()
            require("kanagawa").setup({
                compile = false,
                transparent = false,
            })
            vim.cmd([[colorscheme kanagawa]])
        end,
    },
    {
        "folke/tokyonight.nvim",
        cmd = "colorscheme",
        -- lazy = true,
        -- priority = 1000,
        config = function()
            require("tokyonight").setup({
                transparent = false,
                styles = {
                    sidebars = "transparent",
                    floats = "transparent",
                },
            })
            vim.cmd([[colorscheme tokyonight-moon]])
        end,
    },
    {
        "catppuccin/nvim",
        lazy = false,
        name = "catppuccin",
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme catppuccin-mocha]])
        end,
    },
    {
        "EdenEast/nightfox.nvim",
        lazy = true,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme duskfox]])
        end,
    },
    -- {
    --     "olimorris/onedarkpro.nvim",
    --     lazy = true,
    --     priority = 1000, -- Ensure it loads first
    --     config = function ()
    --         vim.cmd [[colorscheme onedark_vivid]]
    --     end
    -- },
    -- {
    --     'tanvirtin/monokai.nvim',
    --     lazy = true,
    --     priority = 1000, -- Ensure it loads first
    --     -- event = { 'BufRead', 'BufNewFile' },
    --     -- config = require("plugins.configs.others").monokai
    -- },
    --  文件浏览器 File Explorer
    {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "3rd/image.nvim",
        },
        cmd = "Neotree",
        config = function()
            package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
            package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"
            require("image").setup()

            require("neo-tree").setup({
                close_if_last_window = true,
                filesystem = {
                    follow_current_file = {
                        enabled = true, -- This will find and focus the file in the active buffer every time
                        --               -- the current file is changed while the tree is open.
                        leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
                    },
                },
                window = {
                    mappings = {
                        ["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = true } },
                    },
                },
            })
        end,
    },
    --  telescope 扩展插件
    {
        "nvim-telescope/telescope.nvim",
        cmd = { "Telescope" },
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("plugins.configs.telescope-cfg").config()
        end,
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        lazy = true,
    },
    {
        "nvim-telescope/telescope-project.nvim",
        lazy = true,
    },
    {
        "nvim-telescope/telescope-frecency.nvim",
        lazy = true,
        config = function() end,
    },
    --  Insert or delete brackets, parens, quotes in pair.
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("plugins.configs.autopairs-cfg").setup()
        end,
    },
    -- Use treesitter to auto close and auto rename html tag
    {
        "windwp/nvim-ts-autotag",
        ft = {
            "astro",
            "glimmer",
            "handlebars",
            "html",
            "javascript",
            "jsx",
            "markdown",
            "svelte",
            "tsx",
            "vue",
            "xml",
            "typescript",
        },
        config = function()
            require("nvim-ts-autotag").setup()
        end,
    },
    --  Surround 环绕的标签修改插件
    {
        "kylechui/nvim-surround",
        event = "InsertEnter",
        config = function()
            require("nvim-surround").setup()
        end,
    },
    --  `.` 重复上次操作
    { "tpope/vim-repeat", event = "InsertEnter" },
    --  Git 文件git状态、Blame text
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        config = function()
            require("gitsigns").setup()
        end,
    },
    -- indentation guides to all lines
    {
        "lukas-reineke/indent-blankline.nvim",
        -- event = "BufRead",
        event = "VeryLazy",
        main = "ibl",
        config = function()
            require("plugins.configs.others").blankline()
        end,
    },
    --  注释插件 -- replaced by build-in commentings
    -- {
    --     "numToStr/Comment.nvim",
    --     config = function()
    --         require("Comment").setup()
    --     end,
    --     event = "VeryLazy",
    -- },
    -- Markdown预览
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
    },
    {
        "Zeioth/markmap.nvim",
        cmd = { "MarkmapOpen", "MarkmapSave", "MarkmapWatch", "MarkmapWatchStop" },
        opts = {
            html_output = "/tmp/markmap.html", -- (default) Setting a empty string "" here means: [Current buffer path].html
            hide_toolbar = false, -- (default)
            grace_period = 3600000, -- (default) Stops markmap watch after 60 minutes. Set it to 0 to disable the grace_period.
        },
        config = function(_, opts)
            require("markmap").setup(opts)
        end,
    },
    -- 高性能的十六进制文本颜色高亮
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup({
                "less",
                "css",
                "go",
                "svelte",
                "lua",
                "astro",
                "javascript",
                html = { mode = "foreground" },
            }, { mode = "background" })
        end,
        ft = { "html", "css", "less", "lua", "go", "svelte", "astro" },
    },
    --  终端控制
    {
        "akinsho/toggleterm.nvim",
        cmd = "ToggleTerm",
        config = function()
            require("plugins.configs.toggleterm-cfg").setup()
        end,
    },
    --  插件提供基于 tree-sitter 的多个基础功能，它可以让你在 nvim 中高效的实现 代码高亮，增量选择 等功能。
    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
        branch = "local-dart",
        -- event = { "BufRead", "BufNewFile" },
        event = "VeryLazy",
        config = function()
            require("nvim-treesitter.configs").setup({
                textobjects = { enable = true },
                highlight = {
                    enable = true,
                    disable = { "markdown" },
                    additional_vim_regex_highlighting = false,
                },
                indent = {
                    enable = true,
                },
                autopairs = {
                    enable = true,
                },
                autotag = {
                    enable = true,
                    enable_rename = true,
                    enable_close = true,
                    enable_close_on_slash = true,
                },
            })
        end,
    },
    -- LSP
    {
        "neovim/nvim-lspconfig",
        -- event = { "BufRead", "BufNewFile" },
        event = "VeryLazy",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            require("plugins.configs.lspconfig-cfg").setup()
        end,
    },
    --  增强代码自动完成
    -- load luasnips + cmp related in insert mode only
    -- nvim-cmp source neovim's built-in language server client.
    -- completion engine
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "onsails/lspkind.nvim",
        },
        config = function()
            require("plugins.configs.cmp-cfg").setup()
        end,
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
        config = function()
            require("plugins.configs.others").snippet()
        end,
    },
    -- LSP signature hint as you type(use noice instant)
    -- {
    --     "ray-x/lsp_signature.nvim",
    --     event = "LspAttach",
    --     config = function()
    --         require("plugins.configs.others").signature()
    --     end,
    -- },
    -- LSP plugin
    {
        "glepnir/lspsaga.nvim",
        event = "LspAttach",
        branch = "main",
        config = function()
            require("plugins.configs.others").lspsaga()
        end,
    },
    -- 一种通用图形调试器
    {
        "rcarriga/nvim-dap-ui",
        -- lazy = true,
        event = "VeryLazy",
        -- cmd = { "DapToggleBreakpoint", "DapContinue", "DapRunToCursor" },
        -- event        = { "BufRead", "BufNewFile" },
        -- ft = { "zig" },
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
            -- "theHamsta/nvim-dap-virtual-text",
        },
        config = function()
            require("plugins.configs.dap-cfg").setup()
        end,
    },
    -- go
    {
        "ray-x/go.nvim",
        ft = "go",
        dependencies = "ray-x/guihua.lua",
        config = function()
            require("plugins.configs.go-cfg").setup()
        end,
    },
    -- flutter
    {
        "akinsho/flutter-tools.nvim",
        ft = "dart",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "mfussenegger/nvim-dap",
            "stevearc/dressing.nvim",
        },
        config = function()
            require("plugins.configs.flutter-cfg").setup()
        end,
    },
    -- rust
    {
        "mrcjkb/rustaceanvim",
        ft = "rust",
    },
    -- 测试插件
    {
        "vim-test/vim-test",
        cmd = { "TestFile", "TestLast", "TestNearest", "TestSuite" },
    },
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/neotest-go",
            "sidlatau/neotest-dart",
            "lawrence-laz/neotest-zig",
            "rouge8/neotest-rust",
            "antoinemadec/FixCursorHold.nvim",
        },
        cmd = { "NeotestToggleSummary", "NeotestToggleOutputPanel", "NeotestRun", "NeotestRunFile" },
        config = function()
            require("plugins.configs.others").neotest()
        end,
    },
    --  Quick fix
    {
        "folke/trouble.nvim",
        branch = "dev",
        cmd = { "Trouble" },
        config = function()
            require("trouble").setup({
                focus = true,
            })
        end,
    },
    -- lint
    {
        "mfussenegger/nvim-lint",
        event = "VeryLazy",
        -- ft = {
        --     "css",
        --     "docker",
        --     "go",
        --     "html",
        --     "javascript",
        --     "less",
        --     "lua",
        --     "markdown",
        --     "python",
        --     "rust",
        --     "sh",
        --     "swift",
        --     "typescript",
        --     "typescriptreact",
        --     "vim",
        --     "zig",
        -- },
        config = function()
            require("plugins.configs.others").lint()
        end,
    },
    -- formatter
    -- {
    --     'mhartington/formatter.nvim',
    --     ft = { 'html', 'css', 'xml', 'markdown' },
    --     config = function ()
    --         require('plugins.configs.others').format()
    --     end
    -- },
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        config = function()
            require("plugins.configs.others").conform()
        end,
    },
    -- TODO
    {
        "folke/todo-comments.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        cmd = {
            "TodoQuickFix",
            "TodoLocList",
            "TodoTelescope",
            "TroubleToggle",
        },
        config = function()
            require("todo-comments").setup({})
        end,
    },
    -----Utility-----
    {
        "rcarriga/nvim-notify",
        event = "InsertEnter",
        config = function()
            local notify = require("notify")
            notify.setup({ timeout = 1000 })
            vim.notify = notify
        end,
    },
    -- highlight cursor words and lines
    {
        "xiyaowong/nvim-cursorword",
        event = "InsertEnter",
        config = function()
            vim.cmd([[hi default CursorWord cterm=underline gui=underline]])
        end,
    },
    -- Just Syntax
    -- {
    --     "NoahTheDuke/vim-just",
    --     ft = "just",
    -- },
    {
        "IndianBoy42/tree-sitter-just",
        ft = "just",
        config = function()
            require("tree-sitter-just").setup({})
        end,
    },
    -- Documentation Generator
    {
        "kkoomen/vim-doge",
        event = "InsertEnter",
        build = ":call doge#install()",
    },
    -- smooth scrolling
    -- {
    --     "karb94/neoscroll.nvim",
    --     event = "VeryLazy",
    --     config = function()
    --         require("neoscroll").setup({})
    --     end,
    -- },
    -- completely replaces the UI
    -- lazy.nvim
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        -- lazy = true,
        -- event = { "BufRead", "BufNewFile" },
        dependencies = {
            "MunifTanjim/nui.nvim",
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        },
        config = function()
            require("plugins.configs.others").noice()
        end,
    },
    -- rename
    {
        "smjonas/inc-rename.nvim",
        cmd = "IncRename",
        config = function()
            require("inc_rename").setup({})
        end,
    },
    -- motion
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {
            modes = {
                search = { enabled = false },
                char = { enabled = false },
            },
        },
        keys = {
            {
                "s",
                mode = { "n", "x", "o" },
                function()
                    require("flash").jump()
                end,
                desc = "Flash",
            },
            {
                "F",
                mode = { "n", "x", "o" },
                function()
                    require("flash").treesitter()
                end,
                desc = "Flash Treesitter",
            },
        },
    },
    -- hurl
    {
        "jellydn/hurl.nvim",
        cmd = { "HurlRunner", "HurlRunnerAt", "HurlRunnerToEntry", "HurlToggleMode", "HurlVerbose" },
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("hurl").setup({
                debug = false,
                show_notification = false,
                env_file = {
                    "hurl.env",
                },
                mode = "split",
                formatters = {
                    json = { "jq" }, -- Make sure you have install jq in your system, e.g: brew install jq
                    html = {
                        "prettier", -- Make sure you have install prettier in your system, e.g: npm install -g prettier
                        "--parser",
                        "html",
                    },
                },
            })
        end,
    },
    -- AI Code Generator
    {
        "Exafunction/codeium.nvim",
        event = "VeryLazy",
        config = function()
            require("codeium").setup({})
        end,
    },
    -- tabline
    {
        "romgrk/barbar.nvim",
        event = "VeryLazy",
    },
}, {
    defaults = { lazy = true },
})
