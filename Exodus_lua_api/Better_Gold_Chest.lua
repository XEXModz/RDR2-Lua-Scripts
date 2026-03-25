function delete_entity(ent)
    if native.entity.does_entity_exist(ent) then
        local mem <const> = memory.alloc_mem(4)
        memory.write_s32(memory.get_address(mem), ent)
        native.entity.delete_entity(memory.get_address(mem))
    end
end

local All_Chest = {}

script.on_shutdown(function()
    for _, ent in ipairs(All_Chest) do
        delete_entity(ent)
    end
end)

Spawn_Gold = menu.player_root():add_list("Spawn Gold", {"1", "10", "50", "100"}, false, {}, function(pid)
    local player_ped <const> = native.player.get_player_ped(pid)
    local pos1 <const> = native.entity.get_offset_from_entity_in_world_coords(player_ped, 0, 1, 0)
    local rot <const> = native.entity.get_entity_rotation(player_ped, 0)
    local chest <const> = native.object.create_object(hash.joaat("s_footlocker03x"), pos1.x, pos1.y, pos1.z, true, false, true, false, false)
    native.entity.place_entity_on_ground_properly(chest, true)
    native.entity.set_entity_invincible(chest, true)
    native.entity.set_entity_rotation(chest, rot.x, rot.y, rot.z, 0, false)
    native.task._set_scenario_container_opening_state(chest, true)
    local pos2 <const> = native.entity.get_entity_coords(chest, false, false)
    for i = 1, tonumber(Spawn_Gold:get_item()) do
        local gold <const> = native.object.create_object(hash.joaat("mp001_s_mp_boxsm01x"), pos2.x, pos2.y, pos2.z + 0.15, true, false, true, false, false)
        native.entity.set_entity_invincible(gold, true)
        native.entity.set_entity_rotation(gold, rot.x, rot.y, rot.z, 0, false)
        All_Chest[#All_Chest + 1] = gold
        All_Chest[#All_Chest + 1] = chest
    end
end)

menu.player_root():add_button("Delete All Chest", {}, function()
    for _, ent in ipairs(All_Chest) do
        delete_entity(ent)
    end
    All_Chest = {}
end)

script.keep_alive()