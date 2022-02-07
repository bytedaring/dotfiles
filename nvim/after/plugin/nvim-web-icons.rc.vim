" if !exists('g:loaded_nvim_web_icons') | finish | endif

lua << EOF

require'nvim-web-devicons'.setup {
    -- your personnal icons can go here (to override)
    -- you can specify color or cterm_color instead of specifying both of them
    -- DevIcon will be appended to `name`
    override = {
        fish = {
            icon = "",
            color = "#51a0cf",
            cterm_color = "66",
            name = "Fish"
        }
    };

    -- globally enable default icons (default to false)
    -- will get overriden by `get_icons` option
    default = true;
}

EOF
