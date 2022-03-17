local M = {}
M.setup = function()
  local present1, autopairs = pcall(require, "nvim-autopairs")
  local present2, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")

  if present1 and present2 then
    local cmp = require "cmp"
    cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))

    cmp_autopairs.lisp[#cmp_autopairs.lisp+1] = "racket"
  end
end
return M
