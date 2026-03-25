lua_fast_calls = {}

--//Common//--
function lua_fast_calls.s_ID()
    return native.player.s_ID()
end
function lua_fast_calls.get_local_heading()
    return native.entity.get_entity_heading(lua_fast_calls.get_s_player_ped())
end
function lua_fast_calls.get_local_pos()
    return native.entity.get_entity_coords(lua_fast_calls.get_s_player_ped(), true, true)
end
function lua_fast_calls.get_s_player_ped()
    return native.player.player_ped_id()
end
function lua_fast_calls.player_pedIDX()
    return native.player.get_player_ped_script_index()
end
function lua_fast_calls.get_net_player_ped()
    local player_pedIDX <const> = lua_fast_calls.player_pedIDX()
    return native.player.get_player_ped(player_pedIDX)
end
function lua_fast_calls.get_net_player_heading()
    return native.entity.get_entity_heading(lua_fast_calls.n_player_heading())
end
function lua_fast_calls.get_entity_coords(ent)
    return native.entity.get_entity_coords(ent, false, false)
end
--//Advanced//--
function lua_fast_calls.hash_key(Hash_key)
    return native.misc.get_hash_key(Hash_key)
end
function lua_fast_calls.request_control(ent, timeout)
    local timer <const> = time.unix_milliseconds() + timeout
    while native.network.network_has_control_of_entity(ent) or timer > time.unix_milliseconds() do
        native.network.network_request_control_of_entity(ent)
        thread.yield()
    end
    if native.network.network_has_control_of_entity(ent) then
        return true
    else
        return false
    end
end
function lua_fast_calls.delete_object(ent)
    native.entity.set_entity_as_mission_entity(ent)
    native.entity.set_entity_coords(ent { 4503.726, -635.393, 71.421 })
    native.delete_entity_2(ent) 
end
function lua_fast_calls.spawnGoldChest(playerIdx)
    local targetPed = native.player.get_player_ped_script_index(playerIdx)
    local playerPosX, playerPosY, playerPosZ = native.entity.entity_getEntityCoords(targetPed, true, true)
  
    lua_object.create_object(0xAC33C49, playerPosX, playerPosY + 1, playerPosZ - 1)--0x2AB28031
    thread.yield(50)
end
function lua_fast_calls.request_model(hash)
    local timer <const> = time.unix_milliseconds() + 1000
    while not native.streaming.has_model_loaded(hash) and timer > time.unix_milliseconds() do
        native.streaming.request_model(hash, true)
        thread.yield()
    end
end

function lua_fast_calls.give_weapons_to_ped(Target_ped, Weapon_ID, int, bool, bool, int, bool, int, int, int, bool, bool, bool)
    return native.weapon.give_weapon_to_ped()
end
function lua_fast_calls.task_follow_to_offset_of_offset(Main_ped, Target_ped, int, int, int, int, int, int, bool, int, int, bool, bool, bool, bool, bool, bool)
    return native.task.task_follow_to_offset_of_entity()
end

