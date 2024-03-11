-- hs.hotkey.bind({"shift"}, "space", function()
--   local alacritty = hs.application.find('alacritty')
--   if alacritty ~= nil and alacritty:isFrontmost() then
--     alacritty:hide()
--   else
--     hs.application.launchOrFocus("/Applications/Alacritty.app")
--   end
-- end)

hs.hotkey.bind({ "option" }, "space", function()
    local kitty = hs.application.find('kitty')
    if kitty ~= nil and kitty:isFrontmost() then
        kitty:hide()
    else
        hs.application.launchOrFocus("/Applications/kitty.app")
    end
end)
