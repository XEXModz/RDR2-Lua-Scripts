script.set_name('EXO Troll v1.1')
toast.add_info('EXO Troll Script v1.1 Loaded!')

local MainSub = menu.script_root()
local sub0 = menu.player_root():add_submenu('Cages', {}, function() end)
local sub1 = menu.player_root():add_submenu('Spawn Attackers', {}, function() end)
local sub2 = menu.player_root():add_submenu('Explosion Loop', {}, function() end)

local last_toggle_time = 0
local toggle_delay = 500

-- Drunk Slap Toggle
MainSub:add_toggle("Drunk Slap toggle", {"Smack em!"}, function(toggle)
    local current_time = time.unix_milliseconds()
    if current_time - last_toggle_time < toggle_delay then return end
    last_toggle_time = current_time

    local player_ped = native.player.player_ped_id()
    if toggle then
        native.ped._set_ped_drunkness(player_ped, true, 1.0)
        native.ped._set_ped_brawling_style(player_ped, 0x687BF19F)
        toast.add_info("Drunk slap mode enabled.")
    else
        native.ped._set_ped_drunkness(player_ped, false, 0.0)
        native.ped._set_ped_brawling_style(player_ped, 0x78BAEF07)
        toast.add_info("Drunk slap mode disabled.")
    end
end)

-- Cage: Animal
sub0:add_button('Animal Cage', {}, function(playerIdx)
    local target_ped = native.player.get_player_ped_script_index(playerIdx)
    local player_name = player.get_name(playerIdx)
    local target_pos = native.entity.get_offset_from_entity_in_world_coords(target_ped, 0, 0, 0)
    local x, y, z = target_pos.x, target_pos.y, target_pos.z

    native.streaming.request_model(0x67AC4992, true)
    native.streaming.request_model(0xE1EBF6EB, true)

    local invisible_obj = native.object.create_object(0xE1EBF6EB, x + 3, y - 1, z - 0.5, true, true, true, true, true)
    native.entity.set_entity_alpha(invisible_obj, 0, true)

    native.object.create_object(0x67AC4992, x, y, z - 1.2, true, true, true, true, true)
    toast.add_info('Animal Cage Sent to ' .. player_name)
end)

-- Cage: Prison
sub0:add_button('Prison Cage', {}, function(playerIdx)
    local target_ped = native.player.get_player_ped_script_index(playerIdx)
    local player_name = player.get_name(playerIdx)
    local target_pos = native.entity.get_offset_from_entity_in_world_coords(target_ped, 0, 0, -0.9)
    local x, y, z = target_pos.x, target_pos.y, target_pos.z

    native.streaming.request_model(0xF3D580D3, true)
    native.object.create_object(0xF3D580D3, x, y, z, true, true, true, true, true)
    toast.add_info('Prison Cage Sent to ' .. player_name)
end)

-- Ped model list
local random_ped_models = {
    0xF666E887, 0x838F50CE, 0x9550F451, 0x8F549F46, 0x7CC2FA23, 0xC4CC5EE6, 0xA5F92140, 0xAD789542,
    0x0C6E57DB, 0xB545A97B, 0x008F4AD5, 0xF7E2135D, 0xD0A31078, 0xA0600CFB, 0x17C91016, 0x837B740E,
    0xD076C393, 0xCF7E73BE, 0xC137D731, 0x0B54641C, 0xA5E02A13, 0xD10CE853, 0x3CF00F0B, 0xE232B9EF,
    0x002A0F51, 0x70B728D7, 0xECBDF082, 0x7D65D747, 0x3B777AC0, 0xC7458219, 0x5A3ABACE, 0xE5CED83E,
    0x584626EE, 0x2F9417F1, 0x0DB7B411, 0x8DABAE42, 0x542A035C, 0x761D319E, 0x97273585, 0x9DDE71E1,
    0x0D4DB92F, 0xEEF71080, 0xB05F73A6, 0xA9DCFB5A, 0xB3410109, 0x5729EC23, 0xD898CFD4, 0x9233448C,
    0xBD48CFD4, 0xE40C9EB8, 0x82AF5BFB, 0x950C61AA, 0x7F2FF3A2, 0x6E8E525F, 0x20C236C8, 0xB56ED02B,
    0x3A489018, 0x009F6A48, 0x6833EBEE, 0x4335A6E5, 0x1C9C6388, 0x39A29D9C, 0x838F50CE, 0x9550F451, 0x36C66682
}

