system.setScriptName("~e~Chuck ~e~Crash_V2.10")

system.registerConstructor(function()
    logger.logInfo("--==============================--")
    logger.logInfo("--           Chuck Crash        --")
    logger.logInfo("--              v2.10           --")
    logger.logInfo("--==============================--")
    logger.logInfo("Chuck Crash ready, use from the players tab.")
end)

-- Model hashes
local hash_model_0 = 0xA385E1C7 -- "ship_guama02"
local hash_model_1 = 0x0FD92BD2 -- "p_test_tinthorse"
local hash_model_2 = 0xF598AEA2 -- "mp_big_rock_scan_07"
local hash_model_3 = 0x3E85EE41 -- "A_C_Horse_TennesseeWalker_GoldPalomino_PC" 

-- Menu
local crash_id = menu.addSubmenu('player', 'Crashes', 'Chuck Crash')

-- Tables for tracking spawned objects
local spawnedObjects = {}
local spawnTimes = {}
local deleteDelay = 5000 -- milliseconds

-- Tick to auto-delete spawned objects
system.registerTick(function(frame)
    local currentTick = system.getTickCount64()

    for i = #spawnedObjects, 1, -1 do
        local obj = spawnedObjects[i]

        -- store spawn time if not already stored
        if not spawnTimes[obj] then
            spawnTimes[obj] = currentTick
        end

        -- delete object after delay
        if currentTick - spawnTimes[obj] > deleteDelay then
            if natives.entity_doesEntityExist(obj) then
                spawner.deleteObject(obj)
            end
            table.remove(spawnedObjects, i)
            spawnTimes[obj] = nil
        end
    end
end)

-- Model loading functions
local function loadModel(hash)
    natives.streaming_requestModel(hash, true)
    if natives.streaming_isModelValid(hash) then
        logger.logInfo(hash .. " model is valid")
    else
        logger.logError(hash .. " model is not valid!")
        return false
    end
    while not natives.streaming_hasModelLoaded(hash) do
        system.yield(100)
    end
end

-- Chuck Crash function
local function chuck_crash1(player_idx)
    loadModel(hash_model_1)
    local target_ped = natives.player_getPlayerPed(player_idx)
    local player_name = player.getName(player_idx)
    local target_x, target_y, target_z = player.getCoords(player_idx)

    for i = 1, 40 do
        local focus_object_z = target_z + 10000
        local focus_object1 = spawner.spawnObject(hash_model_1, target_x, target_y, focus_object_z)
        natives.streaming_setFocusEntity(focus_object1)
        table.insert(spawnedObjects, focus_object1)

        local wagon_object1 = spawner.spawnObject(natives.misc_getHashKey("s_chuckwagonawning01b"), target_x, target_y, target_z)
        table.insert(spawnedObjects, wagon_object1)
    end

    logger.logInfo('Chuck Crash Sent to ' .. player_name)
end

-- Menu button
menu.addButton(crash_id, 'Chuck Crash ~e~ [AOE] ', '', chuck_crash1)
