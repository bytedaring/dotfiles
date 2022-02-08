"
" 空白缩进
" https://github.com/lukas-reineke/indent-blankline.nvim
"
lua << EOF

vim.opt.list = true

require("indent_blankline").setup {
    show_end_of_line = true,
    space_char_blankline = " ",
    -- 显示当前起始行
    -- show_current_context_start = true,
    -- 显示当前起始块
    show_current_context = true,
}
EOF

