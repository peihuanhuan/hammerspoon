-- 家里的Wi-Fi名称
homeWifis = {"CMCC-p9ab","homeWifiName2"}

-- 办公室的Wi-Fi名称
officeWifi = {"Meituan", "Meituan-Test"}



-- 依据当前网络情况运行或退出应用
wifiWatcher = hs.wifi.watcher.new(function()

    -- 获取当前 Wi-Fi 名称
    local currWifi = hs.wifi.currentNetwork()
    hs.alert.closeAll(0.0)
    -- 家里 WiFi
    if IsInTable(currWifi, homeWifis) then
      hs.audiodevice.defaultOutputDevice():setVolume(25)
      hs.alert.show("已接入家庭 WiFi ")
    -- 公司 WiFi
    elseif IsInTable(currWifi, officeWifi) then
      local volumn = 2
      hs.audiodevice.defaultOutputDevice():setVolume(volumn)
      hs.alert.show("已接入公司 WiFi，音量调节至 " .. volumn)
    end


end)

wifiWatcher:start()




function IsInTable(value, tbl)
  for k,v in ipairs(tbl) do
    if v == value then
    return true;
    end
  end
  return false;
end

