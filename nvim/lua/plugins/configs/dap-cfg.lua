local M = {}

M.setup = function ()
  local dap = require('dap')
  dap.adapters.codelldb = {
    type = 'server',
    host = '127.0.0.1',
    port = "${port}",
    executable = {
      command = '',
      args = { "--port", "${port}" }
    }
  }

  dap.configurations.zig = {
    {
      name = 'Launch',
      type = 'codelldb',
      request = 'launch',
      program = function ()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      end,
      cwd = '${workspaceFolder}',
      stopOnEntry = false,
      args = {},
    }
  }
end

return M
