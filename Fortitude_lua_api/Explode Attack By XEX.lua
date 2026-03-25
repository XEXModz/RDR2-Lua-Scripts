local explosionLoops = {}  
local screenShakeLoops = {}

local function screenShakeLoop(player_idx)
    local target_ped = natives.player_getPlayerPed(player_idx)
    local player_name = player.getName(player_idx)
    local x, y, z = player.getCoords(player_idx)
    if x and y and z then
        natives.fire_addExplosion(
            x, y, z,
            22,       --Explosion type 
            10.0,     --Damage scale
            false,    --Audible
            false,     --Invisible
            1.0       --Camera shake
        )
    else
        logger.logError("Could not get coords for " .. player_name)
    end
end    


local function explodeLoop(player_idx)
    local target_ped = natives.player_getPlayerPed(player_idx)
    local player_name = player.getName(player_idx)
    local x, y, z = player.getCoords(player_idx)
    if x and y and z then
        natives.fire_addExplosion(
            x, y, z,
            24,       --Explosion type 
            10.0,     --Damage scale
            false,    --Audible
            false,     --Invisible
            1.0       --Camera shake
        )
    else
        logger.logError("Could not get coords for " .. player_name)
    end
end    

--buttons
menu.addToggleButton("player", "Screen Shake loop", "", false, function(toggle, player_idx)
    screenShakeLoops[player_idx] = toggle
    if toggle then
        logger.logInfo("Screen shake started on: " .. player.getName(player_idx))
    else
        logger.logInfo("Screen shake stopped on: " .. player.getName(player_idx))
    end
end)

menu.addToggleButton("player", "Explode loop", "", false, function(toggle, player_idx)
    explosionLoops[player_idx] = toggle
    if toggle then
        logger.logInfo("Explode loop started on: " .. player.getName(player_idx))
    else
        logger.logInfo("Explode loop stopped on: " .. player.getName(player_idx))
    end
end)

--Loop handler
system.registerTick(function()
    for player_idx, enabled in pairs(screenShakeLoops) do
        if enabled then
            screenShakeLoop(player_idx)
        end
    end

    for player_idx, enabled in pairs(explosionLoops) do
        if enabled then
            explodeLoop(player_idx)
        end
    end

    thread.yield(2000)
end)

menu.addButton('', 'Loaded', '', function() end)
