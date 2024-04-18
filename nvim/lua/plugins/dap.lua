local M = {}

local bind = require("core.keybind")
local keymaps_backup
local dapui_setuped
local keys = {}

local dap_debug_config = {
    -- icons = icons.dap_ui.base,
    mappings = {
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t",
    },
    element_mappings = {},
    -- expand_lines = vim.fn.has("nvim-0.7") == 1,
    force_buffers = true,
    layouts = {
        {
            elements = {
                { id = "scopes", size = 0.33 },
                { id = "breakpoints", size = 0.17 },
                { id = "stacks", size = 0.25 },
                { id = "watches", size = 0.25 },
            },
            size = 0.33,
            position = "left",
        },
        {
            elements = {
                { id = "repl" },
                -- { id = "console", size = 0.55 },
            },
            size = 0.27,
            position = "bottom",
        },
    },
    floating = {
        max_height = nil,
        max_width = nil,
        border = "single",
        mappings = {
            ["close"] = { "q", "<Esc>" },
        },
    },
    -- controls = {
    --   enabled = vim.fn.exists("+winbar") == 1,
    --   element = "repl",
    --   -- icons = icons.dap_ui.controls,
    -- },
    -- render = {
    --   max_type_length = nil,
    --   max_value_lines = 100,
    --   indent = 1,
    -- },
}

local function keybind()
    local dap = require("dap")
    keymaps_backup = vim.api.nvim_get_keymap("n")
    keys = {
        ["c"] = { f = dap.continue, desc = "DapContinue" },
        ["n"] = { f = dap.step_over, desc = "DapStepOver" },
        ["s"] = { f = dap.step_into, desc = "DapStepInto" },
        ["o"] = { f = dap.step_out, desc = "DapStepOut" },
        ["S"] = {
            desc = "stop debug session",
            f = function()
                require("plugins.configs.dap-cfg").stop()
            end,
        },
        ["u"] = { f = dap.up, desc = "DapUp" },
        ["D"] = { f = dap.down, desc = "DapDown" },
        ["C"] = { f = dap.run_to_cursor, desc = "DapRunToCursor" },
        ["b"] = { f = dap.toggle_breakpoint, desc = "DapToggleBreakpoint" },
        ["P"] = { f = dap.pause, desc = "DapPause" },
    }

    local dapui_status_ok, dapui = pcall(require, "dapui")
    if dapui_status_ok then
        keys["p"] = { f = dapui.eval, m = { "n", "v" }, desc = "eval" }
        keys["K"] = { f = dapui.float_element, desc = "float_element" }
        keys["B"] = {
            f = function()
                dapui.float_element("breakpoints")
            end,
            desc = "float_element('breakpoints')",
        }
        keys["R"] = {
            f = function()
                dapui.float_element("repl")
            end,
            desc = "float_element('repl')",
        }
        keys["O"] = {
            f = function()
                dapui.float_element("scopes")
            end,
            desc = "float_element('scopes')",
        }
        keys["a"] = {
            f = function()
                dapui.float_element("stacks")
            end,
            desc = "float_element('stacks')",
        }
        keys["w"] = {
            f = function()
                dapui.float_element("watches")
            end,
            desc = "float_element('watches')",
        }
        -- else
        -- keys['p'] = { f = require('dap.ui.widgets').hover, m = { 'n', 'v' }, desc = 'hover' }
    end
    bind.nvim_load_mapping(keys)
end

local unmap = function()
    local unmap_keys = {
        "r",
        "c",
        "n",
        "s",
        "o",
        "S",
        "u",
        "D",
        "C",
        "b",
        "P",
        "p",
        "K",
        "B",
        "R",
        "O",
        "a",
        "w",
    }
    for _, value in pairs(unmap_keys) do
        local cmd = "silent! unmap " .. value
        vim.cmd(cmd)
    end

    vim.cmd([[silent! vunmap p]])

    for _, k in pairs(unmap_keys) do
        for _, v in pairs(keymaps_backup or {}) do
            if v.lhs == k then
                local nr = (v.noremap == 1)
                local sl = (v.slient == 1)
                local exp = (v.expr == 1)
                local mode = v.mode
                local desc = v.desc or "dap"
                if v.mode == " " then
                    mode = { "n", "v" }
                end

                vim.keymap.set(mode, v.lhs, v.rhs or v.callback, { noremap = nr, silent = sl, expr = exp, desc = desc })
            end
        end
    end
    keymaps_backup = {}
end

-- dap.adapters.rust = {
--   type = 'server',
--   host = '127.0.0.1',
--   port = "${port}",
--   executable = {
--     command = '/usr/local/codelldb/extension/adapter/codelldb',
--     args = { "--port", "${port}" }
--   }
-- }

-- dap.configurations.zig = {
--   {
--     name = 'Launch',
--     type = 'codelldb',
--     request = 'launch',
--     program = function ()
--       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--     end,
--     cwd = '${workspaceFolder}',
--     stopOnEntry = false,
--     args = {},
--   }
-- }

