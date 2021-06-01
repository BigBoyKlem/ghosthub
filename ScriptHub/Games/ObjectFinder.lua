--[[
    objectLocation [Instance]
    objectName [String]
    returnTable [bool]
]]

local function getObject(objectLocation, objectName, returnTable)
    local objects = {}

    for _,v in pairs(objectLocation:GetDescendants()) do
        if (v.Name == objectName) then
            if (returnTable) then
                table.insert(objects, v)
            else
                return v
            end
        end
    end

    return objects
end