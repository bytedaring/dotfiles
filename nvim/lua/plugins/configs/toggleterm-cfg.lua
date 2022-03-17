require("toggleterm").setup{
    size = 15,
    open_mapping = [[<c-\>]],
    hide_numbers = true, -- hide the number column in toggleterm buffers
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
    start_in_insert = true,
    insert_mappings = true, -- whether or not the open mapping applies in insert mode
    terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
    persist_size = true,
    direction = 'float', ---'vertical' | 'horizontal' | 'window' | 'float',
    close_on_exit = true, -- close the terminal wndow when the process exits
    shell = vim.o.shell, -- change the default shell
    -- This field is only relevant if direction is set to 'float'
    float_opts = {
        border = 'curved', --'single' | 'double' | 'shadow' | 'curved'
        winblend = 0,
        highlights = {
            border = "Normal",
            background = "Normal",
        }
    }
}

-- 集成lazygit
local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
    cmd = "lazygit",
    hidden = true,
    direction = "float"})

function _G.lazygit_toggle_term()
    lazygit:toggle()
end
vim.api.nvim_set_keymap("n", "<c-g>", "<cmd> lua lazygit_toggle_term()<CR>", {noremap = true, silent = true })

