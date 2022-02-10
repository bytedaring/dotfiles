lua << EOF

require'symbols-outline'.setup{
    auto_close = true,
    width = 45,
}


set_symbols_outline_state = function()
  vim.g['symbols_outline_state'] = require('symbols-outline').state
end

EOF

" auto close symbols-outline window when it is the last window
autocmd BufEnter * :lua set_symbols_outline_state()
autocmd BufEnter * if winnr('$') == 1 && exists('g:symbols_outline_state.outline_buf') && g:symbols_outline_state.outline_buf | quit | endif
