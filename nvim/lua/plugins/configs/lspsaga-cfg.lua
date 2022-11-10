local M = {}
M.config = function()
  local saga = require 'lspsaga'
  saga.init_lsp_saga({
    border_style = 'bold',
    symbol_in_winbar = {
      in_custom = false,
      separator = ' > ',
      enable = true
    },
  })

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

  -- Outline
  vim.keymap.set("n", "<leader>o", "<cmd>AerialToggle<CR>", { silent = true })

  -- peek definition
  vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)

  -- jump diagnostic
  vim.keymap.set("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
  vim.keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
  vim.keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)

end
return M
