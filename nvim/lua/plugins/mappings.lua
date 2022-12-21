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
map('n', 'fc', [[<Cmd>Telescope<CR>]], { noremap = true, silent = true })

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
map('n', '<F9>', [[<Cmd>GoDebug -b<CR>]], { noremap = true, silent = true })
map('n', '<leader>dd', [[<Cmd>GoDebug<CR>]], { noremap = true, silent = true })
map('n', '<leader>dx', [[<Cmd>GoDebug -s<CR>]], { noremap = true, silent = true })
map('n', '<leader>dt', [[<Cmd>GoDebug -t<CR>]], { noremap = true, silent = true })
map('n', '<leader>t', [[<Cmd>TestFile -strategy=neovim<CR>]], { noremap = true, silent = true })

-- vim-illuminate
map('n', ']r', '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>', { noremap = true })
map('n', '[r', '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>', { noremap = true })

-- Outline
map("n", "<leader>o", "<cmd>AerialToggle<CR>", { noremap = true, silent = true })

-- lspsaga
local opts = { noremap = true, silent = true }
-- lsp finder to find the cursor word definition and reference
vim.keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", opts)
-- code action
vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
vim.keymap.set("v", "<leader>ca", "<cmd><C-U>Lspsaga range_code_action<CR>", opts)
-- code lens action
vim.keymap.set("n", "<leader>la", "<cmd>lua vim.lsp.codelens.run()<CR>", opts)
-- show hover doc and press twice will jump to hover window
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
-- rename
vim.keymap.set("n", "gr", "<cmd>Lspsaga rename<CR>", opts)
-- peek definition
vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)
-- jump diagnostic
vim.keymap.set("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
