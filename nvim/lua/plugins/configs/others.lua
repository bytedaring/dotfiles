local M = {}
M.signature = function ()
  local function get_border_style(style, highlight)
    highlight = highlight or 'FloatBorder'
    local border_style = {
      ['none'] = 'none',
      ['single'] = {
        { "┌", highlight },
        { "─", highlight },
        { "┐", highlight },
        { "│", highlight },
        { "┘", highlight },
        { "─", highlight },
        { "└", highlight },
        { "│", highlight }
      },
      ['double'] = 'double',
      ['rounded'] = {
        { "╭", highlight },
        { "─", highlight },
        { "╮", highlight },
        { "│", highlight },
        { "╯", highlight },
        { "─", highlight },
        { "╰", highlight },
        { "│", highlight },
      },
      ['bold'] = {
        { '┏', highlight },
        { '─', highlight },
        { '┓', highlight },
        { '│', highlight },
        { '┛', highlight },
        { '─', highlight },
        { '┗', highlight },
        { '│', highlight },
      },
      ['plus'] = {
        { '+',   highlight },
        { '─', highlight },
        { '+',   highlight },
        { '│', highlight },
        { '+',   highlight },
        { '─', highlight },
        { '+',   highlight },
        { '│', highlight },
      },
    }

    return border_style[style]
  end

  require('lsp_signature').setup({
    handler_opts = {
      border = get_border_style('bold', "SagaBorder") -- DefinitionBorder, double, rounded, single, shadow, none
    },
  })
end

M.lint = function ()
  require('lint').linters_by_ft = {
    go = { 'golangcilint' },
    sh = { 'shellcheck' },
    dockerfile = { 'hadolint' },
    yaml = { 'yamllint' },
    html = { 'eslint' },
    javascript = { 'eslint' }
  }
  vim.api.nvim_create_autocmd({ "BufRead", "BufWritePost" }, {
    callback = function ()
      require("lint").try_lint()
    end,
  })
end

M.format = function ()
  local defaults = require('formatter.filetypes')
  require("formatter").setup {
    filetype = {
      html = {
        defaults.html.prettier,
      },
      svelte = {
        defaults.svelte.prettier,
      }
      -- javascript = {
      --   defaults.javascript.prettier,
      -- }
    }
  }
  vim.api.nvim_create_autocmd({ "BufRead", "BufWritePost" }, {
    callback = function ()
      vim.cmd [[Format]]
    end,
  })
end

M.lspsaga = function ()
  require('lspsaga').setup({
    ui = {
      border = 'single',
      title = true,
    },
    symbol_in_winbar = {
      in_custom = false,
      separator = ' > ',
      enable = true
    },
  })
end

M.neotest = function ()
  local create_cmd = function (cmd, func, opt)
    opt = vim.tbl_extend('force', { desc = 'xw.nvim ' .. cmd }, opt or {})
    vim.api.nvim_create_user_command(cmd, func, opt)
  end

  create_cmd("NeotestToggleSummary", function (_)
    require('neotest').summary.toggle()
  end)

  create_cmd("NeotestToggleOutputPanel", function (_)
    require('neotest').output_panel.toggle()
  end)

  create_cmd("NeotestRun", function (_)
    require('neotest').run.run()
  end)

  create_cmd("NeotestRunFile", function (_)
    require('neotest').run.run(vim.fn.expand('%'))
  end)
end

M.rusttools = function ()
  local rt = require("rust-tools")
  rt.setup({
    server = {
      -- on_attach = function (_, bufnr)
      -- Hover actions
      -- vim.keymap.set("n", "<leader>ca", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      -- vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
      -- end,
    },
  })
end

return M