M.setup = function()
    local dapui_status_ok, dapui = pcall(require, "dapui")
    if not dapui_status_ok then
        return
    end
    local dap_status_ok, dap = pcall(require, "dap")
    if not dap_status_ok then
        return
    end

    if dapui_setuped ~= true then
        dapui.setup(dap_debug_config)
        dapui_setuped = true
    end

    vim.fn.sign_define("DapBreakpoint", {
        text = "🍄",
        texthl = "DapBreakpoint",
        linehl = "",
        numhl = "",
    })
    -- vim.fn.sign_define("DapBreakpointRejected", {
    --   text = icons.dap_ui.sign.reject,
    --   texthl = "DapBreakpointRejected",
    --   linehl = "",
    --   numhl = "",
    -- })
    -- vim.fn.sign_define("DapBreakpointCondition", {
    --   text = icons.dap_ui.sign.condition,
    --   texthl = "DapBreakpointCondition",
    --   linehl = "",
    --   numhl = "",
    -- })
    vim.fn.sign_define("DapStopped", {
        text = "🔥",
        texthl = "DapStopped",
        linehl = "",
        numhl = "",
    })
    -- vim.fn.sign_define("DapLogPoint", {
    --   text = icons.dap_ui.sign.log_point,
    --   texthl = "DapLogPoint",
    --   linehl = "",
    --   numhl = "",
    -- })
    -- vim.api.nvim_create_user_command("LuaDapLaunch", [[FlutterRun<CR>]], {})
    vim.api.nvim_create_user_command("DapToggleBreakpoint", 'lua require("dap").toggle_breakpoint()', {})
    vim.api.nvim_create_user_command("DapClearBreakpoints", 'lua require("dap").clear_breakpoints()', {})
    vim.api.nvim_create_user_command("DapRunToCursor", 'lua require("dap").run_to_cursor()', {})
    vim.api.nvim_create_user_command("DapContinue", 'lua require"dap".continue()', {})
    vim.api.nvim_create_user_command("DapStepInto", 'lua require"dap".step_into()', {})
    vim.api.nvim_create_user_command("DapStepOver", 'lua require"dap".step_over()', {})
    vim.api.nvim_create_user_command("DapStepOut", 'lua require"dap".step_out()', {})
    vim.api.nvim_create_user_command("DapUp", 'lua require"dap".up()', {})
    vim.api.nvim_create_user_command("DapDown", 'lua require"dap".down()', {})
    vim.api.nvim_create_user_command("DapPause", 'lua require"dap".pause()', {})
    vim.api.nvim_create_user_command("DapClose", 'lua require"dap".close()', {})
    vim.api.nvim_create_user_command("DapDisconnect", 'lua require"dap".disconnect()', {})
    vim.api.nvim_create_user_command("DapRestart", 'lua require"dap".restart()', {})
    vim.api.nvim_create_user_command("DapToggleRepl", 'lua require"dap".repl.toggle()', {})
    vim.api.nvim_create_user_command("DapGetSession", 'lua require"dap".session()', {})
    vim.api.nvim_create_user_command("DapUIClose", 'lua require("plugins.configs.dap-cfg").stop()', {})
    dap.listeners.after.event_initialized["dapui_config"] = function()
        vim.defer_fn(function()
            dapui.open()
            keybind()
        end, 200)
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
        -- dapui.close()
        unmap()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
        unmap()
    end

    dap.adapters.cppdbg = {
        id = "cppdbg",
        type = "executable",
        command = "/Users/xiaoxiwang/Work/cpptools/extension/debugAdapters/bin/OpenDebugAD7",
        options = {
            detached = false,
        },
    }
    dap.adapters.lldb = {
        id = "lldb",
        type = "server",
        port = "${port}",
        host = "127.0.0.1",
        executable = {
            command = "/Users/xiaoxiwang/.vscode/extensions/vadimcn.vscode-lldb-1.10.0/adapter/codelldb",
            args = {
                "--liblldb",
                "/Users/xiaoxiwang/.vscode/extensions/vadimcn.vscode-lldb-1.10.0/lldb/lib/liblldb.dylib",
                "--port",
                "${port}",
            },
        },
    }

    dap.configurations.cpp = {
        {
            name = "Launch",
            type = "cppdbg",
            request = "launch",
            program = function()
                return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/zig-out/bin/", "file")
            end,
            cwd = "${workspaceFolder}",
            stopOnEntry = true,
            MIMode = "lldb",
        },
    }

    dap.configurations.zig = dap.configurations.cpp
    dap.configurations.rust = {
        {
            name = "Launch",
            type = "cppdbg",
            request = "launch",
            program = vim.fn.getcwd() .. "/target/debug/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t"),
            -- program = function ()
            --   return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
            -- end,
            cwd = "${workspaceFolder}",
            stopOnEntry = true,
            MIMode = "lldb",
        },
    }
    -- rust
    -- require('dap.ext.vscode').load_launchjs(nil, { lldb = { 'rust' } });
end

local function dapui_opened()
    local lys = require("dapui.windows").layouts or {}
    local opened = false
    for _, ly in ipairs(lys) do
        if ly:is_open() == true then
            opened = true
        end
    end
    return opened
end

M.stop = function()
    unmap()
    local has_dapui, dapui = pcall(require, "dapui")
    if has_dapui then
        if dapui_opened() then
            dapui.close()
        end
    end
    require("dap").close()
    require("dap").disconnect()
end

return {

    -- 一种通用图形调试器
    {
        "rcarriga/nvim-dap-ui",
        -- lazy = true,
        event = "VeryLazy",
        -- cmd = { "DapToggleBreakpoint", "DapContinue", "DapRunToCursor" },
        -- event        = { "BufRead", "BufNewFile" },
        -- ft = { "zig" },
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
            -- "theHamsta/nvim-dap-virtual-text",
        },
        config = function()
            M.setup()
        end,
    },
}
