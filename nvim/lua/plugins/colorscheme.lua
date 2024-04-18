return {
    -- colorscheme
    {
        "rebelot/kanagawa.nvim",
        priority = 1000, -- Ensure it loads first
        lazy = true,
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
        lazy = true,
        priority = 1000,
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
    {
        "ellisonleao/gruvbox.nvim",
        lazy = true,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme gruvbox]])
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
    --     -- config = require("plugins-bk.configs.others").monokai
    -- },
}
