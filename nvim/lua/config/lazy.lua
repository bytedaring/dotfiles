local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = { { import = "plugins" } },
    defaults = {
        lazy = true,
    },
    install = {
        colorscheme = { "catppuccin", "tokyonight" },
    },
    checker = { enable = true },
    performance = {
        -- disable some rtp plugins
        rtp = {
            disabled_plugins = {
                "2html_plugin",
                "getscriptPlugin",
                "getscript",
                "gzip",
                "logiPat",
                "matchparen",
                "matchit",
                "netrw",
                "netrwPlugin",
                "netrwSettings",
                "netrwFileHandlers",
                "remote_plugins",
                "rrhelper",
                "tar",
                "tarPlugin",
                "tutor_mode_plugin",
                "vimball",
                "vimballPlugin",
                "zip",
                "zipPlugin",
            },
        },
    },
})
