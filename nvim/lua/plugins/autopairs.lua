local function setup()
    local present1, autopairs = pcall(require, "nvim-autopairs")
    local present2, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")

    if present1 and present2 then
        local cmp = require("cmp")
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
        -- cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))

        -- cmp_autopairs.lisp[#cmp_autopairs.lisp+1] = "racket"
        autopairs.setup({
            fast_wrap = {},
            -- 被navigator.lua插件提议禁用
            disable_filetype = { "TelescopePrompt", "guihua", "guihua_rust", "clap_input" },
        })
    end
end

return {
    --  Insert or delete brackets, parens, quotes in pair.
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            setup()
        end,
    },
}