--------------
--//Features//
--------------
function lua_fast_calls.Recovery_ANI_Spawn()
    -------------
    --//Defines//
    -------------
    local player_ped <const> = native.player.player_ped_id()
    local coords <const> = native.entity.get_entity_coords(player_ped, true, true)
    
    --------------
    --//Spawning//
    --------------
    local Hash <const> = hash.joaat('mp_a_c_buffalo_01')
    lua_fast_calls.request_model(Hash)
    for i= 1,3 do
    TatankaLegendary = native.ped.create_ped(Hash, coords.x, coords.y, coords.z, 0, true, true, false, false)
    native.entity.set_entity_health(TatankaLegendary, 0, 0)
    end
    thread.yield(500)

    for i = 1,3 do
        TatankaPaytaLegendary = native.ped.create_ped(0xC971C4C6, coords.x, coords.y, coords.z, 0, true, true, false, false)
        native.ped._equip_meta_ped_outfit_preset(TatankaPaytaLegendary, 2, false) 
        native.entity.set_entity_health(TatankaPaytaLegendary, 0, 0)
    end

    
    
    
    local Hash <const> = hash.joaat('a_c_boarlegendary_01')
    lua_fast_calls.request_model(Hash)
    for i = 1,3 do
    BoarLegendary = native.ped.create_ped(Hash, coords.x, coords.y, coords.z, 0, true, true, false, false)
    native.entity.set_entity_health(BoarLegendary, 0, 0)
    end
    thread.yield(500)

    for i = 1,3 do
        BoarLegendary = native.ped.create_ped(0xDE99DA6D, coords.x, coords.y, coords.z, 0, true, true, false, false)
        native.ped._equip_meta_ped_outfit_preset(BoarLegendary, 2, false) 
        native.entity.set_entity_health(BoarLegendary, 0, 0)
    end



    local Hash <const> = hash.joaat('a_c_boar_01')
    lua_fast_calls.request_model(Hash)
    for i = 1,3 do
    Boar1 = native.ped.create_ped(Hash, coords.x, coords.y, coords.z, 0, true, true, false, false)
    native.entity.set_entity_health(Boar1, 0, 0)
    end
    thread.yield(500)

    for i = 1,3 do
        Boar1 = native.ped.create_ped(0x78EBDA79, coords.x, coords.y, coords.z, 0, true, true, false, false)
        native.ped._equip_meta_ped_outfit_preset(Boar1, 2, false) 
        native.entity.set_entity_health(Boar1, 0, 0)
    end




    local Hash <const> = hash.joaat('a_c_chicken_01')
    lua_fast_calls.request_model(Hash)
    for i = 1,3 do
    Chicken1 = native.ped.create_ped(Hash, coords.x, coords.y, coords.z, 0, true, true, false, false)
    native.entity.set_entity_health(Chicken1, 0, 0)
    end
    thread.yield(500)

    for i = 1,3 do
        Chicken1 = native.ped.create_ped(0x8506531D, coords.x, coords.y, coords.z, 0, true, true, false, false)
        native.ped._equip_meta_ped_outfit_preset(Chicken1, 2, false) 
        native.entity.set_entity_health(Chicken1, 0, 0)
    end



    
    local Hash <const> = hash.joaat('a_c_cougar_01')
    lua_fast_calls.request_model(Hash)
    for i = 1,3 do
    Cougar1 = native.ped.create_ped(Hash, coords.x, coords.y, coords.z, 0, true, true, false, false)
    native.entity.set_entity_health(Cougar1, 0, 0)
    end
    thread.yield(500)

    for i = 1,3 do
        Cougar1 = native.ped.create_ped(0x056154F7, coords.x, coords.y, coords.z, 0, true, true, false, false)
        native.ped._equip_meta_ped_outfit_preset(Cougar1, 2, false) 
        native.entity.set_entity_health(Cougar1, 0, 0)
    end







    
    local Hash <const> = hash.joaat('mp_a_c_buck_01')
    lua_fast_calls.request_model(Hash)
    for i = 1,3 do
        SnowBuckLegendary = native.ped.create_ped(Hash, coords.x, coords.y, coords.z, 0, true, true, false, false)
        native.ped._equip_meta_ped_outfit_preset(SnowBuckLegendary, 3, false)
        native.entity.set_entity_health(SnowBuckLegendary, 0, 0)
    end
    thread.yield(500)

    local Hash <const> = hash.joaat('mp_a_c_alligator_01')
    lua_fast_calls.request_model(Hash)
    for i= 1,3 do
        LegendaryTecaGator = native.ped.create_ped(Hash, coords.x, coords.y, coords.z, 0, true, true, false, false)
        native.entity.set_entity_health(LegendaryTecaGator, 0, 0)
    end
    thread.yield(500)

    local Hash <const> = hash.joaat('mp_a_c_wolf_01')
    lua_fast_calls.request_model(Hash)
    for i = 1,3 do
        LegendaryOnyxWolf = native.ped.create_ped(Hash, coords.x, coords.y, coords.z, 0, true, true, false, false)
        native.ped_equipPedOutfitPreset(LegendaryOnyxWolf, 1, false)
        native.entity.set_entity_health(LegendaryOnyxWolf, 0, 0)
    end
    thread.yield(500)

    local Hash <const> hash.joaat('mp_a_c_bighornram_01')
    lua_fast_calls.request_model(Hash)
    for i=1,3 do
        LegendaryGabbro = native.ped.create_ped(Hash, coords.x, coords.y, coords.z, 0, true, true, false, false)
        native.entity_set_entity_health(LegendaryGabbro, 0, 0)
    end
    thread.yield(500)

    local Hash <const> = hash.joaat('mp_a_c_coyote_01')
    lua_fast_calls.request_model(Hash)
    for i = 1,3 do
    LegendaryRedStreak = native.ped.create_ped(Hash, coords.x, coords.y, coords.z, 0, true, true, false, false)
    native.entity.set_entity_health(LegendaryRedStreak, 0, 0)
    end
    thread.yield(500)

    local Hash <const> = hash.joaat('mp_a_c_panther_01')
    lua_fast_calls.request_model(Hash)
    for i = 1,3 do
        LegendaryGhostPanther = native.ped.create_ped(Hash, coords.x, coords.y, coords.z, 0, true, true, false, false)
        native.ped.equip_ped_outfit_preset(LegendaryGhostPanther, 1, false)
        native.entity.set_entity_health(LegendaryGhostPanther, 0, 0)
    end
    thread.yield(750)
end

return lua_fast_calls