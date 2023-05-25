local M = {}

M.setup = function ()
  local dap = require('dap')
  dap.adapters.rust = {
    type = 'server',
    host = '127.0.0.1',
    port = "${port}",
    executable = {
      command = '/usr/local/codelldb/extension/adapter/codelldb',
      args = { "--port", "${port}" }
    }
  }

  -- dap.configurations.zig = {
  --   {
  --     name = 'Launch',
  --     type = 'codelldb',
  --     request = 'launch',
  --     program = function ()
  --       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
  --     end,
  --     cwd = '${workspaceFolder}',
  --     stopOnEntry = false,
  --     args = {},
  --   }
  -- }
end

return M
