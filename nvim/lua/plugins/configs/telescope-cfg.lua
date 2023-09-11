local M = {}

M.config = function ()
  require("telescope").setup {
    extensions = {
      fzf = {
        fuzzy = true,                   -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true,    -- override the file sorter
        case_mode = "ignore_case",      -- or "ignore_case" or "respect_case"
      }
    },
    pickers = {
      colorscheme = {
        enable_preview = true
      }
    },
    defaults = {
      layout_strategy = 'vertical',
      layout_config = {
        vertical = { width = 0.85 }
      },
      file_ignore_patterns = { "vendor" },
      preview = {
        mime_hook = function (filepath, bufnr, opts)
          local is_image = function (filepath)
            local image_extensions = { 'png', 'jpg', 'jpeg', 'webp' } -- Supported image formats
            local split_path = vim.split(filepath:lower(), '.', { plain = true })
            local extension = split_path[#split_path]
            return vim.tbl_contains(image_extensions, extension)
          end
          if is_image(filepath) then
            local term = vim.api.nvim_open_term(bufnr, {})
            local function send_output(_, data, _)
              for _, d in ipairs(data) do
                vim.api.nvim_chan_send(term, d .. '\r\n')
              end
            end

            -- { 'viu', '-h', '20', '-b', filepath },
            vim.fn.jobstart(
              { 'viu', filepath },
              { on_stdout = send_output, stdout_buffered = true })
          else
            require("telescope.previewers.utils").set_preview_message(bufnr, opts.winid, "Binary cannot be previewed")
          end
        end
      },
    }
  }

  --local ok, _ = pcall(require, 'aerial')
  --if ok then
  --  require('telescope').load_extension('aerial')
  --end
  local telescope = require("telescope")
  telescope.load_extension("fzf")
end

return M
