-- 家里的Wi-Fi名称
homeWifis = {"CU_j7q4"}

-- 办公室的Wi-Fi名称
officeWifi = {"Meituan", "Meituan-Test"}



-- 依据当前网络情况运行或退出应用
wifiWatcher = hs.wifi.watcher.new(function()

    -- 获取当前 Wi-Fi 名称
    local currWifi = hs.wifi.currentNetwork()
    hs.alert.closeAll(0.0)
    -- 家里 WiFi
    uid = nil
    if IsInTable(currWifi, homeWifis) then
      uid = "C6C04C8C-9C29-44C7-BE1F-71D76134AFE5"
      hs.alert.show("即将切换到网络地址 家")
    -- 公司 WiFi
    elseif IsInTable(currWifi, officeWifi) then
      uid = "9B25AF69-10E3-4FD0-B97D-07BB3490DFF0"
      hs.alert.show("即将切换到网络地址 公司")
    end
    os.execute("scselect " ..uid .." > /dev/null")


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

