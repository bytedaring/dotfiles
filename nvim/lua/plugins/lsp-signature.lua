local M = {}
M.signature = function()
    local function get_border_style(style, highlight)
        highlight = highlight or "FloatBorder"
        local border_style = {
            ["none"] = "none",
            ["single"] = {
                { "┌", highlight },
                { "─", highlight },
                { "┐", highlight },
                { "│", highlight },
                { "┘", highlight },
                { "─", highlight },
                { "└", highlight },
                { "│", highlight },
            },
            ["double"] = "double",
            ["rounded"] = {
                { "╭", highlight },
                { "─", highlight },
                { "╮", highlight },
                { "│", highlight },
                { "╯", highlight },
                { "─", highlight },
                { "╰", highlight },
                { "│", highlight },
            },
            ["bold"] = {
                { "┏", highlight },
                { "─", highlight },
                { "┓", highlight },
                { "│", highlight },
                { "┛", highlight },
                { "─", highlight },
                { "┗", highlight },
                { "│", highlight },
            },
            ["plus"] = {
                { "+", highlight },
                { "─", highlight },
                { "+", highlight },
                { "│", highlight },
                { "+", highlight },
                { "─", highlight },
                { "+", highlight },
                { "│", highlight },
            },
        }

        return border_style[style]
    end

    require("lsp_signature").setup({
        handler_opts = {
            -- DefinitionBorder, double, rounded, single, shadow, none, SagaBorder, HoverBorder
            border = get_border_style("bold", "SagaBorder"),
        },
    })
end

return {}
