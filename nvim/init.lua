-- require 'impatient'
-- require 'settings'
-- require 'plugins'

local ok, impatient = pcall(require, 'impatient')
if ok then
  impatient.enable_profile()
else
  vim.notify(impatient)
end

require("plugins")
