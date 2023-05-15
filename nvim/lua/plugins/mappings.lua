--
-- Description: Keymaps
--
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- M.symbol = function()
--   map('n', '<F7>', [[<Cmd>:SymbolsOutline<CR>]], { noremap = true, silent = true })
-- end

-- telescope
-- Find files using Telescope command-line sugar.
map('n', 'ff', [[<Cmd>Telescope find_files<CR>]], opts)
map('n', 'fg', [[<Cmd>Telescope live_grep<CR>]], opts)
map('n', 'fb', [[<Cmd>Telescope buffers<CR>]], opts)
map('n', 'fs', [[<Cmd>Telescope grep_string<CR>]], opts)
map('n', 'fh', [[<Cmd>Telescope help_tags<CR>]], { noremap = true, silent = true })
map('n', 'fn', [[<Cmd>bNext<CR>]], opts)
map('n', 'fp', [[<Cmd>bprevious<CR>]], opts)
map('n', 'fh', [[<Cmd>Telescope oldfiles<CR>]], opts)
map('n', 'fc', [[<Cmd>Telescope<CR>]], opts)
map('n', 'fo', [[<Cmd>Telescope lsp_document_symbols<CR>]], opts)
map('n', 'fr', [[<Cmd>Telescope lsp_references<CR>]], opts)

-- todo-comments.nvim
map('n', 'ft', [[<cmd>TodoTelescope<CR>]], opts)

-- nvim-tree NvimTreeFindFileToggle
-- nnoremap fi :<C-u>:NvimTreeFindFileToggle<CR>
map('n', '<C-b>', [[<Cmd>NvimTreeToggle<CR>]], opts)

-- vimspector
map('n', '<leader>dd', [[<Cmd>:call vimspector#Launch()<CR>]], opts)
map('n', '<leader>dx', [[<Cmd>:VimspectorReset<CR>]], opts)
map('n', '<leader>de', [[<Cmd>:VimspectorEval<CR>]], opts)
map('n', '<leader>dw', [[<Cm>:VimspectorWatch<CR>]], opts)
map('n', '<leader>do', [[<Cmd>:VimspectorShowOutput<CR>]], opts)

-- Trouble
map('n', '<leader>xx', [[<Cmd>TroubleToggle<CR>]], opts)
map('n', '<leader>xw', [[<Cmd>TroubleToggle workspace_diagnostics<CR>]], opts)
map('n', '<leader>xd', [[<Cmd>TroubleToggle document_diagnostics<CR>]], opts)
map('n', '<leader>xq', [[<Cmd>TroubleToggle quickfix<CR>]], opts)
map('n', '<leader>xl', [[<Cmd>TroubleToggle loclist<CR>]], opts)

-- ToggleTerm
map('n', '<C-\\>', [[<Cmd>ToggleTerm<CR>]], opts)
vim.keymap.set('n', '<C-r>', [[<Cmd>ToggleTermSendVisualLines<CR>]], opts)

-- go.nvim
map('n', '<F9>', [[<Cmd>GoDebug -b<CR>]], opts)
map('n', '<leader>dd', [[<Cmd>GoDebug<CR>]], opts)
map('n', '<leader>dx', [[<Cmd>GoDebug -s<CR>]], opts)
map('n', '<leader>dt', [[<Cmd>GoDebug -t<CR>]], opts)

-- vim-illuminate
map('n', ']r', '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>', { noremap = true })
map('n', '[r', '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>', { noremap = true })

-- Outline
-- map("n", "<leader>o", "<cmd>AerialToggle<CR>", opts)
map("n", "<leader>o", "<cmd>Lspsaga outline<CR>", opts)

-- lspsaga
-- lsp finder to find the cursor word definition and reference
vim.keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", opts)
-- code action
vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
vim.keymap.set("v", "<leader>ca", "<cmd><C-U>Lspsaga range_code_action<CR>", opts)
-- code lens action
-- vim.keymap.set("n", "<leader>la", "<cmd>lua vim.lsp.codelens.run()<CR>", opts)
vim.keymap.set("n", "<leader>la", "<cmd>GoCodeLenAct<CR>", opts)
-- show hover doc and press twice will jump to hover window
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
-- rename
vim.keymap.set("n", "gr", "<cmd>Lspsaga rename<CR>", opts)
-- goto definition
vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts)
-- peek type definition
vim.keymap.set("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>")
-- peek definition
vim.keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>", opts)
-- jump diagnostic
vim.keymap.set("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)

--lazygit.nvim
vim.keymap.set('n', '<c-g>', "<cmd>LazyGit<CR>", opts)

--gx open URL in browser
vim.keymap.set('n', 'gx', "<cmd>silent !open <cWORD><CR>", opts)

--neotest_
vim.keymap.set('n', '<leader>ts', [[<Cmd>NeotestToggleSummary<CR>]], opts)
vim.keymap.set('n', '<leader>to', [[<Cmd>NeotestToggleOutputPanel<CR>]], opts)
vim.keymap.set('n', '<leader>tr', [[<Cmd>NeotestRun<CR>]], opts)
vim.keymap.set('n', '<leader>tf', [[<Cmd>NeotestRunFile<CR>]], opts)
