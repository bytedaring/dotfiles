return {
    -- go
    {
        "ray-x/go.nvim",
        ft = "go",
        dependencies = "ray-x/guihua.lua",
        config = function()
            require("go").setup({
                lsp_cfg = false,
                lsp_keymaps = true,
                go = "go1.19",
                icons = { breakpoint = "🍄", currentpos = "🔥" }, --🔴🤡🌕🚨
                run_in_floaterm = false,
                dap_debug_vt = false,
                dap_debug_gui = {
                    layouts = {
                        {
                            -- You can change the order of elements in the sidebar
                            elements = {
                                -- Provide IDs as strings or tables with "id" and "size" keys
                                { id = "scopes", size = 0.25 },
                                { id = "breakpoints", size = 0.25 },
                                { id = "stacks", size = 0.25 },
                                { id = "watches", size = 0.25 },
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
                },
            })
        end,
    },
}
