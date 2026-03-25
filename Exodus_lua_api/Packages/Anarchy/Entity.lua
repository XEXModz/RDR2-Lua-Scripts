require("Anarchy/Mapper/Ammo")
require("Anarchy/Mapper/Objects")
require("Anarchy/Mapper/Peds")
require("Anarchy/Mapper/Vehicles")
require("Anarchy/Mapper/Weapons")

lua_entity = {}

function lua_entity.get_hash_name(hash)
    if lua_entity.model_names[hash] == nil then
        return "Unknown Name : "..hash
    else
        return lua_entity.model_names[hash]
    end
end

lua_entity.model_names = {}
for _, name in pairs(ammo_list) do
    lua_entity.model_names[hash.joaat(name)] = name
end
for _, name in pairs(objects_list) do
    lua_entity.model_names[hash.joaat(name)] = name
end
for _, name in pairs(peds_list) do
    lua_entity.model_names[hash.joaat(name)] = name
end
for _, name in pairs(vehicles_list) do
    lua_entity.model_names[hash.joaat(name)] = name
end
for _, name in pairs(weapons_list) do
    lua_entity.model_names[hash.joaat(name)] = name
end

all_model_names = {}
for _, name in pairs(objects_list) do
    table.insert(all_model_names, name)
end
for _, name in pairs(uncategorized_list) do
    table.insert(all_model_names, name)
end

function lua_entity.entity_owner_cannot_migrate(ent)
    native.network.prevent_network_id_migration(native.network.network_get_network_id_from_entity(ent))
    native.network.network_disable_proximity_migration(native.network.network_get_network_id_from_entity(ent))
end

function lua_entity.set_entity_rotation(ent, rot_x, rot_y, rot_z)
    return native.entity.set_entity_rotation(ent, rot_x, rot_y, rot_z, 0, false)
end

function lua_entity.get_entity_rotation(ent)
    return native.entity.get_entity_rotation(ent, 0)
end

function lua_entity.get_entity_coords(ent)
    return native.entity.get_entity_coords(ent, false, false)
end

function lua_entity.set_entity_coords(ent, pos_x, pos_y, pos_z)
    native.entity.set_entity_coords_no_offset(ent, pos_x, pos_y, pos_z, false, false, false)
end

function lua_entity.request_model(hash)
    local timer <const> = time.unix_milliseconds() + 1000
    while not native.streaming.has_model_loaded(hash) and timer > time.unix_milliseconds() do
        native.streaming.request_model(hash, true)
        thread.yield()
    end
end

function lua_entity.request_control(ent, timeout)
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

lua_entity.anarchy_spawned_entity = {}
function lua_entity.spawn_entity(hash, pos_x, pos_y, pos_z, rot_x, rot_y, rot_z, can_migrate, invincible, visible, freeze, collision, networked, dont_create_animals)
    local spawn_entity, entity_type
    lua_entity.request_model(hash)
    local create_ped <const> = native.ped.create_ped(hash, pos_x, pos_y, pos_z, 0, networked, false, false, false)
    if native.entity.does_entity_exist(create_ped) then
        native.ped._set_random_outfit_variation(create_ped, true) -- Otherwise the peds will not be visible
        native.task.clear_ped_tasks_immediately(create_ped, true, true) -- Peds won't start animation and possibly other problems
        spawn_entity = create_ped
        entity_type = 1
    else
        local create_vehicle <const> = native.vehicle.create_vehicle(hash, pos_x, pos_y, pos_z, 0, networked, false, dont_create_animals, false)
        if native.entity.does_entity_exist(create_vehicle) then
            spawn_entity = create_vehicle
            entity_type = 2
        else
            local create_object <const> = native.object.create_object(hash, pos_x, pos_y, pos_z, networked, false, true, false, false)
            if native.entity.does_entity_exist(create_object) then
                spawn_entity = create_object
                entity_type = 3
            end
        end
    end
    if spawn_entity ~= nil then
        lua_entity.set_entity_coords(spawn_entity, pos_x, pos_y, pos_z)
        lua_entity.set_entity_rotation(spawn_entity, rot_x, rot_y, rot_z)
        if can_migrate then

        else

        end
        native.entity.set_entity_invincible(spawn_entity, invincible)
        native.entity.set_entity_visible(spawn_entity, visible)
        native.entity.freeze_entity_position(spawn_entity, freeze)
        if not freeze then
            native.object.break_object_fragment_child(spawn_entity, 0, false)
            native.physics.activate_physics(spawn_entity)
        end
        native.entity.set_entity_collision(spawn_entity, collision, true)
        native.streaming.set_model_as_no_longer_needed(hash) -- The game will crash if requesting many hashes and never setting as no longer needed
        lua_entity.anarchy_spawned_entity[#lua_entity.anarchy_spawned_entity + 1] = spawn_entity
        return spawn_entity, entity_type
    else
        return 0
    end
end

function lua_entity.delete_entity(ent)
    if native.entity.does_entity_exist(ent) then
        local mem <const> = memory.alloc_mem(4)
        memory.write_s32(memory.get_address(mem), ent)
        native.entity.delete_entity(memory.get_address(mem))
    end
end

return lua_entity