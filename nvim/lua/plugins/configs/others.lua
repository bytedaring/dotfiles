local M = {}
M.signature = function()
    local function get_border_style(style, highlight)
        highlight = highlight or "FloatBorder"
        local border_style = {
            ["none"] = "none",
            ["single"] = {
                { "┌", highlight },
                { "─", highlight },
                { "┐", highlight },
                { "│", highlight },
                { "┘", highlight },
                { "─", highlight },
                { "└", highlight },
                { "│", highlight },
            },
            ["double"] = "double",
            ["rounded"] = {
                { "╭", highlight },
                { "─", highlight },
                { "╮", highlight },
                { "│", highlight },
                { "╯", highlight },
                { "─", highlight },
                { "╰", highlight },
                { "│", highlight },
            },
            ["bold"] = {
                { "┏", highlight },
                { "─", highlight },
                { "┓", highlight },
                { "│", highlight },
                { "┛", highlight },
                { "─", highlight },
                { "┗", highlight },
                { "│", highlight },
            },
            ["plus"] = {
                { "+", highlight },
                { "─", highlight },
                { "+", highlight },
                { "│", highlight },
                { "+", highlight },
                { "─", highlight },
                { "+", highlight },
                { "│", highlight },
            },
        }

        return border_style[style]
    end

    require("lsp_signature").setup({
        handler_opts = {
            -- DefinitionBorder, double, rounded, single, shadow, none, SagaBorder, HoverBorder
            border = get_border_style("bold", "SagaBorder"),
        },
    })
end

M.lint = function()
    require("lint").linters_by_ft = {
        go = { "golangcilint" },
        sh = { "shellcheck" },
        yaml = { "yamllint" },
        html = { "eslint" },
        javascript = { "eslint" },
        dockerfile = { "hadolint" },
        markdown = { "markdownlint" },
        swift = { "swiftlint" },
    }
    vim.api.nvim_create_autocmd({ "BufRead", "BufWritePost" }, {
        callback = function()
            require("lint").try_lint()
        end,
    })
end

M.format = function()
    local defaults = require("formatter.filetypes")
    -- local util = require "formatter.util"
    require("formatter").setup({
        filetype = {
            html = {
                defaults.html.prettier,
            },
            -- svelte = {
            --     defaults.svelte.prettier,
            -- },
            css = {
                defaults.css.prettier,
            },
            markdown = {
                defaults.javascript.prettier,
            },
        },
    })
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
            vim.cmd([[Format]])
        end,
    })
end

M.lspsaga = function()
    require("lspsaga").setup({
        ui = {
            border = "single",
            title = true,
            code_action = "",
        },
        hover = {
            max_width = 0.6,
            max_height = 0.8,
            open_link = "gx",
            open_cmd = "!open",
        },
        symbol_in_winbar = {
            enable = true,
            separator = " > ",
        },
    })
end

M.neotest = function()
    local create_cmd = function(cmd, func, opt)
        opt = vim.tbl_extend("force", { desc = "xw.nvim " .. cmd }, opt or {})
        vim.api.nvim_create_user_command(cmd, func, opt)
    end

    create_cmd("NeotestToggleSummary", function(_)
        require("neotest").summary.toggle()
    end)

    create_cmd("NeotestToggleOutputPanel", function(_)
        require("neotest").output_panel.toggle()
    end)

    create_cmd("NeotestRun", function(_)
        require("neotest").run.run()
    end)

    create_cmd("NeotestRunFile", function(_)
        require("neotest").run.run(vim.fn.expand("%"))
    end)

    local neotest_ns = vim.api.nvim_create_namespace("neotest")
    vim.diagnostic.config({
        virtual_text = {
            format = function(diagnostic)
                local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
                return message
            end,
        },
    }, neotest_ns)
    require("neotest").setup({
        adapters = {
            require("neotest-zig"),
            require("neotest-go"),
            require("neotest-dart")({
                command = "flutter",
                use_lsp = true,
            }),
            require("neotest-rust")({
                dap_adapter = "lldb",
            }),
        },
    })
end

M.snippet = function()
    -- lazy-load snippets from my-snippets folder
    require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.config/nvim/my_snippets" })
    -- lazy-load default snippets
    require("luasnip.loaders.from_vscode").lazy_load()
end

M.blankline = function()
    vim.opt.termguicolors = true
    -- vim.opt.list = true
    require("ibl").setup({
        indent = {
            char = { "|", "¦", "┆", "┊" },
        },
        whitespace = { highlight = { "Whitespace" } },
        -- whitespace = { highlight = { "Whitespace", "NonText" } },
        scope = { enabled = true },
    })
end

M.monokai = function()
    local monokai = require("monokai")
    local palette = monokai.pro
    monokai.setup({
        palette = palette,
        custom_hlgroups = {
            ["@comment"] = {
                fg = palette.base6,
                -- style = 'NONE',
            },
            ["@function"] = {
                fg = palette.green,
                style = "NONE",
            },
            ["@keyword.function"] = {
                fg = palette.aqua,
                style = "NONE",
            },
            ["@keyword"] = {
                fg = palette.pink,
                style = "NONE",
            },
            ["@function.builtin"] = {
                fg = palette.aqua,
                style = "italic",
            },
            ["@type.builtin"] = {
                fg = palette.aqua,
                style = "italic",
            },
            ["@method.call"] = {
                fg = palette.green,
            },
        },
    })

    vim.api.nvim_set_hl(0, "NormalFloat", { fg = "#fff1f3", bg = "#26292c" })
end

M.noice = function()
    require("noice").setup({
        lsp = {
            -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
            },
        },
        -- you can enable a preset for easier configuration
        presets = {
            bottom_search = false, -- use a classic bottom cmdline for search
            command_palette = true, -- position the cmdline and popupmenu together
            long_message_to_split = true, -- long messages will be sent to a split
            inc_rename = false, -- enables an input dialog for inc-rename.nvim
            lsp_doc_border = false, -- add a border to hover docs and signature help
        },
        views = {
            cmdline_popup = {
                position = {
                    row = "20%",
                    col = "50%",
                },
                size = {
                    width = 60,
                    height = "auto",
                },
            },
        },
    })
end

return M
