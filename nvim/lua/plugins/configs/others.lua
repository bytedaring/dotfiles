local M = {}

M.signature = function()
  local function get_border_style(style, highlight)
    highlight = highlight or 'FloatBorder'
    local border_style = {
      ['none'] = 'none',
      ['single'] = {
        { "┌", highlight },
        { "─", highlight },
        { "┐", highlight },
        { "│", highlight },
        { "┘", highlight },
        { "─", highlight },
        { "└", highlight },
        { "│", highlight }
      },
      ['double'] = 'double',
      ['rounded'] = {
        { "╭", highlight },
        { "─", highlight },
        { "╮", highlight },
        { "│", highlight },
        { "╯", highlight },
        { "─", highlight },
        { "╰", highlight },
        { "│", highlight },
      },
      ['bold'] = {
        { '┏', highlight },
        { '─', highlight },
        { '┓', highlight },
        { '│', highlight },
        { '┛', highlight },
        { '─', highlight },
        { '┗', highlight },
        { '│', highlight },
      },
      ['plus'] = {
        { '+', highlight },
        { '─', highlight },
        { '+', highlight },
        { '│', highlight },
        { '+', highlight },
        { '─', highlight },
        { '+', highlight },
        { '│', highlight },
      },
    }

    return border_style[style]
  end

  require('lsp_signature').setup({
    handler_opts = {
      border = get_border_style('bold', "LspSagaHoverBorder") -- DefinitionBorder, double, rounded, single, shadow, none
    },
  })
end

M.lint = function()
  require('lint').linters_by_ft = {
    go = { 'golangcilint' },
    sh = { 'shellcheck' },
    dockerfile = { 'hadolint' },
    yaml = { 'yamllint' }
  }
  vim.api.nvim_create_autocmd({ "BufRead", "BufWritePost" }, {
    callback = function()
      require("lint").try_lint()
    end,
  })
end

M.lspsaga = function()
  local saga = require 'lspsaga'
  saga.init_lsp_saga({
    border_style = 'bold',
    symbol_in_winbar = {
      in_custom = false,
      separator = ' > ',
      enable = true
    },
  })
end
return M
