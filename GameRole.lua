Gamerole ={}
Gamerole.__index = Gamerole; --给自己设置Index

--创建一个角色对象类
function Gamerole:new(id,name,modelId,attack,defense)
    local role={}
    role.ID=id
    role.Name=name
    role.ModelId=modelId
    role.Attack=attack
    role.Defense=defense
    setmetatable(role,self)--设置role的元表是Gamerole
    return role
end

return Gamerole