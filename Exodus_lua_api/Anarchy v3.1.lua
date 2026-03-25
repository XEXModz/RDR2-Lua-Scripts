function print(text)
    return log.add_info(tostring(text))
end

local anarchy_version <const> = "3.1"

local update_date <const> = "09/03/2024"

fs.create_directories(fs.get_workspace_path() .. "\\Anarchy")

local profile_file <const> = fs.get_workspace_path() .. "\\Anarchy\\profile.ini"
local history_file <const> = fs.get_workspace_path() .. "\\Anarchy\\history.cfg"

local int_max <const> = 2147483647
local int_min <const> = -2147483647

local message = ""
if not pcall(require, "Anarchy\\Mapper\\Ammo") then
    message = message .. "\n - Scripting\\Packages\\Anarchy\\Mapper\\Ammo"
end
if not pcall(require, "Anarchy\\Mapper\\Objects") then
    message = message .. "\n - Scripting\\Packages\\Anarchy\\Mapper\\Objects"
end
if not pcall(require, "Anarchy\\Mapper\\Peds") then
    message = message .. "\n - Scripting\\Packages\\Anarchy\\Mapper\\Peds"
end
if not pcall(require, "Anarchy\\Mapper\\Timecycles") then
    message = message .. "\n - Scripting\\Packages\\Anarchy\\Mapper\\Timecycles"
end
if not pcall(require, "Anarchy\\Mapper\\Vehicles") then
    message = message .. "\n - Scripting\\Packages\\Anarchy\\Mapper\\Vehicles"
end
if not pcall(require, "Anarchy\\Mapper\\Weapons") then
    message = message .. "\n - Scripting\\Packages\\Anarchy\\Mapper\\Weapons"
end
if not pcall(require, "Anarchy\\Entity") then
    message = message .. "\n - Scripting\\Packages\\Anarchy\\Entity"
end
if not pcall(require, "Anarchy\\Essential") then
    message = message .. "\n - Scripting\\Packages\\Anarchy\\Essential"
end
if not pcall(require, "Anarchy\\Player") then
    message = message .. "\n - Scripting\\Packages\\Anarchy\\Player"
end
if message ~= "" then
    toast.add_error("File Missing", string.sub(message, 2) .. "\n\nDownload the menu correctly on github:\nhttps://github.com/SmileyMP4/Anarchy-Exodus/releases")
    return
end

local Player_Parents <const> = {}
local Player_Feature <const> = {}
local Local_Parents <const> = {}
local Local_Feature <const> = {}
local Threads <const> = {}
local Listeners <const> = {}

for pid in lua_player.player_list(true) do
    lua_essential.add_to_player_history(player.get_name(pid), player.get_rockstar_id(pid), lua_player.get_player_ip(pid), lua_player.get_player_port(pid), false)
end

Listeners["Player Join"] = events.add_listener("on_player_join", "", function(name, pid, rid)
    lua_essential.add_to_player_history(name, rid, lua_player.get_player_ip(pid), lua_player.get_player_port(pid), true)

    if Local_Feature["Player Join Enable"]:get_toggle()
    and (not Local_Feature["Player Join Exclude Me"]:get_toggle() or pid ~= lua_player.my_pid()) then
        local message = ""
        if Local_Feature["Player Join Name"]:get_toggle() then
            message = message .. "\nName: " .. name
        end

        if Local_Feature["Player Join RID"]:get_toggle() then
            message = message .. "\nRID: " .. rid
        end

        if Local_Feature["Player Join PID"]:get_toggle() then
            message = message .. "\nPID: " .. pid
        end

        if Local_Feature["Player Join IP"]:get_toggle() then
            message = message .. "\nIP: " .. lua_player.get_player_ip(pid)
        end

        if Local_Feature["Player Join Port"]:get_toggle() then
            message = message .. "\nPort: " .. lua_player.get_player_port(pid)
        end

        if Local_Feature["Player Join Enable"]:get_item() == "Notify & Log" then
            toast.add_info("Player Join", string.sub(message, 2))
        else
            log.add_info("Player Join", string.sub(message, 2))
        end
    end
end)

Listeners["Player Leave"] = events.add_listener("on_player_leave", "", function(name, pid, rid)
    if Local_Feature["Player Leave Enable"]:get_toggle()
    and (not Local_Feature["Player Leave Exclude Me"]:get_toggle() or pid ~= lua_player.my_pid()) then
        local message = ""
        if Local_Feature["Player Leave Name"]:get_toggle() then
            message = message .. "\nName: " .. name
        end

        if Local_Feature["Player Leave RID"]:get_toggle() then
            message = message .. "\nRID: " .. rid
        end

        if Local_Feature["Player Leave PID"]:get_toggle() then
            message = message .. "\nPID: " .. pid
        end

        if Local_Feature["Player Leave IP"]:get_toggle() then
            local file <const> = io.open(history_file, "r")
            if file then
                for line in file:lines() do
                    local file_name, file_rid, file_ip, file_port, first_seen_date, first_seen_hours, last_seen_date, last_seen_hours, how_many_times <const> = line:match("([^|]+)|([^|]+)|([^|]+)|([^|]+)|([^|]+)|([^|]+)|([^|]+)|([^|]+)|([^|]+)")
                    if file_name == name then
                        message = message .. "\nIP: " .. file_ip
                    end
                end
            else
                message = message .. "\nIP: " .. lua_player.get_player_ip(pid)
            end
        end

        if Local_Feature["Player Leave Port"]:get_toggle() then
            message = message .. "\nPort: " .. lua_player.get_player_port(pid)
        end

        if Local_Feature["Player Leave Enable"]:get_item() == "Notify & Log" then
            toast.add_info("Player Leave", string.sub(message, 2))
        else
            log.add_info("Player Leave", string.sub(message, 2))
        end
    end
end)

Listeners["Player Spawn"] = events.add_listener("on_player_spawn", "", function(name, pid)
    if Local_Feature["Player Spawn Enable"]:get_toggle() then
        local message = ""
        if Local_Feature["Player Spawn Name"]:get_toggle() then
            message = message .. "\nName: " .. name
        end

        if Local_Feature["Player Spawn RID"]:get_toggle() then
            message = message .. "\nRID: " .. player.get_rockstar_id(pid)
        end

        if Local_Feature["Player Spawn PID"]:get_toggle() then
            message = message .. "\nPID: " .. pid
        end

        if Local_Feature["Player Spawn IP"]:get_toggle() then
            message = message .. "\nIP: " .. lua_player.get_player_ip(pid)
        end

        if Local_Feature["Player Spawn Port"]:get_toggle() then
            message = message .. "\nPort: " .. lua_player.get_player_port(pid)
        end

        if Local_Feature["Player Spawn Enable"]:get_item() == "Notify & Log" then
            toast.add_info("Player Spawn", string.sub(message, 2))
        else
            log.add_info("Player Spawn", string.sub(message, 2))
        end
    end
end)

