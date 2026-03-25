system.setScriptName("~e~Chuck ~e~Crash")

system.registerConstructor(function()
  logger.logInfo("--==============================--")
  logger.logInfo("--           Chuck Crash        --")
  logger.logInfo("--              v2.8            --")
  logger.logInfo("--==============================--")
  logger.logInfo("Chuck Crash ready, use from the players tab.")
end)

local hash_model_0 = 0xA385E1C7 -- "ship_guama02"
local hash_model_1 = 0x0FD92BD2 -- "p_test_tinthorse"
local hash_model_2 = 0xF598AEA2 -- "mp_big_rock_scan_07"
local hash_model_3 = 0x3E85EE41 -- "A_C_Horse_TennesseeWalker_GoldPalomino_PC" 
local crash_id = menu.addSubmenu('player', 'Crashes', 'Chuck Crash')

local function loadModel_0(hash_model_0)
  natives.streaming_requestModel(hash_model_0, true)

  if natives.streaming_isModelValid(hash_model_0) then
    logger.logInfo(hash_model_0 .. " model 0 is valid")
  else
    logger.logError(hash_model_0 .. " model 0 is not a valid model!")
    return false
  end

  while not natives.streaming_hasModelLoaded(hash_model_0) do
    system.yield(450)
  end
end 

local function loadModel_1(hash_model_1)
  natives.streaming_requestModel(hash_model_1, true)

  if natives.streaming_isModelValid(hash_model_1) then
    logger.logInfo(hash_model_1 .. " model 1 is valid")
  else
    logger.logError(hash_model_1 .. " model 1 is not a valid model!")
    return false
  end

  while not natives.streaming_hasModelLoaded(hash_model_1) do
    system.yield(80)
  end
end  

local function loadModel_2(hash_model_2)
  natives.streaming_requestModel(hash_model_2, true)

  if natives.streaming_isModelValid(hash_model_2) then
    logger.logInfo(hash_model_2 .. " model 2 is valid")
  else
    logger.logError(hash_model_2 .. " model 2 is not a valid model!")
    return false
  end

  while not natives.streaming_hasModelLoaded(hash_model_2) do
    system.yield(120)
  end
end  
  
local function loadModel_3(hash_model_3)
  natives.streaming_requestModel(hash_model_3, true)

  if natives.streaming_isModelValid(hash_model_3) then
    logger.logInfo(hash_model_3 .. " model 3 is valid")
  else
    logger.logError(hash_model_3 .. " model 3 is not a valid model!")
    return false
  end

  while not natives.streaming_hasModelLoaded(hash_model_3) do
    system.yield(50)
  end
end  

--[[local function chuck_crash0(player_idx)
  loadModel_0(hash_model_0)
  local target_ped = natives.player_getPlayerPed(player_idx)
  local player_name = player.getName(player_idx)
  local target_x, target_y, target_z = player.getCoords(player_idx)
  for i = 1, 15 do
   local focus_object_z = target_z + 10000
   local focus_object0 = spawner.spawnVehicle(hash_model_0, target_x, target_y, focus_object_z)
   natives.streaming_setFocusEntity(focus_object0)
   local wagon_object0 = spawner.spawnObject(natives.misc_getHashKey("s_chuckwagonawning01b"), target_x, target_y, target_z)
   sync.deleteEntitySyncLimit(focus_object0)
   sync.deleteEntitySyncLimit(wagon_object0)
   logger.logInfo('Chuck Crash Sent to ' .. player_name)
  end 
end--]]

