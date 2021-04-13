local gameList = loadstring(game:HttpGet('https://raw.githubusercontent.com/BigBoyKlem/GhostHub/master/GameList.lua',true))()

print('Loading...')

if not (_G.Dev) then
    if gameList[tostring(game.PlaceId)] then
        loadstring(game:HttpGet('https://raw.githubusercontent.com/BigBoyKlem/GhostHub/master/' .. 'Games/' .. gameList[tostring(game.PlaceId)] .. '.lua', true))()
    else
        loadstring(game:HttpGet('https://raw.githubusercontent.com/BigBoyKlem/GhostHub/master/Games/Universal.lua', true))()
    end
else
    loadstring(game:HttpGet('https://raw.githubusercontent.com/BigBoyKlem/GhostHub/master/Games/Devel', true))()
end