return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "nvim-neotest/neotest-go",
            "sidlatau/neotest-dart",
            "lawrence-laz/neotest-zig",
            "rouge8/neotest-rust",
            "antoinemadec/FixCursorHold.nvim",
        },
        cmd = { "NeotestToggleSummary", "NeotestToggleOutputPanel", "NeotestRun", "NeotestRunFile" },
        config = function()
            local create_cmd = function(cmd, func, opt)
                opt = vim.tbl_extend("force", { desc = "xw.nvim " .. cmd }, opt or {})
                vim.api.nvim_create_user_command(cmd, func, opt)
            end

            create_cmd("NeotestToggleSummary", function(_)
                require("neotest").summary.toggle()
            end)

            create_cmd("NeotestToggleOutputPanel", function(_)
                require("neotest").output_panel.toggle()
            end)

            create_cmd("NeotestRun", function(_)
                require("neotest").run.run()
            end)

            create_cmd("NeotestRunFile", function(_)
                require("neotest").run.run(vim.fn.expand("%"))
            end)

            local neotest_ns = vim.api.nvim_create_namespace("neotest")
            vim.diagnostic.config({
                virtual_text = {
                    format = function(diagnostic)
                        local message =
                            diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
                        return message
                    end,
                },
            }, neotest_ns)
            require("neotest").setup({
                adapters = {
                    require("neotest-zig"),
                    require("neotest-go"),
                    require("neotest-dart")({
                        command = "flutter",
                        use_lsp = true,
                    }),
                    require("neotest-rust")({
                        dap_adapter = "lldb",
                    }),
                },
            })
        end,
    },
}