local function chuck_crash1(player_idx)
  loadModel_1(hash_model_1)
  local target_ped = natives.player_getPlayerPed(player_idx)
  local player_name = player.getName(player_idx)
  local target_x, target_y, target_z = player.getCoords(player_idx)
  for i = 1, 40 do
   local focus_object_z = target_z + 10000
   local focus_object1 = spawner.spawnObject(hash_model_1, target_x, target_y, focus_object_z)
   natives.streaming_setFocusEntity(focus_object1)
   local wagon_object1 = spawner.spawnObject(natives.misc_getHashKey("s_chuckwagonawning01b"), target_x, target_y, target_z)
   sync.deleteEntitySyncLimit(focus_object1)
   sync.deleteEntitySyncLimit(wagon_object1)
   --spawner.deleteObject(focus_object1)
   --spawner.deleteObject(wagon_object1)
   logger.logInfo('Chuck Crash Sent to ' .. player_name)
  end
end

--[[local function chuck_crash_nuke(player_idx)
  loadModel_0(hash_model_0)
  loadModel_1(hash_model_1)
  loadModel_2(hash_model_2)
  loadModel_3(hash_model_3)
  local target_ped = natives.player_getPlayerPed(player_idx)
  local player_name = player.getName(player_idx)
  local target_x, target_y, target_z = player.getCoords(player_idx)
  local z = target_z - 13
  local yy = target_y + 6
  local focus_object_x = target_x - 0.9
  local focus_object_0 = target_z + 2000
  local focus_object_1 = target_z + 10000
  local focus_object_2 = target_z + 7000
  local focus_object_3 = target_z + 8000
  local f = target_z - 18
  local ff = target_x + 4
  sync.clearAllEntitySyncLimiting()
  for i = 1, 1 do
    local A = spawner.spawnVehicle(hash_model_0, target_x, target_y, focus_object_0)
  end 
  natives.streaming_setFocusEntity(A)
  sync.clearAllEntitySyncLimiting()
  local B = spawner.spawnObject(hash_model_1, target_x, target_y, focus_object_1)
  local C = spawner.spawnObject(hash_model_2, target_x, target_y, focus_object_2)
  sync.clearAllEntitySyncLimiting()
  for i = 1, 80 do
   local D = spawner.spawnObject(hash_model_3, target_x, target_y, focus_object_3)
  end
  sync.clearAllEntitySyncLimiting()
  for i = 1, 5 do 
    local E = spawner.spawnVehicle(hash_model_0, target_x, target_y, f)
  end 
  sync.clearAllEntitySyncLimiting()
  --natives.streaming_setFocusEntity(A)
  --natives.streaming_setFocusEntity(B)
  --natives.streaming_setFocusEntity(C)
  --natives.streaming_setFocusEntity(D)
  --natives.streaming_setFocusEntity(E)
  
  for i = 1, 18 do
    spawner.spawnObject(natives.misc_getHashKey("s_chuckwagonawning01b"), target_x, target_y, target_z)
  end
  sync.clearAllEntitySyncLimiting()
  for i = 1, 2 do
    spawner.spawnObject(natives.misc_getHashKey("p_mvhotel_01"), target_x, target_y, z)
  end
  sync.clearAllEntitySyncLimiting()
  for i = 1, 20 do  
    spawner.spawnVehicle(hash_model_0, ff, yy, target_z, true)
  end  
  sync.clearAllEntitySyncLimiting()
  for i = 1, 10 do
   spawner.spawnObject(hash_model_2, focus_object_x, target_y, z, true)
  end
  sync.clearAllEntitySyncLimiting()
  natives.entity_setEntityVisible(hash_model_0, false)
  natives.entity_setEntityVisible(hash_model_2, false)
  natives.entity_setEntityVisible("s_chuckwagonawning01b", false)
  natives.entity_setEntityVisible("p_mvhotel_01", false)
  logger.logInfo('Chuck Nuke Sent to ' .. player_name)  
end --]]

--menu.addButton(crash_id, 'Chuck Crash 0 ~e~ [AOE] ', '', chuck_crash0)
menu.addButton(crash_id, 'Chuck Crash ~e~ [AOE] ', '', chuck_crash1)
--menu.addButton(crash_id, 'Chuck Nuke Crash ~e~ [AOE] ', '', chuck_crash_nuke)
