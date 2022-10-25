local M = {}

M.signature = function()
  local function border(hl_name)
    return {
      --   { "╭", hl_name },
      --   { "─", hl_name },
      --   { "╮", hl_name },
      --   { "│", hl_name },
      --   { "╯", hl_name },
      --   { "─", hl_name },
      --   { "╰", hl_name },
      --   { "│", hl_name },
      { "┌", hl_name },
      { "─", hl_name },
      { "┐", hl_name },
      { "│", hl_name },
      { "┘", hl_name },
      { "─", hl_name },
      { "└", hl_name },
      { "│", hl_name }
    }
  end

  require('lsp_signature').setup({
    handler_opts = {
      border = border "DefinitionBorder" -- double, rounded, single, shadow, none
    },
  })
end

return M
