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
  vim.api.nvim_create_autocmd({ "BufWritePre" }, {
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
      code_action = '',
    },
    hover = {
      max_width = 0.6,
      max_height = 0.8,
      open_link = 'gx',
      open_cmd = '!open'
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

  local neotest_ns = vim.api.nvim_create_namespace("neotest")
  vim.diagnostic.config({
    virtual_text = {
      format = function (diagnostic)
        local message =
          diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
        return message
      end,
    },
  }, neotest_ns)
  require("neotest").setup({
    adapters = {
      require("neotest-go"),
    },
  })
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

M.snippet = function ()
  -- lazy-load snippets from my-snippets folder
  require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.config/nvim/my_snippets" })
  -- lazy-load default snippets
  require("luasnip.loaders.from_vscode").lazy_load()
end

M.flutter = function ()
  require('flutter-tools').setup {
    -- flutter_path = "~/development/flutter",
    fvm = false, -- takes priority over path, uses <workspace>/.fvm/flutter_sdk if enabled
    ui = {
      border = "single",
      notification_style = 'native'
    },
    decorations = {
      statusline = {
        -- set to true to be able use the 'flutter_tools_decorations.app_version' in your statusline
        -- this will show the current version of the flutter app from the pubspec.yaml file
        app_version = false,
        -- set to true to be able use the 'flutter_tools_decorations.device' in your statusline
        -- this will show the currently running device if an application was started with a specific
        -- device
        device = false,
      },
    },
    debugger = {
      enabled = false,
      run_via_dap = false,
    },
    dev_log = {
      -- enabled = false,
      -- open_cmd = "tabedit", -- command to use to open the log buffer
    },
    lsp = {
      color = {
        -- show the derived colours for dart variables
        enabled = true,         -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
        background = false,     -- highlight the background
        foreground = false,     -- highlight the foreground
        virtual_text = true,    -- show the highlight using virtual text
        virtual_text_str = "■", -- the virtual text character to highlight
      },
      init_options = {
        onlyAnalyzeProjectsWithOpenFiles = true,
        suggestFromUnimportedLibraries = true,
        closingLabels = true,
        outline = true,
        flutterOutline = true,
      },
      settings = {
        dart = {
          showTodos = true,
          completeFunctionCalls = true,
          -- renameFilesWithClasses = "prompt", -- "always"
          -- enableSnippets = true,
          -- enableSdkFormatter = true,
        }
      },
    },
  }
end

M.blankline = function ()
  vim.g.indentLine_char_list = { '|', '¦', '┆', '┊' }
  vim.opt.termguicolors = true
  vim.opt.list = true
  -- vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
  -- vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
  -- vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
  -- vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
  -- vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
  -- vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]
  require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = false,
    -- char_highlight_list = {
    --   "IndentBlanklineIndent1",
    --   "IndentBlanklineIndent2",
    --   "IndentBlanklineIndent3",
    --   "IndentBlanklineIndent4",
    --   "IndentBlanklineIndent5",
    --   "IndentBlanklineIndent6",
    -- },
  }
end
return M
