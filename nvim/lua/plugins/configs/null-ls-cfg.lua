local M = {}

M.setup = function()
  require("null-ls").setup {
    sources = {
      -- require("null-ls").builtins.diagnostics.shellcheck,
      require("null-ls").builtins.formatting.shfmt,
      -- require("null-ls").builtins.diagnostics.cspell,
      require("null-ls").builtins.formatting.prettier,
      -- require("null-ls").builtins.completion.spell
    }
  }

  require("core.mappings").nullLs()
end

return M
