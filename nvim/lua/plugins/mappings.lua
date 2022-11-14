--
-- Description: Keymaps
--
local map = vim.api.nvim_set_keymap

-- M.symbol = function()
--   map('n', '<F7>', [[<Cmd>:SymbolsOutline<CR>]], { noremap = true, silent = true })
-- end

-- telescope
-- Find files using Telescope command-line sugar.
map('n', 'ff', [[<Cmd>Telescope find_files<CR>]], { noremap = true, silent = true })
map('n', 'fg', [[<Cmd>Telescope live_grep<CR>]], { noremap = true, silent = true })
map('n', 'fb', [[<Cmd>Telescope buffers<CR>]], { noremap = true, silent = true })
map('n', 'fh', [[<Cmd>Telescope help_tags<CR>]], { noremap = true, silent = true })
map('n', 'fn', [[<Cmd>bNext<CR>]], { noremap = true, silent = true })
map('n', 'fp', [[<Cmd>bprevious<CR>]], { noremap = true, silent = true })
map('n', 'fo', [[<Cmd>Telescope oldfiles<CR>]], { noremap = true, silent = true })

-- todo-comments.nvim
map('n', 'ft', [[<cmd>TodoTelescope<CR>]], { noremap = true, silent = true })

-- nvim-tree NvimTreeFindFileToggle
-- nnoremap fi :<C-u>:NvimTreeFindFileToggle<CR>
map('n', '<C-b>', [[<Cmd>NvimTreeToggle<CR>]], { noremap = true, silent = true })

-- vimspector
map('n', '<leader>dd', [[<Cmd>:call vimspector#Launch()<CR>]], { noremap = true, silent = true })
map('n', '<leader>dx', [[<Cmd>:VimspectorReset<CR>]], { noremap = true, silent = true })
map('n', '<leader>de', [[<Cmd>:VimspectorEval<CR>]], { noremap = true, silent = true })
map('n', '<leader>dw', [[<Cm>:VimspectorWatch<CR>]], { noremap = true, silent = true })
map('n', '<leader>do', [[<Cmd>:VimspectorShowOutput<CR>]], { noremap = true, silent = true })

-- Trouble
map('n', '<leader>xx', [[<Cmd>TroubleToggle<CR>]], { noremap = true, silent = true })
map('n', '<leader>xw', [[<Cmd>TroubleToggle workspace_diagnostics<CR>]], { noremap = true, silent = true })
map('n', '<leader>xd', [[<Cmd>TroubleToggle document_diagnostics<CR>]], { noremap = true, silent = true })
map('n', '<leader>xq', [[<Cmd>TroubleToggle quickfix<CR>]], { noremap = true, silent = true })
map('n', '<leader>xl', [[<Cmd>TroubleToggle loclist<CR>]], { noremap = true, silent = true })

-- ToggleTerm
map('n', '<C-\\>', [[<Cmd>ToggleTerm<CR>]], { noremap = true, silent = true })

-- go.nvim
map('n', '<F9>', [[<Cmd>GoBreakToggle<CR>]], { noremap = true, silent = true })
map('n', '<leader>dd', [[<Cmd>GoDebug<CR>]], { noremap = true, silent = true })
map('n', '<leader>dx', [[<Cmd>GoDebug -s<CR>]], { noremap = true, silent = true })
map('n', '<leader>dt', [[<Cmd>GoDebug -t<CR>]], { noremap = true, silent = true })
map('n', '<leader>t', [[<Cmd>TestFile -strategy=neovim<CR>]], { noremap = true, silent = true })
-- vim.cmd [[
--     autocmd!
--     autocmd FileType go nmap <F9> :GoBreakToggle<CR>
--     autocmd FileType go nmap <leader>dd :GoDebug<CR>
--     autocmd FileType go nmap <leader>dx :GoDebug -s<CR>
--     autocmd FileType go nmap <leader>dt :GoDebug -t<CR>
--     autocmd FileType go nmap <leader>t :TestFile -strategy=neovim<CR>
--   ]]

-- bufferline
-- map('n', 'b]', [[<Cmd>BufferLineCycleNext<CR>]], { noremap = true, silent = true })
-- map('n', 'b[', [[<Cmd>BufferLineCyclePrev<CR>]], { noremap = true, silent = true })

-- Null-ls
-- map('n', '<space>f', [[<Cmd>lua vim.lsp.buf.format{async = true}<CR>]], { noremap = true, silent = true })

-- vim-illuminate
map('n', ']r', '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>', { noremap = true })
map('n', '[r', '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>', { noremap = true })
