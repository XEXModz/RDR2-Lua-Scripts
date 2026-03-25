toast.add_info("Loaded-----MADE BY CRAZYPONY")
local function delete_ent(ent)
    if native.entity.does_entity_exist(ent) then
        local mem = memory.alloc_mem(4)
        memory.write_s32(memory.get_address(mem), ent)
        native.entity.delete_entity(memory.get_address(mem))
    end
 end
 local root = menu.player_root()
root:add_button("Crash", {}, function (playerIdx)
    local playerped = native.player.get_player_ped_script_index(playerIdx)
    local posVec = native.entity.get_offset_from_entity_in_world_coords(playerped, 0,0, -0.9)
          objectHash = native.misc.get_hash_key('s_chuckwagonawning01b')
          object = native.object.create_object_no_offset(objectHash, posVec.x, posVec.y, posVec.z, true, true, true, false)
                   native.entity.set_entity_alpha(object, 0,true)
                   
        thread.yield(3000)
        delete_ent(object)

end)
script.keep_alive()