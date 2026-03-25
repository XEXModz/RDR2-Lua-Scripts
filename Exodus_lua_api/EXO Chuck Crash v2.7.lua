script.set_name("Chuck Crash")
toast.add_info("Chuck Crash v2.7 loaded")
log.add_info("Chuck Crash v2.7 ready use from players tab.")

hash_model_0 = native.misc.get_hash_key('s_chuckwagonawning01b')
hash_model_1 = native.misc.get_hash_key('ship_guama02') 
hash_model_2 = native.misc.get_hash_key('p_test_tinthorse')
hash_model_3 = native.misc.get_hash_key('mp_big_rock_scan_07')
hash_model_4 = native.misc.get_hash_key('bountywagon01x')
hash_model_5 = native.misc.get_hash_key('p_mvhotel_01')

local sub = menu.player_root()

sub:add_button('Crash 1', {}, function (playerIdx)
    local target_ped = native.player.get_player_ped_script_index(playerIdx)
    local player_name = player.get_name(playerIdx)
    local target_pos = native.entity.get_offset_from_entity_in_world_coords(target_ped, 0, 0.5, 0)
    local x, y, z = target_pos.x, target_pos.y, target_pos.z
    local zz = z + 10000
    local zzz = z + 2000
    native.streaming.request_model(0xA385E1C7, true)
    for i = 1, 31 do
     local focus_object0 = native.vehicle.create_vehicle(hash_model_1, x, y, zzz, 1, true, true, true, false)
     local focus_object1 = native.object.create_object(hash_model_2, x, y, zz, true, true, true, true, false)
     native.streaming.set_focus_entity(focus_object1)
     thread.yield(30)
     local object = native.object.create_object(hash_model_0, x, y, z, true, true, true, true, true)
     native.entity.set_entity_alpha(object, 0, true)
    end 
    toast.add_info('Chuck Crash 1 Sent to ' .. player_name)   
end)
  
sub:add_button('Crash 2', {}, function (playerIdx)
    local target_ped = native.player.get_player_ped_script_index(playerIdx)
    local player_name = player.get_name(playerIdx)
    local target_pos = native.entity.get_offset_from_entity_in_world_coords(target_ped, 0, 0.5, 0)
    local x, y, z =  target_pos.x, target_pos.y, target_pos.z
    local zz = z + 10000
    for i = 1, 40 do
     local focus_object1 = native.object.create_object(hash_model_2, x, y, zz, true, true, true, true, false)
     native.streaming.set_focus_entity(focus_object1)
     thread.yield(50)
     local object = native.object.create_object(hash_model_0, x, y, z, true, true, true, true, true)
     native.entity.set_entity_alpha(object, 0, true)
    end
    toast.add_info('Chuck Crash 2 Sent to ' .. player_name)
end)
  
sub:add_button('Chuck Nuke', {}, function (playerIdx)
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
    local focus_1 = z + 10000
    local focus_2 = z + 7000
    local focus_3 = z + 30
    local focus_4 = z + 20
    local focus_5 = z + 15
    
    native.streaming.request_model(0x861D4C6A, true) -- "bountywagon01x"
    native.streaming.request_model(0xA385E1C7, true)
    
    local A = native.vehicle.create_vehicle(hash_model_1, x, y, focus_0, 1, true, true, true, false)
    
    native.streaming.set_focus_entity(A)
    
    native.object.create_object(hash_model_2, x, y, focus_1, true, true, true, true, false)
    
    native.object.create_object(hash_model_3, x, y, focus_2, true, true, true, true, false)

    for i = 1, 12 do
        native.vehicle.create_vehicle(hash_model_4, x, y, focus_3, 1, true, true, true, false)
    end

    thread.yield(100)

    native.streaming.request_model(0xA631E858, true)
    
    for i = 1, 31 do
      native.object.create_object(0xA631E858, x, y - 4, focus_5, true, true, true, true, true)
    end
    
    for i = 1, 10 do 
      local B = native.vehicle.create_vehicle(hash_model_1, x, y, focus_4, 1, true, true, true, false)
    end

    for i = 1, 18 do
        local C = native.object.create_object(hash_model_0, x, y, z, true, true, true, true, true)
        native.entity.set_entity_alpha(C, 0, true)
    end

    for i = 1, 5 do
        native.object.create_object(hash_model_5, x, y, zz, true, true, true, true, true)
    end

    for i = 1, 21 do  
      local D = native.vehicle.create_vehicle(hash_model_1, ff, yy, focus_4, 1, true, true, true, false)
    end  

    for i = 1, 10 do
        native.object.create_object(hash_model_3, x, yyy, zzz, true, true, true, true, true)
    end

    toast.add_info('Chuck Nuke Sent to ' .. player_name)  
end) 
  
script.keep_alive()