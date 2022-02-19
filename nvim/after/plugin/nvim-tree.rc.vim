"
" https://github.com/kyazdani42/nvim-tree.lua
"

let g:nvim_tree_respect_buf_cwd = 1 
let g:nvim_tree_indent_markers = 1 
let g:nvim_tree_disable_window_picker = 0 

lua << EOF
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
        update_cwd  = true,
        ignore_list = {}
    },
    git = {
        timeout = 300,
    },
    view = {
        width = 40,
    },
}
EOF

