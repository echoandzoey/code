package.cpath = "luaclib/?.so"

if _VERSION ~= "Lua 5.4" then
    error "Use lua 5.4"
end

local socket = require "client.socket"

local fd = assert(socket.connect("114.132.161.28", 8888))
print("请输入您的姓名：")

local name;
while name == nil do
    name = socket.readstdin()
end
-- local name = io.read()--不知道为什么一直会有阻塞
-- socket.send(fd, "sdsad")


while true do
    local str = socket.recv(fd)
    if str ~= nil and str ~= "" then
        print(name .. ":" .. str)
    end

    -- 读取用户输入消息
    local readstr = socket.readstdin()
    if readstr then
        if readstr == "quit" then
            socket.close(fd)
            break;
        else
            socket.send(fd, readstr)
        end
    else
        socket.usleep(100)
    end
end
