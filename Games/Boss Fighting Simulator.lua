local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/BigBoyKlem/GhostHub/master/Library.lua", true))()

local AutoFarmWindow = library:CreateWindow("Auto Farm")
local EggsWindow = library:CreateWindow("Eggs")
local ShopsWindow = library:CreateWindow("Shops")
local playerWindow = library:CreateWindow("Player")
local teleportWindow = library:CreateWindow("Teleport")
local miscWindow = library:CreateWindow("Misc")

local noClipToggled = false
local playerlist = {}
local eggList = {}

for i,v in pairs(game.Players:GetPlayers())do
    if v ~= game.Players.LocalPlayer then
        table.insert(playerlist,v.Name)
    end
end

for i,v in pairs(game.Workspace.Eggs:GetChildren()) do
    table.insert(eggList,v.Name)
end


AutoFarmWindow:Toggle("Enable Auto Farm", {flag = 'autoFarmToggle'})
AutoFarmWindow:Toggle("Auto Sell", {flag = 'autoSellToggle'})

EggsWindow:Dropdown("Egg Type", {flag = "eggTypeDropdown", list = eggList}, function(value)

end)

EggsWindow:Button("Open Egg", function()
    game.ReplicatedStorage.Remotes.EggPurchase:InvokeServer(EggsWindow.flags.eggTypeDropdown)
end)

ShopsWindow:Button("Open Shop", function()
    game.ReplicatedStorage.Remotes.OpenShop:Fire()
end)

ShopsWindow:Button("Open Rune Shop", function()
    game.ReplicatedStorage.Remotes.OpenRuneShop:Fire()
end)

playerWindow:Slider("Walk Speed", {flag = "walkSpeedSlider", min = 16, max = 500})
playerWindow:Slider("Jump Power", {flag = "jumpPowerSlider", min = 50, max = 500})
playerWindow:Slider("FOV", {flag = "fovSlider", min = 70, max = 120})

playerWindow:Toggle("Anti AFK", {flag = "antiAFKToggle"}, function(value)
    if (value) then
        if (playerWindow.flags.antiAFKToggle) then
            local VirtualUser=game:GetService('VirtualUser')
            game:GetService('Players').LocalPlayer.Idled:Connect(function()
                VirtualUser:CaptureController()
                VirtualUser:ClickButton2(Vector2.new())
            end)
        end
    end
end)

playerWindow:Toggle("Infinite Jump", {flag = "infiniteJumpToggle"})

playerWindow:Bind("No Clip", {flag = "noClipBind", kbonly = true, default = Enum.KeyCode.E}, function()
    
    noClipToggled = not noClipToggled
    
    game:GetService('RunService').Stepped:Connect(function()
        if (noClipToggled) then
            game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
        end
    end)
end)

local playerDropDown = teleportWindow:Dropdown("Player", {flag = "playerDropDown", list = playerlist})

teleportWindow:Button("Teleport", function()
    local playerPart = game.Players.LocalPlayer.Character.PrimaryPart
    local targetPart = game.Players[teleportWindow.flags.playerDropDown].Character.PrimaryPart

    playerPart.CFrame = targetPart.CFrame
end)

teleportWindow:Toggle("Annoy Player", {flag = 'annoyPlayerToggle'})

miscWindow:Button("Rejoin Game", function()
    game:GetService('TeleportService'):Teleport(game.PlaceId, game.Players.LocalPlayer)
end)

miscWindow:Button("Get Discord Link", function()
    setclipboard(loadstring(game:HttpGet('https://raw.githubusercontent.com/BigBoyKlem/GhostHub/master/DiscordLink.lua',true))())
end)

game.Players.PlayerAdded:Connect(function(player)
    local name = player.Name
    table.insert(playerlist,name)
    playerDropDown:Refresh(playerlist)
end)

game.Players.PlayerRemoving:Connect(function(player)
    local name = player.Name
    for i,v in pairs(playerlist)do
        if v == name then  
            table.remove(playerlist,i)
        end
    end
    playerDropDown:Refresh(playerlist)
end)

while wait() do
    spawn(
        function()
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = playerWindow.flags.walkSpeedSlider
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = playerWindow.flags.jumpPowerSlider

            game.Workspace.CurrentCamera.FieldOfView = playerWindow.flags.fovSlider

            if (AutoFarmWindow.flags.autoSellToggle) then
                game.ReplicatedStorage.Remotes.SellPower:InvokeServer()
            end

            if (AutoFarmWindow.flags.autoFarmToggle) then

                for i,v in pairs(game.Players.LocalPlayer.Weapons:GetChildren()) do
                    if (game.Players.LocalPlayer.Character:FindFirstChild(v.Name)) then
                        game.Players.LocalPlayer.Character:FindFirstChild(v.Name):Activate()
                    elseif(game.Players.LocalPlayer.Backpack:FindFirstChild(v.Name)) then
                        game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack[v.Name])
                    end
                end
            end

            if (teleportWindow.flags.annoyPlayerToggle) then
                if (game.Players[teleportWindow.flags.playerDropDown].Character ~= nil and game.Players.LocalPlayer.Character ~= nil) then
                    local playerPart = game.Players.LocalPlayer.Character.PrimaryPart
                    local targetPart = game.Players[teleportWindow.flags.playerDropDown].Character.PrimaryPart
                
                    playerPart.CFrame = targetPart.CFrame
                end
            end

            game:GetService("UserInputService").JumpRequest:Connect(function()
                if (playerWindow.flags.infiniteJumpToggle) then
                    game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
                end
            end)
        end
    )
end