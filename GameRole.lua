Gamerole ={}
Gamerole.__index = Gamerole; --���Լ�����Index

--����һ����ɫ������
function Gamerole:new(id,name,modelId,attack,defense)
    local role={}
    role.ID=id
    role.Name=name
    role.ModelId=modelId
    role.Attack=attack
    role.Defense=defense
    setmetatable(role,self)--����role��Ԫ����Gamerole
    return role
end

return Gamerole