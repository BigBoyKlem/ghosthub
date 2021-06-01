local Flux = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/fluxlib.txt")()
local Window = Flux:Window("GHOST Hub", "Universals", Color3.fromRGB(41,41,41), Enum.KeyCode.LeftControl)

local PlayerTab = Window:Tab("Player", "")
local TeleportTab = Window:Tab("Teleport", "")
local MiscTab = Window:Tab("Miscellaneous", "")

PlayerTab:Label("Movement")
PlayerTab:Line()

_G.WalkSpeed = 16
_G.JumpHeight = 50

PlayerTab:Slider("Walk Speed", "Sets players walk speed.", 16,500,16, function(ws)
    _G.WalkSpeed = ws
end)

PlayerTab:Slider("Jump Height", "Sets players jump height.", 50,500,50 ,function(jh)
    _G.JumpHeight = jh
end)

TeleportTab:Label("Teleport")
TeleportTab:Line()

MiscTab:Label("Miscellaneous")
MiscTab:Line()

MiscTab:Button("Rejoin Game", "Rejoins current game, usefull for testing new features.", function()
    game:GetService('TeleportService'):Teleport(game.PlaceId, game.Players.LocalPlayer)
end)

MiscTab:Button("Get Discord Link", "Copies the Discord invite for GHOST Hub to your clipboard.", function()
    setclipboard(loadstring(game:HttpGet('https://raw.githubusercontent.com/BigBoyKlem/GhostHub/master/ScriptHub/DiscordLink.lua',true))())
end)

while wait() do
    pcall(function()

        -- Walk Speed / Jump Power
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = _G.WalkSpeed
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = _G.JumpHeight

        -- FOV
        game.Workspace.CurrentCamera.FieldOfView = _G.FOV

        if (TeleportTab.flags.annoyPlayerToggle) then
            if (game.Players[TeleportTab.flags.playerDropDown].Character ~= nil and game.Players.LocalPlayer.Character ~= nil) then
                local playerPart = game.Players.LocalPlayer.Character.PrimaryPart
                local targetPart = game.Players[TeleportTab.flags.playerDropDown].Character.PrimaryPart
            
                playerPart.CFrame = targetPart.CFrame
            end
        end

        
        game:GetService("UserInputService").JumpRequest:Connect(function()
            if (PlayerTab.flags.infiniteJumpToggle) then
                game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
            end
        end)
    end)
end

-- tab:Button("Kill all", "This function may not work sometimes and you can get banned.", function()
-- Flux:Notification("Killed all players successfully!", "Alright")
-- end)
-- tab:Label("This is just a label.")
-- tab:Line()
-- tab:Toggle("Auto-Farm Coins", "Automatically collects coins for you!", function(t)
-- print(t)
-- end)
-- tab:Slider("Walkspeed", "Makes your faster.", 0, 100,16,function(t)
-- print(t)
-- end)
-- tab:Dropdown("Part to aim at", {"Torso","Head","Penis"}, function(t)
-- print(t)
-- end)
-- tab:Colorpicker("ESP Color", Color3.fromRGB(255,1,1), function(t)
-- print(t)
-- end)
-- tab:Textbox("Gun Power", "This textbox changes your gun power, so you can kill everyone faster and easier.", true, function(t)
-- print(t)
-- end)
-- tab:Bind("Kill Bind", Enum.KeyCode.Q, function()
-- print("Killed a random person!")
-- end)
-- win:Tab("Tab 2", "http://www.roblox.com/asset/?id=6022668888")