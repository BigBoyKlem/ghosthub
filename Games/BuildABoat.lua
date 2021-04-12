local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wally2", true))()

local playerWindow = library:CreateWindow("Player")
local miscWindow = library:CreateWindow("Misc")

playerWindow:Slider("Walk Speed", {flag = "walkSpeedSlider", min = 16, max = 500})
playerWindow:Slider("Jump Power", {flag = "jumpPowerSlider", min = 50, max = 500})

miscWindow:Button("Rejoin Game", function()
    game:GetService('TeleportService'):Teleport(game.PlaceId, game.Players.LocalPlayer)
end)

miscWindow:Button("Get Discord Link", function()
    setclipboard(loadstring(game:HttpGet('https://raw.githubusercontent.com/BigBoyKlem/GhostHub/master/DiscordLink.lua',true))())
end)

while wait() do
    pcall(function()
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = playerWindow.flags.walkSpeedSlider
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = playerWindow.flags.jumpPowerSlider
    end)
end