-- Get random ped model
local function get_random_ped_model()
    return random_ped_models[math.random(#random_ped_models)]
end

local spawned_attackers = {}

-- Spawn attackers
sub1:add_button("Spawn 1 Attacker", {}, function(playerIdx)
    local target_ped = native.player.get_player_ped_script_index(playerIdx)
    local target_pos = native.entity.get_offset_from_entity_in_world_coords(target_ped, 0, 0, 0.4)
    local x, y, z = target_pos.x, target_pos.y, target_pos.z

    local model = get_random_ped_model()
    native.streaming.request_model(model, true)

    local deadline = time.unix_milliseconds() + 500
    while not native.streaming.has_model_loaded(model) do
        if time.unix_milliseconds() > deadline then
            toast.add_info("Model failed to load.")
            return
        end
        thread.yield(30)
    end

    for i = 1, 1 do
        local ped = native.ped.create_ped(model, x, y, z, 0, true, true, true, false)
        if ped and ped ~= 0 then
            native.ped.set_ped_random_component_variation(ped, 1)
            native.entity.set_entity_invincible(ped, false)
            native.weapon.remove_all_ped_weapons(ped, true, true)
            native.ped.set_ped_combat_ability(ped, 3)
            native.ped.set_ped_accuracy(ped, 80)
            native.task.task_combat_ped(ped, target_ped, 0, 16)
            native.ped.set_ped_combat_range(ped, 4)
            native.ped.set_ped_combat_movement(ped, 3)
            table.insert(spawned_attackers, ped)
        else
            toast.add_info("Ped spawn failed.")
        end
    end
end)

sub1:add_button("Spawn 5 Attackers", {}, function(playerIdx)
    local target_ped = native.player.get_player_ped_script_index(playerIdx)
    local target_pos = native.entity.get_offset_from_entity_in_world_coords(target_ped, 0, 0, 0.4)
    local x, y, z = target_pos.x, target_pos.y, target_pos.z

    local model = get_random_ped_model()
    native.streaming.request_model(model, true)

    local deadline = time.unix_milliseconds() + 500
    while not native.streaming.has_model_loaded(model) do
        if time.unix_milliseconds() > deadline then
            toast.add_info("Model failed to load.")
            return
        end
        thread.yield(30)
    end

    for i = 1, 5 do
        local ped = native.ped.create_ped(model, x, y, z, 0, true, true, true, false)
        if ped and ped ~= 0 then
            native.ped.set_ped_random_component_variation(ped, 1)
            native.entity.set_entity_invincible(ped, false)
            native.weapon.remove_all_ped_weapons(ped, true, true)
            native.ped.set_ped_combat_ability(ped, 3)
            native.ped.set_ped_accuracy(ped, 80)
            native.task.task_combat_ped(ped, target_ped, 0, 16)
            native.ped.set_ped_combat_range(ped, 4)
            native.ped.set_ped_combat_movement(ped, 3)
            table.insert(spawned_attackers, ped)
        else
            toast.add_info("Ped spawn failed.")
        end
    end
end)

-- Spawn godmode attackers 
sub1:add_button("Spawn 1 Godmode Attacker", {}, function(playerIdx)
    local target_ped = native.player.get_player_ped_script_index(playerIdx)
    local target_pos = native.entity.get_offset_from_entity_in_world_coords(target_ped, 0, 0, 0.4)
    local x, y, z = target_pos.x, target_pos.y, target_pos.z

    local model = get_random_ped_model()
    native.streaming.request_model(model, true)

    local deadline = time.unix_milliseconds() + 500
    while not native.streaming.has_model_loaded(model) do
        if time.unix_milliseconds() > deadline then
            toast.add_info("Model failed to load.")
            return
        end
        thread.yield(30)
    end

    for i = 1, 1 do
        local ped = native.ped.create_ped(model, x, y, z, 0, true, true, true, false)
        if ped and ped ~= 0 then
            native.ped.set_ped_random_component_variation(ped, 1)
            native.entity.set_entity_invincible(ped, true)
            native.weapon.remove_all_ped_weapons(ped, true, true)
            native.ped.set_ped_combat_ability(ped, 3)
            native.ped.set_ped_accuracy(ped, 100)
            native.task.task_combat_ped(ped, target_ped, 0, 16)
            native.ped.set_ped_combat_range(ped, 4)
            native.ped.set_ped_combat_movement(ped, 3)
            table.insert(spawned_attackers, ped)
        else
            toast.add_info("Ped spawn failed.")
        end
    end
end)

sub1:add_button("Spawn 5 Godmode Attackers", {}, function(playerIdx)
    local target_ped = native.player.get_player_ped_script_index(playerIdx)
    local target_pos = native.entity.get_offset_from_entity_in_world_coords(target_ped, 0, 0, 0.4)
    local x, y, z = target_pos.x, target_pos.y, target_pos.z

    local model = get_random_ped_model()
    native.streaming.request_model(model, true)

    local deadline = time.unix_milliseconds() + 500
    while not native.streaming.has_model_loaded(model) do
        if time.unix_milliseconds() > deadline then
            toast.add_info("Model failed to load.")
            return
        end
        thread.yield(30)
    end

    for i = 1, 5 do
        local ped = native.ped.create_ped(model, x, y, z, 0, true, true, true, false)
        if ped and ped ~= 0 then
            native.ped.set_ped_random_component_variation(ped, 1)
            native.entity.set_entity_invincible(ped, true)
            native.weapon.remove_all_ped_weapons(ped, true, true)
            native.ped.set_ped_combat_ability(ped, 3)
            native.ped.set_ped_accuracy(ped, 100)
            native.task.task_combat_ped(ped, target_ped, 0, 16)
            native.ped.set_ped_combat_range(ped, 4)
            native.ped.set_ped_combat_movement(ped, 3)
            table.insert(spawned_attackers, ped)
        else
            toast.add_info("Ped spawn failed.")
        end
    end
end)

--:Explode Loop
local selected_explosion_type = 0
local explode_loop_active = false

--[[local explosions_list = {
    0,  1,  2,  3,  4,
    5,  6,  7,  8,  9,
    10, 11, 12, 13, 14,
    15, 16, 17, 18, 19,
    20, 21, 22, 23, 24,
    25, 26, 27, 28, 29,
    30, 31, 32, 33, 34,
    35
}--]]

--[[sub2:add_slider_int(
    "Explosion Type",
    0,      -- initial value
    0,      -- min
    35,     -- max
    1,      -- step
    false,
    { "Select explosion ID" },
    nil,
    function(value)
        selected_explosion_type = value
    end
)--]]

--[[sub2:add_slider_int(
    "Explosion Speed (ms)",
    500,    -- initial value
    50,     -- minimum (fastest)
    2000,   -- maximum (slowest)
    50,     -- step
    false,  -- no toggle
    { "Delay between explosions in milliseconds" },
    nil,
    function(value)
    explosion_delay = 
    end
)--]]

sub2:add_toggle("Normal Loop", {}, function(playerIdx, state)

    explode_loop_active = state

    if state then
        thread.create(function()

            while explode_loop_active do

                local target_ped = native.player.get_player_ped_script_index(playerIdx)
                if target_ped ~= 0 then

                    local pos = native.entity.get_offset_from_entity_in_world_coords(
                        target_ped, 0, 0, 0
                    )

                    native.fire.add_explosion(
                        pos.x,
                        pos.y,
                        pos.z,
                        selected_explosion_type,
                        1.0,
                        true,
                        false,
                        1.0
                    )
                end

                thread.yield(380) 
            end

        end)
    end

end)

sub2:add_toggle("Fast Loop", {}, function(playerIdx, state)

    explode_loop_active = state

    if state then
        thread.create(function()

            while explode_loop_active do

                local target_ped = native.player.get_player_ped_script_index(playerIdx)
                if target_ped ~= 0 then

                    local pos = native.entity.get_offset_from_entity_in_world_coords(
                        target_ped, 0, 0, 0
                    )

                    native.fire.add_explosion(
                        pos.x,
                        pos.y,
                        pos.z,
                        selected_explosion_type,
                        1.0,
                        true,
                        false,
                        1.0
                    )
                end

                thread.yield(50) 
            end

        end)
    end

end)

script.keep_alive()
