require "volume"
require "autoSwitchInputMethod"
require "autoReloadConfig"
require "chrome"
require "wifiWatcher"
-- require "autoChangeDns"


-- 自动使用必应每日图片作为您的壁纸。
hs.loadSpoon("BingDaily")



--[[ 
     以下是测试代码，没注释的可以删除
--]]

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
  hs.notify.new({title="Hammerspoon", informativeText="Hello World"}):send()
end)

