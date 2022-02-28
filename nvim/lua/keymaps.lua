--
-- Description: Keymaps
--
local map = vim.api.nvim_set_keymap

map('n', '<F7>', [[<Cmd>:SymbolsOutline<CR>]], {noremap = true, silent = true })

-- Find files using Telescope command-line sugar.
map('n', 'ff', [[<Cmd>Telescope find_files<CR>]], { noremap = true, silent = true })
map('n', 'fg', [[<Cmd>Telescope live_grep<CR>]], { noremap = true, silent = true })
map('n', 'fb', [[<Cmd>Telescope buffers<CR>]], { noremap = true, silent = true })
map('n', 'fh', [[<Cmd>Telescope help_tags<CR>]], { noremap = true, silent = true })

-- nvim-tree NvimTreeFindFileToggle
-- nnoremap fi :<C-u>:NvimTreeFindFileToggle<CR>
map('n', 'fi', [[<Cmd>NvimTreeToggle<CR>]], { noremap = true, silent = true })

-- vimspector
map('n','<leader>dd', [[<Cmd>:call vimspector#Launch()<CR>]], { noremap = true, silent = true })
map('n','<leader>dx', [[<Cmd>:VimspectorReset<CR>]], { noremap = true, silent = true })
map('n','<leader>de', [[<Cmd>:VimspectorEval<CR>]],  { noremap = true, silent = true })
map('n','<leader>dw', [[<Cmd>:VimspectorWatch<CR>]], { noremap = true, silent = true })
map('n','<leader>do', [[<Cmd>:VimspectorShowOutput<CR>]], { noremap = true, silent = true })


-- Trouble
map('n','<leader>xx', [[<Cmd>TroubleToggle<CR>]], { noremap = true, silent = true })
map('n','<leader>xw', [[<Cmd>TroubleToggle workspace_diagnostics<CR>]], { noremap = true, silent = true })
map('n','<leader>xd', [[<Cmd>TroubleToggle document_diagnostics<CR>]], { noremap = true, silent = true })
map('n','<leader>xq', [[<Cmd>TroubleToggle quickfix<CR>]], { noremap = true, silent = true })
map('n','<leader>xl', [[<Cmd>TroubleToggle loclist<CR>]], { noremap = true, silent = true })


-- -- Nvim-dap
-- local dap, dapui = require("dap"), require("dapui")
-- dap.listeners.after.event_initialized["dapui_config"] = function()
--     dapui.open()
-- end
-- dap.listeners.before.event_terminated["dapui_config"] = function()
--     -- dapui.close()
-- end
-- dap.listeners.before.event_exited["dapui_config"] = function()
--     -- dapui.close()
-- end
--
-- map('n', '<F5>', [[<Cmd>lua require'dap'.continue()<CR>]], { noremap = true, silent = true })
-- map('n', '<F10>', [[<Cmd>lua require'dap'.step_over()<CR>]], { noremap = true, silent = true })
-- map('n', '<F11>', [[<Cmd>lua require'dap'.step_into()<CR>]], { noremap = true, silent = true })
-- map('n', '<F12>', [[<Cmd>lua require'dap'.step_out()<CR>]], { noremap = true, silent = true })
-- map('n', '<F9>', [[<Cmd>lua require'dap'.toggle_breakpoint()<CR>]], { noremap = true, silent = true })
-- nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
-- nnoremap <silent> <F10> :lua require'dap'.step_over()<CR>
-- nnoremap <silent> <F11> :lua require'dap'.step_into()<CR>
-- nnoremap <silent> <F12> :lua require'dap'.step_out()<CR>
-- nnoremap <silent> <leader>b :lua require'dap'.toggle_breakpoint()<CR>
-- nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
-- nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
-- nnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>
-- nnoremap <silent> <leader>dl :lua require'dap'.run_last()<CR>
