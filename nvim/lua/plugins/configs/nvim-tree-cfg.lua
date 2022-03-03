--
--  https://github.com/kyazdani42/nvim-tree.lua
--

local g = vim.g
g.nvim_tree_respect_buf_cwd = 1
g.nvim_tree_indent_markers = 1

require'nvim-tree'.setup {
    disable_netrw       = true,
    hijack_netrw        = true,
    open_on_setup       = true,
    auto_close          = true,
    open_on_tab         = false,
    hijack_cursor       = false,
    update_cwd          = true,
    update_focused_file = {
        enable      = true,
        update_cwd  = false,
        ignore_list = {}
    },
    git = {
        timeout = 300,
    },
    view = {
        width = 40,
    },
    filters = {
        dotfiles = true

    }
}


