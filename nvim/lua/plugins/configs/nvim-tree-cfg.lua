local M = {}
M.config = function ()
  require"nvim-tree".setup{
    disable_netrw = false,
    view = {
      width = 45
    },
    renderer = {
      indent_markers = {
        enable = true,
      },
      icons          = {
        git_placement = "after",
        glyphs = {
          default = "",
          bookmark = ""
        }
      }
    },
    update_focused_file = {
      enable      = true,
      update_cwd  = false,
      ignore_list = {}
    },
    git = {
      timeout = 300,
      ignore = false,
    },
    filters = {
      dotfiles = true
    }
  }
  vim.api.nvim_create_autocmd("BufEnter", {
    group = vim.api.nvim_create_augroup("NvimTreeClose", { clear = true }),
    pattern = "NvimTree_*",
    callback = function ()
      local layout = vim.api.nvim_call_function("winlayout", {})
      if layout[1] == "leaf" and
        vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree" and
        layout[3] == nil then
        vim.cmd("confirm quit")
      end
    end
  })
end
return M
