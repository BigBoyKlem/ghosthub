local gameList = loadstring(game:HttpGet('https://raw.githubusercontent.com/BigBoyKlem/GhostHub/master/GameList.lua',true))()

for i,v in pairs(gameList) do
    if (v == game.PlaceId) then
        loadstring(game:HttpGet('https://raw.githubusercontent.com/BigBoyKlem/GhostHub/master/' .. 'Games/' .. gameList[v] .. '.lua', true))
    end
end