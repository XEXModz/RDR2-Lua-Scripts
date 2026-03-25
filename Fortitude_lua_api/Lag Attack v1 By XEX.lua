system.setScriptName("~e~Lag Atack")
system.registerConstructor(function()
  logger.logInfo("--====================--")
  logger.logInfo("--      Lag Attack    --")
  logger.logInfo("--         v1         --")
  logger.logInfo("--====================--")
  logger.logInfo("[Lag Attack] - Use from the players tab.")
end)

HASH_BIG_ROCK = 0xF598AEA2
VEHICLE_HASH_1 = 0xC6FA5BFF
VEHICLE_HASH_2 = 0x38648FEF
VEHICLE_HASH_3 = 0x861D4C6A
VEHICLE_HASH_4 = 0xA385E1C7
PROP_HASH = 0xA631E858

sub_id = menu.addSubmenu('player', 'Attacks', 'Lag Attack')

local function load_VEHICLE_HASH_1(VEHICLE_HASH_1)
  natives.streaming_requestModel(VEHICLE_HASH_1, true)

  if natives.streaming_isModelValid(VEHICLE_HASH_1) then
    logger.logInfo(VEHICLE_HASH_1 .. " VEHICLE HASH 1 loaded")
  else
    logger.logError(VEHICLE_HASH_1 .. " VEHICLE HASH 1 is not a valid model!")
    return false
  end

  while not natives.streaming_hasModelLoaded(VEHICLE_HASH_1) do
    system.yield(450)
  end
end 

local function load_VEHICLE_HASH_2(VEHICLE_HASH_2)
  natives.streaming_requestModel(VEHICLE_HASH_2, true)

  if natives.streaming_isModelValid(VEHICLE_HASH_2) then
    logger.logInfo(VEHICLE_HASH_2 .. " VEHICLE HASH 2 loaded")
  else
    logger.logError(VEHICLE_HASH_2 .. " VEHICLE HASH 2 is not a valid model!")
    return false
  end

  while not natives.streaming_hasModelLoaded(VEHICLE_HASH_2) do
    system.yield(450)
  end
end 

local function load_VEHICLE_HASH_3(VEHICLE_HASH_3)
  natives.streaming_requestModel(VEHICLE_HASH_3, true)

  if natives.streaming_isModelValid(VEHICLE_HASH_3) then
    logger.logInfo(VEHICLE_HASH_3 .. "VEHICLE HASH 3 loaded")
  else
    logger.logError(VEHICLE_HASH_3 .. " VEHICLE HASH 3 is not a valid model!")
    return false
  end

  while not natives.streaming_hasModelLoaded(VEHICLE_HASH_3) do
    system.yield(450)
  end
end 


local function load_VEHICLE_HASH_4(VEHICLE_HASH_4)
  natives.streaming_requestModel(VEHICLE_HASH_4, true)

  if natives.streaming_isModelValid(VEHICLE_HASH_4) then
    logger.logInfo(VEHICLE_HASH_4 .. "VEHICLE HASH 4 loaded")
  else
    logger.logError(VEHICLE_HASH_4 .. " VEHICLE HASH 4 is not a valid model!")
    return false
  end

  while not natives.streaming_hasModelLoaded(VEHICLE_HASH_4) do
    system.yield(450)
  end
end 


local function load_hash_big_rock(HASH_BIG_ROCK)
  natives.streaming_requestModel(HASH_BIG_ROCK, true)

  if natives.streaming_isModelValid(HASH_BIG_ROCK) then
    logger.logInfo(HASH_BIG_ROCK .. " HASH BIG ROCK loaded")
  else
    logger.logError(HASH_BIG_ROCK .. " HASH_BIG_ROCK is not a valid model!")
    return false
  end

  while not natives.streaming_hasModelLoaded(HASH_BIG_ROCK) do
    system.yield(120)
  end
end  
    
