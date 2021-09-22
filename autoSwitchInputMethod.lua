

appLastInputMethod = {}

-- 自动切换输入法
local function Chinese()
    -- 简体拼音
    hs.keycodes.currentSourceID("com.sogou.inputmethod.sogou.pinyin")
  end
  
  local function English()
    -- ABC
    hs.keycodes.currentSourceID("com.apple.keylayout.ABC")
  end
  
  -- app to expected ime config
  -- app和对应的输入法
  local app2Ime = {
    {'/Applications/iTerm.app', 'English'},
    {'/Applications/Visual Studio Code.app', 'English'},
    {'/Applications/Postman.app', 'English'},
    {'/Applications/Alfred 4.app', 'English'},
    {'/Applications/IntelliJ IDEA.app', 'English'},
  
  }
  
  
  
  -- 窗口激活时自动切换输入法
  function applicationWatcher(appName, eventType, appObject)
    if (eventType == hs.application.watcher.activated or eventType == hs.application.watcher.launched) then
        updateFocusAppInputMethod()
    end
  end
  
  function updateFocusAppInputMethod()
    local ime = 'Chinese'
    
    local focusAppPath = getApp()
    -- hs.alert.show(appLastInputMethod[focusAppPath])

    -- 使用上次记录到的输入法
    if(appLastInputMethod[focusAppPath] ~= nil) then
      hs.keycodes.currentSourceID(appLastInputMethod[focusAppPath])
      return
    end

    for index, app in pairs(app2Ime) do
        local appPath = app[1]
        local expectedIme = app[2]
  
        if focusAppPath == appPath then
            ime = expectedIme
            break
        end
    end
  
    if ime == 'English' then
        English()
    else
        Chinese()
    end
  end

  function getApp()
    window = hs.window.frontmostWindow()
    if window == nil then
      return nil
    end
    application = window:application()
    if application == nil then
      return nil
    end
    return application:path()
  end
  
  
  appWatcher = hs.application.watcher.new(applicationWatcher)
  appWatcher:start()



  hs.keycodes.inputSourceChanged(
    function ()
      source = hs.keycodes.currentSourceID()
      
      app = getApp()
      if app == nil then
        return
      end

      appLastInputMethod[app] = source

      -- for key, value in pairs(appLastInputMethod) do      
      --   hs.alert.show(key .. ":  " .. value)
      -- end  
    
    end
  )
  
  


  -- 如果不知道当前的应用的名字和输入法SourceID, 可以用下面的函数查看:
hs.hotkey.bind({'ctrl', 'cmd'}, ".", function()
  hs.alert.show("App path:        "
    ..hs.window.focusedWindow():application():path()
    .."\n"
    .."App name:      "
    ..hs.window.focusedWindow():application():name()
    .."\n"
    .."IM source id:  "
    ..hs.keycodes.currentSourceID())
end)
