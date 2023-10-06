package.cpath = "luaclib/?.so"

if _VERSION ~= "Lua 5.4" then
    error "Use lua 5.4"
end

local socket = require "client.socket"

local fd = assert(socket.connect("114.132.161.28", 8888))
print("请输入您的姓名：")

local ID;
while ID == nil do
    ID = socket.readstdin()
end
-- local name = io.read()--不知道为什么一直会有阻塞
-- socket.send(fd, "sdsad")



while true do
    local str = socket.recv(fd)--接收消息
    if str ~= nil and str ~= "" then --如果消息不为空
        if str == "恭喜你登录成功！" then
            print("恭喜你登陆成功！现在你可以开始畅所欲言了！")--登陆成功
        elseif  str =="角色ID无效！" then
            print("角色ID无效！,请重新输入")
        else
            print("role_ "..ID ":" .. str)--进入正常发消息阶段
        end
    end

    -- 读取用户输入消息
    local readstr = socket.readstdin()
    if readstr then
        if readstr == "quit" then
            socket.close(fd)
            break
        else
            socket.send(fd, readstr)
        end
    else
        socket.usleep(100)
    end
end
