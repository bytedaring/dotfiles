local M = {}
M.config = function()
  local saga = require 'lspsaga'
  saga.init_lsp_saga()

  -- lsp finder to find the cursor word definition and reference
  vim.keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true, noremap = true })

  -- code action
  vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true, noremap = true })
  vim.keymap.set("v", "<leader>ca", "<cmd><C-U>Lspsaga range_code_action<CR>", { silent = true, noremap = true })

  -- show hover doc and press twice will jumpto hover window
  vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

  -- show signature help
  vim.keymap.set("n", "gs", "<Cmd>Lspsaga signature_help<CR>", { silent = true, noremap = true })

  -- rename
  vim.keymap.set("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true, noremap = true })

  -- preview definition
  vim.keymap.set("n", "gd", "<cmd>Lspsaga preview_definition<CR>", { silent = true })

  -- jump diagnositc
  vim.keymap.set("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true, noremap = true })
  vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true, noremap = true })
  vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true, noremap = true })

end
return M
