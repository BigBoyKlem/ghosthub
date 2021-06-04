local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/BigBoyKlem/GhostHub/master/Library.lua", true))()
local HashLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/Egor-Skriptunoff/pure_lua_SHA/master/sha2.lua', true))()


function checkWhitelist()

    local request = request or http_request or (http and http.request) or syn.request

    local Response = request({Url = 'http://ghosthub.xyz/LoginCheck.php?key=' .. (_G.Key or ''), Method = 'GET'})

    if (Response.Body == string.upper(HashLib.md5(HashLib.md5(_G.Key)))) then
        return true
    else
        return false
    end
    return true
end

if (checkWhitelist()) then

    local mainWindow = library:CreateWindow("Bitcoin Miner")
    local playerWindow = library:CreateWindow("Player")
    local teleportWindow = library:CreateWindow("Teleport")
    local miscWindow = library:CreateWindow("Misc")

    local plot
    local noClipToggled = false
    local playerlist = {}

    for i,v in pairs(game.Players:GetPlayers())do
        if v ~= game.Players.LocalPlayer then
            table.insert(playerlist,v.Name)
        end
    end

    for i,v in pairs(game.Workspace:GetChildren()) do
        if (v.Name:match('Plot_')) then
            local plotName = v.Tabliczka.wr.SurfaceGui.Text.Text:gsub("'s plot", '')
                
            if (plotName == game.Players.LocalPlayer.Name) then
                plot = v
            end
        end
    end

    mainWindow:Button("Exchange Bitcoin", function()
        local originalPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(243.335358, 5.49769545, 85.1367645)
        wait(.15)
        game.ReplicatedStorage.Events.ExchangeMoney:FireServer(true)
        wait(.15)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = originalPos
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

    teleportWindow:Button("Teleport to Store", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(180.727631, 10.24996662, 86.3693695)
    end)

    teleportWindow:Button("Teleport to Plot", function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = plot.Floor.CFrame + Vector3.new(0,10,0)
    end)
    local playerDropDown = teleportWindow:Dropdown("Player", {flag = "playerDropDown", list = playerlist})

    teleportWindow:Button("Teleport", function()
        local playerPart = game.Players.LocalPlayer.Character.PrimaryPart
        local targetPart = game.Players[teleportWindow.flags.playerDropDown].Character.PrimaryPart

        playerPart.CFrame = targetPart.CFrame
    end)

    teleportWindow:Toggle("Annoy Player", {flag = 'annoyPlayerToggle'})

    miscWindow:Toggle("Remove Others Plots", {flag = 'removeOthersPlots'})

    miscWindow:Button("Rejoin Game", function()
        game:GetService('TeleportService'):Teleport(game.PlaceId, game.Players.LocalPlayer)
    end)

    miscWindow:Button("Get Discord Link", function()
        setclipboard(loadstring(game:HttpGet('https://raw.githubusercontent.com/BigBoyKlem/GhostHub/master/ScriptHub/DiscordLink.lua',true))())
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
        pcall(function()

            -- Walk Speed / Jump Power
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = playerWindow.flags.walkSpeedSlider
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = playerWindow.flags.jumpPowerSlider

            -- FOV
            game.Workspace.CurrentCamera.FieldOfView = playerWindow.flags.fovSlider

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

            for _,v in pairs(game.Workspace.Buildings:GetChildren()) do
                if (v.Name ~= game.Players.LocalPlayer.Name and miscWindow.flags.removeOthersPlots) then
                    v:Destroy()
                end
            end
        end)
    end
end