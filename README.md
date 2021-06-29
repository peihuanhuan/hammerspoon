# 安装配置与升级:

安装 hammerspoon。
```
brew install hammerspoon
```

将配置文件克隆到本地根目录。
```
git clone https://github.com/peihuanhuan/hammerspoon ~/.hammerspoon
```

重新加载配置文件即可生效。

> 如果提示：already exists and is not an empty directory. 先删除目录
```
rm -rf ~/.hammerspoon
```

升级：
```
cd ~/.hammerspoon && git pull
```

# 实现功能

## 快捷键调节系统音量
『command + ↑』调高音量，『command + ↓』降低音量。
## 自动切换输入法
能够记录此 App 中最近一次使用的输入法，切到别的 App 修改输入法后，再切回此 App 时，会自动切回上次记录的输入法。

如果没有记录到最近使用的输入法，则使用配置的默认输入法： ~/.hammerspoon/autoSwitchInputMethod.lua 文件中，修改 app2Ime 变量，此变量中的 App 都会切换到英语，其余全部切换搜狗拼音。

如果使用的其他输入法，也需要自行修改。
> 不知道当前 App 叫什么，可以使用 cmd + ctrl + . 来查看当前 App 路径和输入法。



## 其他自定义功能
自行参考：
- 官方文档：[https://www.hammerspoon.org/docs/index.html](https://www.hammerspoon.org/docs/index.html)
- Lua学习：[https://learnxinyminutes.com/docs/zh-cn/lua-cn/](https://learnxinyminutes.com/docs/zh-cn/lua-cn/)
