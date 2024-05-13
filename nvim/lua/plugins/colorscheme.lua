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
            vim.cmd([[colorscheme tokyonight-night]])
        end,
    },
    {
        "catppuccin/nvim",
        lazy = true,
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
            vim.cmd([[colorscheme carbonfox]])
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
    {
        "olimorris/onedarkpro.nvim",
        lazy = true,
        priority = 1000, -- Ensure it loads first
        config = function()
            vim.cmd([[colorscheme onedark_vivid]])
        end,
    },
    {
        "projekt0n/github-nvim-theme",
        lazy = true,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme github_dark_default]])
        end,
    },
    {
        "scottmckendry/cyberdream.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("cyberdream").setup({
                -- Recommended - see "Configuring" below for more config options
                transparent = true,
                italic_comments = true,
                hide_fillchars = true,
                borderless_telescope = true,
                terminal_colors = true,
            })
            vim.cmd("colorscheme cyberdream") -- set the colorscheme
        end,
    },
    {
        "tanvirtin/monokai.nvim",
        lazy = true,
        priority = 1000, -- Ensure it loads first
        config = function()
            vim.cmd("colorscheme monokai")
        end,
    },
}
