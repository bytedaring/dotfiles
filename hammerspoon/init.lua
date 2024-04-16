-- hs.hotkey.bind({"shift"}, "space", function()
--   local alacritty = hs.application.find('alacritty')
--   if alacritty ~= nil and alacritty:isFrontmost() then
--     alacritty:hide()
--   else
--     hs.application.launchOrFocus("/Applications/Alacritty.app")
--   end
-- end)

hs.hotkey.bind({ "option" }, "space", function()
	local app = hs.application.get("kitty")
	if app ~= nil then
		if not app:mainWindow() then
			app:selectMenuItem("kitty", "New Window")
		elseif app:isFrontmost() then
			app:hide()
		else
			app:activate()
		end
	else
		hs.application.launchOrFocus(app:name())
	end
end)
