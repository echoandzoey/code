Gamerole ={}
Gamerole.__index = Gamerole; --���Լ�����Index

--����һ����ɫ������
function Gamerole:new(id,name,modelId,attack,defense)
    local role={}
    role.id=id
    role.name=name
    role.modelId=modelId
    role.attack=attack
    role.defense=defense
    setmetatable(role,self)--����role��Ԫ����Gamerole
    return role
end

return Gamerole