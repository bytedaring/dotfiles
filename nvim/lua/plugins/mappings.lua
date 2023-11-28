--
-- Description: Keymaps
--
-- local map = vim.api.nvim_set_keymap
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- M.symbol = function()
--   map('n', '<F7>', [[<Cmd>:SymbolsOutline<CR>]], { noremap = true, silent = true })
-- end

-- telescope
-- Find files using Telescope command-line sugar.
keymap.set('n', 'ff', [[<Cmd>Telescope find_files<CR>]], opts)
keymap.set('n', 'fg', [[<Cmd>Telescope live_grep<CR>]], opts)
keymap.set('n', 'fb', [[<Cmd>Telescope buffers<CR>]], opts)
keymap.set('n', 'fs', [[<Cmd>Telescope grep_string<CR>]], opts)
-- keymap.set('n', 'fh', [[<Cmd>Telescope help_tags<CR>]], { noremap = true, silent = true })
keymap.set('n', 'fn', [[<Cmd>bNext<CR>]], opts)
keymap.set('n', 'fp', [[<Cmd>bprevious<CR>]], opts)
keymap.set('n', 'fh', [[<Cmd>Telescope oldfiles<CR>]], opts)
keymap.set('n', 'fc', [[<Cmd>Telescope commands<CR>]], opts)
keymap.set('n', 'fk', [[<Cmd>Telescope keymaps<CR>]], opts)
keymap.set('n', 'fa', [[<Cmd>Telescope<CR>]], opts)
keymap.set('n', 'fo', [[<Cmd>Telescope lsp_document_symbols<CR>]], opts)
keymap.set('n', 'fr', [[<Cmd>Telescope lsp_references<CR>]], opts)
keymap.set('n', 'fm', [[<Cmd>Telescope marks<CR>]], opts)

-- todo-comments.nvim
keymap.set('n', 'ft', [[<cmd>TodoTelescope<CR>]], opts)

-- nvim-tree NvimTreeFindFileToggle
-- nnorekeymap.set fi :<C-u>:NvimTreeFindFileToggle<CR>
-- keymap.set('n', '<C-b>', [[<Cmd>NvimTreeToggle<CR>]], opts)
keymap.set('n', '<C-b>', [[<Cmd>Neotree toggle reveal<CR>]], opts)

-- vimspector
-- keymap.set('n', '<leader>dd', [[<Cmd>:call vimspector#Launch()<CR>]], opts)
-- keymap.set('n', '<leader>dx', [[<Cmd>:VimspectorReset<CR>]], opts)
-- keymap.set('n', '<leader>de', [[<Cmd>:VimspectorEval<CR>]], opts)
-- keymap.set('n', '<leader>dw', [[<Cm>:VimspectorWatch<CR>]], opts)
-- keymap.set('n', '<leader>do', [[<Cmd>:VimspectorShowOutput<CR>]], opts)

-- Trouble
keymap.set('n', '<leader>xx', function () require("trouble").open() end, opts)
keymap.set('n', '<leader>xw', function () require("trouble").open("workspace_diagnostics") end, opts)
keymap.set('n', '<leader>xd', function () require("trouble").open("document_diagnostics") end, opts)
keymap.set('n', '<leader>xq', function () require("trouble").open("quickfix") end, opts)
keymap.set('n', '<leader>xl', function () require("trouble").open("loclist") end, opts)

-- ToggleTerm
keymap.set('n', '<C-\\>', [[<Cmd>ToggleTerm direction=float<CR>]], opts)
keymap.set('n', '<CS-\\>', function ()
  if vim.g.toggleTerm_direction == 'horizontal' then
    vim.cmd [[ToggleTerm direction=float]]
    vim.g.toggleTerm_direction = 'float'
  else
    vim.cmd [[ToggleTerm direction=horizontal]]
    vim.g.toggleTerm_direction = 'horizontal'
  end
end, opts)
keymap.set('n', '<leader>s', [[<Cmd>ToggleTermSendVisualLines<CR>]], opts)

-- go.nvim
keymap.set('n', '<F9>', [[<Cmd>GoDebug -b<CR>]], opts)
keymap.set('n', '<leader>dd', function ()
  if 'zig' == vim.bo.filetype or 'rust' == vim.bo.filetype then
    vim.cmd [[DapContinue]]
  elseif 'flutter' == vim.bo.filetype then
    vim.cmd [[FlutterRun]]
    -- elseif 'rust' == vim.bo.filetype then
    -- require('rust-tools').hover_actions.hover_actions()
  else
    vim.cmd [[GoDebug]]
  end
end, opts)
keymap.set('n', '<leader>dx', [[<Cmd>GoDebug -s<CR>]], opts)
keymap.set('n', '<leader>dt', [[<Cmd>GoDebug -t<CR>]], opts)

-- Outline
-- keymap.set("n", "<leader>o", "<cmd>AerialToggle<CR>", opts)
keymap.set("n", "<leader>o", function ()
  if vim.fn.exists(':FlutterOutlineToggle') > 0 and ('dart' == vim.bo.filetype or 'flutterToolsOutline' == vim.bo.filetype) then
    vim.cmd [[FlutterOutlineToggle]]
  else
    vim.cmd [[Lspsaga outline]]
  end
end, opts)

-- lspsaga
-- lsp finder to find the cursor word definition and reference
keymap.set("n", "gh", "<cmd>Lspsaga finder def+ref<CR>", opts)
-- find definition and implementation
keymap.set("n", "gi", "<cmd>Lspsaga finder def+imp<CR>", opts)
-- code action
keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
keymap.set("v", "<leader>ca", "<cmd><C-U>Lspsaga range_code_action<CR>", opts)
-- code lens action
-- keymap.set("n", "<leader>la", "<cmd>lua vim.lsp.codelens.run()<CR>", opts)
keymap.set("n", "<leader>la", "<cmd>GoCodeLenAct<CR>", opts)
-- show hover doc and press twice will jump to hover window
keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
-- rename
keymap.set("n", "gr", "<cmd>Lspsaga rename<CR>", opts)
-- goto definition
keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>", opts)
-- peek type definition
keymap.set("n", "gP", "<cmd>Lspsaga peek_type_definition<CR>")
-- peek definition
keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>", opts)
-- jump diagnostic
keymap.set("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)

--lazygit.nvim
-- keymap.set('n', '<c-g>', "<cmd>LazyGit<CR>", opts)

--gx open URL in browser
keymap.set('n', 'gx', "<cmd>silent !open <cWORD><CR>", opts)

--neotest_
keymap.set('n', '<leader>ts', [[<Cmd>NeotestToggleSummary<CR>]], opts)
keymap.set('n', '<leader>to', [[<Cmd>NeotestToggleOutputPanel<CR>]], opts)
keymap.set('n', '<leader>tr', [[<Cmd>NeotestRun<CR>]], opts)
keymap.set('n', '<leader>tf', [[<Cmd>NeotestRunFile<CR>]], opts)

--format
keymap.set('n', '<space>f', function ()
  if 'xml' == vim.bo.filetype then
    vim.cmd [[%!xmllint % --format ]]
  elseif 'css' == vim.bo.filetype or 'html' == vim.bo.filetype then
    vim.cmd [[Format]]
  else
    vim.lsp.buf.format { async = true }
  end
end, opts)
