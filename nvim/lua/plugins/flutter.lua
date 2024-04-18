return {
    -- flutter
    {
        "akinsho/flutter-tools.nvim",
        ft = "dart",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "mfussenegger/nvim-dap",
            "stevearc/dressing.nvim",
        },
        config = function()
            require("flutter-tools").setup({
                -- flutter_path = "~/development/flutter",
                fvm = false, -- takes priority over path, uses <workspace>/.fvm/flutter_sdk if enabled
                ui = {
                    border = "single",
                    notification_style = "native",
                },
                decorations = {
                    statusline = {
                        app_version = false,
                        device = false,
                    },
                },
                debugger = {
                    enabled = true,
                    run_via_dap = true,
                    exception_breakpoints = {},
                    register_configurations = function(paths)
                        local dap = require("dap")
                        dap.adapters.dart = {
                            type = "executable",
                            command = "dart",
                            args = { "debug_adapter" },
                        }
                        dap.adapters.flutter = {
                            type = "executable",
                            command = "flutter",
                            args = { "debug_adapter" },
                        }
                        dap.configurations.dart = {
                            -- {
                            --   type = "dart",
                            --   name = "Launch Dart",
                            --   request = "launch",
                            --   dartSdkPath = paths["dart_sdk"],
                            --   flutterSdkPath = paths["flutter_sdk"],
                            --   program = "${workspaceFolder}/lib/main.dart",
                            --   cwd = "${workspaceFolder}",
                            -- },
                            {
                                type = "flutter",
                                name = "Launch Flutter",
                                request = "launch",
                                dartSdkPath = paths["dart_sdk"],
                                flutterSdkPath = paths["flutter_sdk"],
                                program = "${workspaceFolder}/lib/main.dart",
                                cwd = "${workspaceFolder}",
                            },
                        }
                    end,
                },
                dev_log = {
                    enabled = false,
                    open_cmd = "tabedit", -- command to use to open the log buffer
                },
                dev_tools = {
                    autostart = false,
                    auto_open_browser = false,
                },
                lsp = {
                    color = {
                        -- show the derived colours for dart variables
                        enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
                        background = false, -- highlight the background
                        foreground = false, -- highlight the foreground
                        virtual_text = true, -- show the highlight using virtual text
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
                        },
                    },
                },
            })
        end,
    },
}