Listeners["Entity Damaged"] = events.add_listener("on_entity_damaged", "", function(victim, damager, weapon_hash, ammo_hash, damage, victim_dead, was_suicide)
    if Local_Feature["Entity Damaged Enable"]:get_toggle()
    and damage ~= 1
    and (not Local_Feature["Entity Damaged Victim Filter"]:get_toggle()
    or (Local_Feature["Entity Damaged Victim Filter"]:get_item() == "Only Player" and native.ped.is_ped_a_player(victim) and victim ~= lua_player.my_ped())
    or (Local_Feature["Entity Damaged Victim Filter"]:get_item() == "Only Ped" and not native.ped.is_ped_a_player(victim))
    or (Local_Feature["Entity Damaged Victim Filter"]:get_item() == "Only Me" and victim == lua_player.my_ped())
    or (Local_Feature["Entity Damaged Victim Filter"]:get_item() == "Exclude Player" and not native.ped.is_ped_a_player(victim) or victim == lua_player.my_ped())
    or (Local_Feature["Entity Damaged Victim Filter"]:get_item() == "Exclude Ped" and native.ped.is_ped_a_player(victim))
    or (Local_Feature["Entity Damaged Victim Filter"]:get_item() == "Exclude Ped" and victim ~= lua_player.my_ped()))

    and (not Local_Feature["Entity Damaged Damager Filter"]:get_toggle()
    or (Local_Feature["Entity Damaged Damager Filter"]:get_item() == "Only Player" and native.ped.is_ped_a_player(damager) and damager ~= lua_player.my_ped())
    or (Local_Feature["Entity Damaged Damager Filter"]:get_item() == "Only Ped" and not native.ped.is_ped_a_player(damager))
    or (Local_Feature["Entity Damaged Damager Filter"]:get_item() == "Only Me" and damager == lua_player.my_ped())
    or (Local_Feature["Entity Damaged Damager Filter"]:get_item() == "Exclude Player" and not native.ped.is_ped_a_player(damager) or damager == lua_player.my_ped())
    or (Local_Feature["Entity Damaged Damager Filter"]:get_item() == "Exclude Ped" and native.ped.is_ped_a_player(damager))
    or (Local_Feature["Entity Damaged Damager Filter"]:get_item() == "Exclude Ped" and damager ~= lua_player.my_ped()))

    and (not Local_Feature["Entity Damaged Dead Filter"]:get_toggle()
    or (Local_Feature["Entity Damaged Dead Filter"]:get_item() == "Only" and victim_dead)
    or (Local_Feature["Entity Damaged Dead Filter"]:get_item() == "Exclude" and not victim_dead))

    and (not Local_Feature["Entity Damaged Suicide Filter"]:get_toggle()
    or (Local_Feature["Entity Damaged Suicide Filter"]:get_item() == "Only" and was_suicide)
    or (Local_Feature["Entity Damaged Suicide Filter"]:get_item() == "Exclude" and not was_suicide))

    and (not Local_Feature["Entity Damaged Exclude Empty Damager"]:get_toggle() or damager ~= -1)
    then
        local message = ""
        if Local_Feature["Entity Damaged Victim"]:get_toggle() then
            message = message .. "\nVictim: " .. lua_essential.better_notify(victim)
        end
        if Local_Feature["Entity Damaged Damager"]:get_toggle() then
            message = message .. "\nDamager: " .. lua_essential.better_notify(damager)
        end
        if Local_Feature["Entity Damaged Weapon"]:get_toggle() then
            if weapon_hash == -1569615261 then
                message = message .. "\nWeapon: Punch"
            else
                message = message .. "\nWeapon: " .. lua_essential.better_name(lua_entity.get_hash_name(weapon_hash), "2")
            end
        end
        if Local_Feature["Entity Damaged Ammo"]:get_toggle() then
            if ammo_hash == 0 then
                message = message .. "\nAmmo: nil"
            else
                message = message .. "\nAmmo: " .. lua_essential.better_name(lua_entity.get_hash_name(ammo_hash), "2")
            end
        end
        if Local_Feature["Entity Damaged Damage"]:get_toggle() then
            message = message .. "\nDamage: " .. string.format("%.2f", damage)
        end
        if Local_Feature["Entity Damaged Dead"]:get_toggle() then
            if victim_dead then
                message = message .. "\nDead: Yes"
            else
                message = message .. "\nDead: No"
            end
        end
        if Local_Feature["Entity Damaged Suicide"]:get_toggle() then
            if was_suicide then
                message = message .. "\nSuicide: Yes"
            else
                message = message .. "\nSuicide: No"
            end
        end
        if Local_Feature["Entity Damaged Enable"]:get_item() == "Notify & Log" then
            toast.add_info("Entity Damaged", string.sub(message, 2))
        else
            log.add_info("Entity Damaged", string.sub(message, 2))
        end
    end
end)

Listeners["Entity Revived"] = events.add_listener("on_entity_revived", "", function(victim, reviver)
    if Local_Feature["Entity Revived Enable"]:get_toggle() then
        local message = ""
        if Local_Feature["Entity Revived Victim"]:get_toggle() then
            message = message .. "\nVictim: " .. lua_essential.better_notify(victim)
        end
        if Local_Feature["Entity Revived Reviver"]:get_toggle() then
            message = message .. "\nReviver: " .. lua_essential.better_notify(reviver)
        end
        if Local_Feature["Entity Revived Enable"]:get_item() == "Notify & Log" then
            toast.add_info("Entity Revived", string.sub(message, 2))
        else
            log.add_info("Entity Revived", string.sub(message, 2))
        end
    end
end)

Listeners["Script Event"] = events.add_listener("on_script_event", "", function(value)

end)

script.on_shutdown(function()
    for _, ent in ipairs(lua_entity.anarchy_spawned_entity) do
        lua_entity.delete_entity(ent)
    end
    toast.add_success("Anarchy v" .. anarchy_version, "Anarchy has been deleted.")
end)

Player_Parents["Player Root"] = menu.player_root()

Player_Parents["Spawn Gold"] = Player_Parents["Player Root"]:add_submenu("Spawn Gold", {})

local All_Chest = {}
local Chest_Items = {}

