require'symbols-outline'.setup{
    auto_close = true,
    width = 45,
}


set_symbols_outline_state = function()
  vim.g['symbols_outline_state'] = require('symbols-outline').state
end

