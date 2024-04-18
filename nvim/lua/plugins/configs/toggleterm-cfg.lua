local M = {}
M.setup = function()
    require("toggleterm").setup({
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
        direction = "horizontal", ---'vertical' | 'horizontal' | 'window' | 'float',
        close_on_exit = true, -- close the terminal wndow when the process exits
        shell = vim.o.shell, -- change the default shell
        -- This field is only relevant if direction is set to 'float'
        float_opts = {
            border = "curved", --'single' | 'double' | 'shadow' | 'curved'
            winblend = 3,
            highlights = {
                border = "Normal",
                background = "Normal",
            },
        },
    })
    -- 集成lazygit
    -- local Terminal = require('toggleterm.terminal').Terminal
    -- local lazygit = Terminal:new({
    --   cmd = "lazygit",
    --   hidden = true,
    --   direction = "float"
    -- })

    -- After Neovim 0.7, can use after:
    -- vim.api.nvim_set_keymap("n", "<c-g>", "", {
    --   noremap = true,
    --   silent = true,
    --   callback = function()
    --     lazygit:toggle()
    --   end
    -- })

    -- Terminal window mappings, it can be helpful to make moving in and out of a terminal
    function _G.set_terminal_keymaps()
        local opts = { buffer = 0 }
        vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
        -- vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
        vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
        vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
        vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
        vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
        vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
    end

    -- if you only want these mappings for toggle term use term://*toggleterm#* instead
    vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
end
return M
