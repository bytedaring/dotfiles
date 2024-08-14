return {
    -- lint
    {
        "mfussenegger/nvim-lint",
        event = "VeryLazy",
        config = function()
            require("lint").linters_by_ft = {
                go = { "golangcilint" },
                sh = { "shellcheck" },
                -- yaml = { "yamllint" },
                html = { "eslint" },
                javascript = { "eslint" },
                dockerfile = { "hadolint" },
                markdown = { "markdownlint" },
                -- markdown = { "markdownlint", "vale" },
                swift = { "swiftlint" },
                python = { "ruff" },
                proto = { "buf_lint" },
            }
            vim.api.nvim_create_autocmd({ "BufRead", "BufWritePost" }, {
                callback = function()
                    require("lint").try_lint()
                end,
            })
        end,
    },
}
