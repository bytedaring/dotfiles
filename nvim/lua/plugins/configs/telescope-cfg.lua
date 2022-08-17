local M = {}

M.config = function()
  require("telescope").setup {
    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "ignore_case", -- or "ignore_case" or "respect_case"
      }
    },
    defaults = {
      layout_strategy = 'vertical',
      layout_config = {
        vertical = { width = 0.85 }
      },
      file_ignore_patterns = { "vendor" }
    }
  }
end

return M
