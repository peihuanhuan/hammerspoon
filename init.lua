require "volume"
require "autoSwitchInputMethod"
require "autoReloadConfig"



-- 防止阻塞粘贴
hs.hotkey.bind({"cmd", "ctrl"}, "V", function() hs.eventtap.keyStrokes(hs.pasteboard.getContents()) end)




--- 

--[[ 
     以下是测试代码，没注释的可以删除
--]]





hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
  hs.notify.new({title="Hammerspoon", informativeText="Hello World"}):send()
end)

