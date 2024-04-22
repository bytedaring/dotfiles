return {
    --  Insert or delete brackets, parens, quotes in pair.
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            local autopairs = require("nvim-autopairs")
            local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            local cmp = require("cmp")

            cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
            -- cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))

            -- cmp_autopairs.lisp[#cmp_autopairs.lisp+1] = "racket"
            autopairs.setup({
                fast_wrap = {},
                -- 被navigator.lua插件提议禁用
                disable_filetype = { "TelescopePrompt", "guihua", "guihua_rust", "clap_input" },
            })
        end,
    },
}
