local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/BigBoyKlem/GhostHub/master/Library.lua", true))()
local HashLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/Egor-Skriptunoff/pure_lua_SHA/master/sha2.lua', true))()


function checkWhitelist() 
    local Response = syn.request({Url = 'http://ghosthub.xyz/LoginCheck.php?key=' .. (_G.Key or ''), Method = 'GET'})

    if (Response.Body == string.upper(HashLib.md5(_G.Key))) then
        return true
    else
        return false
    end
end

if (checkWhitelist()) then

    local autoFarmWindow = library:CreateWindow("Auto Farm")
    local playerWindow = library:CreateWindow("Player")
    local teleportWindow = library:CreateWindow("Teleport")
    local miscWindow = library:CreateWindow("Misc")

    originalfunction = hookfunction(wait, function(seconds)
        if seconds == 1 and miscWindow.flags.disableAnswerCooldown then
            seconds = 0
        end
        return originalfunction(seconds)
    end)

    local noClipToggled = false
    local playerlist = {}

    local blackList = {
        14403930,
        11437160,
        18640030,
        175261337,
        51714312,
        964572934,
        122782805,
        263272606,
        81602478,
        1409610507,
        560335244,
        222114698,
        1766744161,
        1289720961,
        309937564,
        1028976330,
        66822893,
        13151032,
        934872298,
        18029658,
        73597521,
        138579882,
        284474810,
        148166235,
        351603426,
        184233445,
        659090074,
        212661139,
        443770971,
        49601674,
        84924035,
        109282935,
        446695757,
        25403910,
        89329322,
        41359669,
        67264210
    }

    for i,v in pairs(game.Players:GetPlayers())do
        if v ~= game.Players.LocalPlayer then
            table.insert(playerlist,v.Name)
        end
    end

    autoFarmWindow:Toggle("Auto Farm", {flag = 'autoFarmToggle'})
    autoFarmWindow:Toggle("Auto Upgrade IQ", {flag = 'autoUpgradeIQToggle'})
    autoFarmWindow:Toggle("Auto Upgrade C$", {flag = 'autoUpgradeCToggle'})
    autoFarmWindow:Toggle("Auto Rebirth", {flag = 'autoRebirthToggle'})

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

    miscWindow:Toggle("Anti Staff", {flag = 'antiStaffToggle'})
    miscWindow:Toggle("Disable Answer Cooldown", {flag = 'disableAnswerCooldown'})

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
        end)

        if (autoFarmWindow.flags.autoFarmToggle) then
            local function format(textToFormat)
                textToFormat = textToFormat:gsub('<br%s*/>', '')
                textToFormat = textToFormat:gsub("What's", '')
                textToFormat = textToFormat:gsub("?", '')
                textToFormat = textToFormat:gsub("<[^<>]->", '')
            
                return string.split(textToFormat, ' ')
            end
            
            function solve()
            
                local player = game.Players.LocalPlayer
                local question = player.PlayerGui.UI.Holder.Main.Question.Text
            
                local problem = format(question)
            
                local num1 = problem[2]
                local operator = problem[3]
                local num2 = problem[4]
                
                local answer = nil
            
                if operator == '-' then
                    answer = num1 - num2
                elseif operator == '+' then
                    answer = num1 + num2
                elseif operator == '*' then
                    answer = num1 * num2
                end
            
                for i,v in pairs(player.PlayerGui.UI.Holder.Main.Answers:GetChildren()) do
                    if (v.Text == tostring(answer)) then
                        for _,v in pairs(getconnections(v.MouseButton1Click)) do
                            v:Fire()
                        end
                    end
                end
            end
            solve()
        end

        if (miscWindow.flags.antiStaffToggle) then
            for i,v in pairs(game.Players:GetPlayers()) do
                if (table.find(blackList, v.UserId)) then
                    game.Players.LocalPlayer:Kick("[GHOST Hub] - Staff Member Joined")
                end
            end
        end

        if (autoFarmWindow.flags.autoUpgradeIQToggle) then
            game.ReplicatedStorage.RequestBuy:FireServer("IQ")
        end

        if (autoFarmWindow.flags.autoUpgradeCToggle) then
            game.ReplicatedStorage.RequestBuy:FireServer("Coins")
        end

        if (autoFarmWindow.flags.autoRebirthToggle) then
            game.ReplicatedStorage.RequestBuy:FireServer("Rebirth")
        end

    end
end