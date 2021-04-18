local gameList = loadstring(game:HttpGet('https://raw.githubusercontent.com/BigBoyKlem/GhostHub/master/GameList.lua',true))()

if (not game:GetService('CoreGui'):FindFirstChild("GHOSTGUI")) then
    print('Loading...')

    if gameList[tostring(game.PlaceId)] then
        loadstring(game:HttpGet(string.gsub('https://raw.githubusercontent.com/BigBoyKlem/GhostHub/master/Games/' .. gameList[tostring(game.PlaceId)] .. '.lua', '%s+', '%%20'), true))()
    else
        loadstring(game:HttpGet('https://raw.githubusercontent.com/BigBoyKlem/GhostHub/master/Games/Universal.lua', true))()
    end
end