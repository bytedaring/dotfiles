return {
    -- completely replaces the UI
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
                    lsp_doc_border = true, -- add a border to hover docs and signature help
                },
                views = {
                    mini = {
                        win_options = {
                            winblend = 0,
                        },
                    },
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
        end,
    },
}
