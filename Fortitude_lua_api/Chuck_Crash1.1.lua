system.setScriptName("~e~Chuck ~v~Crash")

--===[INIT]===--
system.registerConstructor(function()
    logger.logInfo("--============================--")
    logger.logInfo("--         Chuck Crash        --")
    logger.logInfo("--            v1.1            --")
    logger.logInfo("--============================--")
    logger.logInfo("Chuck crash ready. Use from the players tab.")
    notifications.alertInfo("Wagon Crash Loaded")
end)

--===[Submenu]===--
local crash_id = menu.addSubmenu('player', 'Crashes', 'Wagon Crash')

--===[Crash model]===--
local hash_model = 0x7A6A77C7

--===[Functions]===--
local function loadModel(model_hash)
    natives.streaming_requestModel(model_hash)

    while not natives.streaming_hasModelLoaded(model_hash) do
        system.yield(750) 
    end
end
   
local function chuck_crash(player_idx)
    local target_ped = natives.player_getPlayerPed(player_idx)
    local player_name = player.getName(player_idx)
    local target_x, target_y, target_z = player.getCoords(player_idx)
    local focus_object_z = target_z + 10000
    --local focus_object = spawner.spawnObject(hash_model, target_x, target_y, focus_object_z)
    natives.streaming_setFocusEntity(focus_object)
    local wagon_object = spawner.spawnObject(natives.misc_getHashKey("s_chuckwagonawning01b"), target_x, target_y, target_z)
    logger.logInfo('Wagon Crash Sent to ' .. player_name)
    system.yield(500)
    sync.deleteEntitySyncLimit(focus_object)
    sync.clearAllEntitySyncLimiting()
    --spawner.deleteObject(wagon_object)
    spawner.deleteObject(focus_object)
end

--===[Button]===--
menu.addButton(crash_id, 'Chuck Crash  ~e~[AOE]', '', chuck_crash)

--[[--===[unload Handler]===--
system.registerDestructor(function()
    logger.logInfo('Unloading Script')
    
    -- Cleanup without touching the crash model directly
    if natives.streaming_hasModelLoaded(hash_model) then
        logger.logInfo('Crash model is loaded, skipping direct cleanup of the crash model.')
        natives.streaming_setModelAsNoLongerNeeded(hash_model)
    end
    
    -- Cleanup spawned objects or entities safely
    spawner.deleteObject(focus_object)
    spawner.deleteObject(wagon_object)
    notifications.alertInfo('Script Unloaded')
    logger.logInfo('Script Unloaded Successfully')
end)--]]
