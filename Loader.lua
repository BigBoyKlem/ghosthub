local gameList = loadstring(game:HttpGet('https://raw.githubusercontent.com/BigBoyKlem/GhostHub/master/GameList.lua',true))()

print('Loading...')

if gameList[tostring(game.PlaceId)] then
    loadstring(game:HttpGet('https://raw.githubusercontent.com/BigBoyKlem/GhostHub/master/Games/' .. string.gsub(gameList[tostring(game.PlaceId)], '%s+', '%%20') .. '.lua', true))()
else
    loadstring(game:HttpGet('https://raw.githubusercontent.com/BigBoyKlem/GhostHub/master/Games/Universal.lua', true))()
end