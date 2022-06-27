--
-- Description: Keymaps
--
local map = vim.api.nvim_set_keymap

local M = {}
M.symbol = function ()
  map('n', '<F7>', [[<Cmd>:SymbolsOutline<CR>]], {noremap = true, silent = true })
end

-- Find files using Telescope command-line sugar.
M.telescope = function ()
  map('n', 'ff', [[<Cmd>Telescope find_files<CR>]], { noremap = true, silent = true })
  map('n', 'fg', [[<Cmd>Telescope live_grep<CR>]], { noremap = true, silent = true })
  map('n', 'fb', [[<Cmd>Telescope buffers<CR>]], { noremap = true, silent = true })
  map('n', 'fh', [[<Cmd>Telescope help_tags<CR>]], { noremap = true, silent = true })
end

-- todo-comments.nvim
M.todo = function ()
  map('n', 'ft', [[<cmd>TodoTelescope<CR>]], { noremap = true, silent = true })
end

-- nvim-tree NvimTreeFindFileToggle
-- nnoremap fi :<C-u>:NvimTreeFindFileToggle<CR>
M.nvimtree = function ()
  map('n', '<C-b>', [[<Cmd>NvimTreeToggle<CR>]], { noremap = true, silent = true })
end

-- vimspector
M.vimspector = function ()
  map('n','<leader>dd', [[<Cmd>:call vimspector#Launch()<CR>]], { noremap = true, silent = true })
  map('n','<leader>dx', [[<Cmd>:VimspectorReset<CR>]], { noremap = true, silent = true })
  map('n','<leader>de', [[<Cmd>:VimspectorEval<CR>]],  { noremap = true, silent = true })
  map('n','<leader>dw', [[<Cm>:VimspectorWatch<CR>]], { noremap = true, silent = true })
  map('n','<leader>do', [[<Cmd>:VimspectorShowOutput<CR>]], { noremap = true, silent = true })
end

-- Trouble
M.trouble = function ()
  map('n','<leader>xx', [[<Cmd>TroubleToggle<CR>]], { noremap = true, silent = true })
  map('n','<leader>xw', [[<Cmd>TroubleToggle workspace_diagnostics<CR>]], { noremap = true, silent = true })
  map('n','<leader>xd', [[<Cmd>TroubleToggle document_diagnostics<CR>]], { noremap = true, silent = true })
  map('n','<leader>xq', [[<Cmd>TroubleToggle quickfix<CR>]], { noremap = true, silent = true })
  map('n','<leader>xl', [[<Cmd>TroubleToggle loclist<CR>]], { noremap = true, silent = true })
end

-- ToggleTerm
M.toggleTerm = function ()
  map('n','<C-\\>', [[<Cmd>ToggleTerm<CR>]], {noremap = true, silent = true })
end

--------------------- autocmd for go.nvim --------------------
M.gonvim = function ()
  vim.cmd [[
    autocmd!
    autocmd FileType go nmap <F9> :GoBreakToggle<CR>
    autocmd FileType go nmap <leader>dd :GoDebug<CR>
    autocmd FileType go nmap <leader>dx :GoDebug -s<CR>
    autocmd FileType go nmap <leader>dt :GoDebug -t<CR>
    autocmd FileType go nmap <leader>t :Ultest<CR>
  ]]
end

-- bufferline
M.bufferline = function ()
  map('n', 'b]', [[<Cmd>BufferLineCycleNext<CR>]], { noremap = true, silent = true})
  map('n', 'b[', [[<Cmd>BufferLineCyclePrev<CR>]], { noremap = true, silent = true})
end

return M
