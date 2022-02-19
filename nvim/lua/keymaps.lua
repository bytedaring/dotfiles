--
-- Description: Keymaps
--
local map = vim.api.nvim_set_keymap

map('n', '<F7>', [[<Cmd>:SymbolsOutline<CR>]], {noremap = true, silent = true })

-- Find files using Telescope command-line sugar.
map('n', 'ff', [[<Cmd>Telescope find_files<CR>]], { noremap = true, silent = true })
map('n', 'fg', [[<Cmd>Telescope live_grep<CR>]], { noremap = true, silent = true })
map('n', 'fh', [[<Cmd>Telescope buffers<CR>]], { noremap = true, silent = true })
map('n', 'fp', [[<Cmd>Telescope help_tags<CR>]], { noremap = true, silent = true })

-- nvim-tree NvimTreeFindFileToggle
-- nnoremap fi :<C-u>:NvimTreeFindFileToggle<CR>
map('n', 'fi', [[<Cmd>NvimTreeToggle<CR>]], { noremap = true, silent = true })

-- vimspector
map('n','<leader>dd', [[<Cmd>:call vimspector#Launch()<CR>]],{ noremap = true, silent = true })
map('n','<leader>dx', [[<Cmd>:VimspectorReset<CR>,{ noremap = true, silent = true })
map('n','<leader>de', [[<Cmd>:VimspectorEval<CR>]], { noremap = true, silent = true })
map('n','<leader>dw', [[<Cmd>:VimspectorWatch<CR>]], { noremap = true, silent = true })
map('n','<leader>do', [[<Cmd>:VimspectorShowOutput<CR>]], { noremap = true, silent = true })

-- Trouble
map('n','<leader>xx', [[<Cmd>TroubleToggle<CR>]], { noremap = true, silent = true })
map('n','<leader>xw', [[<Cmd>TroubleToggle workspace_diagnostics<CR>]], { noremap = true, silent = true })
map('n','<leader>xd', [[<Cmd>TroubleToggle document_diagnostics<CR>]], { noremap = true, silent = true })
map('n','<leader>xq', [[<Cmd>TroubleToggle quickfix<CR>]], { noremap = true, silent = true })
map('n','<leader>xl', [[<Cmd>TroubleToggle loclist<CR>]], { noremap = true, silent = true })
