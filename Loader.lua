if (game:GetService('CoreGui'):FindFirstChild("GHOSTHUB")) then return end

hookfunction(hookfunction, newcclosure(function(Event, ...)

end))

local gameList = loadstring(game:HttpGet('https://raw.githubusercontent.com/BigBoyKlem/GhostHub/master/GameList.lua',true))()

print('Loading...')

if gameList[tostring(game.PlaceId)] then
    loadstring(game:HttpGet(string.gsub('https://raw.githubusercontent.com/BigBoyKlem/GhostHub/master/' .. 'Games/' .. gameList[tostring(game.PlaceId)] .. '.lua', '%s+', '%%20'), true))()
else
    loadstring(game:HttpGet('https://raw.githubusercontent.com/BigBoyKlem/GhostHub/master/Games/Universal.lua', true))()
end