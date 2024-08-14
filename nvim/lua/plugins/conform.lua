return {
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        config = function()
            require("conform").setup({
                -- Define your formatters
                formatters_by_ft = {
                    lua = { "stylua" },
                    go = { "goimports", "gofmt" },
                    python = function(bufnr)
                        if require("conform").get_formatter_info("ruff_format", bufnr).available then
                            return { "ruff_format" }
                        else
                            return { "isort", "black" }
                        end
                    end,
                    javascript = { { "prettierd", "prettier" } },
                    html = { { "prettierd", "prettier" } },
                    markdown = { "prettier" },
                    json = { "jq" },
                    just = { "just" },
                    sh = { "shfmt" },
                    zig = { "zigfmt" },
                    xml = { "xmllint" },
                    swift = { "swiftformat" },
                    proto = { "buf" },
                    toml = { "taplo" },
                    rust = { "rustfmt" },
                    yaml = { "yamlfmt" },
                },
                -- Set up format-on-save
                format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
                -- Customize formatters
                formatters = {
                    shfmt = {
                        prepend_args = { "-i", "2" },
                    },
                },
            })
        end,
    },
}
