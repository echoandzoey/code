local GameRole = require("GameRole")

GameRoleMgr = {}
GameRoleMgr.__index = GameRoleMgr
--������һ�� ��ɫ������
--������ʵ���������ɫ������
function GameRoleMgr:new()
    local self = {}
    setmetatable(self, GameRoleMgr)--����Ԫ��ʹ�ÿ�����GameroleMgr�Ϸ�������
    self.roles={}--���ڴ����ɫ���б�
    return self--���ش����Ķ���ʵ��
end

--���һ����ɫ
--���roleֻ��Ҫ�ٴ�����ɫ��ʱ��˳������gamerole��ʵ����ӵ�self��roles����ȥ�Ϳ�����
function GameRoleMgr:add_role( role )
    
    table.insert(self.roles, role)--selfָ��GameRoleMgr�����Կ���ֱ�ӷ��ʵ�roles���У�ʹ�ò��뺯�������������ɫ
end

--ɾ��һ����ɫ--Ĭ������roleid������
function GameRoleMgr:del_role_by_id(role_id)
    for i, role in ipairs(self.roles) do
        if role.id ==role_id then
            table.remove(role,i )
            break
        end
    end

end

--����id��ȡ��ɫ����
function GameRoleMgr:get_role_by_id(role_id)
   if self.roles[role_id] then
    return self.roles[role_id]
   else
    return nil
   end
end

--�����ɫ�����б����ݹ���������
function GameRoleMgr:Get_att_sort_list( ... )
    -- �ȴ���һ���µ��б�
    local sorted_list= {}
    for i,v in ipairs(self.roles) do
        table.insert(sorted_list, v)
    end

    --��table.sort����һ���ȽϺ���������
    table.sort(sorted_list,function(a, b)
        return a.attack>b.attack
    end)

    
end

--�Զ�����n����ͬ�Ľ�ɫ�����ұ���õ��б�ɻ�ȡ/ɾ����
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







































