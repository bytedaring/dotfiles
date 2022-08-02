local M = {}
M.config = function()
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

return M
