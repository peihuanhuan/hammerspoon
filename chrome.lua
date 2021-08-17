
function chrome_switch_to(ppl)
    return function()
        hs.application.launchOrFocus("Google Chrome")
        local chrome = hs.appfinder.appFromName("Google Chrome")
        local str_menu_item = {"文件", "新标签页"}
        
        
        
        local menu_item = chrome:findMenuItem(str_menu_item)

        hs.alert.show(menu_item)
        if (menu_item) then
            chrome:selectMenuItem(str_menu_item)
        end
    end
end


hs.loadSpoon("DeepLTranslate")



--- open different Chrome users
hs.hotkey.bind({"alt"}, "1", function() spoon.DeepLTranslate:translateSelectionPopup() end)
hs.hotkey.bind({"alt"}, "2", chrome_switch_to("Yahoo!"))
hs.hotkey.bind({"alt"}, "`", chrome_switch_to("Incognito"))
