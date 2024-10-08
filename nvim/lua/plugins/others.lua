return {
    --  A lua fork of vim-devicons. This plugin provides the same icons as well as colors for each icon.
    {
        "kyazdani42/nvim-web-devicons",
        -- event = { "BufRead", "BufNewFile" },
        event = "VeryLazy",
        config = function()
            require("nvim-web-devicons").setup({
                override = {
                    zip = {
                        icon = "",
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
        event = "VeryLazy",
        config = function()
            require("lualine").setup({
                options = {
                    theme = "auto",
                    icons_nabled = true,
                },
            })
        end,
    },
    --  文件浏览器 File Explorer
    {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "3rd/image.nvim",
            -- "romgrk/barbar.nvim",
        },
        cmd = "Neotree",
        config = function()
            -- local is_alacritty = os.getenv("ALACRITTY_LOG") ~= nil
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
                use_libuv_file_watcher = true,
                window = {
                    mappings = {
                        ["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = true } },
                        ["<C-f>"] = "none",
                        ["<C-b>"] = "none",
                    },
                    buffers = {
                        ["<C-f>"] = "none",
                        ["<C-b>"] = "none",
                    },
                    git_status = {
                        ["<C-f>"] = "none",
                        ["<C-b>"] = "none",
                    },
                },
                source_selector = {
                    winbar = false,
                    statusline = false,
                },
            })
        end,
    },
    -- tabline
    -- {
    --     "romgrk/barbar.nvim",
    --     lazy = true,
    --     config = function()
    --         require("barbar").setup({
    --             sidebar_filetypes = {
    --                 ["neo-tree"] = { event = "BufWipeout" },
    --             },
    --         })
    --     end,
    -- },
    -- Use treesitter to auto close and auto rename html tag
    {
        "windwp/nvim-ts-autotag",
        event = "VeryLazy",
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
            require("gitsigns").setup({
                current_line_blame = true,
                current_line_blame_opts = {
                    delay = 600,
                },
            })
        end,
    },
    --  注释插件 -- replaced by build-in commentings
    -- Markdown预览
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && bun install",
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
    -- {
    --     "MeanderingProgrammer/markdown.nvim",
    --     name = "render-markdown",
    --     event = "VeryLazy",
    --     dependencies = {
    --         "nvim-treesitter/nvim-treesitter", -- Mandatory
    --     },
    --     config = function()
    --         require("render-markdown").setup({
    --             -- Characters that will replace the # at the start of headings
    --             headings = { "󰬺 ", "󰬻 ", "󰬼 ", "󰬽 ", "󰬾 ", "󰬿 " },
    --         })
    --     end,
    -- },
    -- 高性能的十六进制文本颜色高亮
    {
        "norcalli/nvim-colorizer.lua",
        event = "VeryLazy",
        config = function()
            require("colorizer").setup({
                "*",
                html = { mode = "foreground" },
            }, { mode = "background" })
        end,
    },
    --  插件提供基于 tree-sitter 的多个基础功能，它可以让你在 nvim 中高效的实现 代码高亮，增量选择 等功能。
    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
        -- event = { "BufRead", "BufNewFile" },
        event = "VeryLazy",
        config = function()
            require("nvim-treesitter.configs").setup({
                textobjects = { enable = true },
                highlight = {
                    enable = true,
                    -- disable = { "markdown" },
                    additional_vim_regex_highlighting = false,
                },
                indent = {
                    enable = true,
                },
                autopairs = {
                    enable = true,
                },
            })
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
            -- lazy-load snippets from my-snippets folder
            require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.config/nvim/my_snippets" })
            -- lazy-load default snippets
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },
    -- rust
    {
        "mrcjkb/rustaceanvim",
        ft = "rust",
    },
    {
        "saecki/crates.nvim",
        event = { "BufRead Cargo.toml" },
        config = function()
            require("crates").setup({
                popup = { autofocus = true },
            })
        end,
    },
    -- 测试插件
    {
        "vim-test/vim-test",
        cmd = { "TestFile", "TestLast", "TestNearest", "TestSuite" },
    },
    --  Quick fix
    {
        "folke/trouble.nvim",
        cmd = { "Trouble" },
        config = function()
            require("trouble").setup({
                focus = true,
            })
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
            notify.setup({ timeout = 1000, background_colour = "#000000" })
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
    --     "IndianBoy42/tree-sitter-just",
    --     ft = "just",
    --     config = function()
    --         require("tree-sitter-just").setup({})
    --     end,
    -- },
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
    -- {
    --     "NoahTheDuke/vim-just",
    --     event = { "BufRead justfile" },
    -- },
    {
        "towolf/vim-helm",
        event = "VeryLazy",
    },
    -- scroll
    {
        "karb94/neoscroll.nvim",
        event = "VeryLazy",
        config = function()
            require("neoscroll").setup({})
        end,
    },
    -- -- neorg
    -- {
    --     "nvim-neorg/neorg",
    --     version = "*",
    --     dependencies = {
    --         "nvim-neorg/lua-utils.nvim",
    --         "pysan3/pathlib.nvim",
    --         "nvim-neotest/nvim-nio",
    --         "MunifTanjim/nui.nvim",
    --         "nvim-lua/plenary.nvim",
    --         "vhyrro/luarocks.nvim",
    --     },
    --     cmd = "Neorg",
    --     config = function()
    --         require("neorg").setup({
    --             load = {
    --                 ["core.completion"] = {
    --                     config = {
    --                         engine = "nvim-cmp",
    --                     },
    --                 },
    --                 ["core.summary"] = {},
    --                 ["core.integrations.image"] = {},
    --                 ["core.defaults"] = {},
    --                 ["core.concealer"] = {},
    --                 ["core.dirman"] = {
    --                     config = {
    --                         workspaces = {
    --                             notes = "~/notes",
    --                         },
    --                         default_workspace = "notes",
    --                     },
    --                 },
    --             },
    --         })
    --
    --         vim.wo.foldlevel = 99
    --         vim.wo.conceallevel = 2
    --     end,
    -- },
}
