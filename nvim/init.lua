local ok, impatient = pcall(require, 'impatient')
if ok then
  -- impatient.enable_profile()
else
  vim.notify('impatient.nvim not installed', vim.log.levels.WARN)
end

require("plugins.setting")
-- require("plugins.plugin_packer")
require("plugins.mappings")
require("plugins.lazy")
