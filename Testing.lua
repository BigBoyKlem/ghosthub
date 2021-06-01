local localPlayer = game:GetService('Players').LocalPlayer

function getClosestPlayer()
    local closestPlayer = nil
    local distance = math.huge

    for _,player in pairs(game:GetService('Players'):GetPlayers()) do
        if (game.Workspace:FindFirstChild(player.Name) ~= nil and player:FindFirstChild('Humanoid') and player:FindFirstChild('Head') and player.Character.Humanoid.Health ~= 0 and player ~= localPlayer) then
            local check = (player.Character.Head.Position - localPlayer.Character.Head.Position).Magnitude

            if (check < distance) then
                distance = check
                closestPlayer = player
            end
        end
    end
    if (closestPlayer) then
        return closestPlayer
    else
        return localPlayer
    end
end

local mt = getrawmetatable(game)
local oldNamecall = mt.__namecall

setreadonly(mt, false)

mt.__namecall = function(self, ...)
    local method = getnamecallmethod()
    local args = {...}

    if (tostring(method) == 'FireServer' and tostring(self) == 'ClientEvent' and args[1] == 'WeaponFired') then
        -- args[3]['hasHitPlayer'] = true
        -- args[3]['hasHitPart'] = true
        -- args[3]['replicatedHitPosition'] = getClosestPlayer().Character.Head.Position
        args[2][2] = getClosestPlayer().Character.Head.Position


        return self.FireServer(self, unpack(args))
    end

    return oldNamecall(self,...)
end

print('Loaded...')