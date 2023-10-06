local GameRole = require("GameRole")

GameRoleMgr = {}
GameRoleMgr.__index = GameRoleMgr
--创建了一个 角色管理类
--接下来实例化这个角色管理类
function GameRoleMgr:new()
    local self = {}
    setmetatable(self, GameRoleMgr)--创建元表，使得可以在GameroleMgr上访问数据
    self.roles={}--用于储存角色的列表
    return self--返回创建的对象实例
end

--添加一个角色
--这个role只需要再创建角色的时候，顺便把这个gamerole的实例添加到self。roles里面去就可以了
function GameRoleMgr:add_role( role )
    
    table.insert(self.roles, role)--self指向GameRoleMgr，所以可以直接访问到roles队列，使用插入函数按插入这个角色
end

--删除一个角色--默认有了roleid的属性
function GameRoleMgr:del_role_by_id(role_id)
    for i, role in ipairs(self.roles) do
        if role.id ==role_id then
            table.remove(role,i )
            break
        end
    end

end

--根据id获取角色对象
function GameRoleMgr:get_role_by_id(role_id)
   if self.roles[role_id] then
    return self.roles[role_id]
   else
    return nil
   end
end

--输出角色数组列表，根据攻击力排序
function GameRoleMgr:Get_att_sort_list( ... )
    -- 先创建一个新的列表
    local sorted_list= {}
    for i,v in ipairs(self.roles) do
        table.insert(sorted_list, v)
    end

    --用table.sort创建一个比较函数来排序
    table.sort(sorted_list,function(a, b)
        return a.attack>b.attack
    end)

    
end

--自动生成n个不同的角色，并且保存得到列表可获取/删除）
function GameRoleMgr:generate_role_list( n )

    for i =1,n do
        local name = "role_" ..i
        local  attack  = math.random( 1,100 )
        local defense = math.random( 1,100 )
        local role = GameRole:new(i,name,i,attack,defense)
        self:add_role(role)
     end

end


return GameRoleMgr







