Player_Feature["Spawn Gold"] = lua_essential.add_list(Player_Parents["Spawn Gold"], "Spawn Gold", {"1", "10", "50", "100"}, false, {}, function(pid)
    local player_ped <const> = native.player.get_player_ped(pid)
    local pos1 <const> = native.entity.get_offset_from_entity_in_world_coords(player_ped, 0, 1, 0)
    local rot <const> = native.entity.get_entity_rotation(player_ped, 0)
    local chest <const> = lua_entity.spawn_entity(hash.joaat("s_lootablebedchest"), pos1.x, pos1.y, pos1.z, rot.x, rot.y, rot.z, true, true, true, true, true, true)
    native.entity.place_entity_on_ground_properly(chest, true)
    native.task._set_scenario_container_opening_state(chest, true)
    local pos2 <const> = lua_entity.get_entity_coords(chest)
    local items_in_chest = {}
    for i = 1, tonumber(Player_Feature["Spawn Gold"]:get_item()) do
        local gold <const> = lua_entity.spawn_entity(hash.joaat("mp001_s_mp_boxsm01x"), pos2.x, pos2.y, pos2.z + 0.15, rot.x, rot.y, rot.z, true, true, true, true, true, true)
        All_Chest[#All_Chest + 1] = gold
        All_Chest[#All_Chest + 1] = chest
        items_in_chest[#items_in_chest + 1] = gold
    end
    Chest_Items[chest] = items_in_chest
end)

function is_chest_empty(chest)
    if Chest_Items[chest] then
        for _, item in ipairs(Chest_Items[chest]) do
            if native.entity.is_entity_visible(item) then
                return false
            end
            lua_entity.delete_entity(item)
        end
        return true
    end
    return false
end

thread.create(function()
    while true do
        for _, ent in ipairs(All_Chest) do
            if native.entity.does_entity_exist(ent) and native.entity.get_entity_model(ent) == hash.joaat("s_footlocker03x") then
                native.task._set_scenario_container_opening_state(ent, true)
                if is_chest_empty(ent) then
                    lua_entity.delete_entity(ent)
                end
            end
        end
        thread.yield()
    end
end)

Player_Feature["Delete All Chest"] = lua_essential.add_button(Player_Parents["Spawn Gold"], "Delete All Chest", {}, function(pid)
    for _, ent in ipairs(All_Chest) do
        lua_entity.delete_entity(ent)
    end
    All_Chest = {}
end)

Player_Feature["Get All Info"] = lua_essential.add_button(Player_Parents["Player Root"], "Get All Info", {}, function(pid)
    if lua_player.its_me(pid, "Get All Info", Player_Feature["Get All Info"]) then return end
    local name <const> = player.get_name(pid)
    local file <const> = io.open(history_file, "r")
    if file then
        for line in file:lines() do
            local file_name, file_rid, file_ip, file_port, first_seen_date, first_seen_hours, last_seen_date, last_seen_hours, how_many_times <const> = line:match("([^|]+)|([^|]+)|([^|]+)|([^|]+)|([^|]+)|([^|]+)|([^|]+)|([^|]+)|([^|]+)")
            if file_name == name then
                toast.add_info(name, "RID: " .. file_rid .. "\nIP: " .. file_ip .. "\nPort: " .. file_port .. "\nFirst Seen: " .. first_seen_date .. " / " .. first_seen_hours .. "\nLast Seen: " .. last_seen_date .. " / " .. last_seen_hours .. "\nHow Many Times: " .. how_many_times)
            end
        end
    end
end)

Player_Feature["Crash Player"] = lua_essential.add_button(Player_Parents["Player Root"], "Crash Player", {}, function(pid)
    if lua_player.its_me(pid, "Crash Player", Player_Feature["Crash Player"]) then return end
    local pos <const> = lua_entity.get_entity_coords(player.get_ped(pid))
    local ent <const> = lua_entity.spawn_entity(hash.joaat("s_chuckwagonawning01b"), pos.x, pos.y, pos.z, 0, 0, 0, false, true, true, true, false, true, true)
    native.entity.set_entity_alpha(ent, 0, true)
    thread.yield(500)
    lua_entity.delete_entity(ent)
end)

Local_Parents["Script Root"] = menu.script_root()

Local_Parents["Self"] = Local_Parents["Script Root"]:add_submenu("Self", {})

Local_Parents["Fighting Style"] = Local_Parents["Self"]:add_submenu("Fighting Style", {})

local Fighting_Style_List <const> = {
    ["AI"] = 0x802C604D,
    ["AI Barbrawl"] = 0x4FF5F0C7,
    ["AI Defensive"] = 0xD888F2FD,
    ["AI Moonshine Barbrawl"] = 0xA01B433A,
    ["Alligator"] = 0x7A5548ED,
    ["Alligator Large"] = 0x368EC7CB,
    ["Ally"] = 0x69C76C14,
    ["Animal"] = 0xD777C754,
    ["Badger"] = 0x7E7C3F53,
    ["Bear"] = 0x0BC66E35,
    ["Beaver"] = 0x4E313783,
    ["Boar"] = 0x176A5831,
    ["Bounty Hunter"] = 0x3900654C,
    ["Bruiser"] = 0x4514DB61,
    ["Bull"] = 0x4E50C5D2,
    ["Cougar"] = 0x9DAA7CCB,
    ["Cow"] = 0xB0E91295,
    ["Coyote"] = 0xA448EB69,
    ["Deer"] = 0xA781E6B3,
    ["Dog"] = 0x5A4155C4,
    ["Elk"] = 0x408697F0,
    ["Female"] = 0x6A3BB2C2,
    ["Female Strong"] = 0x4DAFDD84,
    ["Gangup"] = 0xD0CECFF2,
    ["Goat"] = 0x078E649F,
    ["Horse"] = 0xF6B775F3,
    ["Micah Finale"] = 0x1F0BB27A,
    ["Moose"] = 0x968917AB,
    ["Muskrat"] = 0x1EDC33AC,
    ["No Melee"] = 0x25B5F931,
    ["Pig"] = 0x22EAD110,
    ["Player"] = 0x78BAEF07,
    ["Player Finale"] = 0xF9E77D2D,
    ["Player Moonshiner"] = 0x687BF19F,
    ["Player Winter"] = 0x3C6A802F,
    ["Quick"] = 0xC4CABB1B,
    ["Raccoon"] = 0x505F8917,
    ["Sheep"] = 0x6827CCCF,
    ["Snake"] = 0x82BEBC4B,
    ["Timid"] = 0x431AEF77,
    ["Wolf"] = 0xA8F023D4
}

for _, fighting_style in pairs(lua_essential.sort_table_alphabetically("left", Fighting_Style_List)) do
    Local_Feature[fighting_style.left] = lua_essential.add_toggle(Local_Parents["Fighting Style"], fighting_style.left, {}, function()
        if Local_Feature[fighting_style.left]:get_toggle() then
            for fighting_style_2, _ in pairs(Fighting_Style_List) do
                if fighting_style.left ~= fighting_style_2 and Local_Feature[fighting_style_2]:get_toggle() then
                    Local_Feature[fighting_style_2]:set_toggle(false)
                end
            end
            while Local_Feature[fighting_style.left]:get_toggle() do
                native.ped._set_ped_brawling_style(lua_player.my_ped(), fighting_style.right)
                thread.yield()
            end
            native.ped._set_ped_brawling_style(lua_player.my_ped(), Fighting_Style_List["Player"])
        end
    end)
end

Local_Parents["Ability Card"] = Local_Parents["Self"]:add_submenu("Ability Card", {})

local Ability_List <const> = {
    ["Can Autoescape From Lasso"] = 0,
    ["Hat Blocks First Headshot"] = 1,
    ["Full Auto for All Weapons"] = 2,
    ["Might Live After Deadly Damage"] = 3,
    ["Ignore Aim Before Firing Restrictions"] = 4,
    ["Deadeye Instant Reload"] = 5,
    ["Use Phosphorous Rounds"] = 6,
    ["Continue Deadeye on Taking Cover"] = 7,
    ["Continue Deadeye on Reload"] = 8,
    ["Continue Deadeye on Shooting"] = 9,
    ["Continue Deadeye on Exiting Aim"] = 10,
    ["Disable Player Cancelling Deadeye"] = 11,
    ["Continue Deadeye on Ragdoll"] = 12,
    ["Use Explosive Rounds"] = 13,
    ["Exit Deadeye on Taking Damage"] = 14,
    ["Carry Two Moneybags"] = 15,
    ["Long Pick Herbs"] = 16,
    ["Unbreakable Lasso"] = 17,
    ["Continue Deadeye on Sprinting"] = 18,
    ["Can't Deal Headshots"] = 19,
    ["Hangman"] = 20,
    ["Allow Deadeye with Melee Weapons"] = 21,
    ["Allow Deadeye While Unarmed"] = 22,
    ["Disable Deadeye Perfect Accuracy"] = 23,
    ["Can't Deal Headshots to Players"] = 24,
    ["Can't Deal Critical Damage"] = 25,
    ["Can't Deal Critical Damage to Players"] = 26,
    ["Allow EagleEye in Combat"] = 27,
    ["Continue EagleEye on Sprint"] = 28,
    ["Suppress Legendary EagleEye Trail Color"] = 29,
}

for _, ability in pairs(lua_essential.sort_table_alphabetically("left", Ability_List)) do
    Local_Feature[ability.left] = lua_essential.add_toggle(Local_Parents["Ability Card"], ability.left, {}, function()
        if Local_Feature[ability.left]:get_toggle() then
            while Local_Feature[ability.left]:get_toggle() do
                native.player._set_local_player_persona_ability_flag(ability.right, true)
                thread.yield()
            end
            native.player._set_local_player_persona_ability_flag(ability.right, false)
        end
    end)
end

Local_Parents["Custom Proof"] = Local_Parents["Self"]:add_submenu("Custom Proof", {})

Local_Parents["Damage"] = Local_Parents["Custom Proof"]:add_submenu("Damage", {})

local Damage_Proof <const> = {
    ["Bullet"] = 1,
    ["Flame"] = 2,
    ["Explosion"] = 4,
    ["Collision"] = 8,
    ["Melee"] = 16,
    ["Steam"] = 32,
    ["Smoke"] = 64,
    ["Headshots"] = 128,
    ["Projectile"] = 256, -- seems not to work
}

local Damage_Proof_Flag = 0
for _, proof in pairs(lua_essential.sort_table_alphabetically("left", Damage_Proof)) do
    Local_Feature[proof.left .. " Proof"] = lua_essential.add_toggle(Local_Parents["Damage"], proof.left, {}, function()
        if Local_Feature[proof.left .. " Proof"]:get_toggle() then
            Damage_Proof_Flag = Damage_Proof_Flag + proof.right
            while Local_Feature[proof.left .. " Proof"]:get_toggle() do
                native.entity.set_entity_proofs(lua_player.my_ped(), Damage_Proof_Flag, false)
                thread.yield()
            end
            Damage_Proof_Flag = Damage_Proof_Flag - proof.right
            native.entity.set_entity_proofs(lua_player.my_ped(), Damage_Proof_Flag, false)
        end
    end)
end

Local_Parents["Ragdoll"] = Local_Parents["Custom Proof"]:add_submenu("Ragdoll", {})

local Ragdoll_Proof <const> = {
    ["Bullet Impact"] = 1,
    ["Vehicle Impact"] = 2,
    ["Fire"] = 4,
    ["Electrocution"] = 8,
    ["Player Impact"] = 16,
    ["Explosion"] = 32,
    ["Impact Object"] = 64,
    ["Melee"] = 128,
    ["Rubber Bullet"] = 256,
    ["Falling"] = 512,
    ["Water Jet"] = 1024,
    ["Drowning"] = 2048,
    ["Allow Block Dead Ped"] = 4096,
    ["Player Bump"] = 8192,
    ["Player Ragdoll Bump"] = 16384,
    ["Ped Ragdoll Bump"] = 32768,
    ["Vehicle Grab"] = 65536,
    ["Smoke Grenade"] = 131072,
    ["Horse Bump"] = 262144,
    ["Activate on Collision"] = 524288
}

local Ragdoll_Proof_Flag = 0
for _, proof in pairs(lua_essential.sort_table_alphabetically("left", Ragdoll_Proof)) do
    Local_Feature[proof.left .. " Proof"] = lua_essential.add_toggle(Local_Parents["Ragdoll"], proof.left, {}, function()
        if Local_Feature[proof.left .. " Proof"]:get_toggle() then
            Ragdoll_Proof_Flag = Ragdoll_Proof_Flag + proof.right
            while Local_Feature[proof.left .. " Proof"]:get_toggle() do
                native.entity.set_entity_proofs(lua_player.my_ped(), Ragdoll_Proof_Flag, false)
                thread.yield()
            end
            Ragdoll_Proof_Flag = Ragdoll_Proof_Flag - proof.right
            native.entity.set_entity_proofs(lua_player.my_ped(), Ragdoll_Proof_Flag, false)
        end
    end)
end

Local_Feature["Disable Ambient Animations"] = lua_essential.add_toggle(Local_Parents["Self"], "Disable Ambient Animations", {}, function()
    if Local_Feature["Disable Ambient Animations"]:get_toggle() then
        while Local_Feature["Disable Ambient Animations"]:get_toggle() do
            native.ped.set_ped_can_play_ambient_anims(lua_player.my_ped(), false)
            native.ped.set_ped_can_play_ambient_base_anims(lua_player.my_ped(), false)
            thread.yield()
        end
        native.ped.set_ped_can_play_ambient_anims(lua_player.my_ped(), true)
        native.ped.set_ped_can_play_ambient_base_anims(lua_player.my_ped(), true)
    end
end)

Local_Feature["Collision Radius"] = lua_essential.add_slider_float(Local_Parents["Self"], "Collision Radius", 1.00, 0.00, 5.00, 0.10, true, {"Change your player's collision radius."}, function()
    while Local_Feature["Collision Radius"]:get_toggle() do
        local radius = lua_essential.get_number_value(Local_Feature["Collision Radius"])
        if radius == 0.00 then
            radius = 0.001
        end
        native.ped.set_ped_capsule(lua_player.my_ped(), radius)
        thread.yield()
    end
end)

Local_Feature["Drunk"] = lua_essential.add_toggle(Local_Parents["Self"], "Drunk", {}, function()
    if Local_Feature["Drunk"]:get_toggle() then
        while Local_Feature["Drunk"]:get_toggle() do
            native.ped._set_ped_drunkness(lua_player.my_ped(), true, 1.0)
            thread.yield()
        end
        native.ped._set_ped_drunkness(lua_player.my_ped(), false, 0.0)
    end
end)

Local_Feature["Suicide"] = Local_Parents["Self"]:add_button("Suicide", {}, function()
    native.player.set_player_invincible(lua_player.my_pid(), false)
    native.entity.set_entity_health(lua_player.my_ped(), 0, 0)
end)

Local_Parents["Mount"] = Local_Parents["Script Root"]:add_submenu("Mount", {})

Local_Feature["Preference"] = lua_essential.add_list(Local_Parents["Mount"], "Preference", {"Owned", "Current"}, false, {}, function()
end)

local mount
thread.create(function()
    while true do
        if Local_Feature["Preference"]:get_item() == "Owned" then
            mount = player.get_owned_mount(lua_player.my_pid())
        else
            mount = player.get_mount(lua_player.my_pid())
        end
        thread.yield()
    end
end)

Local_Feature["Revive"] = Local_Parents["Mount"]:add_button("Revive", {}, function()
    native.ped.revive_injured_ped(mount)
    native.entity.set_entity_health(mount, native.ped.get_ped_max_health(mount), 0)
end)

Local_Parents["Weapons"] = Local_Parents["Script Root"]:add_submenu("Weapons", {})

Local_Feature["Friendly Fire"] = lua_essential.add_toggle(Local_Parents["Weapons"], "Friendly Fire", {}, function()
    if Local_Feature["Friendly Fire"]:get_toggle() then
        while Local_Feature["Friendly Fire"]:get_toggle() do
            native.network.network_set_friendly_fire_option(true)
            thread.yield()
        end
        native.network.network_set_friendly_fire_option(false)
    end
end)

Local_Feature["Accuracy"] = lua_essential.add_slider_int(Local_Parents["Weapons"], "Accuracy", 50, 0, 100, 5, true, {}, function()
    if Local_Feature["Accuracy"]:get_toggle() then
        local accuracy <const> = native.ped.get_ped_accuracy(lua_player.my_ped())
        while Local_Feature["Accuracy"]:get_toggle() do
            native.ped.set_ped_accuracy(lua_player.my_ped(), Local_Feature["Accuracy"]:get_value())
            thread.yield()
        end
        native.ped.set_ped_accuracy(lua_player.my_ped(), accuracy)
    end
end)

Local_Feature["Bullet Impact Scale"] = lua_essential.add_slider_int(Local_Parents["Weapons"], "Bullet Impact Scale", 0, 0, 10, 1, true, {}, function()
    if Local_Feature["Bullet Impact Scale"]:get_toggle() then
        while Local_Feature["Bullet Impact Scale"]:get_toggle() do
            native.graphics.set_particle_fx_bullet_impact_scale(Local_Feature["Bullet Impact Scale"]:get_value())
            thread.yield()
        end
        native.graphics.set_particle_fx_bullet_impact_scale(1)
    end
end)

Local_Parents["Network"] = Local_Parents["Script Root"]:add_submenu("Network", {})

Local_Parents["Player History"] = Local_Parents["Network"]:add_submenu("Player History", {})

Local_Feature["Player History Search"] = Local_Parents["Player History"]:add_text_input("Search Among x Player:", "", 16, true, false, {}, function()
end)

Local_Feature["Player History Pages"] = lua_essential.add_slider_int(Local_Parents["Player History"], "Pages", 1, 1, 1000, 1, false, {}, function()
end)

local Player_History <const> = {}

for i = 1, 23 do
    Player_History[i] = lua_essential.add_list(Local_Parents["Player History"], "", {"Get All Info"}, false, {}, function()
        local name <const> = Player_History[i]:get_label()
        local file <const> = io.open(history_file, "r")
        if file then
            for line in file:lines() do
                local file_name, file_rid, file_ip, file_port, first_seen_date, first_seen_hours, last_seen_date, last_seen_hours, how_many_times <const> = line:match("([^|]+)|([^|]+)|([^|]+)|([^|]+)|([^|]+)|([^|]+)|([^|]+)|([^|]+)|([^|]+)")
                if file_name == name then
                    toast.add_info(name, "RID: " .. file_rid .. "\nIP: " .. file_ip .. "\nPort: " .. file_port .. "\nFirst Seen: " .. first_seen_date .. " - " .. first_seen_hours .. "\nLast Seen: " .. last_seen_date .. " - " .. last_seen_hours .. "\nHow Many Times: " .. how_many_times)
                end
            end
        end
    end)
end

thread.create(function()
    while true do
        if fs.exists(history_file) then
            if Local_Feature["Player History Search"]:get_text() == "" then
                local file <const> = io.open(history_file, "r")
                if file then
                    local value_page <const> = Local_Feature["Player History Pages"]:get_value() - 1
                    local count_1 = 0
                    local count_2 = 0
                    for line in file:lines() do
                        local file_name, file_rid, file_ip, file_port, first_seen_date, first_seen_hours, last_seen_date, last_seen_hours, how_many_times <const> = line:match("([^|]+)|([^|]+)|([^|]+)|([^|]+)|([^|]+)|([^|]+)|([^|]+)|([^|]+)|([^|]+)")
                        count_1 = count_1 + 1
                        if count_1 > value_page * 23 then
                            count_2 = count_2 + 1
                            if Player_History[count_2] ~= nil then
                                Player_History[count_2]:set_label(file_name)
                            end
                        end
                    end
                    Local_Feature["Player History Search"]:set_label("Search Among " .. count_1 .. " Players:")
                    if count_2 < 23 then
                        repeat
                            count_2 = count_2 + 1
                            Player_History[count_2]:set_label("")
                        until count_2 == 23
                    end
                end
                io.close(file)
            else
                local history_name = {}
                local file <const> = io.open(history_file, "r")
                if file then
                    for line in file:lines() do
                        local file_name, file_rid, file_ip, file_port, first_seen_date, first_seen_hours, last_seen_date, last_seen_hours, how_many_times <const> = line:match("([^|]+)|([^|]+)|([^|]+)|([^|]+)|([^|]+)|([^|]+)|([^|]+)|([^|]+)|([^|]+)")
                        table.insert(history_name, file_name)
                    end
                end
                io.close(file)
                history_name = lua_essential.filter_table(history_name, Local_Feature["Player History Search"]:get_text())
                Local_Feature["Player History Search"]:set_label("Search Among " .. #history_name .. " Players:")
                local file <const> = io.open(history_file, "r")
                if file then
                    local value_page <const> = Local_Feature["Player History Pages"]:get_value() - 1
                    local count_1 = 0
                    local count_2 = 0
                    for line in file:lines() do
                        local file_name, file_rid, file_ip, file_port, first_seen_date, first_seen_hours, last_seen_date, last_seen_hours, how_many_times <const> = line:match("([^|]+)|([^|]+)|([^|]+)|([^|]+)|([^|]+)|([^|]+)|([^|]+)|([^|]+)|([^|]+)")
                        for _, value in ipairs(history_name) do
                            if value == file_name then
                                count_1 = count_1 + 1
                                if count_1 > value_page * 23 then
                                    count_2 = count_2 + 1
                                    if Player_History[count_2] ~= nil then
                                        Player_History[count_2]:set_label(file_name)
                                    end
                                end
                            end
                        end
                    end
                    if count_2 < 23 then
                        repeat
                            count_2 = count_2 + 1
                            Player_History[count_2]:set_label("")
                        until count_2 == 23
                    end
                end
                io.close(file)
            end
        end
        thread.yield()
    end
end)

Local_Parents["Custom Notify"] = Local_Parents["Network"]:add_submenu("Custom Notify", {})

local Player_Join_Leave_Notify <const> = {
    "Exclude Me",
    "Name",
    "RID",
    "PID",
    "IP",
    "Port",
}

Local_Parents["Player Join"] = Local_Parents["Custom Notify"]:add_submenu("Player Join", {})

Local_Feature["Player Join Enable"] = lua_essential.add_list(Local_Parents["Player Join"], "Enable", {"Notify & Log", "Log"}, true, {}, function()
end)

for _, name in ipairs(Player_Join_Leave_Notify) do
    Local_Feature["Player Join " .. name] = lua_essential.add_toggle(Local_Parents["Player Join"], name, {}, function() end)
end

Local_Parents["Player Leave"] = Local_Parents["Custom Notify"]:add_submenu("Player Leave", {})

Local_Feature["Player Leave Enable"] = lua_essential.add_list(Local_Parents["Player Leave"], "Enable", {"Notify & Log", "Log"}, true, {}, function()
end)

for _, name in ipairs(Player_Join_Leave_Notify) do
    Local_Feature["Player Leave " .. name] = lua_essential.add_toggle(Local_Parents["Player Leave"], name, {}, function() end)
end

Local_Parents["Player Spawn"] = Local_Parents["Custom Notify"]:add_submenu("Player Spawn", {})

Local_Feature["Player Spawn Enable"] = lua_essential.add_list(Local_Parents["Player Spawn"], "Enable", {"Notify & Log", "Log"}, true, {}, function()
end)

local Player_Spawn_Notify <const> = {
    "Name",
    "RID",
    "PID",
    "IP",
    "Port",
}

for _, name in ipairs(Player_Spawn_Notify) do
    Local_Feature["Player Spawn " .. name] = lua_essential.add_toggle(Local_Parents["Player Spawn"], name, {}, function() end)
end

Local_Parents["Entity Damaged"] = Local_Parents["Custom Notify"]:add_submenu("Entity Damaged", {})

Local_Feature["Entity Damaged Enable"] = lua_essential.add_list(Local_Parents["Entity Damaged"], "Enable", {"Notify & Log", "Log"}, true, {}, function()
end)

Local_Feature["Entity Damaged Victim Filter"] = lua_essential.add_list(Local_Parents["Entity Damaged"], "Victim Filter", {"Only Player", "Only Ped", "Only Me", "Exclude Player", "Exclude Ped", "Exclude Me"}, true, {}, function()
end)

Local_Feature["Entity Damaged Damager Filter"] = lua_essential.add_list(Local_Parents["Entity Damaged"], "Damager Filter", {"Only Player", "Only Ped", "Only Me", "Exclude Player", "Exclude Ped", "Exclude Me"}, true, {}, function()
end)

Local_Feature["Entity Damaged Dead Filter"] = lua_essential.add_list(Local_Parents["Entity Damaged"], "Dead Filter", {"Only", "Exclude"}, true, {}, function()
end)

Local_Feature["Entity Damaged Suicide Filter"] = lua_essential.add_list(Local_Parents["Entity Damaged"], "Suicide Filter", {"Only", "Exclude"}, true, {}, function()
end)

local Entity_Damaged_Notify <const> = {
    "Exclude Empty Damager",
    "Victim",
    "Damager",
    "Weapon",
    "Ammo",
    "Damage",
    "Dead",
    "Suicide",
}

for _, name in ipairs(Entity_Damaged_Notify) do
    Local_Feature["Entity Damaged " .. name] = lua_essential.add_toggle(Local_Parents["Entity Damaged"], name, {}, function() end)
end

Local_Parents["Entity Revived"] = Local_Parents["Custom Notify"]:add_submenu("Entity Revived", {})

Local_Feature["Entity Revived Enable"] = lua_essential.add_list(Local_Parents["Entity Revived"], "Enable", {"Notify & Log", "Log"}, true, {}, function()
end)

local Entity_Revived_Notify <const> = {
    "Victim",
    "Reviver",
}

for _, name in ipairs(Entity_Revived_Notify) do
    Local_Feature["Entity Revived " .. name] = lua_essential.add_toggle(Local_Parents["Entity Revived"], name, {}, function() end)
end

Local_Feature["Block Script Host Migration"] = lua_essential.add_toggle(Local_Parents["Network"], "Block Script Host Migration", {}, function()
    while Local_Feature["Block Script Host Migration"]:get_toggle() do
        if native.network.network_is_host() then
            native.network.network_prevent_script_host_migration()
        end
        thread.yield()
    end
end)

Local_Feature["Disables Session Splitting"] = lua_essential.add_toggle(Local_Parents["Network"], "Disables Session Splitting", {}, function() -- I wonder if it makes any difference
    if Local_Feature["Disables Session Splitting"]:get_toggle() then
        while Local_Feature["Disables Session Splitting"]:get_toggle() do
            native.network._network_auto_session_set_allowed_to_split(false)
            thread.yield()
        end
        native.network._network_auto_session_set_allowed_to_split(true)
    end
end)

Local_Feature["Create Ghost Session"] = lua_essential.add_toggle(Local_Parents["Network"], "Create Ghost Session", {}, function()
    if Local_Feature["Create Ghost Session"]:get_toggle() then
        native.network.network_start_solo_tutorial_session()
    else
        native.network.network_end_tutorial_session()
    end
end)

Local_Feature["Hide Loading Spinner"] = lua_essential.add_toggle(Local_Parents["Network"], "Hide Loading Spinner", {}, function()
    while Local_Feature["Hide Loading Spinner"]:get_toggle() do
        native.hud.busyspinner_off()
        thread.yield()
    end
end)

Local_Feature["Crash Session"] = Local_Parents["Network"]:add_button("Crash Session", {}, function()
    for a = 1, 5 do
        local count = 0
        local ent <const> = {}
        for pid in lua_player.player_list(false) do
            count = count + 1
            local pos <const> = lua_entity.get_entity_coords(player.get_ped(pid))
            ent[count] = lua_entity.spawn_entity(hash.joaat("s_chuckwagonawning01b"), pos.x, pos.y, pos.z, 0, 0, 0, false, true, true, true, false, true, true)
            native.entity.set_entity_alpha(ent[count], 0, true)
        end
        thread.yield(500)
        for i in ipairs(ent) do
            lua_entity.delete_entity(ent[i])
        end
    end
end)

Local_Parents["Entity Manager"] = Local_Parents["Script Root"]:add_submenu("Entity Manager", {})

Local_Parents["All"] = Local_Parents["Entity Manager"]:add_submenu("All", {})

Local_Parents["Peds"] = Local_Parents["Entity Manager"]:add_submenu("Peds", {})

Local_Feature["Ped LOD"] = lua_essential.add_slider_float(Local_Parents["Peds"], "Ped LOD", 1.00, 0.00, 1.00, 0.01, true, {}, function()
    if Local_Feature["Ped LOD"]:get_toggle() then
        while Local_Feature["Ped LOD"]:get_toggle() do
            for _, ent in pairs(game.get_world_peds()) do
                native.ped.set_ped_lod_multiplier(ent, lua_essential.get_number_value(Local_Feature["Ped LOD"]))
            end
            thread.yield()
        end
        for _, ent in pairs(game.get_world_peds()) do
            native.ped.set_ped_lod_multiplier(ent, 1.0)
        end
    end
end)

Local_Feature["Fill Ped Population"] = lua_essential.add_toggle(Local_Parents["Peds"], "Fill Ped Population", {}, function()
    while Local_Feature["Fill Ped Population"]:get_toggle() do
        native.ped.instantly_fill_ped_population()
        thread.yield()
    end
end)

Local_Feature["Ped No Damage"] = lua_essential.add_toggle(Local_Parents["Peds"], "Ped No Damage", {}, function()
    if Local_Feature["Ped No Damage"]:get_toggle() then
        native.ped.set_ai_weapon_damage_modifier(0)
        native.ped.set_ai_melee_weapon_damage_modifier(0)
    else
        native.ped.reset_ai_weapon_damage_modifier()
        native.ped.set_ai_melee_weapon_damage_modifier(1) -- not find native.ped.reset_ai_melee_weapon_damage_modifier()
    end
end)

Local_Feature["Agitate Horse"] = Local_Parents["Peds"]:add_button("Agitate Horse", {}, function()
    for _, ent in pairs(game.get_world_peds()) do
        if not native.ped.is_ped_a_player(ent) then
            native.ped._horse_agitate(ent, true)
        end
    end
end)

Local_Feature["Kill Ped"] = Local_Parents["Peds"]:add_button("Kill Ped", {}, function()
    for _, ent in pairs(game.get_world_peds()) do
        if not native.ped.is_ped_a_player(ent) then
            native.entity.set_entity_health(ent, 0, 0)
        end
    end
end)

Local_Feature["Revive Ped"] = Local_Parents["Peds"]:add_button("Revive Ped", {}, function()
    for _, ent in pairs(game.get_world_peds()) do
        if not native.ped.is_ped_a_player(ent) then
            native.ped.revive_injured_ped(ent)
            native.entity.set_entity_health(ent, native.ped.get_ped_max_health(ent), 0)
        end
    end
end)

Local_Parents["Vehicles"] = Local_Parents["Entity Manager"]:add_submenu("Vehicles", {})

Local_Feature["Vehicle LOD"] = lua_essential.add_toggle(Local_Parents["Vehicles"], "Vehicle LOD", {}, function()
    if Local_Feature["Vehicle LOD"]:get_toggle() then
        while Local_Feature["Vehicle LOD"]:get_toggle() do
            for _, ent in pairs(game.get_world_vehicles()) do
                native.vehicle.set_vehicle_lod_multiplier(ent, 0.0)
            end
            thread.yield()
        end
        for _, ent in pairs(game.get_world_vehicles()) do
            native.vehicle.set_vehicle_lod_multiplier(ent, 1.0)
        end
    end
end)

Local_Feature["Fill Vehicle Population"] = lua_essential.add_toggle(Local_Parents["Vehicles"], "Fill Vehicle Population", {}, function()
    while Local_Feature["Fill Vehicle Population"]:get_toggle() do
        native.vehicle.instantly_fill_vehicle_population()
        thread.yield()
    end
end)

Local_Feature["Halt Vehicles"] = Local_Parents["Vehicles"]:add_button("Halt Vehicle", {}, function()
    for _, ent in pairs(game.get_world_vehicles()) do
        native.vehicle.bring_vehicle_to_halt(ent, 1, 1, false)
    end
end)

Local_Feature["Fix Vehicles"] = Local_Parents["Vehicles"]:add_button("Fix Vehicle", {}, function()
    for _, ent in pairs(game.get_world_vehicles()) do
        native.vehicle.set_vehicle_fixed(ent)
    end
end)

Local_Feature["Break Vehicle Wheels"] = Local_Parents["Vehicles"]:add_button("Break Vehicle Wheels", {}, function()
    for _, ent in pairs(game.get_world_vehicles()) do
        for i = 0, 3 do
            native.vehicle._break_off_vehicle_wheel(ent, i)
        end
    end
end)

Local_Feature["Clean Vehicle"] = Local_Parents["Vehicles"]:add_button("Clean Vehicle", {}, function()
    for _, ent in pairs(game.get_world_vehicles()) do
        native.vehicle._set_vehicle_wet_level(ent, 0.0)
        native.vehicle._set_vehicle_snow_level(ent, 0.0)
        native.vehicle.set_vehicle_dirt_level(ent, 0.0)
    end
end)

Local_Parents["Objects"] = Local_Parents["Entity Manager"]:add_submenu("Objects", {})

Local_Parents["Misc"] = Local_Parents["Script Root"]:add_submenu("Misc", {})

Local_Parents["Camera"] = Local_Parents["Misc"]:add_submenu("Camera", {})

Local_Parents["Timecycles Modifier"] = Local_Parents["Camera"]:add_submenu("Timecycles Modifier", {})

for _, name in ipairs(timecycles) do
    Local_Feature[name] = lua_essential.add_toggle(Local_Parents["Timecycles Modifier"], name, {}, function()
        if Local_Feature[name]:get_toggle() then
            for _, name_2 in ipairs(timecycles) do
                if name ~= name_2 and Local_Feature[name_2]:get_toggle() then
                    Local_Feature[name_2]:set_toggle(false)
                end
            end
            while Local_Feature[name]:get_toggle() do
                native.graphics.set_timecycle_modifier(name)
                thread.yield()
            end
            native.graphics.clear_timecycle_modifier()
        end
    end)
end

Local_Feature["Force Third Person"] = lua_essential.add_list(Local_Parents["Camera"], "Force Third Person", {"Near", "Far"}, true, {}, function()
    while Local_Feature["Force Third Person"]:get_toggle() do
        if Local_Feature["Force Third Person"]:get_item() == "Near" then
            native.cam.disable_on_foot_first_person_view_this_update()
            native.cam._force_third_person_cam_this_frame()
        elseif Local_Feature["Force Third Person"]:get_item() == "Far" then
            native.cam.disable_on_foot_first_person_view_this_update()
            native.cam._force_third_person_cam_far_this_frame()
        end
        thread.yield()
    end
end)

Local_Feature["First Person"] = lua_essential.add_list(Local_Parents["Camera"], "First Person", {"Force", "Disable"}, true, {}, function()
    while Local_Feature["First Person"]:get_toggle() do
        if Local_Feature["First Person"]:get_item() == "Force" then
            native.cam._force_first_person_cam_this_frame()
        elseif Local_Feature["First Person"]:get_item() == "Disable" then
            native.cam.disable_on_foot_first_person_view_this_update()
        end
        thread.yield()
    end
end)

Local_Feature["Unrestrict Third Person Cam"] = lua_essential.add_toggle(Local_Parents["Camera"], "Unrestrict Third Person Cam", {}, function()
    while Local_Feature["Unrestrict Third Person Cam"]:get_toggle() do
        native.cam.set_third_person_cam_relative_pitch_limits_this_update(-89.0, 89.0)
        thread.yield()
    end
end)

Local_Feature["Unrestrict First Person Cam"] = lua_essential.add_toggle(Local_Parents["Camera"], "Unrestrict First Person Cam", {}, function()
    while Local_Feature["Unrestrict First Person Cam"]:get_toggle() do
        native.cam.set_first_person_aim_cam_relative_pitch_limits_this_update(-89.0, 89.0)
        thread.yield()
    end
end)

Local_Feature["Disable Cam Shaking"] = lua_essential.add_toggle(Local_Parents["Camera"], "Disable Cam Shaking", {}, function()
    while Local_Feature["Disable Cam Shaking"]:get_toggle() do
        native.cam.stop_gameplay_cam_shaking(true)
        thread.yield()
    end
end)

Local_Feature["Disable Cinematic Mode"] = lua_essential.add_toggle(Local_Parents["Camera"], "Disable Cinematic Mode", {}, function()
    while Local_Feature["Disable Cinematic Mode"]:get_toggle() do
        native.cam._disable_cinematic_mode_this_frame()
        thread.yield()
    end
end)

Local_Feature["Disable PostFX"] = lua_essential.add_toggle(Local_Parents["Camera"], "Disable PostFX", {}, function()
    while Local_Feature["Disable PostFX"]:get_toggle() do
        native.graphics.animpostfx_stop_all()
        native.graphics.clear_timecycle_modifier()
        thread.yield()
    end
end)

Local_Parents["Disable"] = Local_Parents["Misc"]:add_submenu("Disable", {})

Local_Feature["Disable Far Light"] = lua_essential.add_toggle(Local_Parents["Disable"], "Disable Far Light", {}, function()
    if Local_Feature["Disable Far Light"]:get_toggle() then
        while Local_Feature["Disable Far Light"]:get_toggle() do
            native.graphics._disable_far_artificial_lights(true)
            thread.yield()
        end
        native.graphics._disable_far_artificial_lights(false)
    end
end)

Local_Feature["Disable Points Of Interest"] = lua_essential.add_toggle(Local_Parents["Disable"], "Disable Points Of Interest", {}, function()
    if Local_Feature["Disable Points Of Interest"]:get_toggle() then
        while Local_Feature["Disable Points Of Interest"]:get_toggle() do
            native.map._hide_active_points_of_interest()
            thread.yield()
        end
        native.map._show_active_points_of_interest()
    end
end)

Local_Feature["Disable Loading Screens"] = lua_essential.add_toggle(Local_Parents["Disable"], "Disable Loading Screens", {}, function()
    if Local_Feature["Disable Loading Screens"]:get_toggle() then
        while Local_Feature["Disable Loading Screens"]:get_toggle() do
            native.scripts.set_no_loading_screen(true)
            thread.yield()
        end
        native.scripts.set_no_loading_screen(false)
    end
end)

Local_Feature["Disable Water Lookup"] = lua_essential.add_toggle(Local_Parents["Disable"], "Disable Water Lookup", {}, function()
    while Local_Feature["Disable Water Lookup"]:get_toggle() do
        native.water.disable_water_lookup()
        thread.yield()
    end
end)

Local_Parents["Minimap"] = Local_Parents["Misc"]:add_submenu("Minimap", {})

Local_Feature["Hide Minimap"] = lua_essential.add_toggle(Local_Parents["Minimap"], "Hide Minimap", {}, function()
    if Local_Feature["Hide Minimap"]:get_toggle() then
        while Local_Feature["Hide Minimap"]:get_toggle() do
            native.map.display_radar(false)
            thread.yield()
        end
        native.map.display_radar(true)
    end
end)

local radar_configs <const> = {
    ["0"] = 0x25B517BF,
    ["1.1"] = 0x7BFC01D8,
    ["2.2"] = 0x8997C4AF,
    ["2.5"] = 0x8C251CF0,
    ["3"] = 0x14BAAA02,
    ["3.5"] = 0x874D8F10,
    ["4"] = 0xEF4631D2,
    ["5"] = 0xF4BB863C,
    ["7"] = 0xD0F4B483,
    ["10"] = 0xDF5DB58C,
}

Local_Feature["Minimap Zoom"] = lua_essential.add_list(Local_Parents["Minimap"], "Minimap Zoom", {"0", "1.1", "2.2", "2.5", "3", "3.5", "4", "5", "7", "10"}, true, {}, function()
    if Local_Feature["Minimap Zoom"]:get_toggle() then
        while Local_Feature["Minimap Zoom"]:get_toggle() do
            native.map._set_radar_config_type(radar_configs[Local_Feature["Minimap Zoom"]:get_item()], 0)
            thread.yield()
        end
        native.map._set_radar_config_type(radar_configs["5"], 0)
    end
end)

Local_Feature["Minimap Angle"] = lua_essential.add_slider_int(Local_Parents["Minimap"], "Minimap Angle", 0, 0, 360, 10, true, {}, function()
    if Local_Feature["Minimap Angle"]:get_toggle() then
        while Local_Feature["Minimap Angle"]:get_toggle() do
            native.map.lock_minimap_angle(Local_Feature["Minimap Angle"]:get_value())
            thread.yield()
        end
        native.map.unlock_minimap_angle()
    end
end)

Local_Feature["Minimap Zone"] = lua_essential.add_list(Local_Parents["Minimap"], "Minimap Zone", {"World", "Guarma"}, true, {}, function()
    while Local_Feature["Minimap Zone"]:get_toggle() do
        native.map._set_minimap_zone(hash.joaat(Local_Feature["Minimap Zone"]:get_item()))
        thread.yield()
    end
end)

Local_Feature["Reveal Entire Map"] = lua_essential.add_toggle(Local_Parents["Minimap"], "Reveal Entire Map", {}, function()
    if Local_Feature["Reveal Entire Map"]:get_toggle() then
        native.map.set_minimap_hide_fow(true)
    else
        native.map.set_minimap_hide_fow(false)
    end
end)

Local_Feature["Pause"] = lua_essential.add_list(Local_Parents["Misc"], "Pause", {"Game", "Render Phases"}, true, {}, function()
    if Local_Feature["Pause"]:get_toggle() then
        while Local_Feature["Pause"]:get_toggle() do
            if Local_Feature["Pause"]:get_item() == "Game" then
                native.misc.set_game_paused(true)
                native.graphics.toggle_paused_renderphases(true)
            elseif Local_Feature["Pause"]:get_item() == "Render Phases" then
                native.misc.set_game_paused(false)
                native.graphics.toggle_paused_renderphases(false)
            end
            thread.yield()
        end
        native.misc.set_game_paused(false)
        native.graphics.toggle_paused_renderphases(true)
    end
end)

Local_Feature["FPS Limiter"] = lua_essential.add_slider_int(Local_Parents["Misc"], "FPS Limiter", 60, 5, 240, 5, true, {}, function()
    while Local_Feature["FPS Limiter"]:get_toggle() do
        local timer <const> = time.unix_milliseconds() + (500 / Local_Feature["FPS Limiter"]:get_value())
        thread.yield()
        while timer > time.unix_milliseconds() do end
    end
end)

Local_Feature["Guarma Water"] = lua_essential.add_toggle(Local_Parents["Misc"], "Guarma Water", {}, function()
    if Local_Feature["Guarma Water"]:get_toggle() then
        while Local_Feature["Guarma Water"]:get_toggle() do
            native.water._set_world_water_type(1)
            thread.yield()
        end
        native.water._set_world_water_type(0)
    end
end)

Local_Feature["Guarma World Horizon"] = lua_essential.add_toggle(Local_Parents["Misc"], "Guarma World Horizon", {}, function()
    if Local_Feature["Guarma World Horizon"]:get_toggle() then
        while Local_Feature["Guarma World Horizon"]:get_toggle() do
            native.streaming._set_guarma_worldhorizon_active(true)
            thread.yield()
        end
        native.streaming._set_guarma_worldhorizon_active(false)
    end
end)

Local_Feature["World Potato Mode"] = lua_essential.add_list(Local_Parents["Misc"], "World Potato Mode", lua_essential.create_doubling_table(32), true, {}, function()
    if Local_Feature["World Potato Mode"]:get_toggle() then
        while Local_Feature["World Potato Mode"]:get_toggle() do
            local pos <const> = lua_entity.get_entity_coords(lua_player.my_ped())
            native.streaming.set_focus_pos_and_vel(pos.x + tonumber(Local_Feature["World Potato Mode"]:get_item()), pos.y, pos.z, 0.0, 0.0, 0.0)
            native.streaming.request_collision_at_coord(pos.x, pos.y, pos.z)
            thread.yield()
        end
        native.streaming.clear_focus()
    end
end)

Local_Feature["Moon Intensity"] = lua_essential.add_slider_float(Local_Parents["Misc"], "Moon Intensity", 0.50, 0.00, 1.00, 0.10, true, {}, function()
    while Local_Feature["Moon Intensity"]:get_toggle() do
        native.graphics.enable_moon_cycle_override(lua_essential.get_number_value(Local_Feature["Moon Intensity"]))
        thread.yield()
    end
end)

Local_Feature["Snow Value"] = lua_essential.add_list(Local_Parents["Misc"], "Snow Value", {"Nothing", "Less", "More"}, true, {}, function()
    while Local_Feature["Snow Value"]:get_toggle() do
        local snow_type
        if Local_Feature["Snow Value"]:get_item() == "Nothing" then
            snow_type = 0
        elseif Local_Feature["Snow Value"]:get_item() == "Less" then
            snow_type = 2
        elseif Local_Feature["Snow Value"]:get_item() == "More" then
            snow_type = 3
        end
        native.graphics._set_snow_coverage_type(snow_type)
        thread.yield()
    end
end)

Local_Feature["Screenshot Mode"] = lua_essential.add_toggle(Local_Parents["Misc"], "Screenshot Mode", {"Makes the Hud Invisible."}, function()
    if Local_Feature["Screenshot Mode"]:get_toggle() then
        while Local_Feature["Screenshot Mode"]:get_toggle() do
            native.hud.display_hud(false)
            native.hud.disable_frontend_this_frame()
            native.hud._ui_prompt_disable_prompts_this_frame()
            thread.yield()
        end
        native.hud.display_hud(true)
    end
end)

Local_Feature["Wind Speed"] = lua_essential.add_list(Local_Parents["Misc"], "Wind Speed", lua_essential.create_doubling_table(32), true, {}, function()
    while Local_Feature["Wind Speed"]:get_toggle() do
        print(native.misc.get_wind_speed())
        native.misc.set_wind_speed(tonumber(Local_Feature["Wind Speed"]:get_item()))
        thread.yield()
    end
end)

Local_Feature["Wind Direction"] = lua_essential.add_slider_int(Local_Parents["Misc"], "Wind Direction", 0, 0, 360, 5, true, {}, function()
    while Local_Feature["Wind Direction"]:get_toggle() do
        native.misc.set_wind_direction(Local_Feature["Wind Direction"]:get_value())
        thread.yield()
    end
end)

Local_Feature["Force Lightning Flash"] = lua_essential.add_list(Local_Parents["Misc"], "Force Lightning Flash", {"Random", "On Me"}, true, {}, function()
    while Local_Feature["Force Lightning Flash"]:get_toggle() do
        if Local_Feature["Force Lightning Flash"]:get_item() == "Random" then
            native.misc.force_lightning_flash()
        elseif Local_Feature["Force Lightning Flash"]:get_item() == "On Me" then
            local pos <const> = lua_entity.get_entity_coords(lua_player.my_ped())
            native.misc._force_lightning_flash_at_coords(pos.x, pos.y, pos.z, -1)
        end
        thread.yield()
    end
end)

Local_Parents["Profile"] = Local_Parents["Script Root"]:add_submenu("Profile", {})

Local_Feature["Save Profile"] = Local_Parents["Profile"]:add_button("Save", {}, function()
    local file <const> = io.open(profile_file, "w")
    io.output(file)
    io.write("")
    io.close(file)
    for k, v in pairs(Local_Feature) do
        local feature <const> = Local_Feature[k]
        local feature_type <const> = feature:get_type()
        local toggle = "false"
        local value = "nil"
        if feature:get_toggle() then
            toggle = "true"
        end
        if feature_type == "slider_int" then
            value = feature:get_value()
        elseif feature_type == "slider_float" then
            value = feature:get_value()
        elseif feature_type == "text_input" then
            value = feature:get_text()
        elseif feature_type == "list" then
            value = feature:get_item()
        elseif feature_type == "colour" then
            local r, g, b, a = feature:get_colour()
            value = r .. ", " .. g .. ", " .. b .. ", " .. a
        end
        local file <const> = io.open(profile_file, "a")
        io.output(file)
        io.write(k .. "|" .. toggle .. "|" .. value .. "\n")
        io.close(file)
    end
    toast.add_success("Save", "Successfully save profile.")
end)

Local_Feature["Load Profile"] = Local_Parents["Profile"]:add_button("Load", {}, function()
    if fs.exists(profile_file) and io.open(profile_file, "r"):read("*a") ~= "" then
        local file <const> = io.open(profile_file, "r")
        if file then
            for ligne in file:lines() do
                local valeur1, valeur2, valeur3 <const> = ligne:match("([^|]+)|([^|]+)|([^|]+)")
                local feature <const> = Local_Feature[valeur1]
                if feature ~= nil then
                    local feature_type <const> = feature:get_type()
                    feature:set_toggle(valeur2 == "true")
                    if valeur3 ~= "nil" then
                        if feature_type == "slider_int" then
                            feature:set_value(tonumber(valeur3))
                        elseif feature_type == "slider_float" then
                            feature:set_value(tonumber(valeur3))
                        elseif feature_type == "text_input" then
                            feature:set_text(valeur3)
                        elseif feature_type == "list" then
                            feature:set_item(valeur3)
                        elseif feature_type == "colour" then
                            -- feature:set_colour(valeur3)
                        end
                    end
                end
            end
            file:close()
        end
        toast.add_success("Load", "Successfully load profile.")
    else
        toast.add_warning("Load", "Save your profile before.")
    end
end)

Local_Feature["Reset Profile"] = Local_Parents["Profile"]:add_button("Reset", {}, function()
    local file <const> = io.open(profile_file, "w")
    io.output(file)
    io.write("")
    io.close(file)
    for k, v in pairs(Local_Feature) do
        Local_Feature[k]:set_toggle(false)
    end
    toast.add_success("Reset", "Successfully reset profile.")
end)

Local_Feature["Discord: GfmmeQNc93"] = Local_Parents["Script Root"]:add_button("Discord: GfmmeQNc93", {}, function()
    toast.add_success("Discord", "https://discord.gg/GfmmeQNc93")
end)

do
    local file <const> = io.open(profile_file, "r")
    if file then
        for ligne in file:lines() do
            local valeur1, valeur2, valeur3 <const> = ligne:match("([^|]+)|([^|]+)|([^|]+)")
            local feature <const> = Local_Feature[valeur1]
            if feature ~= nil then
                local feature_type <const> = feature:get_type()
                if valeur2 == "true" then
                    feature:set_toggle(true)
                end
                if valeur3 ~= "nil" then
                    if feature_type == "slider_int" then
                        feature:set_value(tonumber(valeur3))
                    elseif feature_type == "slider_float" then
                        feature:set_value(tonumber(valeur3))
                    elseif feature_type == "text_input" then
                        feature:set_text(valeur3)
                    elseif feature_type == "list" then
                        feature:set_item(valeur3)
                    elseif feature_type == "colour" then
                        -- feature:set_colour(valeur3)
                    end
                end
            end
        end
        file:close()
    end
end

toast.add_success("Anarchy v" .. anarchy_version, "Version: " .. anarchy_version .. "\nUpdated on: " .. update_date .. "\nDev: [3arc] Smiley\n\nAnarchy is correctly loaded.")


script.keep_alive()