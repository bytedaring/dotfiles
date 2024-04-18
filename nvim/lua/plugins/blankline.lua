return {
    -- indentation guides to all lines
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "VeryLazy",
        main = "ibl",
        config = function()
            vim.opt.termguicolors = true
            -- vim.opt.list = true
            require("ibl").setup({
                indent = {
                    char = { "|", "¦", "┆", "┊" },
                },
                whitespace = { highlight = { "Whitespace" } },
                scope = { enabled = true, show_start = false, show_end = false },
            })
        end,
    },
}
