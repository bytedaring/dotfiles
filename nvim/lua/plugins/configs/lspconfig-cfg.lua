local M = {}
M.setup = function ()
  local nvim_lsp = require('lspconfig')

  -- 支持code snippets
  local capabilities = require('cmp_nvim_lsp').default_capabilities()

  -- after the language server attaches to the current buffer
  local on_attach = function (client, bufnr)
    -- Mappings.
    local opts = { noremap = true, silent = true, buffer = bufnr }
    -- -- Se `:help vim.lsp.*` for documentation on any of the below functions
    -- vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    -- vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    -- vim.keymap.set('n', 'ga', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    -- vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    -- -- vim.keymap.set('n', 'gr', '<cmd>TroubleToggle lsp_references<CR>', opts)
    -- vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    -- vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    -- vim.keymap.set('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.keymap.set('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    vim.keymap.set('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    vim.keymap.set('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    -- vim.keymap.set('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    -- vim.keymap.set('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    -- vim.keymap.set('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    -- vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    -- vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    -- vim.keymap.set('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
    -- vim.keymap.set('n', '<space>f', '<cmd>lua vim.lsp.buf.format{async = true}<CR>', opts)

    -- 保存文件时自动 formatting
    -- if client.resolved_capabilities.document_formatting then
    -- if client.server_capabilities.documentFormattingProvider then
    --   vim.api.nvim_command [[augroup Format]]
    --   vim.api.nvim_command [[autocmd! * <buffer>]]
    --   vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format({async = true})]]
    --   vim.api.nvim_command [[augroup END]]
    -- end
    vim.api.nvim_create_autocmd("BufWritePost", {
      buffer = bufnr,
      callback = function ()
        if 'css' ~= vim.bo.filetype and 'html' ~= vim.bo.filetype and 'proto' ~= vim.bo.filetype and 'sh' ~= vim.bo.filetype then
          vim.lsp.buf.format({ async = true })
        end
      end
    })
  end

  -- Add bun for Node.js-based servers
  -- local lspconfig_util = require "lspconfig.util"
  -- local add_bun_prefix = require("plugins.lsp.bun").add_bun_prefix
  -- lspconfig_util.on_setup = lspconfig_util.add_hook_before(lspconfig_util.on_setup, add_bun_prefix)

  -- Use a loop to conveniently call 'setup' on multiple servers and
  -- map buffer local keybindings when the language server attaches
  local servers = { 'rust_analyzer', 'tsserver', 'vimls', 'jsonls', 'marksman', 'astro',
    'bashls', 'awk_ls', 'dockerls', 'yamlls', 'bufls', 'zls', 'clangd', 'cssls', 'svelte', 'tailwindcss' }
  for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      flags = {
        debounce_text_changes = 150,
      }
    }
  end

  --
  nvim_lsp.pylsp.setup {
    cmd = { 'pylsp' },
    -- for postfix snippets and analyzers
    capabilities = capabilities,
    filetypes = { "python" },
    -- root_dir = function(startpath)
    --    return M.search_ancestors(startpath, matcher)
    -- end,
    settings = {
      pylsp = {
        plugins = {
          pycodestyle = {
            enabled = true
          },
        }
      }
    },
    on_attach = on_attach,
    -- single_file_support = false
  }

  -- gopls
  nvim_lsp.gopls.setup {
    cmd = { 'gopls' },
    -- for postfix snippets and analyzers
    capabilities = {
      textDocument = {
        completion = {
          completionItem = {
            commitCharactersSupport = true,
            deprecatedSupport = true,
            documentationFormat = { 'markdown', 'plaintext' },
            insertReplaceSupport = true,
            insertTextModeSupport = {
              valueSet = { 1, 2 }
            },
            labelDetailsSupport = true,
            preselectSupport = true,
            resolveSupport = {
              properties = { "documentation", "detail", "additionalTextEdits" }
            },
            snippetSupport = true,
          },
          contextSupport = true,
          dynamicRegistration = false,
          insertTextMode = 1
        }
      }
    },
    settings = {
      gopls = {
        experimentalPostfixCompletions = true,
        analyses = {
          unusedparams = true,
          shadow = true,
        },
        staticcheck = true,
        -- codelenses = {
        --   test = true,
        --   tidy = true,
        --   gc_details = true,
        --   generate = true,
        --   regenerate_cgo = true
        -- }
        -- buildFlags = { "-tags=wireinject" }
      },
    },
    on_attach = on_attach
  }

  nvim_lsp.lua_ls.setup {
    cmd = { "lua-language-server" },
    capabilities = capabilities,
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { 'vim' },
        }
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
    on_attach = on_attach,
  }

  nvim_lsp.html.setup {
    capabilities = capabilities,
    init_options = {
      configurationSection = { "html", "css", "javascript" },
      embeddedLanguages = {
        css = true,
        javascript = true
      },
      provideFormatter = false
    },
    settings = {
    },
    on_attach = on_attach,
  }
end
return M
