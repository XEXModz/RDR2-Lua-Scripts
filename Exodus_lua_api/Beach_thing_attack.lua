toast.add_info("Lag attack to attack b*tch --By CRAZYPONY")
function request_model(hash)
    local timer <const> = time.unix_milliseconds() + 1000
    while not native.streaming.has_model_loaded(hash) and timer > time.unix_milliseconds() do
        native.streaming.request_model(hash, true)
        thread.yield()
    end
 end
 local function spanw_veh(hash,posVec)
    request_model(hash)
    
    local veh = native.vehicle.create_vehicle(hash, posVec.x, posVec.y, posVec.z, 1, true, true, true, false)
    
    if veh   then
    return veh1
    else
       return false,toast.add_info("Spawn Failed")
    end
 end

 local root = menu.player_root()
 root:add_button("Start to attack1", {}, function (playerIdx)
toast.add_info("Creating")
local playerPed = native.player.get_player_ped(playerIdx)
local posVec = native.entity.get_offset_from_entity_in_world_coords(playerPed, 0, 0, 0)
native.entity.set_entity_coords(playerPed,233,9999, 9999, true, true, true, true)
thread.yield(10)
for i=1,30 do
    object1 = native.object.create_object_no_offset(0xEFA76886,posVec.x, posVec.y, posVec.z-1, true, true, false, false)
    --native.entity.set_entity_visible(object1, false)
end
for i= 1,30 do
    vehicle1 = spanw_veh(0xA385E1C7,posVec)
    --native.entity.set_entity_visible(vehicle1, false)
end
for i=1,30 do
    object2 = native.object.create_object_no_offset(0xF598AEA2,posVec.x, posVec.y, posVec.z-0.9, true, true, false, false)
    --native.network.network_set_entity_only_exists_for_participants(object2, true)
end
for i= 1,2 do
    vehicle2 = spanw_veh(0x861d4c6a,posVec)
    --native.entity.set_entity_visible(vehicle2, false)
end
--native.entity.attach_entity_to_entity(object1, playerPed, 0,0.0, 0.5, 1.0, 0.0, 90.0, 180.0, false, false, false, true, 0, true, false, false)
--native.entity.attach_entity_to_entity(object2, playerPed, 0,0.0, 0.5, 1.0, 0.0, 90.0, 180.0, false, false, false, true, 0, true, false, false)
--native.entity.attach_entity_to_entity(vehicle1, playerPed, 0,0.0, 0.5, 1.0, 0.0, 90.0, 180.0, false, false, false, true, 0, true, false, false)
--native.entity.attach_entity_to_entity(vehicle2, playerPed, 0,0.0, 0.5, 1.0, 0.0, 90.0, 180.0, false, false, false, true, 0, true, false, false)
end)
local root = menu.player_root()
root:add_button("Start to attack2", {}, function (playerIdx)
toast.add_info("Creating")
local playerPed = native.player.get_player_ped(playerIdx)
local posVec = native.entity.get_offset_from_entity_in_world_coords(playerPed, 0, 0, 0)
native.entity.set_entity_coords(playerPed,233,9999, 9999, true, true, true, true)
thread.yield(10)
for i=1,30 do
    object1 = native.object.create_object_no_offset(0xF598AEA2,posVec.x, posVec.y, posVec.z-1, true, true, false, false)
    --native.entity.set_entity_visible(object1, false)
end
for i= 1,20 do
    object2 = native.object.create_object_no_offset(0xCFE1038E,posVec.x, posVec.y, posVec.z-1, true, true, false, false)
    --native.entity.set_entity_visible(object2, false)
end
for i=1,20 do
    object3 = native.object.create_object_no_offset(0xEFA76886,posVec.x, posVec.y, posVec.z-0.9, true, true, false, false)
    --native.entity.set_entity_visible(object3, false)
end
for i= 1,30 do
    vehicle1 = spanw_veh(0x876E6EB7,posVec)
    --native.entity.set_entity_visible(vehicle1, false)
end
--native.entity.attach_entity_to_entity(object1, playerPed, 0,0.0, 0.5, 1.0, 0.0, 90.0, 180.0, false, false, false, true, 0, true, false, false)
--native.entity.attach_entity_to_entity(object2, playerPed, 0,0.0, 0.5, 1.0, 0.0, 90.0, 180.0, false, false, false, true, 0, true, false, false)
--native.entity.attach_entity_to_entity(object3, playerPed, 0,0.0, 0.5, 1.0, 0.0, 90.0, 180.0, false, false, false, true, 0, true, false, false)
--native.entity.attach_entity_to_entity(vehicle1, playerPed, 0,0.0, 0.5, 1.0, 0.0, 90.0, 180.0, false, false, false, true, 0, true, false, false)
end)
local root = menu.player_root()
root:add_button("Start to attack3", {}, function (playerIdx)
toast.add_info("Creating")
local playerPed = native.player.get_player_ped(playerIdx)
local posVec = native.entity.get_offset_from_entity_in_world_coords(playerPed, 0, 0, 0)
for i=1,30 do
    object1 = native.object.create_object_no_offset(0xF598AEA2,posVec.x, posVec.y+1, posVec.z-1, true, true, false, false)
    --native.network.network_set_entity_only_exists_for_participants(object1, true)
end
for i= 1,30 do
    object2 = native.object.create_object_no_offset(0x30766DEF,posVec.x, posVec.y+1, posVec.z-1, true, true, false, false)
    --native.network.network_set_entity_only_exists_for_participants(object2, true)
end
for i= 1,30 do
    object3 = native.object.create_object_no_offset(0x30766DEF,posVec.x, posVec.y+1, posVec.z-1, true, true, false, false)
    --native.network.network_set_entity_only_exists_for_participants(object3, true)
end
end)
script.keep_alive()