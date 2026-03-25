system.setScriptName("~t3~Test-Spawner")

local hash = 0xBB1085F9 --???
local sub = menu.addSubmenu('player', 'Spawner', '')

local player_name = player.getName(player_idx)
local target_x, target_y, target_z = player.getCoords(player_idx)

local function loadModel()
   natives.streaming_requestModel(hash, true)
   if natives.streaming_isModelValid(hash) then 
      logger.logInfo(hash .. " is a valid model.")
   else
      logger.logError(hash .. " is not a valid model.")  
      return false
   end
   while not natives.streaming_hasModelLoaded(hash) do
      system.yield(100)
    end
end    

local function pedSpawner()
    loadModel()
    system.yield(500)
    --local target_ped = natives.player_getPlayerPed(player_idx)
    spawner.spawnPed(hash, target_x, target_y, target_z, true)
end    

local function objSpawner()
    loadModel()
    system.yield(500)
    --local target_ped = natives.player_getPlayerPed(player_idx)
    spawner.spawnObject(hash, target_x, target_y, target_z, true)
end  

local function vehSpawner()
    loadModel()
    system.yield(500)
    --local target_ped = natives.player_getPlayerPed(player_idx)
    spawner.spawnVehicle(hash, target_x, target_y, target_z, false, true)
end    

menu.addButton(sub, 'Spawn as Ped', '', function()
 pedSpawner()
end) 

menu.addButton(sub, 'Spawn as OBJ', '', function()
 objSpawner()
end) 

menu.addButton(sub, 'Spawn as VEH', '', function()
 vehSpawner()
end) 
