" if !exists('g:loaded_lualine') | finish | endif

lua << EOF

require('lualine').setup()

EOF
