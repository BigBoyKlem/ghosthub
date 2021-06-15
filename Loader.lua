local gameList = loadstring(game:HttpGet('https://raw.githubusercontent.com/BigBoyKlem/GhostHub/master/GameList.lua',true))()
local HashLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/Egor-Skriptunoff/pure_lua_SHA/master/sha2.lua', true))()

function checkWhitelist()

    local request = request or http_request or (http and http.request) or syn.request

    local Response = request({Url = 'https://daunting-overcurren.000webhostapp.com/LoginCheck.php?key=' .. (_G.Key or ''), Method = 'GET'})

    if (Response.Body == string.upper(HashLib.md5(HashLib.md5(_G.Key)))) then
        return true
    else
        return false
    end
    return true
end

if (checkWhitelist()) then
    if (not game:GetService('CoreGui'):FindFirstChild('GHOSTGUI')) then
        print('Loading...')
    
        if gameList[tostring(game.PlaceId)] then
            loadstring(game:HttpGet(string.gsub('https://raw.githubusercontent.com/BigBoyKlem/GhostHub/master/Games/' .. gameList[tostring(game.PlaceId)] .. '.lua', '%s+', '%%20'), true))()
        else
            loadstring(game:HttpGet('https://raw.githubusercontent.com/BigBoyKlem/GhostHub/master/Games/Universal.lua', true))()
        end
    end
end