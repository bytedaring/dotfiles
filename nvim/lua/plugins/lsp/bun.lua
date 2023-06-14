local M = {}

local bun_servers = { "jsonls", "html", "awk_ls", "cssls", "yamlls", "dockerls" }

local function is_bun_server(name)
  for _, server in ipairs(bun_servers) do
    if server == name then
      return true
    end
  end
  return false
end

local function is_bun_available()
  local bunx = vim.fn.executable "bunx"
  if bunx == 0 then
    return false
  end
  return true
end

M.add_bun_prefix = function (config, _)
  if config.cmd and is_bun_available() and is_bun_server(config.name) then
    local cmd, _ = string.gsub(config.cmd, ".*/", "")
    config.cmd = vim.list_extend({
      "bunx --bun"
    }, cmd)
  end
end

return M