local function load_prop_hash(PROP_HASH)
  natives.streaming_requestModel(PROP_HASH, true)

  if natives.streaming_isModelValid(PROP_HASH) then
    logger.logInfo(PROP_HASH .. " PROP HASH loaded")
  else
    logger.logError(PROP_HASH .. " PROP_HASH is not a valid model!")
    return false
  end

  while not natives.streaming_hasModelLoaded(PROP_HASH) do
    system.yield(50)
  end
end  

local function lag_attack(player_idx)
  load_VEHICLE_HASH_1(VEHICLE_HASH_1)
  load_VEHICLE_HASH_2(VEHICLE_HASH_2)
  load_prop_hash(PROP_HASH)
  local target_ped = natives.player_getPlayerPed(player_idx)
  local player_name = player.getName(player_idx)
  local x, y, z = player.getCoords(player_idx)
  
  for i = 1, 31 do
   local A = spawner.spawnObject(PROP_HASH, x, y, z + 13, true) 
    --natives.entity_setEntityAlpha(A, 0, false)
  end

  for i = 1, 31 do                           
   local B = spawner.spawnObject(VEHICLE_HASH_2, x, y, z + 15, true)
    --natives.entity_setEntityAlpha(B, 0, false)
  end

  for i = 1, 1 do                           
    local trigger_obj = spawner.spawnVehicle(0xC2D200FE, x, y, z + 20, true, true)
    natives.physics_activatePhysics(trigger_obj)
    --natives.entity_setEntityAlpha(trigger_obj, 0, false)
  end        
  
  toast.add_info('Lag sent to ' .. player_name)
end

local function big_lag(player_idx) --{Still in work may crash you}
  load_VEHICLE_HASH_1(VEHICLE_HASH_1)
  load_VEHICLE_HASH_2(VEHICLE_HASH_2)
  load_VEHICLE_HASH_3(VEHICLE_HASH_3)
  load_VEHICLE_HASH_4(VEHICLE_HASH_4)
  load_hash_big_rock(HASH_BIG_ROCK)
  load_prop_hash(PROP_HASH)
  local target_ped = natives.player_getPlayerPed(player_idx)
  local player_name = player.getName(player_idx)
  local x, y, z = player.getCoords(player_idx)
  
  --[[for i = 1, 5 do
   A = spawner.spawnVehicle(VEHICLE_HASH_2, x, y, z + 10, true)
   natives.network_networkSetEntityInvisibleToNetwork(A)
  end--]]

  for i = 1, 2 do 
    local B = spawner.spawnObject(HASH_BIG_ROCK, x, y - 1, z, true)
    --natives.entity_setEntityAlpha(B, 0, false)
  end
  
  for i = 1, 2 do
   local C = spawner.spawnObject(VEHICLE_HASH_3, x, y + 4, z + 25, true)
    --natives.entity_setEntityAlpha(C, 0, false)
  end

  system.yield(500)
  
  for i = 1, 2 do
   local D = spawner.spawnObject(PROP_HASH, x, y, z + 13, true)
    --natives.entity_setEntityAlpha(D, 0, false)
  end

  for i = 1, 2 do
   local E = spawner.spawnObject(VEHICLE_HASH_1, x, y, z + 15, true)
    --natives.entity_setEntityAlpha(E, 0, false)
  end

  for i = 1, 2 do
   local F = spawner.spawnObject(VEHICLE_HASH_4, x, y, z + 20, true)
    --natives.entity_setEntityAlpha(F, 0, false)
  end
  
  system.yield(100)
  
  for i = 1, 5 do
    local trigger_obj = spawner.spawnVehicle(0xC2D200FE, x, y, z + 30, true, true)
    natives.physics_activatePhysics(trigger_obj)
    --natives.entity_setEntityAlpha(trigger_obj, 0, false)
  end

  toast.add_info('Big Lag Sent to ' .. player_name)
end

menu.addButton(sub_id, 'Boat Lag Attack 1 ~e~ [AOE] ', 'Will lag you if close, stay atleast 500M. ', lag_attack)
menu.addButton(sub_id, 'Boat Lag Attack 2 ~e~ [AOE] ', 'This may crash you if near, stay 5000M+ away! ', big_lag)
