return {
    -- LSP plugin
    {
        "glepnir/lspsaga.nvim",
        event = "LspAttach",
        branch = "main",
        config = function()
            require("lspsaga").setup({
                ui = {
                    border = "rounded",
                    title = true,
                    code_action = "",
                    -- kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
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
        end,
    },
}
