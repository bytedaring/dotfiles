"
" https://github.com/kyazdani42/nvim-tree.lua
"
" if !exists('g:loaded_nvim_tree') | finish | endif


" let g:nvim_tree_group_empty = 1
" let g:nvim_tree_change_dir_global = 1

let g:nvim_tree_respect_buf_cwd = 1 "0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_disable_window_picker = 0 "0 by default, will disable the window picker.

" default will show icon by default if no icon is provided
" default shows no icon by default
let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'arrow_open': "",
    \   'arrow_closed': "",
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   }
    \ }

lua << EOF
-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
require'nvim-tree'.setup {
    disable_netrw       = true,
    hijack_netrw        = true,
    open_on_setup       = true,
    ignore_ft_on_setup  = {},
    auto_close          = true,
    open_on_tab         = false,
    hijack_cursor       = false,
    update_cwd          = true,
    update_to_buf_dir   = {
        enable = true,
        auto_open = true,
    },
    diagnostics = {
        enable = false,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
         }
    },
    update_focused_file = {
        enable      = true,
        update_cwd  = true,
        ignore_list = {}
    },
    system_open = {
        cmd  = nil,
        args = {}
    },
    filters = {
        dotfiles = true,
        custom = {}
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 300,
    },
    view = {
        width = 40,
        height = 30,
        hide_root_folder = false,
        side = 'left',
        auto_resize = true,
        mappings = {
            custom_only = false,
            list = {}
        },
        number = false,
        relativenumber = false,
        signcolumn = "yes"
    },
    trash = {
        cmd = "trash",
        require_confirm = true
    }
}
EOF

