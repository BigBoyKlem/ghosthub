local gameList = loadstring(game:HttpGet('https://raw.githubusercontent.com/BigBoyKlem/GhostHub/master/GameList.lua',true))()

print('Loading...')
if gameList[tostring(game.PlaceId)] then
    loadstring(game:HttpGet('https://raw.githubusercontent.com/BigBoyKlem/GhostHub/master/' .. 'Games/' .. gameList[tostring(game.PlaceId)] .. '.lua', true))()
    print('Found Game')
else
    loadstring(game:HttpGet('https://raw.githubusercontent.com/BigBoyKlem/GhostHub/master/Games/Universal.lua', true))()
    print('No game found, using the universal script.')
end