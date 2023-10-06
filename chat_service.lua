local skynet = require "skynet"
local socket = require "skynet.socket"
local GameRole = require "GameRole"
local RoleMgr = require "GameRoleMgr"

-- 接收到客户端连接或收到客户端消息
function handle_client(id, addr)
    print("connect from "..addr.." ".. id)
    skynet.error("handle_client service", coroutine.running())
    -- 任何一个服务只有在调用 socket.start(id) 之后，才可以收到这个 socket 上的数据。
    socket.start(id)

    --从服务器收到角色ID

    local is_authenticated = false

    while true do
        local str = socket.read(id)
        if str then
            if not is_authenticated then --当第一次登录的时候需要验证用户是不是存在
               local role =  RoleMgr:get_role_by_id(tonumber(str))
                if role then
                    socket.write(id, "恭喜你登录成功！")
                    is_authenticated= true --登录成功 之后把标记取消掉
                    
                else
                    socket.write(id, "登录失败！")
                end
            else --进入正常的的聊状态
                print("client say:"..str)
            -- 把一个字符串置入正常的写队列，skynet 框架会在 socket 可写时发送它。
                socket.write(id, str)
        else
            print("handle_client-- over")
            socket.close(id)
            return
        end
    end
end

-- 启动服务器
function start_server()
    print("==========Socket Start=========")
    -- 监听一个端口，返回一个 id ，供 start 使用。
    local srv_id = socket.listen("0.0.0.0", 8888)
    print("Listen socket :", "0.0.0.0", 8888)
    --创建一个角色管理实例
    local RoleMgr = GameRoleMgr:new()
    --生成10000个角色
    RoleMgr:generate_role_list(10000)
    --启动socket，当有客户端链接的时候调用handle_client
    socket.start(srv_id, handle_client)
    --把角色管理实例传递给handle_client
        handle_client(id, addr, RoleMgr)

end

-- 启动服务器
skynet.start(start_server)