---@diagnostic disable: lowercase-global

script.keep_alive()

script.set_name("Exodus Mix Features")

script.set_desc("|ΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞ\\||____\n|      The STFU Truck\t   |||''''''|'''''\\__,_\n| _̳_̳_̳_̳_̳_̳_̳_̳_̳_̳_̳_̳_̳_̳_̳_̳_̳_̳_̳_̳_̳_̳ l||__|__|__|__|)\n\t|(〇)〇)``````````***|(〇)(〇)***|(〇)\n\n\thttps://exodusmenu.com/\n")

script.on_shutdown(function()
    log.delete_key("Exodus™")
    native.hud.display_hud(true)
end)
local isJumping = false
attackersAmount = 1
attackersWeapon = 0
attackersDistance = 1
attackerInvincible = false
AttackerVisible = true
Agressive = true
attackerMount = false
animalcount = 1
Cycle = false
FireHooves = false
local variant = 0
SpawnDead = false
SpawmSedated = false
SpawnDrunk = false
CanBeTargeted = false


local troll_sub = menu.player_root():add_submenu("Trolling",{"To My Beloved Fortnite users:\n\n________________$$$$$\n_______________$$____$$\n_______________$$____$$\n_______________$$____$$\n_______________$$____$$\n_______________$$____$$\n_________$$$$$$____$$$$$$\n________$$____$$____$$____$$$$\n________$$____$$____$$____$$__$$\n$$$$__$$____$$_____$$___$$____$$\n$$______$$$$______________$$____$$\n$$______$$__________________________$$\n__$$____$$___________________________$$\n___$$$__$$___________________________$$\n____$$_________________________________$$\n_____$$$______________________________$$\n______$$______________________________$$$\n_______$$$____________________________$$\n________$$____________________________$$\n_________$$$________________________$$$\n__________$$_______________________$$\n__________$$$$$$$$$$$$$$$$$$$$\n\nhttps://exodusmenu.com/\n"}, function()
end)

local ped_att_sub = troll_sub:add_submenu("Ped Attachments", {"To My Beloved Fortnite users:\n\n________________$$$$$\n_______________$$____$$\n_______________$$____$$\n_______________$$____$$\n_______________$$____$$\n_______________$$____$$\n_________$$$$$$____$$$$$$\n________$$____$$____$$____$$$$\n________$$____$$____$$____$$__$$\n$$$$__$$____$$_____$$___$$____$$\n$$______$$$$______________$$____$$\n$$______$$__________________________$$\n__$$____$$___________________________$$\n___$$$__$$___________________________$$\n____$$_________________________________$$\n_____$$$______________________________$$\n______$$______________________________$$$\n_______$$$____________________________$$\n________$$____________________________$$\n_________$$$________________________$$$\n__________$$_______________________$$\n__________$$$$$$$$$$$$$$$$$$$$\n\nhttps://exodusmenu.com/\n"}, function()end)
local attacker_sub = troll_sub:add_submenu("Send Attackers", {"\n+----^-------------------,--------------,--------,-------------^---,\n| \t| | | | | | | | |      `-------------'  \t     |                \t〇\n`+-----------------------------------------------^-----------------|\n  `\\_,-----------------,------------,-------------------------------'\n    / XXXXXX /\t'|     \t/'\n   / XXXXXX /  \t`\\  \t/'\n  / XXXXXX /`------------'\n / XXXXXX /\n/ XXXXXX /\n(_________(      \n`--------------'\n\nhttps://exodusmenu.com/\n"}, function()end)
local annoying_sub = troll_sub:add_submenu("Annoying", {"To My Beloved Fortnite users:\n\n________________$$$$$\n_______________$$____$$\n_______________$$____$$\n_______________$$____$$\n_______________$$____$$\n_______________$$____$$\n_________$$$$$$____$$$$$$\n________$$____$$____$$____$$$$\n________$$____$$____$$____$$__$$\n$$$$__$$____$$_____$$___$$____$$\n$$______$$$$______________$$____$$\n$$______$$__________________________$$\n__$$____$$___________________________$$\n___$$$__$$___________________________$$\n____$$_________________________________$$\n_____$$$______________________________$$\n______$$______________________________$$$\n_______$$$____________________________$$\n________$$____________________________$$\n_________$$$________________________$$$\n__________$$_______________________$$\n__________$$$$$$$$$$$$$$$$$$$$\n\nhttps://exodusmenu.com/\n "}, function()end)

local attach_sub, attach_sub_opt = troll_sub:add_submenu("Attach Yourself",{"To My Beloved Fortnite users:\n\n________________$$$$$\n_______________$$____$$\n_______________$$____$$\n_______________$$____$$\n_______________$$____$$\n_______________$$____$$\n_________$$$$$$____$$$$$$\n________$$____$$____$$____$$$$\n________$$____$$____$$____$$__$$\n$$$$__$$____$$_____$$___$$____$$\n$$______$$$$______________$$____$$\n$$______$$__________________________$$\n__$$____$$___________________________$$\n___$$$__$$___________________________$$\n____$$_________________________________$$\n_____$$$______________________________$$\n______$$______________________________$$$\n_______$$$____________________________$$\n________$$____________________________$$\n_________$$$________________________$$$\n__________$$_______________________$$\n__________$$$$$$$$$$$$$$$$$$$$\n\nhttps://exodusmenu.com/\n"}, function()
end)



local function LoadingAnim(anim_dict)
    if not native.streaming.has_anim_dict_loaded(anim_dict) then
        native.streaming.request_anim_dict(anim_dict)
        while not native.streaming.has_anim_dict_loaded(anim_dict) do
            thread.yield(0)
        end
    end
end

local function LoadingAnim1(anim_dict1)
    if not native.streaming.has_anim_dict_loaded(anim_dict1) then
        native.streaming.request_anim_dict(anim_dict1)
        while not native.streaming.has_anim_dict_loaded(anim_dict1) do
            thread.yield(0)
        end
    end
end



    function RequestModel(hash)
        local timer <const> = time.unix_milliseconds() + 1000
        while not native.streaming.has_model_loaded(hash) and timer > time.unix_milliseconds() do
            native.streaming.request_model(hash, true)
            thread.yield()
        end
     end


local function UpdateLPlayer()
PlayerPed = native.player.get_player_ped(0)
PosX, PosY, PosZ = native.entity.get_entity_coords(PlayerPed, false, true)
end


local function request_model(hash)
    local timer <const> = time.unix_milliseconds() + 1000
    while not native.streaming.has_model_loaded(hash) and timer > time.unix_milliseconds() do
        native.streaming.request_model(hash, true)
        thread.yield()
    end
 end


    local function spanw_ped(hash,posVec, i)
        request_model(hash)
        local ped = native.ped.create_ped(hash, posVec.x, posVec.y+0.1, posVec.z, 0, true, true, true, false)
        if native.entity.does_entity_exist(ped) then
            native.task.clear_ped_tasks_immediately(ped, true, true)
            return ped
            else
               return false,toast.add_info("Spawn Failed")
        end
    end
    

     local function PlayAnimTask3(ped3, anim_dict1, anim_name1)
        LoadingAnim1(anim_dict1)
        UpdateLPlayer()
        native.task.task_play_anim(ped3, anim_dict1, anim_name1, 1.0, 1.0, -1, 1, 0.0, false, 0, false, "", false)
    end
    
    local function PlayAnimTask2(ped2, anim_dict, anim_name)
        LoadingAnim(anim_dict)
        UpdateLPlayer()
        native.task.task_play_anim(ped2, anim_dict, anim_name, 1.0, 1.0, -1, 1, 0.0, false, 0, false, "", false)
    end
    
    local function PlayAnimTask1(ped1, anim_dict1, anim_name1)
        LoadingAnim1(anim_dict1)
        UpdateLPlayer()
        native.task.task_play_anim(ped1, anim_dict1, anim_name1, 1.0, 1.0, -1, 1, 0.0, false, 0, false, "", false)
    end
    
    local function PlayAnimTask(ped, anim_dict, anim_name)
        LoadingAnim(anim_dict)
        UpdateLPlayer()
        native.task.task_play_anim(ped, anim_dict, anim_name, 1.0, 1.0, -1, 1, 0.0, false, 0, false, "", false)
    end

    ped_att_sub:add_button("GIVE HEAD - [on your knees]", {""}, function (playerIdx)
        local playerPed = native.player.get_player_ped(playerIdx)
            local posVec = native.entity.get_offset_from_entity_in_world_coords(playerPed, 0, 1.0, 0)
            ped1 = spanw_ped(0x25D32467,posVec)
            if native.entity.does_entity_exist(ped1) then
            native.ped._set_random_outfit_variation(ped1, true)
            native.task.clear_ped_tasks_immediately(ped1, true, true)
            native.streaming.request_anim_dict("script_story@sal1@ig@sal1_18_lenny_on_lenny")
            local anim_dict =  "script_story@sal1@ig@sal1_18_lenny_on_lenny"
            local anim_name =  "loop_female"
            native.task.task_play_anim(ped1, anim_dict, anim_name, 1.0, 1.0, -1, 1, 0.0, false, 0, false, "", false)
            native.entity.attach_entity_to_entity(ped1, playerPed, 0,0.0, 0.19, 1.35, 0.0, 0.0, 180.0, false, false, false, true, 0, true, false, false)
            local player_heading =native.entity.get_entity_heading(playerPed)
            native.entity.set_entity_heading(ped1,player_heading)
            native.entity.set_entity_invincible(ped1, true)
            native.ped.set_ped_config_flag(ped1, 61, true)
            native.ped.set_ped_config_flag(ped1, 254, true)
            native.ped._set_ped_can_be_lassoed(ped1, false)
            native.ped.set_ped_can_be_targetted(ped1, false)
            native.ped.set_ped_can_ragdoll(ped1, false)
            native.ped.set_blocking_of_non_temporary_events(ped1, true)
            native.ped.set_ped_flee_attributes(ped1, 0, false)
            native.ped.set_ped_combat_attributes(ped1, 17, true)
            native.ped.set_ped_lasso_hogtie_flag(ped1, 0, false)  
            end
        end)
        
        ped_att_sub:add_button("GIVE HEAD", {""}, function (playerIdx)
            local playerPed = native.player.get_player_ped(playerIdx)
            local posVec = native.entity.get_offset_from_entity_in_world_coords(playerPed, 0, 1.0, 0)
             ped1 = spanw_ped(0x25D32467,posVec)   
             if native.entity.does_entity_exist(ped1) then
            native.ped._set_random_outfit_variation(ped1, true)
            native.task.clear_ped_tasks_immediately(ped1, true, true)
            native.streaming.request_anim_dict("script_story@mud3@ig@ig_1_throw_whore")
            local anim_dict =  "script_story@mud3@ig@ig_1_throw_whore"
            local anim_name =  "base_att"
            native.task.task_play_anim(ped1, anim_dict, anim_name, 1.0, 1.0, -1, 1, 0.0, false, 0, false, "", false)
            native.entity.attach_entity_to_entity(ped1, playerPed, 0,0.0, 0.32, 0.65, 30.0, 0.0, 180.0, false, false, false, true, 0, true, false, false)
            local player_heading =native.entity.get_entity_heading(playerPed)
            native.entity.set_entity_heading(ped1,player_heading)
            native.entity.set_entity_invincible(ped1, true)
            native.ped.set_ped_config_flag(ped1, 61, true)
            native.ped.set_ped_config_flag(ped1, 254, true)
            native.ped._set_ped_can_be_lassoed(ped1, false)
            native.ped.set_ped_can_be_targetted(ped1, false)
            native.ped.set_ped_can_ragdoll(ped1, false)
            native.ped.set_blocking_of_non_temporary_events(ped1, true)
            native.ped.set_ped_flee_attributes(ped1, 0, false)
            native.ped.set_ped_combat_attributes(ped1, 17, true)
            native.ped.set_ped_lasso_hogtie_flag(ped1, 0, false)
             end
            end)   
            
        ped_att_sub:add_button("MY C IS IN YOUR BUM - [gay]", {""}, function (playerIdx) 
            local playerPed = native.player.get_player_ped(playerIdx)
                    local posVec = native.entity.get_offset_from_entity_in_world_coords(playerPed, 0, 1.0, 0)
                    ped1 = spanw_ped(0x25D32467,posVec)   
                    if native.entity.does_entity_exist(ped1) then
                    native.ped._set_random_outfit_variation(ped1, true)
                    native.task.clear_ped_tasks_immediately(ped1, true, true)
                    native.streaming.request_anim_dict("script_story@mud3@ig@ig_1_throw_whore")
                    local anim_dict =  "script_story@mud3@ig@ig_1_throw_whore"
                    local anim_name =  "base_att"
                    native.task.task_play_anim(ped1, anim_dict, anim_name, 1.0, 1.0, -1, 1, 0.0, false, 0, false, "", false)
                    native.entity.attach_entity_to_entity(ped1, playerPed, 0,0.0, -0.36, -0.05, 40.0, 0.0, 0.0, false, false, false, true, 0, true, false, false)
                    local player_heading =native.entity.get_entity_heading(playerPed)
                    native.entity.set_entity_heading(ped1,player_heading)
                    native.entity.set_entity_invincible(ped1, true)
                    native.ped.set_ped_config_flag(ped1, 61, true)
                    native.ped.set_ped_config_flag(ped1, 254, true)
                    native.ped._set_ped_can_be_lassoed(ped1, false)
                    native.ped.set_ped_can_be_targetted(ped1, false)
                    native.ped.set_ped_can_ragdoll(ped1, false)
                    native.ped.set_blocking_of_non_temporary_events(ped1, true)
                    native.ped.set_ped_flee_attributes(ped1, 0, false)
                    native.ped.set_ped_combat_attributes(ped1, 17, true)
                    native.ped.set_ped_lasso_hogtie_flag(ped1, 0, false)
                    end
        end)
        
        ped_att_sub:add_button("MY C IS IN YOUR BUM - [gay] - 2", {""}, function (playerIdx) 
            local playerPed = native.player.get_player_ped(playerIdx)
            local posVec = native.entity.get_offset_from_entity_in_world_coords(playerPed, 0, 1.0, 0)
             ped1 = spanw_ped(0x25D32467,posVec)
             if native.entity.does_entity_exist(ped1) then
            native.ped._set_random_outfit_variation(ped1, true)
            native.task.clear_ped_tasks_immediately(ped1, true, true)
            native.streaming.request_anim_dict("script_story@sal1@ig@sal1_18_lenny_on_lenny")
            local anim_dict =  "script_story@sal1@ig@sal1_18_lenny_on_lenny"
            local anim_name =  "loop_female"
            native.task.task_play_anim(ped1, anim_dict, anim_name, 1.0, 1.0, -1, 1, 0.0, false, 0, false, "", false)
            native.entity.attach_entity_to_entity(ped1, playerPed, 0,0.0, -0.4, 0.5, 30.0, 0.0, 0.0, false, false, false, true, 0, true, false, false)
            local player_heading =native.entity.get_entity_heading(playerPed)
            native.entity.set_entity_heading(ped1,player_heading)
            native.entity.set_entity_invincible(ped1, true)
            native.ped.set_ped_config_flag(ped1, 61, true)
            native.ped.set_ped_config_flag(ped1, 254, true)
            native.ped._set_ped_can_be_lassoed(ped1, false)
            native.ped.set_ped_can_be_targetted(ped1, false)
            native.ped.set_ped_can_ragdoll(ped1, false)
            native.ped.set_blocking_of_non_temporary_events(ped1, true)
            native.ped.set_ped_flee_attributes(ped1, 0, false)
            native.ped.set_ped_combat_attributes(ped1, 17, true)
            native.ped.set_ped_lasso_hogtie_flag(ped1, 0, false)
             end
        end)
        
        
        ped_att_sub:add_button("YOUR C IS IN MY BUM - [gay]", {""}, function (playerIdx)
        local playerPed = native.player.get_player_ped(playerIdx)
        local posVec = native.entity.get_offset_from_entity_in_world_coords(playerPed, 0, 1.0, 0)
        
         ped1 = spanw_ped(0x25D32467,posVec)   
         if native.entity.does_entity_exist(ped1) then
        native.ped._set_random_outfit_variation(ped1, true)
        native.task.clear_ped_tasks_immediately(ped1, true, true)
        native.streaming.request_anim_dict("script_story@mud3@ig@ig_1_throw_whore")
        local anim_dict =  "script_story@mud3@ig@ig_1_throw_whore"
        local anim_name =  "base_vtm"
        native.task.task_play_anim(ped1, anim_dict, anim_name, 1.0, 1.0, -1, 1, 0.0, false, 0, false, "", false)
        native.entity.attach_entity_to_entity(ped1, playerPed, 0,0.0, 0.25, 0.0, 0.0, 0.0, 0.0, false, false, false, true, 0, true, false, false)
        local player_heading =native.entity.get_entity_heading(playerPed)
        native.entity.set_entity_heading(ped1,player_heading)
        native.entity.set_entity_invincible(ped1, true)
        native.ped.set_ped_config_flag(ped1, 61, true)
        native.ped.set_ped_config_flag(ped1, 254, true)
        native.ped._set_ped_can_be_lassoed(ped1, false)
        native.ped.set_ped_can_be_targetted(ped1, false)
        native.ped.set_ped_can_ragdoll(ped1, false)
        native.ped.set_blocking_of_non_temporary_events(ped1, true)
        native.ped.set_ped_flee_attributes(ped1, 0, false)
        native.ped.set_ped_combat_attributes(ped1, 17, true)
        native.ped.set_ped_lasso_hogtie_flag(ped1, 0, false)
         end
        end)
        
        
        ped_att_sub:add_button("YOUR C IS IN MY BUM", {""}, function (playerIdx)
            local playerPed = native.player.get_player_ped(playerIdx)
            local posVec = native.entity.get_offset_from_entity_in_world_coords(playerPed, 0, 1.0, 0)
             ped1 = spanw_ped(0x99372227,posVec)   
            native.ped._set_random_outfit_variation(ped1, true)
            if native.entity.does_entity_exist(ped1) then
            native.task.clear_ped_tasks_immediately(ped1, true, true)
            native.streaming.request_anim_dict("script_story@mud3@ig@ig_1_throw_whore")
            local anim_dict =  "script_story@mud3@ig@ig_1_throw_whore"
            local anim_name =  "base_vtm"
            native.task.task_play_anim(ped1, anim_dict, anim_name, 1.0, 1.0, -1, 1, 0.0, false, 0, false, "", false)
            native.entity.attach_entity_to_entity(ped1, playerPed, 0,0.0, 0.23, 0.08, 0.0, 0.0, 0.0, false, false, false, true, 0, true, false, false)
            local player_heading =native.entity.get_entity_heading(playerPed)
            native.entity.set_entity_heading(ped1,player_heading)
            native.entity.set_entity_invincible(ped1, true)
            native.ped.set_ped_config_flag(ped1, 61, true)
            native.ped.set_ped_config_flag(ped1, 254, true)
            native.ped._set_ped_can_be_lassoed(ped1, false)
            native.ped.set_ped_can_be_targetted(ped1, false)
            native.ped.set_ped_can_ragdoll(ped1, false)
            native.ped.set_blocking_of_non_temporary_events(ped1, true)
            native.ped.set_ped_flee_attributes(ped1, 0, false)
            native.ped.set_ped_combat_attributes(ped1, 17, true)
            native.ped.set_ped_lasso_hogtie_flag(ped1, 0, false)
            end
        end)

    local function ByeBye(playerIdx)
        local playerPed = native.player.get_player_ped(playerIdx)
        local posVec = native.entity.get_offset_from_entity_in_world_coords(playerPed, 0, 1.0, 0)
        local ped = spanw_ped(0x25D32467,posVec)
        local ped1 = spanw_ped(0xA91215CD,posVec)
        local ped2 = spanw_ped(0xA91215CD,posVec)
        local ped3 = spanw_ped(0xA91215CD,posVec)
        native.ped._set_random_outfit_variation(ped, true)
        native.ped._set_random_outfit_variation(ped1, true)
        native.ped._set_random_outfit_variation(ped2, true)
        native.ped._set_random_outfit_variation(ped3, true)
        local anim_dict =  "script_mp@emotes@gentlewave@male@unarmed@upper"
        local anim_name =  "loop"
    
        local anim_dict1 = "script_mp@emotes@pointlaugh@male@unarmed@upper"
        local anim_name1 = "action"
        PlayAnimTask(ped, anim_dict, anim_name)
        PlayAnimTask1(ped1, anim_dict1, anim_name1)
        PlayAnimTask2(ped2, anim_dict1, anim_name1)
        PlayAnimTask3(ped3, anim_dict1, anim_name1)
        native.entity.attach_entity_to_entity(ped, playerPed, 0, 0.0, 0.5, 0.0, 0.0, 0.0, 180.0, false, false, false, true, 0, true, false, false)
        native.entity.attach_entity_to_entity(ped1, playerPed, 0, 0.0, -1.0, 0.0, 0.0, 0.0, 0.0, false, false, false, true, 0, true, false, false)
        native.entity.attach_entity_to_entity(ped2, playerPed, 0, 1.0, 0.0, 0.0, 0.0, 0.0, 90.0, false, false, false, true, 0, true, false, false)
        native.entity.attach_entity_to_entity(ped3, playerPed, 0,-1.0, -0.0, 0.0, 0.0, 0.0, -90, false, false, false, true, 0, true, false, false)

    
        local player_heading =native.entity.get_entity_heading(playerPed)
    
        native.entity.set_entity_heading(ped, -player_heading)
        native.entity.set_entity_heading(ped1, -player_heading)
        native.entity.set_entity_heading(ped2, player_heading)
        native.entity.set_entity_heading(ped3, player_heading)
    
        native.ped.set_ped_config_flag(ped1, 254, true)
        native.ped.set_ped_config_flag(ped2, 254, true)
        native.ped.set_ped_config_flag(ped3, 254, true)
        native.ped.set_ped_config_flag(ped, 254, true)
    
            native.ped.set_ped_config_flag(ped1, 61, true)
            native.ped.set_ped_config_flag(ped2, 61, true)
            native.ped.set_ped_config_flag(ped3, 61, true)
            native.ped.set_ped_config_flag(ped, 61, true)
    
            native.ped._set_ped_can_be_lassoed(ped1, false)
            native.ped._set_ped_can_be_lassoed(ped2, false)
            native.ped._set_ped_can_be_lassoed(ped, false)
            native.ped._set_ped_can_be_lassoed(ped3, false)
    
            native.ped.set_ped_can_be_targetted(ped1, false)
            native.ped.set_ped_can_be_targetted(ped, false)
            native.ped.set_ped_can_be_targetted(ped2, false)
            native.ped.set_ped_can_be_targetted(ped3, false)
    
            native.ped.set_ped_can_ragdoll(ped1, false)
            native.ped.set_ped_can_ragdoll(ped3, false)
            native.ped.set_ped_can_ragdoll(ped2, false)
            native.ped.set_ped_can_ragdoll(ped, false)
    
            native.ped.set_blocking_of_non_temporary_events(ped1, true)
            native.ped.set_blocking_of_non_temporary_events(ped2, true)
            native.ped.set_blocking_of_non_temporary_events(ped3, true)
            native.ped.set_blocking_of_non_temporary_events(ped, true)
    
            native.ped.set_ped_flee_attributes(ped1, 0, false)
            native.ped.set_ped_flee_attributes(ped, 0, false)
            native.ped.set_ped_flee_attributes(ped2, 0, false)
            native.ped.set_ped_flee_attributes(ped3, 0, false)
    
    
            native.ped.set_ped_combat_attributes(ped1, 17, true)
            native.ped.set_ped_combat_attributes(ped2, 17, true)
            native.ped.set_ped_combat_attributes(ped3, 17, true)
            native.ped.set_ped_combat_attributes(ped, 17, true)
    
            native.ped.set_ped_lasso_hogtie_flag(ped1, 0, false)
            native.ped.set_ped_lasso_hogtie_flag(ped, 0, false)
            native.ped.set_ped_lasso_hogtie_flag(ped2, 0, false)
            native.ped.set_ped_lasso_hogtie_flag(ped3, 0, false)
    
        native.entity.set_entity_invincible(ped, true)
        native.entity.set_entity_invincible(ped1, true)
        native.entity.set_entity_invincible(ped2, true)
        native.entity.set_entity_invincible(ped3, true)
        native.ped.set_ped_keep_task(ped, true)
        native.ped.set_ped_keep_task(ped1, true)
        native.ped.set_ped_keep_task(ped2, true)
        native.ped.set_ped_keep_task(ped3, true)
        thread.yield(5000)
     end
    
   
    ped_att_sub:add_button("1 Wave - 3 Point and Laugh", {""}, function (playerIdx)
        ByeBye(playerIdx)
    end)


    ped_att_sub:add_button("4 Peeing Guys", {"https://exodusmenu.com/\n"}, function (playerIdx)
        local playerPed = native.player.get_player_ped(playerIdx)
        local posVec = native.entity.get_offset_from_entity_in_world_coords(playerPed, 0, 1.0, 0)
        local ped = spanw_ped(0x25D32467,posVec)
        local ped1 = spanw_ped(0x25D32467,posVec)
        local ped2 = spanw_ped(0x25D32467,posVec)
        local ped3 = spanw_ped(0x25D32467,posVec)
        native.ped._set_random_outfit_variation(ped, true)
        native.ped._set_random_outfit_variation(ped1, true)
        native.ped._set_random_outfit_variation(ped2, true)
        native.ped._set_random_outfit_variation(ped3, true)

        local anim_dict =  "amb_misc@world_human_pee@male_a@idle_c"
        local anim_name =  "idle_h"

        local anim_dict1 = "amb_misc@world_human_pee@male_a@idle_b"
        local anim_name1 = "idle_e"

        PlayAnimTask(ped, anim_dict, anim_name)
        PlayAnimTask1(ped1, anim_dict1, anim_name1)
        PlayAnimTask2(ped2, anim_dict, anim_name)
        PlayAnimTask3(ped3, anim_dict1, anim_name1)
    
        native.entity.attach_entity_to_entity(ped, playerPed, 0, 0.0, 0.5, 1.0, 0.0, 0.0, 180.0, false, false, false, true, 0, true, false, false)
        native.entity.attach_entity_to_entity(ped1, playerPed, 0, 0.0, -0.5,1.0, 0.0, 0.0, 0.0, false, false, false, true, 0, true, false, false)
        native.entity.attach_entity_to_entity(ped2, playerPed, 0, 0.5, 0.0, 1.0, 0.0, 0.0, 90.0, false, false, false, true, 0, true, false, false)
        native.entity.attach_entity_to_entity(ped3, playerPed, 0,-0.5, -0.0,1.0, 0.0, 0.0, -90, false, false, false, true, 0, true, false, false)

        local player_heading =native.entity.get_entity_heading(playerPed)
    
        native.entity.set_entity_heading(ped, -player_heading)
        native.entity.set_entity_heading(ped1, -player_heading)
        native.entity.set_entity_heading(ped2, player_heading)
        native.entity.set_entity_heading(ped3, player_heading)
    
        native.ped.set_ped_config_flag(ped1, 254, true)
        native.ped.set_ped_config_flag(ped2, 254, true)
        native.ped.set_ped_config_flag(ped3, 254, true)
        native.ped.set_ped_config_flag(ped, 254, true)
    
            native.ped.set_ped_config_flag(ped1, 61, true)
            native.ped.set_ped_config_flag(ped2, 61, true)
            native.ped.set_ped_config_flag(ped3, 61, true)
            native.ped.set_ped_config_flag(ped, 61, true)
    
            native.ped._set_ped_can_be_lassoed(ped1, false)
            native.ped._set_ped_can_be_lassoed(ped2, false)
            native.ped._set_ped_can_be_lassoed(ped, false)
            native.ped._set_ped_can_be_lassoed(ped3, false)
    
            native.ped.set_ped_can_be_targetted(ped1, false)
            native.ped.set_ped_can_be_targetted(ped, false)
            native.ped.set_ped_can_be_targetted(ped2, false)
            native.ped.set_ped_can_be_targetted(ped3, false)
    
            native.ped.set_ped_can_ragdoll(ped1, false)
            native.ped.set_ped_can_ragdoll(ped3, false)
            native.ped.set_ped_can_ragdoll(ped2, false)
            native.ped.set_ped_can_ragdoll(ped, false)
    
            native.ped.set_blocking_of_non_temporary_events(ped1, true)
            native.ped.set_blocking_of_non_temporary_events(ped2, true)
            native.ped.set_blocking_of_non_temporary_events(ped3, true)
            native.ped.set_blocking_of_non_temporary_events(ped, true)
    
            native.ped.set_ped_flee_attributes(ped1, 0, false)
            native.ped.set_ped_flee_attributes(ped, 0, false)
            native.ped.set_ped_flee_attributes(ped2, 0, false)
            native.ped.set_ped_flee_attributes(ped3, 0, false)
    
    
            native.ped.set_ped_combat_attributes(ped1, 17, true)
            native.ped.set_ped_combat_attributes(ped2, 17, true)
            native.ped.set_ped_combat_attributes(ped3, 17, true)
            native.ped.set_ped_combat_attributes(ped, 17, true)
    
            native.ped.set_ped_lasso_hogtie_flag(ped1, 0, false)
            native.ped.set_ped_lasso_hogtie_flag(ped, 0, false)
            native.ped.set_ped_lasso_hogtie_flag(ped2, 0, false)
            native.ped.set_ped_lasso_hogtie_flag(ped3, 0, false)
    
        native.entity.set_entity_invincible(ped, true)
        native.entity.set_entity_invincible(ped1, true)
        native.entity.set_entity_invincible(ped2, true)
        native.entity.set_entity_invincible(ped3, true)
        native.ped.set_ped_keep_task(ped, true)
        native.ped.set_ped_keep_task(ped1, true)
        native.ped.set_ped_keep_task(ped2, true)
        native.ped.set_ped_keep_task(ped3, true)
        thread.yield(5000)
    end)





    local function FourPointAndLaugh(playerIdx)
        local playerPed = native.player.get_player_ped(playerIdx)
        local posVec = native.entity.get_offset_from_entity_in_world_coords(playerPed, 0, 1.0, 0)
        local ped = spanw_ped(0xA91215CD,posVec)
        local ped1 = spanw_ped(0xA91215CD,posVec)
        local ped2 = spanw_ped(0xA91215CD,posVec)
        local ped3 = spanw_ped(0xA91215CD,posVec)
        native.ped._set_random_outfit_variation(ped, true)
        native.ped._set_random_outfit_variation(ped1, true)
        native.ped._set_random_outfit_variation(ped2, true)
        native.ped._set_random_outfit_variation(ped3, true)
        local anim_dict ="script_mp@emotes@pointlaugh@male@unarmed@upper"
        local anim_name ="action"
        PlayAnimTask(ped, anim_dict, anim_name)
        PlayAnimTask1(ped1, anim_dict, anim_name)
        PlayAnimTask2(ped2, anim_dict, anim_name)
        PlayAnimTask3(ped3, anim_dict, anim_name)
        native.entity.attach_entity_to_entity(ped, playerPed, 0, 0.0, 1.0, 0.0, 0.0, 0.0, 180.0, false, false, false, true, 0, true, false, false)
        native.entity.attach_entity_to_entity(ped1, playerPed, 0, 0.0, -1.0, 0.0, 0.0, 0.0, 0.0, false, false, false, true, 0, true, false, false)
        native.entity.attach_entity_to_entity(ped2, playerPed, 0, 1.0, 0.0, 0.0, 0.0, 0.0, 90.0, false, false, false, true, 0, true, false, false)
        native.entity.attach_entity_to_entity(ped3, playerPed, 0,-1.0, -0.0, 0.0, 0.0, 0.0, -90, false, false, false, true, 0, true, false, false)

        local player_heading =native.entity.get_entity_heading(playerPed)
    
        native.entity.set_entity_heading(ped, -player_heading)
        native.entity.set_entity_heading(ped1, -player_heading)
        native.entity.set_entity_heading(ped2, player_heading)
        native.entity.set_entity_heading(ped3, player_heading)
    
        native.ped.set_ped_config_flag(ped1, 254, true)
        native.ped.set_ped_config_flag(ped2, 254, true)
        native.ped.set_ped_config_flag(ped3, 254, true)
        native.ped.set_ped_config_flag(ped, 254, true)
    
            native.ped.set_ped_config_flag(ped1, 61, true)
            native.ped.set_ped_config_flag(ped2, 61, true)
            native.ped.set_ped_config_flag(ped3, 61, true)
            native.ped.set_ped_config_flag(ped, 61, true)
    
            native.ped._set_ped_can_be_lassoed(ped1, false)
            native.ped._set_ped_can_be_lassoed(ped2, false)
            native.ped._set_ped_can_be_lassoed(ped, false)
            native.ped._set_ped_can_be_lassoed(ped3, false)
    
            native.ped.set_ped_can_be_targetted(ped1, false)
            native.ped.set_ped_can_be_targetted(ped, false)
            native.ped.set_ped_can_be_targetted(ped2, false)
            native.ped.set_ped_can_be_targetted(ped3, false)
    
            native.ped.set_ped_can_ragdoll(ped1, false)
            native.ped.set_ped_can_ragdoll(ped3, false)
            native.ped.set_ped_can_ragdoll(ped2, false)
            native.ped.set_ped_can_ragdoll(ped, false)
    
            native.ped.set_blocking_of_non_temporary_events(ped1, true)
            native.ped.set_blocking_of_non_temporary_events(ped2, true)
            native.ped.set_blocking_of_non_temporary_events(ped3, true)
            native.ped.set_blocking_of_non_temporary_events(ped, true)
    
            native.ped.set_ped_flee_attributes(ped1, 0, false)
            native.ped.set_ped_flee_attributes(ped, 0, false)
            native.ped.set_ped_flee_attributes(ped2, 0, false)
            native.ped.set_ped_flee_attributes(ped3, 0, false)
    
    
            native.ped.set_ped_combat_attributes(ped1, 17, true)
            native.ped.set_ped_combat_attributes(ped2, 17, true)
            native.ped.set_ped_combat_attributes(ped3, 17, true)
            native.ped.set_ped_combat_attributes(ped, 17, true)
    
            native.ped.set_ped_lasso_hogtie_flag(ped1, 0, false)
            native.ped.set_ped_lasso_hogtie_flag(ped, 0, false)
            native.ped.set_ped_lasso_hogtie_flag(ped2, 0, false)
            native.ped.set_ped_lasso_hogtie_flag(ped3, 0, false)
    
        native.entity.set_entity_invincible(ped, true)
        native.entity.set_entity_invincible(ped1, true)
        native.entity.set_entity_invincible(ped2, true)
        native.entity.set_entity_invincible(ped3, true)
        native.ped.set_ped_keep_task(ped, true)
        native.ped.set_ped_keep_task(ped1, true)
        native.ped.set_ped_keep_task(ped2, true)
        native.ped.set_ped_keep_task(ped3, true)
        thread.yield(5000)
     end

     ped_att_sub:add_button("4 Laughing Guys", {""}, function (playerIdx)
        FourPointAndLaugh(playerIdx)
    end)























local PlayerPed = native.player.get_player_ped(0)                            
local PosX, PosY, PosZ = native.entity.get_entity_coords(PlayerPed, false, true)    
local TargetPed = nil			                                    
local TargetPlayer = nil			                             
local TposX, TposY, TposZ = 0.0, 0.0, 0.0               


local CleanUp = false
local SitOnFace = false
local BeingWeird = false
local SitOnhead = false
local Hug = false
local Eatmyshit = false
local Fxxkstart = false
local FxxkstartHorse = false
local Hitbutt = false
local Dance1 = false
local Dance2 = false
local Dance3 = false
local Dance4 = false
local Kissbutt = false
local shoveGreet = false
local Hitbutt_c = false
local Pee = false

local Pee1 = false
local Pee2 = false
local Pee3 = false
local Pee4 = false
local Pee5 = false
local Pee6 = false
local Pee7 = false
local Pee8 = false
local Pee9 = false
local Shit = false

local Drunkhug1 = false
local Drunkhug2 = false
local Drunkhug3 = false
local Drunkhug4 = false
local Drunkhug5 = false
local Drunkhug6 = false


local vomit1 = false
local vomit2 = false
local vomit3 = false
local vomit4 = false
local vomit5 = false
local vomit6 = false

local Slap1 = false
local Slap2 = false
local Slap3 = false
local Slap4 = false
local Slap5 = false
local Slap6 = false
local Slap7 = false
local Slap8 = false
local Slap9 = false
local laugh1 = false
local laugh2 = false 
local Bell = false

local TUP = false

local function SetAnimFalse()
    SitOnFace = false
    BeingWeird = false
    SitOnhead = false
    Hug = false
    Eatmyshit = false
    Fxxkstart = false
    FxxkstartHorse = false
    Hitbutt = false
    Dance1 = false
    Dance2 = false
    Dance3 = false
    Dance4 = false
    Kissbutt = false
    Pee = false
    Hitbutt_c = false
    shoveGreet = false
    SitOnFace = false
    BeingWeird = false
    SitOnhead = false
    Hug = false
    Eatmyshit = false
    Fxxkstart = false
    FxxkstartHorse = false
    Hitbutt = false
    Dance1 = false
    Dance2 = false
    Dance3 = false
    Dance4 = false
    Kissbutt = false
    Dancenoattach1 = false
    Dancenoattach2 = false
    Dancenoattach3 = false
    Dancenoattach4 = false
    Drunkhug = false
    Pee1 = false
    Pee2 = false
    Pee3 = false
    Pee4 = false
    Pee5 = false
    Pee6 = false
    Pee7 = false
    Pee8 = false
    Pee9 = false
    Pee10 = false
    Vomit1 = false
    Vomit2 = false
    Vomit3 = false
    Vomit4 = false
    Vomit5 = false
    Vomit6 = false
    Peenoattach1 = false
    Peenoattach2 = false
    Peenoattach3 = false
    Peenoattach4 = false
    Peenoattach5 = false
    Peenoattach6 = false
    Peenoattach7 = false
    Peenoattach8 = false
    Peenoattach9 = false
    Shit = false
    Drunkhug1 = false
    Drunkhug2 = false
    Drunkhug3 = false
    Drunkhug4 = false
    Drunkhug5 = false
    Drunkhug6 = false
    vomit1 = false
    vomit2 = false
    vomit3 = false
    vomit4 = false
    vomit5 = false
    vomit6 = false
    TUP = false
    Slap1 = false
    Slap2 = false
    Slap3 = false
    Slap4 = false
    Slap5 = false
    Slap6 = false
    Slap7 = false
    Slap8 = false
    Slap9 = false
    laugh1 = false
    laugh2 = false
    Bell = false
end




local function UpdateLPlayer()
    PlayerPed = native.player.get_player_ped(0)
    PosX, PosY, PosZ = native.entity.get_entity_coords(PlayerPed, false, true)
end

local function UpdateTPlayer(Index)
    TargetPlayer = Index
    TargetPed = native.player.get_player_ped(Index)
    TposX, TposY, TposZ = native.entity.get_entity_coords(PlayerPed, true, true)
end

local function LoadingAnim(anim_dict)
    if not native.streaming.has_anim_dict_loaded(anim_dict) then
        native.streaming.request_anim_dict(anim_dict)
        while not native.streaming.has_anim_dict_loaded(anim_dict) do
            thread.yield(0)
        end
    end
end

local function PlayAnimTask(anim_dict, anim_name)
    LoadingAnim(anim_dict)
    UpdateLPlayer()
    native.task.task_play_anim(PlayerPed, anim_dict, anim_name, 1.0, 1.0, -1, 1, 0.0, false, 0, false, "", false)
end

local function ClearTasks(ped)
    native.ped.set_ped_should_play_immediate_scenario_exit(ped)
    native.task.clear_ped_tasks_immediately(ped, true, true)
    thread.yield(50)
end



local function AttachMeToPlayer(TargetPlayer, PosX, PosY, PosZ, RotX, RotY, RotZ)
    UpdateLPlayer()
    if (TargetPlayer ~= 0) then
        UpdateTPlayer(TargetPlayer)
		toast.add_warning("Surprise mf", "Fortnite fucker\n\tis\nattached to:\n\n" .. player.get_name(TargetPlayer) .. '.')
    	native.entity.attach_entity_to_entity(PlayerPed, TargetPed, 0, PosX, PosY, PosZ, RotX, RotY, RotZ, false, false, false, true, 0, true, false, false)
	end
end




    local function CleanUP()
        CleanUp = true
        if CleanUp == true then
            thread.create(function(index)
                local allanim = SetAnimFalse()
                    if not allanim then
                        local PlayerPed = native.player.get_player_ped(native.player.player_id())
                        UpdateLPlayer()
                        native.entity.detach_entity(PlayerPed, true, true)
                        thread.yield(500)
                        ClearTasks(PlayerPed)
                        else
                        end
                        thread.yield()
                end)
            end
        end


attach_sub:add_separator("NEW")

attach_sub:add_button("GIVE HEAD ", {""}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not SitOnFace then
        local anim_dict = "script_story@mud3@ig@ig_1_throw_whore"
        local anim = "base_att"
        AttachMeToPlayer(index, 0.0, 0.32, 0.65, 30.0, 0.0, 180.0)
        PlayAnimTask(anim_dict, anim)
		SitOnFace = true
    else
		SetAnimFalse()
	end
end)

attach_sub:add_button("GIVE HEAD - [on your knees]", {""}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not SitOnFace then
        local anim_dict = "script_story@sal1@ig@sal1_18_lenny_on_lenny"
        local anim = "loop_female"
        AttachMeToPlayer(index, 0.0, 0.19, 1.35, 0.0, 0.0, 180.0)
        PlayAnimTask(anim_dict, anim)
		SitOnFace = true
    else
		SetAnimFalse()
	end
end)

attach_sub:add_button("FU*K IN THE A**", {""}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not SitOnFace then
        local anim_dict = "script_story@mud3@ig@ig_1_throw_whore"
        local anim = "base_att"
        AttachMeToPlayer(index, 0.0, -0.36, -0.05, 40.0, 0.0, 0.0)
        PlayAnimTask(anim_dict, anim)
		SitOnFace = true
    else
		SetAnimFalse()
	end
end)

attach_sub:add_button("FU*K IN THE A** - 2", {""}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not SitOnFace then
        local anim_dict = "script_story@sal1@ig@sal1_18_lenny_on_lenny"
        local anim = "loop_female"
        AttachMeToPlayer(index, 0.0, -0.4, 0.5, 30.0, 0.0, 0.0)
        PlayAnimTask(anim_dict, anim)
		SitOnFace = true
    else
		SetAnimFalse()
	end
end)




attach_sub:add_button("take a shit - [new]", {""}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not SitOnFace then
        local anim_dict = "script_story@mud3@ig@ig_3_room2a"
        local anim = "ig3_enterroom_pooper"
        AttachMeToPlayer(index, 0.0, 0.3, 1.0, 0.0, 0.0, 0.0)
        PlayAnimTask(anim_dict, anim)
		SitOnFace = true
    else
		SetAnimFalse()
	end
end)




--[[
    local anim_dict =  "script_story@mud3@ig@ig_1_throw_whore"
               local anim_name =  "base_vtm"
local anim_dict =  "script_story@mud3@ig@ig_1_throw_whore"
            local anim_name =  "base_att"
]]

attach_sub:add_button("==============--- CLEAN ---=================", {""}, function(index)
    CleanUP()
end)




attach_sub:add_separator("Originals")

local og_sub = attach_sub:add_submenu("Original [attachments]", {}, function()end)


og_sub:add_button("==============--- CLEAN ---=================", {""}, function(index)
    CleanUP()
end)

og_sub:add_button("GIVE A HEAD", {"Tet them suck your d*ck\nThis is so annoying and so fun together.\n\t ☺ ☺ ☺"}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not SitOnFace then
        local anim_dict = "script_story@gry1@ig@ig_15_archibald_sit_reading"
        local anim = "held_1hand_archibald"
        AttachMeToPlayer(index, 0.0, 0.2, 0.7, 0.0, 0.0, 190.0)
        PlayAnimTask(anim_dict, anim)
		SitOnFace = true
    else
		SetAnimFalse()
	end
end)

og_sub:add_button("SPANK SOMEONE", {"Spank Someone"}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not Hitbutt then
        local anim_dict = "script_re@peep_tom@spanking_cowboy"
        local anim = "spanking_idle_female"
        AttachMeToPlayer(index, 0.0, -0.8, -0.5, 0.0, 15.0, -30.0)
        PlayAnimTask(anim_dict, anim)
		Hitbutt = true
    else
		SetAnimFalse()
	end
end)


og_sub:add_button("CUTE HUG", {"Friendly hug?\nNot Friendly hug?\nCute Hug?"}, function(index)
    ClearTasks(PlayerPed)
	if not Hug then
		local anim_disc = "amb_rest_sit@prop_human_seat_chair_table@eating@fork_knife@rest_front@male_a@base"
		local anim = "base"
		AttachMeToPlayer(index, 0.0, 0.5, 0.0, 0.0, 0.0, 180)
        PlayAnimTask(anim_disc, anim)
        Hug = true
    else
		SetAnimFalse()
	end
end)

og_sub:add_button("TAKE A RIDE", {"Sit on your `buddy's` Shoulders"}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not SitOnFace then
        local anim_dict = "script_story@gry1@ig@ig_15_archibald_sit_reading"
        local anim = "held_1hand_archibald"
        AttachMeToPlayer(index, 0.0, 0.0, 0.7, 0.0, 0.0, 10.0)
        PlayAnimTask(anim_dict, anim)
		SitOnFace = true
    else
		SetAnimFalse()
	end
end)

og_sub:add_button("TOUCH HIS/HER PP/[or sm]", {""}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not TUP then
        
        local anim_dict ="script_re@unpaid_debt@paid"
        local anim ="slap_loop_attacker"
        AttachMeToPlayer(index, 0.0, 0.8, 0.0, -8.0, 0.0, 150.0) 
        PlayAnimTask(anim_dict, anim)
    TUP = true
    else
    SetAnimFalse()
  end
  end)

og_sub:add_separator("WEIRD ONES")
og_sub:add_button("==============--- CLEAN ---=================", {""}, function(index)
    CleanUP()
end)

og_sub:add_button("S*CK A DICK", {"Suck someone's d*ck???"}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not Hitbutt_c then
        local anim_dict = "script_re@peep_tom@spanking_cowboy"
        local anim = "spanking_idle_cowboy"
        AttachMeToPlayer(index, 0.0, 0.6, -0.5, 60.0, 0.0, -180.0)
        PlayAnimTask(anim_dict, anim)
		Hitbutt_c = true
    else
		SetAnimFalse()
	end
end)



og_sub:add_button("KISS MY ASS", {"Kiss my butt`  Face"}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not Kissbutt then
        local anim_dict = "script_re@peep_tom@spanking_cowboy"
        local anim = "spanking_idle_cowboy"
        AttachMeToPlayer(index, 0.0, 0.2, 0.6, 0.0, 0.0, 0.0)
        PlayAnimTask(anim_dict, anim)
		Kissbutt = true
    else
		SetAnimFalse()
	end
end)


og_sub:add_button("EAT MY SHIT", {"Eat shit sucker` Face"}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not Eatmyshit then
        local anim_dict = "script_story@gry1@ig@ig_15_archibald_sit_reading"
        local anim = "held_1hand_archibald"
        AttachMeToPlayer(index, 0.0, 0.5, 0.6, -45.0, 0.0, 0.0)
        PlayAnimTask(anim_dict, anim)
		Eatmyshit = true
    else
		SetAnimFalse()
	end
end)



og_sub:add_button("SIT ON BACK", {"Sit on your `buddy's` back"}, function(index)
    ClearTasks(PlayerPed)
	if not BeingWeird then
		local anim_disc = "amb_rest_sit@prop_human_seat_chair_table@eating@fork_knife@rest_front@male_a@base"
		local anim = "base"
		AttachMeToPlayer(index, 0.0, -0.2, 0.3, 0.0, 0.0, 0.0)
        PlayAnimTask(anim_disc, anim)
        BeingWeird = true
    else
		SetAnimFalse()
	end
end)



og_sub:add_button("PREPARE TO FUCK", {""}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not Fxxkstart then
        local anim_dict = "script_story@gry1@ig@ig_15_archibald_sit_reading"
        local anim = "held_1hand_archibald"
        AttachMeToPlayer(index, 0.0, -0.2, -0.2, 30.0, 0.0, 0.0)
        PlayAnimTask(anim_dict, anim)
		Fxxkstart = true
    else
		SetAnimFalse()
	end
end)


og_sub:add_button("F*CK HORSE", {"?????"}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not FxxkstartHorse then
        local anim_dict = "script_story@gry1@ig@ig_15_archibald_sit_reading"
        local anim = "held_1hand_archibald"
        AttachMeToPlayer(index, 0.0, -0.7, -0.2, -30.0, 0.0, 0.0)
        PlayAnimTask(anim_dict, anim)
		FxxkstartHorse = true
    else
		SetAnimFalse()
	end
end)


































local pee_sub = attach_sub:add_submenu("Pee [attachments]", {"Credits to Crazypony"}, function()end)

pee_sub:add_button("==============--- CLEAN ---=================", {""}, function(index)
    CleanUP()
end)

pee_sub:add_button("PEE vol1", {"Pee on him/her"}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not Pee then
        local anim_dict = "amb_misc@world_human_pee@male_a@idle_a"
        local anim = "idle_a"
        AttachMeToPlayer(index, 0.0, 0.6, 0.0, 0.0, 0.0, 180.0)
        PlayAnimTask(anim_dict, anim)
		Pee = true
    else
		SetAnimFalse()
	end
end)

pee_sub:add_button("PEE VOL2", {"Pee on him/her"}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not Pee2 then
        
        local anim_dict = "amb_misc@world_human_pee@male_a@idle_a"
        local anim = "idle_b"
        AttachMeToPlayer(index, 0.0, 0.3, 1.7, 0.0, 0.0, 180.0)
        PlayAnimTask(anim_dict, anim)
		Pee2 = true
    else
		SetAnimFalse()
	end
end)

pee_sub:add_button("PEE VOL3", {"Pee on him/her"}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not Pee3 then
        
        local anim_dict = "amb_misc@world_human_pee@male_a@idle_a"
        local anim = "idle_c"
        AttachMeToPlayer(index, 0.0, 0.3, 1.7, 0.0, 0.0, 180.0)
        PlayAnimTask(anim_dict, anim)
		Pee3 = true
    else
		SetAnimFalse()
	end
end)

pee_sub:add_button("PEE VOL4", {"Pee on him/her"}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not Pee6 then
        
        local anim_dict = "amb_misc@world_human_pee@male_a@idle_b"
        local anim = "idle_f"
        AttachMeToPlayer(index, 0.0, 0.3, 1.7, 0.0, 0.0, 180.0)
        PlayAnimTask(anim_dict, anim)
		Pee6 = true
    else
		SetAnimFalse()
	end
end)

pee_sub:add_button("PEE VOL5", {"Pee on him/her"}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not Pee7 then
        
        local anim_dict = "amb_misc@world_human_pee@male_a@idle_c"
        local anim = "idle_h"
        AttachMeToPlayer(index, 0.0, 0.3, 1.7, 0.0, 0.0, 180.0)
        PlayAnimTask(anim_dict, anim)
		Pee7 = true
    else
		SetAnimFalse()
	end
end)

pee_sub:add_button("PEE VOL6", {"Pee on him/her"}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not Pee8 then
        
        local anim_dict = "amb_misc@world_human_pee@male_a@idle_c"
        local anim = "idle_g"
        AttachMeToPlayer(index, 0.0, 0.3, 1.7, 0.0, 0.0, 180.0)
        PlayAnimTask(anim_dict, anim)
		Pee8 = true
    else
		SetAnimFalse()
	end
end)

pee_sub:add_button("PEE VOL7", {"Pee on him/her"}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not Pee9 then
        
        local anim_dict = "amb_misc@world_human_pee@male_a@base"
        local anim = "base"
        AttachMeToPlayer(index, 0.0, 0.3, 1.7, 0.0, 0.0, 180.0)
        PlayAnimTask(anim_dict, anim)
		Pee9 = true
    else
		SetAnimFalse()
	end
end)

pee_sub:add_button("PEE VOL8", {"Pee on him/her"}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not Pee5 then
        
        local anim_dict = "amb_misc@world_human_pee@male_a@idle_b"
        local anim = "idle_d"
        AttachMeToPlayer(index, 0.0, 0.3, 1.7, 0.0, 0.0, 180.0)
        PlayAnimTask(anim_dict, anim)
		Pee5 = true
    else
		SetAnimFalse()
	end
end)









































local vomit_sub = attach_sub:add_submenu("Vomit [attachments]", {"Credits to Crazypony"}, function()end) 



vomit_sub:add_button("==============--- CLEAN ---=================", {""}, function(index)
    CleanUP()
end)


vomit_sub:add_button("VOMIT VOL1", {""}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not vomit1 then
        
        local anim_dict = "amb_rest_drunk@world_human_drunk_brace_wall@vomit@male_a@idle_a"
        local anim = "idle_a"
        AttachMeToPlayer(index, 0.0, 0.3, 1.7, 0.0, 0.0, 180.0)
        PlayAnimTask(anim_dict, anim)
		vomit1 = true
    else
		SetAnimFalse()
	end
end)

vomit_sub:add_button("VOMIT VOL2", {""}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not vomit3 then
        
        local anim_dict = "amb_rest_drunk@world_human_drunk_brace_wall@vomit@male_a@idle_a"
        local anim = "idle_c"
        AttachMeToPlayer(index, 0.0, 0.3, 1.7, 0.0, 0.0, 180.0)
        PlayAnimTask(anim_dict, anim)
		vomit3 = true
    else
		SetAnimFalse()
	end
end)

vomit_sub:add_button("VOMIT VOL4", {""}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not vomit4 then
        
	    local anim_dict = "amb_misc@world_human_vomit_kneel@male_a@idle_a"
        local anim = "idle_a"
        AttachMeToPlayer(index, 0.0, 0.3, 1.7, 0.0, 0.0, 180.0)
        PlayAnimTask(anim_dict, anim)
		vomit4 = true
    else
		SetAnimFalse()
	end
end)

vomit_sub:add_button("VOMIT VOL5", {""}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not vomit5 then
        
        local anim_dict = "amb_misc@world_human_vomit_kneel@male_a@idle_a"
        local anim = "idle_b"
        AttachMeToPlayer(index, 0.0, 0.3, 1.7, 0.0, 0.0, 180.0)
        PlayAnimTask(anim_dict, anim)
		vomit5 = true
    else
		SetAnimFalse()
	end
end)

vomit_sub:add_button("VOMIT VOL6", {""}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not vomit6 then
        
        local anim_dict = "amb_misc@world_human_vomit_kneel@male_a@idle_a"
        local anim = "idle_c"
        AttachMeToPlayer(index, 0.0, 0.3, 1.7, 0.0, 0.0, 180.0)
        PlayAnimTask(anim_dict, anim)
		vomit6 = true
    else
		SetAnimFalse()
	end
end)






























local moonshine_sub = attach_sub:add_submenu("Taunts and Greets [attachments]", {}, function()end) 




moonshine_sub:add_separator("MOONSHINE SHACK TAUNTS")

moonshine_sub:add_button("==============--- CLEAN ---=================", {""}, function(index)
    CleanUP()
end)

moonshine_sub:add_button("SLAP", {""}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not Slap1 then
        
        local anim_dict ="mech_melee@unarmed@posse@ambient@healthy@noncombat"
        local anim ="slap_back_drunk_vs_drunk_light_v1_att"
        AttachMeToPlayer(index, 0.0, 0.6, 0.0, 0.0, 0.0, 180.0) 
        PlayAnimTask(anim_dict, anim)
    Slap1 = true
    else
    SetAnimFalse()
  end
  end)

 moonshine_sub:add_button("SLAP VOL2", {""}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not Slap2 then
        
        local anim_dict ="mech_melee@unarmed@posse@ambient@healthy@noncombat"
        local anim ="slap_back_drunk_vs_sober_light_v1_att"
        AttachMeToPlayer(index, 0.0, 0.6, 0.0, 0.0, 0.0, 180.0) 
        PlayAnimTask(anim_dict, anim)
    Slap2 = true
    else
    SetAnimFalse()
  end
  end)

  moonshine_sub:add_button("SLAP VOL3", {""}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not Slap3 then
        
        local anim_dict ="mech_melee@unarmed@posse@ambient@healthy@noncombat"
        local anim ="slap_front_drunk_vs_drunk_heavy_v1_att"
        AttachMeToPlayer(index, 0.0, 0.6, 0.0, 0.0, 0.0, 180.0) 
        PlayAnimTask(anim_dict, anim)
    Slap3 = true
    else
    SetAnimFalse()
  end
  end)

 moonshine_sub:add_button("SLAP VOL4", {""}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not Slap4 then
        
        local anim_dict ="mech_melee@unarmed@posse@ambient@healthy@noncombat"
        local anim ="slap_front_drunk_vs_drunk_light_v1_att"
        AttachMeToPlayer(index, 0.0, 0.6, 0.0, 0.0, 0.0, 180.0) 
        PlayAnimTask(anim_dict, anim)
    Slap4 = true
    else
    SetAnimFalse()
  end
  end)

 moonshine_sub:add_button("SLAP VOL5", {""}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not Slap5 then
        
        local anim_dict ="mech_melee@unarmed@posse@ambient@healthy@noncombat"
        local anim ="slap_front_drunk_vs_drunk_heavy_v2_att"
        AttachMeToPlayer(index, 0.0, 0.6, 0.0, 0.0, 0.0, 180.0) 
        PlayAnimTask(anim_dict, anim)
    Slap5 = true
    else
    SetAnimFalse()
  end
  end)

 moonshine_sub:add_button("SLAP VOL6", {""}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not Slap6 then
        
        local anim_dict ="mech_melee@unarmed@posse@ambient@healthy@noncombat"
        local anim ="slap_front_drunk_vs_drunk_heavy_v3_att"
        AttachMeToPlayer(index, 0.0, 0.6, 0.0, 0.0, 0.0, 180.0) 
        PlayAnimTask(anim_dict, anim)
    Slap6 = true
    else
    SetAnimFalse()
  end
  end)

moonshine_sub:add_button("SLAP VOL7", {""}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not Slap7 then
        
        local anim_dict ="mech_melee@unarmed@posse@ambient@healthy@noncombat"
        local anim ="slap_front_drunk_vs_drunk_heavy_v4_att"
        AttachMeToPlayer(index, 0.0, 0.6, 0.0, 0.0, 0.0, 180.0) 
        PlayAnimTask(anim_dict, anim)
    Slap7 = true
    else
    SetAnimFalse()
  end
  end)

  moonshine_sub:add_button("SLAP VOL8", {""}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not Slap8 then
        
        local anim_dict ="mech_melee@unarmed@posse@ambient@healthy@noncombat"
        local anim ="slap_front_drunk_vs_drunk_heavy_v5_att"
        AttachMeToPlayer(index, 0.0, 0.6, 0.0, 0.0, 0.0, 180.0) 
        PlayAnimTask(anim_dict, anim)
    Slap8 = true
    else
    SetAnimFalse()
  end
  end)

  moonshine_sub:add_button("SLAP VOL9", {""}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not Slap9 then
        
        local anim_dict ="mech_melee@unarmed@posse@ambient@healthy@noncombat"
        local anim ="slap_front_drunk_vs_drunk_heavy_v6_att"
        AttachMeToPlayer(index, 0.0, 0.6, 0.0, 0.0, 0.0, 180.0) 
        PlayAnimTask(anim_dict, anim)
    Slap9 = true
    else
    SetAnimFalse()
  end
  end)


  moonshine_sub:add_separator("MOONSHINE SHACK GREETS(friendly)")

  moonshine_sub:add_button("==============--- CLEAN ---=================", {""}, function(index)
    CleanUP()
end)

moonshine_sub:add_button("DRUNK HUG", {"shove_greet_front_drunk_vs_sober_v3_att\n\"@unarmed@posse@ambient@healthy@noncombat\""}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not shoveGreet then
        local anim_dict = "mech_melee@unarmed@posse@ambient@healthy@noncombat"
        local anim = "shove_greet_front_drunk_vs_sober_v3_att"
        AttachMeToPlayer(index, 0.0, 0.3, 0.0, 0.0, 0.0, 180.0)
        PlayAnimTask(anim_dict, anim)
		Dance4 = true
    else
		SetAnimFalse()
	end
end)

moonshine_sub:add_button("DRUNK HUG VOL2", {"shove_greet_front_drunk_vs_sober_v1_att\n\"@unarmed@posse@ambient@healthy@noncombat\""}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not Drunkhug1 then
        local anim_dict = "mech_melee@unarmed@posse@ambient@healthy@noncombat"
        local anim = "shove_greet_back_drunk_vs_drunk_v1_att"
        AttachMeToPlayer(index, 0.0, 0.4, 0.0, 0.0, 0.0, 180.0)
        PlayAnimTask(anim_dict, anim)
		Dance4 = true
    else
		SetAnimFalse()
	end
end)

moonshine_sub:add_button("DRUNK HUG VOL3", {"shove_greet_front_drunk_vs_drunk_v1_att\"\n\"@unarmed@posse@ambient@healthy@noncombat\""}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not Drunkhug2 then
        local anim_dict = "mech_melee@unarmed@posse@ambient@healthy@noncombat"
        local anim = "shove_greet_front_drunk_vs_drunk_v1_att"
        AttachMeToPlayer(index, 0.0, 0.3, 0.0, 0.0, 0.0, 180.0)
        PlayAnimTask(anim_dict, anim)
		Dance4 = true
    else
		SetAnimFalse()
	end
end)

moonshine_sub:add_button("DRUNK HUG VOL4", {"shove_greet_front_drunk_vs_drunk_v1_att\"\n\"@unarmed@posse@ambient@healthy@noncombat\""}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not Drunkhug3 then
        local anim_dict = "mech_melee@unarmed@posse@ambient@healthy@noncombat"
        local anim = "shove_greet_front_drunk_vs_drunk_v1_att"
        AttachMeToPlayer(index, 0.0, 0.4, 0.0, 0.0, 0.0, 180.0)
        PlayAnimTask(anim_dict, anim)
		Dance4 = true
    else
		SetAnimFalse()
	end
end)

moonshine_sub:add_button("DRUNK HUG VOL 5", {"shove_greet_front_drunk_vs_sober_v1_att\"\n\"@unarmed@posse@ambient@healthy@noncombat\""}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not Drunkhug4 then
        local anim_dict = "mech_melee@unarmed@posse@ambient@healthy@noncombat"
        local anim = "shove_greet_front_drunk_vs_sober_v1_att"
        AttachMeToPlayer(index, 0.0, 0.4, 0.0, 0.0, 0.0, 180.0)
        PlayAnimTask(anim_dict, anim)
		Dance4 = true
    else
		SetAnimFalse()
	end
end)

moonshine_sub:add_button("DRUNK HUG VOL 6", {"shove_greet_left_drunk_vs_drunk_v1_att\"\n\"@unarmed@posse@ambient@healthy@noncombat\""}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not Drunkhug5 then
        local anim_dict = "mech_melee@unarmed@posse@ambient@healthy@noncombat"
        local anim = "shove_greet_left_drunk_vs_drunk_v1_att"
        AttachMeToPlayer(index, 0.0, 0.4, 0.0, 0.0, 0.0, 180.0)
        PlayAnimTask(anim_dict, anim)
		Dance4 = true
    else
		SetAnimFalse()
	end
end)

moonshine_sub:add_button("DRUNK HUG VOL 7", {"shove_greet_back_drunk_vs_sober_v1_att\"\n\"@unarmed@posse@ambient@healthy@noncombat\""}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not Drunkhug6 then
        local anim_dict = "mech_melee@unarmed@posse@ambient@healthy@noncombat"
        local anim = "shove_greet_back_drunk_vs_sober_v1_att"
        AttachMeToPlayer(index, 0.0, 0.4, 0.0, 0.0, 0.0, 180.0)
        PlayAnimTask(anim_dict, anim)
		Dance4 = true
    else
		SetAnimFalse()
	end
end)


















local emote_att_sub = attach_sub:add_submenu("Mixed Emotes [attachments]", {}, function()end) 

emote_att_sub:add_separator("LAUGHING EMOTES")

emote_att_sub:add_button("==============--- CLEAN ---=================", {""}, function(index)
  CleanUP()
end)


emote_att_sub:add_button("POINT AND LAUGH", {"hhaha"}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not laugh2 then
        
        local anim_dict ="script_mp@emotes@pointlaugh@male@unarmed@full"
        local anim ="fullbody"
        
        AttachMeToPlayer(index, 0.0, 1.2, 0.0, 0.0, 0.0, 180.0) 
        PlayAnimTask(anim_dict, anim)
    laugh2 = true
    else
    SetAnimFalse()
  end
  end)

  emote_att_sub:add_button("JOVIAL LAUGH", {"haha"}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not laugh1 then
        
        --local anim_dict ="script_mp@emotes@pointlaugh@male@unarmed@full"
        --local anim ="fullbody"
        local anim_dict ="script_mp@emotes@jovial_laugh@male@unarmed@full"
        local anim ="fullbody"
        AttachMeToPlayer(index, 0.0, 1.2, 0.0, 0.0, 0.0, 180.0) 
        PlayAnimTask(anim_dict, anim)
    laugh1 = true
    else
    SetAnimFalse()
  end
  end)
























  local dance_att_sub = attach_sub:add_submenu("Dances [attachments]", {}, function()end)

  dance_att_sub:add_separator("Dance")

  dance_att_sub:add_button("==============--- CLEAN ---=================", {""}, function(index)
    CleanUP()
end)


dance_att_sub:add_button("FIRE DANCE", {"Firedance` Head"}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not Dance1 then
        local anim_dict = "script_shows@firedancer@act3_p1"
        local anim = "dance"
        AttachMeToPlayer(index, 0.0, 0.3, 1.7, 0.0, 0.0, 180.0)
        PlayAnimTask(anim_dict, anim)
		Dance1 = true
    else
		SetAnimFalse()
	end
end)


dance_att_sub:add_button("SWORD DANCE", {"Sworddance` Head"}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not Dance2 then
        local anim_dict = "script_shows@sworddance@act3_p1"
        local anim = "dancer_sworddance"
        AttachMeToPlayer(index, 0.0, 0.3, 1.7, 0.0, 0.0, 180.0)
        PlayAnimTask(anim_dict, anim)
		Dance2 = true
    else
		SetAnimFalse()
	end
end)


dance_att_sub:add_button("SNAKE DANCE", {"Snackedance` Head"}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not Dance3 then
        local anim_dict = "script_shows@snakedancer@act2_p1"
        local anim = "dance_dancer"
        AttachMeToPlayer(index, 0.0, 0.3, 1.7, 0.0, 0.0, 180.0)
        PlayAnimTask(anim_dict, anim)
		Dance3 = true
    else
		SetAnimFalse()
	end
end)


dance_att_sub:add_button("FIRE BREATHER DANCE", {"Fire breather dance` Head"}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not Dance4 then
        local anim_dict = "script_shows@firebreather@act2_p1"
        local anim = "dancer_dance"
        AttachMeToPlayer(index, 0.0, 0.3, 1.7, 0.0, 0.0, 180.0)
        PlayAnimTask(anim_dict, anim)
		Dance4 = true
    else
		SetAnimFalse()
	end
end)

dance_att_sub:add_button("==============--- CLEAN ---=================", {""}, function(index)
    CleanUP()
end)












































































annoying_sub:add_separator("New")

     



annoying_sub:add_button("clone gun attack on mount2", {"clone/替身骑马持枪攻击"}, function (playerIdx)
    local playerPed = native.player.get_player_ped(playerIdx) 
    local posVec = native.entity.get_offset_from_entity_in_world_coords(playerPed, 0, 0, 0)
          attacker = native.ped.clone_ped(playerPed, true, true, true)
          ped = spanw_ped(attacker,posVec)
          ped1 = spanw_ped(0x2A100154,posVec)
    native.ped._set_random_outfit_variation(ped1, true)
    native.ped.set_ped_move_rate_override(ped1,10.0)
    native.entity.set_entity_invincible(ped1, true)
    native.ped.set_ped_config_flag(ped1, 254, true)
    native.ped._set_ped_can_be_lassoed(ped1, false)
    native.ped.set_ped_can_be_targetted(ped1, false)
    native.ped.set_ped_can_ragdoll(ped1, false)
    native.ped.set_blocking_of_non_temporary_events(ped1, true)
    native.ped.set_ped_flee_attributes(ped1, 0, false)
    native.ped.set_ped_combat_attributes(ped1, 17, true)
    native.ped.set_ped_lasso_hogtie_flag(ped1, 0, false)
       native.entity.set_entity_invincible(attacker, true)
       native.ped.set_ped_config_flag(attacker, 254, true)
       native.ped._set_ped_can_be_lassoed(attacker, false)
       native.ped.set_ped_can_be_targetted(attacker, false)
       native.ped.set_ped_can_ragdoll(attacker, false)
       native.ped.set_blocking_of_non_temporary_events(attacker, true)
       native.ped.set_ped_flee_attributes(attacker, 0, false)
       native.ped.set_ped_lasso_hogtie_flag(attacker, 0, false)
       native.entity.set_entity_as_mission_entity(attacker, false, true)
       native.ped.set_ped_onto_mount(attacker, ped1, -1, false)
       native.weapon.give_delayed_weapon_to_ped(attacker, 0x5B78B8DD, 69000, true, 0x2CD419DC)
       native.weapon.set_current_ped_weapon(attacker, 0x5B78B8DD, true, 0, false, false)
       native.task.task_combat_ped(attacker,playerPed,0,16)
       native.task.task_combat_ped(ped1,playerPed,0,16)
       native.entity.set_entity_as_mission_entity(ped1, false, true)
       while true do
        local playerPed1 = native.player.get_player_ped(playerIdx) 
        local posVec1 = native.entity.get_offset_from_entity_in_world_coords(playerPed1, 0, 3, -1)
        native.entity.set_entity_coords(ped1,posVec1.x, posVec1.y, posVec1.z, true, true, true, true)
        native.network.network_request_control_of_entity(attacker)
        native.network.network_request_control_of_entity(ped1)
        thread.yield(6000)
    end 
end)


annoying_sub:add_button("clone gun attack on mount1", {"clone/替身骑马持枪攻击"}, function (playerIdx)
    local playerPed = native.player.get_player_ped(playerIdx) 
    local posVec = native.entity.get_offset_from_entity_in_world_coords(playerPed, 0, 0, 0)
          attacker = native.ped.clone_ped(playerPed, true, true, true)
          ped = spanw_ped(attacker,posVec)
          ped1 = spanw_ped(0x2A100154,posVec)
    native.ped._set_random_outfit_variation(ped1, true)
    native.ped.set_ped_move_rate_override(ped1,10.0)
    native.entity.set_entity_invincible(ped1, true)
    native.ped.set_ped_config_flag(ped1, 254, true)
    native.ped._set_ped_can_be_lassoed(ped1, false)
    native.ped.set_ped_can_be_targetted(ped1, false)
    native.ped.set_ped_can_ragdoll(ped1, false)
    native.ped.set_blocking_of_non_temporary_events(ped1, true)
    native.ped.set_ped_flee_attributes(ped1, 0, false)
    native.ped.set_ped_combat_attributes(ped1, 17, true)
    native.ped.set_ped_lasso_hogtie_flag(ped1, 0, false)
       native.entity.set_entity_invincible(attacker, true)
       native.ped.set_ped_config_flag(attacker, 254, true)
       native.ped._set_ped_can_be_lassoed(attacker, false)
       native.ped.set_ped_can_be_targetted(attacker, false)
       native.ped.set_ped_can_ragdoll(attacker, false)
       native.ped.set_blocking_of_non_temporary_events(attacker, true)
       native.ped.set_ped_flee_attributes(attacker, 0, false)
       native.ped.set_ped_lasso_hogtie_flag(attacker, 0, false)
       native.entity.set_entity_as_mission_entity(attacker, false, true)
       native.ped.set_ped_onto_mount(attacker, ped1, -1, false)
       native.weapon.give_delayed_weapon_to_ped(attacker, 0x772C8DD6, 69000, true, 0x2CD419DC)
       native.weapon.set_current_ped_weapon(attacker, 0x772C8DD6, true, 0, false, false)
       native.task.task_combat_ped(attacker,playerPed,0,16)
       native.task.task_combat_ped(ped1,playerPed,0,16)
       native.entity.set_entity_as_mission_entity(ped1, false, true)
       while true do
        local playerPed1 = native.player.get_player_ped(playerIdx) 
        local posVec1 = native.entity.get_offset_from_entity_in_world_coords(playerPed1, 0, 3, -1)
        native.entity.set_entity_coords(ped1,posVec1.x, posVec1.y, posVec1.z, true, true, true, true)
        native.network.network_request_control_of_entity(attacker)
        native.network.network_request_control_of_entity(ped1)
        thread.yield(6000)
    end 
end)


annoying_sub:add_button("clone knife attack", {"clone/替身持刀攻击"}, function (playerIdx)
    local playerPed = native.player.get_player_ped(playerIdx) 
    local posVec = native.entity.get_offset_from_entity_in_world_coords(playerPed, 0, 0, 0)
          attacker = native.ped.clone_ped(playerPed, true, true, true)
          ped1 = spanw_ped(attacker,posVec)
       native.task.task_combat_ped(attacker,playerPed,0,16)
       native.entity.set_entity_invincible(attacker, true)
       native.ped.set_ped_config_flag(attacker, 254, true)
       native.ped._set_ped_can_be_lassoed(attacker, false)
       native.ped.set_ped_can_be_targetted(attacker, false)
       native.ped.set_ped_can_ragdoll(attacker, false)
       native.ped.set_blocking_of_non_temporary_events(attacker, true)
       native.ped.set_ped_flee_attributes(attacker, 0, false)
       native.ped.set_ped_lasso_hogtie_flag(attacker, 0, false)
       native.entity.set_entity_as_mission_entity(attacker, false, true)
       native.weapon.give_delayed_weapon_to_ped(attacker, 0x1086D041, 69000, true, 0x2CD419DC)
       native.weapon.set_current_ped_weapon(attacker, 0x1086D041, true, 0, false, false)
       while true do
        local playerPed1 = native.player.get_player_ped(playerIdx) 
        local posVec1 = native.entity.get_offset_from_entity_in_world_coords(playerPed1, 0, 1, -1)
        native.entity.set_entity_coords(attacker,posVec1.x, posVec1.y, posVec1.z, true, true, true, true)
        native.network.network_request_control_of_entity(attacker)
        thread.yield(6000)
    end 
end)


annoying_sub:add_button("clone gun attack2", {"clone/替身持枪攻击"}, function (playerIdx)
    local playerPed = native.player.get_player_ped(playerIdx) 
    local posVec = native.entity.get_offset_from_entity_in_world_coords(playerPed, 0, 0, 0)
          attacker = native.ped.clone_ped(playerPed, true, true, true)
          ped1 = spanw_ped(attacker,posVec)
       native.task.task_combat_ped(attacker,playerPed,0,16)
       native.entity.set_entity_invincible(attacker, true)
       native.ped.set_ped_config_flag(attacker, 254, true)
       native.ped._set_ped_can_be_lassoed(attacker, false)
       native.ped.set_ped_can_be_targetted(attacker, false)
       native.ped.set_ped_can_ragdoll(attacker, false)
       native.ped.set_blocking_of_non_temporary_events(attacker, true)
       native.ped.set_ped_flee_attributes(attacker, 0, false)
       native.ped.set_ped_lasso_hogtie_flag(attacker, 0, false)
       native.entity.set_entity_as_mission_entity(attacker, false, true)
       native.weapon.give_delayed_weapon_to_ped(attacker, 0x5B78B8DD, 69000, true, 0x2CD419DC)
       native.weapon.set_current_ped_weapon(attacker, 0x5B78B8DD, true, 0, false, false)
       while true do
        local playerPed1 = native.player.get_player_ped(playerIdx) 
        local posVec1 = native.entity.get_offset_from_entity_in_world_coords(playerPed1, 0, 3, -1)
        native.entity.set_entity_coords(attacker,posVec1.x, posVec1.y, posVec1.z, true, true, true, true)
        native.network.network_request_control_of_entity(attacker)
        thread.yield(6000)
    end 
end)


annoying_sub:add_button("clone gun attack1", {"clone/替身持枪攻击"}, function (playerIdx)
    local playerPed = native.player.get_player_ped(playerIdx) 
    local posVec = native.entity.get_offset_from_entity_in_world_coords(playerPed, 0, 0, 0)
          attacker = native.ped.clone_ped(playerPed, true, true, true)
          ped1 = spanw_ped(attacker,posVec)
       native.task.task_combat_ped(attacker,playerPed,0,16)
       native.entity.set_entity_invincible(attacker, true)
       native.ped.set_ped_config_flag(attacker, 254, true)
       native.ped._set_ped_can_be_lassoed(attacker, false)
       native.ped.set_ped_can_be_targetted(attacker, false)
       native.ped.set_ped_can_ragdoll(attacker, false)
       native.ped.set_blocking_of_non_temporary_events(attacker, true)
       native.ped.set_ped_flee_attributes(attacker, 0, false)
       native.ped.set_ped_lasso_hogtie_flag(attacker, 0, false)
       native.entity.set_entity_as_mission_entity(attacker, false, true)
       native.weapon.give_delayed_weapon_to_ped(attacker, 0x772C8DD6, 69000, true, 0x2CD419DC)
       native.weapon.set_current_ped_weapon(attacker, 0x772C8DD6, true, 0, false, false)
       while true do
        local playerPed1 = native.player.get_player_ped(playerIdx) 
        local posVec1 = native.entity.get_offset_from_entity_in_world_coords(playerPed1, 0, 3, -1)
        native.entity.set_entity_coords(attacker,posVec1.x, posVec1.y, posVec1.z, true, true, true, true)
        native.network.network_request_control_of_entity(attacker)
        thread.yield(6000)
    end 
end)


annoying_sub:add_button("clone attack", {"clone/替身攻击青春版"}, function (playerIdx)
    local playerPed = native.player.get_player_ped(playerIdx) 
    local posVec = native.entity.get_offset_from_entity_in_world_coords(playerPed, 0, 0, 0)
          attacker = native.ped.clone_ped(playerPed, true, true, true)
          ped1 = spanw_ped(attacker,posVec)
       native.task.task_combat_ped(attacker,playerPed,0,16)
       native.entity.set_entity_invincible(attacker, true)
       native.ped.set_ped_config_flag(attacker, 254, true)
       native.ped._set_ped_can_be_lassoed(attacker, false)
       native.ped.set_ped_can_be_targetted(attacker, false)
       native.ped.set_ped_can_ragdoll(attacker, false)
       native.ped.set_blocking_of_non_temporary_events(attacker, true)
       native.ped.set_ped_flee_attributes(attacker, 0, false)
       native.ped.set_ped_lasso_hogtie_flag(attacker, 0, false)
       native.entity.set_entity_as_mission_entity(attacker, false, true)
       while true do
        local playerPed1 = native.player.get_player_ped(playerIdx) 
        local posVec1 = native.entity.get_offset_from_entity_in_world_coords(playerPed1, 0, 1, -1)
        native.entity.set_entity_coords(attacker,posVec1.x, posVec1.y, posVec1.z, true, true, true, true)
        native.network.network_request_control_of_entity(attacker)
        thread.yield(6000)
    end 
end)

annoying_sub:add_separator("Older Releases")

annoying_sub:add_button("Annoying Horse1", {"Spawn annoying horse(烦人的马)"}, function (playerIdx)
    local playerPed = native.player.get_player_ped(playerIdx) 
    local posVec = native.entity.get_offset_from_entity_in_world_coords(playerPed, 0, 0, 0)
  
    ped1 = spanw_ped(0x2A100154,posVec)
    native.ped._set_random_outfit_variation(ped1, true)
    native.ped.set_ped_move_rate_override(ped1,10.0)
    native.entity.set_entity_invincible(ped1, true)
    native.ped.set_ped_config_flag(ped1, 254, true)
    native.ped._set_ped_can_be_lassoed(ped1, false)
    native.ped.set_ped_can_be_targetted(ped1, false)
    native.ped.set_ped_can_ragdoll(ped1, false)
    native.ped.set_blocking_of_non_temporary_events(ped1, true)
    native.ped.set_ped_flee_attributes(ped1, 0, false)
    native.ped.set_ped_combat_attributes(ped1, 17, true)
    native.ped.set_ped_lasso_hogtie_flag(ped1, 0, false)

    while true do
    playerPed1 = native.player.get_player_ped(playerIdx)     
    posVec1 = native.entity.get_offset_from_entity_in_world_coords(playerPed1, 0, 0, 0)
    
   
    native.task.task_go_straight_to_coord(ped1,posVec1.x, posVec1.y, posVec1.z,10.0, 1000,0.0, 0.4, 0)
    thread.yield(100)
end  

   
end)

annoying_sub:add_button("Annoying Horse2", {"Spawn annoying horse(烦人的马)"}, function (playerIdx)
    local playerPed = native.player.get_player_ped(playerIdx) 
    local posVec = native.entity.get_offset_from_entity_in_world_coords(playerPed, 0, 0, 0)
  
    ped1 = spanw_ped(0x2405C422,posVec)
    native.ped._set_random_outfit_variation(ped1, true)
    native.ped.set_ped_move_rate_override(ped1,10.0)
    native.entity.set_entity_invincible(ped1, true)
    native.ped.set_ped_config_flag(ped1, 254, true)
    native.ped._set_ped_can_be_lassoed(ped1, false)
    native.ped.set_ped_can_be_targetted(ped1, false)
    native.ped.set_ped_can_ragdoll(ped1, false)
    native.ped.set_blocking_of_non_temporary_events(ped1, true)
    native.ped.set_ped_flee_attributes(ped1, 0, false)
    native.ped.set_ped_combat_attributes(ped1, 17, true)
    native.ped.set_ped_lasso_hogtie_flag(ped1, 0, false)

    while true do
    playerPed1 = native.player.get_player_ped(playerIdx)     
    posVec1 = native.entity.get_offset_from_entity_in_world_coords(playerPed1, 0, 0, 0)
    
   
    native.task.task_go_straight_to_coord(ped1,posVec1.x, posVec1.y, posVec1.z,10.0, 1000,0.0, 0.4, 0)
    thread.yield(10)
end  
end)

annoying_sub:add_button("Annoying Horse with Fire", {"Spawn annoying horse(烦人的马)"}, function (playerIdx)
    local playerPed = native.player.get_player_ped(playerIdx) 
    local posVec = native.entity.get_offset_from_entity_in_world_coords(playerPed, 0, 0, 0)
  
    ped1 = spanw_ped(0x2A100154,posVec)
    native.ped._set_random_outfit_variation(ped1, true)
    native.ped.set_ped_move_rate_override(ped1,10.0)
    native.entity.set_entity_invincible(ped1, true)
    native.ped.set_ped_config_flag(ped1, 254, true)
    native.ped._set_ped_can_be_lassoed(ped1, false)
    native.ped.set_ped_can_be_targetted(ped1, false)
    native.ped.set_ped_can_ragdoll(ped1, false)
    native.ped.set_blocking_of_non_temporary_events(ped1, true)
    native.ped.set_ped_flee_attributes(ped1, 0, false)
    native.ped.set_ped_combat_attributes(ped1, 17, true)
    native.ped.set_ped_lasso_hogtie_flag(ped1, 0, false)

    while true do
    playerPed1 = native.player.get_player_ped(playerIdx)     
    posVec1 = native.entity.get_offset_from_entity_in_world_coords(playerPed1, 0, 0, 0)
    posVec2 = native.entity.get_offset_from_entity_in_world_coords(ped1, 0, 0, 0)
    Fire = native.fire.add_explosion(posVec2.x, posVec2.y, posVec2.z-2, 18, 1, false, false, 0.0)
   
    native.task.task_go_straight_to_coord(ped1,posVec1.x, posVec1.y, posVec1.z,10.0, 1000,0.0, 0.4, 0)
    thread.yield(100)
end  
   
end)

annoying_sub:add_button("Annoying Donkey", {"Spawn annoying donkey/donkey ass crack(烦人的驴/贴贴驴屁股)"}, function (playerIdx)
    local playerPed = native.player.get_player_ped(playerIdx) 
    local posVec = native.entity.get_offset_from_entity_in_world_coords(playerPed, 0, 0, 0)
  
    ped1 = spanw_ped(0x69A37A7B,posVec)
    native.ped._set_random_outfit_variation(ped1, true)
    native.ped.set_ped_move_rate_override(ped1,10.0)
    native.entity.set_entity_invincible(ped1, true)
    native.ped.set_ped_config_flag(ped1, 254, true)
    native.ped._set_ped_can_be_lassoed(ped1, false)
    native.ped.set_ped_can_be_targetted(ped1, false)
    native.ped.set_ped_can_ragdoll(ped1, false)
    native.ped.set_blocking_of_non_temporary_events(ped1, true)
    native.ped.set_ped_flee_attributes(ped1, 0, false)
    native.ped.set_ped_combat_attributes(ped1, 17, true)
    native.ped.set_ped_lasso_hogtie_flag(ped1, 0, false)

    while true do
    playerPed1 = native.player.get_player_ped(playerIdx)     
    posVec1 = native.entity.get_offset_from_entity_in_world_coords(playerPed1, 0, 0, 0)
    
   
    native.task.task_go_straight_to_coord(ped1,posVec1.x, posVec1.y, posVec1.z,10.0, 1000,0.0, 0.4, 0)
    thread.yield(10)
end  

   
end)

annoying_sub:add_button("B*tch Hit", {"Spawn annoying B*tch to Hit(哈莉特打人)"}, function (playerIdx)
    local playerPed = native.player.get_player_ped(playerIdx) 
    local posVec = native.entity.get_offset_from_entity_in_world_coords(playerPed, 0, 0, 0)
  
    ped1 = spanw_ped(0x9BD92566,posVec)
    ped2 = spanw_ped(0x9BD92566,posVec)
    ped3 = spanw_ped(0x9BD92566,posVec)
    ped4 = spanw_ped(0x9BD92566,posVec)
    ped5 = spanw_ped(0x9BD92566,posVec)
    native.ped._set_random_outfit_variation(ped1, true)
    native.ped._set_random_outfit_variation(ped2, true)
    native.ped._set_random_outfit_variation(ped3, true)
    native.ped._set_random_outfit_variation(ped4, true)
    native.ped._set_random_outfit_variation(ped5, true)

    native.task.task_combat_ped(ped1,playerPed,0,16)
    native.task.task_combat_ped(ped2,playerPed,0,16)
    native.task.task_combat_ped(ped3,playerPed,0,16)
    native.task.task_combat_ped(ped4,playerPed,0,16)
    native.task.task_combat_ped(ped5,playerPed,0,16)
    
    native.entity.set_entity_invincible(ped1, true)
    native.ped.set_ped_config_flag(ped1, 254, true)
    native.ped._set_ped_can_be_lassoed(ped1, false)
    native.ped.set_ped_can_be_targetted(ped1, false)
    native.ped.set_ped_can_ragdoll(ped1, false)
    native.ped.set_blocking_of_non_temporary_events(ped1, true)
    native.ped.set_ped_flee_attributes(ped1, 0, false)
    native.ped.set_ped_lasso_hogtie_flag(ped1, 0, false)

    native.entity.set_entity_invincible(ped2, true)
    native.ped.set_ped_config_flag(ped2, 254, true)
    native.ped._set_ped_can_be_lassoed(ped2, false)
    native.ped.set_ped_can_be_targetted(ped2, false)
    native.ped.set_ped_can_ragdoll(ped2, false)
    native.ped.set_blocking_of_non_temporary_events(ped2, true)
    native.ped.set_ped_flee_attributes(ped2, 0, false)
    native.ped.set_ped_lasso_hogtie_flag(ped2, 0, false)

    native.entity.set_entity_invincible(ped3, true)
    native.ped.set_ped_config_flag(ped3, 254, true)
    native.ped._set_ped_can_be_lassoed(ped3, false)
    native.ped.set_ped_can_be_targetted(ped3, false)
    native.ped.set_ped_can_ragdoll(ped3, false)
    native.ped.set_blocking_of_non_temporary_events(ped3, true)
    native.ped.set_ped_flee_attributes(ped3, 0, false)
    native.ped.set_ped_lasso_hogtie_flag(ped3, 0, false)

    native.entity.set_entity_invincible(ped4, true)
    native.ped.set_ped_config_flag(ped4, 254, true)
    native.ped._set_ped_can_be_lassoed(ped4, false)
    native.ped.set_ped_can_be_targetted(ped4, false)
    native.ped.set_ped_can_ragdoll(ped4, false)
    native.ped.set_blocking_of_non_temporary_events(ped4, true)
    native.ped.set_ped_flee_attributes(ped4, 0, false)
    native.ped.set_ped_lasso_hogtie_flag(ped1, 0, false)

    native.entity.set_entity_invincible(ped5, true)
    native.ped.set_ped_config_flag(ped5, 254, true)
    native.ped._set_ped_can_be_lassoed(ped5, false)
    native.ped.set_ped_can_be_targetted(ped5, false)
    native.ped.set_ped_can_ragdoll(ped5, false)
    native.ped.set_blocking_of_non_temporary_events(ped5, true)
    native.ped.set_ped_flee_attributes(ped5, 0, false)
    native.ped.set_ped_lasso_hogtie_flag(ped5, 0, false)
    while true do
        local playerPed1 = native.player.get_player_ped(playerIdx) 
        local posVec1 = native.entity.get_offset_from_entity_in_world_coords(playerPed1, 0, 0, 0)
        native.entity.set_entity_coords(ped1,posVec1.x+0.4, posVec1.y, posVec1.z-1, true, true, true, true)
        native.entity.set_entity_coords(ped2,posVec1.x-0.4, posVec1.y, posVec1.z-1, true, true, true, true)
        native.entity.set_entity_coords(ped3,posVec1.x, posVec1.y+0.4, posVec1.z-1, true, true, true, true)
        native.entity.set_entity_coords(ped4,posVec1.x, posVec1.y-0.4, posVec1.z-1, true, true, true, true)
        native.entity.set_entity_coords(ped5,posVec1.x, posVec1.y-0.4, posVec1.z-1, true, true, true, true)
        thread.yield(10000)
    end
end)

annoying_sub:add_button("Raccoon Bite", {"Spawn annoying raccoon(浣熊咬人)"}, function (playerIdx)
    local playerPed = native.player.get_player_ped(playerIdx) 
    local posVec = native.entity.get_offset_from_entity_in_world_coords(playerPed, 0, 0, 0)
  
    ped1 = spanw_ped(0x56EF91BF,posVec)
    ped2 = spanw_ped(0x56EF91BF,posVec)
    ped3 = spanw_ped(0x56EF91BF,posVec)
    ped4 = spanw_ped(0x56EF91BF,posVec)
    ped5 = spanw_ped(0x56EF91BF,posVec)
    native.ped._set_random_outfit_variation(ped1, true)
    native.ped._set_random_outfit_variation(ped2, true)
    native.ped._set_random_outfit_variation(ped3, true)
    native.ped._set_random_outfit_variation(ped4, true)
    native.ped._set_random_outfit_variation(ped5, true)
    native.ped.set_ped_move_rate_override(ped1,10.0)

    native.entity.set_entity_invincible(ped1, true)
    native.ped.set_ped_config_flag(ped1, 254, true)
    native.ped._set_ped_can_be_lassoed(ped1, false)
    native.ped.set_ped_can_be_targetted(ped1, false)
    native.ped.set_ped_can_ragdoll(ped1, false)
    native.ped.set_blocking_of_non_temporary_events(ped1, true)
    native.ped.set_ped_flee_attributes(ped1, 0, false)
    native.ped.set_ped_combat_attributes(ped1, 17, true)
    native.ped.set_ped_lasso_hogtie_flag(ped1, 0, false)

    native.entity.set_entity_invincible(ped2, true)
    native.ped.set_ped_config_flag(ped2, 254, true)
    native.ped._set_ped_can_be_lassoed(ped2, false)
    native.ped.set_ped_can_be_targetted(ped2, false)
    native.ped.set_ped_can_ragdoll(ped2, false)
    native.ped.set_blocking_of_non_temporary_events(ped2, true)
    native.ped.set_ped_flee_attributes(ped2, 0, false)
    native.ped.set_ped_combat_attributes(ped2, 17, true)
    native.ped.set_ped_lasso_hogtie_flag(ped2, 0, false)

    native.entity.set_entity_invincible(ped3, true)
    native.ped.set_ped_config_flag(ped3, 254, true)
    native.ped._set_ped_can_be_lassoed(ped3, false)
    native.ped.set_ped_can_be_targetted(ped3, false)
    native.ped.set_ped_can_ragdoll(ped3, false)
    native.ped.set_blocking_of_non_temporary_events(ped3, true)
    native.ped.set_ped_flee_attributes(ped3, 0, false)
    native.ped.set_ped_combat_attributes(ped3, 17, true)
    native.ped.set_ped_lasso_hogtie_flag(ped3, 0, false)

    native.entity.set_entity_invincible(ped4, true)
    native.ped.set_ped_config_flag(ped4, 254, true)
    native.ped._set_ped_can_be_lassoed(ped4, false)
    native.ped.set_ped_can_be_targetted(ped4, false)
    native.ped.set_ped_can_ragdoll(ped4, false)
    native.ped.set_blocking_of_non_temporary_events(ped4, true)
    native.ped.set_ped_flee_attributes(ped4, 0, false)
    native.ped.set_ped_combat_attributes(ped4, 17, true)
    native.ped.set_ped_lasso_hogtie_flag(ped4, 0, false)

    native.entity.set_entity_invincible(ped5, true)
    native.ped.set_ped_config_flag(ped5, 254, true)
    native.ped._set_ped_can_be_lassoed(ped5, false)
    native.ped.set_ped_can_be_targetted(ped5, false)
    native.ped.set_ped_can_ragdoll(ped5, false)
    native.ped.set_blocking_of_non_temporary_events(ped5, true)
    native.ped.set_ped_flee_attributes(ped5, 0, false)
    native.ped.set_ped_combat_attributes(ped5, 17, true)
    native.ped.set_ped_lasso_hogtie_flag(ped5, 0, false)

    native.task.task_combat_ped(ped1,playerPed,0,16)
    native.task.task_combat_ped(ped2,playerPed,0,16)
    native.task.task_combat_ped(ped3,playerPed,0,16)
    native.task.task_combat_ped(ped4,playerPed,0,16)
    native.task.task_combat_ped(ped5,playerPed,0,16)
    while true do
        local playerPed1 = native.player.get_player_ped(playerIdx) 
        local posVec1 = native.entity.get_offset_from_entity_in_world_coords(playerPed1, 0, 0, 0)
        native.entity.set_entity_coords(ped1,posVec1.x+0.4, posVec1.y, posVec1.z-1, true, true, true, true)
        native.entity.set_entity_coords(ped2,posVec1.x-0.4, posVec1.y, posVec1.z-1, true, true, true, true)
        native.entity.set_entity_coords(ped3,posVec1.x, posVec1.y+0.4, posVec1.z-1, true, true, true, true)
        native.entity.set_entity_coords(ped4,posVec1.x, posVec1.y-0.4, posVec1.z-1, true, true, true, true)
        native.entity.set_entity_coords(ped5,posVec1.x, posVec1.y-0.4, posVec1.z-1, true, true, true, true)
        thread.yield(6000)
    end
end)
     
annoying_sub:add_button("Pony Kick", {"Spawn annoying horses(小马飞踢)"}, function (playerIdx)
    local playerPed = native.player.get_player_ped(playerIdx) 
    local posVec = native.entity.get_offset_from_entity_in_world_coords(playerPed, 0, 0, 0)
  
    ped1 = spanw_ped(0x2A100154,posVec)
    ped2 = spanw_ped(0x2405C422,posVec)
    ped3 = spanw_ped(0x69A37A7B,posVec)
    native.ped._set_random_outfit_variation(ped1, true)
    native.ped._set_random_outfit_variation(ped2, true)
    native.ped._set_random_outfit_variation(ped3, true)
    native.task.task_combat_ped(ped1,playerPed,0,16)
    native.task.task_combat_ped(ped2,playerPed,0,16)
    native.task.task_combat_ped(ped3,playerPed,0,16)
    native.entity.set_entity_invincible(ped1, true)
    native.entity.set_entity_invincible(ped2, true)
    native.entity.set_entity_invincible(ped3, true)

       native.ped.set_ped_config_flag(ped1, 254, true)
       native.ped._set_ped_can_be_lassoed(ped1, false)
       native.ped.set_ped_can_be_targetted(ped1, false)
       native.ped.set_ped_can_ragdoll(ped1, false)
       native.ped.set_blocking_of_non_temporary_events(ped1, true)
       native.ped.set_ped_flee_attributes(ped1, 0, false)
       native.ped.set_ped_combat_attributes(ped1, 17, true)
       native.ped.set_ped_lasso_hogtie_flag(ped1, 0, false)

       native.ped.set_ped_config_flag(ped2, 61, true)
       native.ped.set_ped_config_flag(ped2, 254, true)
       native.ped._set_ped_can_be_lassoed(ped2, false)
       native.ped.set_ped_can_be_targetted(ped2, false)
       native.ped.set_ped_can_ragdoll(ped2, false)
       native.ped.set_blocking_of_non_temporary_events(ped2, true)
       native.ped.set_ped_flee_attributes(ped2, 0, false)
       --native.ped.set_ped_combat_attributes(pe2, 17, true)
       native.ped.set_ped_lasso_hogtie_flag(ped2, 0, false)

       native.ped.set_ped_config_flag(ped3, 61, true)
       native.ped.set_ped_config_flag(ped3, 254, true)
       native.ped._set_ped_can_be_lassoed(ped3, false)
       native.ped.set_ped_can_be_targetted(ped3, false)
       native.ped.set_ped_can_ragdoll(ped3, false)
       native.ped.set_blocking_of_non_temporary_events(ped3, true)
       native.ped.set_ped_flee_attributes(ped3, 0, false)
       native.ped.set_ped_combat_attributes(ped3, 17, true)
       native.ped.set_ped_lasso_hogtie_flag(ped3, 0, false)

   
end)
     
annoying_sub:add_button("Pig Crack", {"Spawn annoying pigs(生成烦人的猪)"}, function (playerIdx)
    local playerPed = native.player.get_player_ped(playerIdx) 
    local posVec = native.entity.get_offset_from_entity_in_world_coords(playerPed, 0, 0, 0)
    for i = 1,10 do
    ped = spanw_ped(0xE8CBC01C,posVec)
    native.ped._set_random_outfit_variation(ped, true)
end
   
    native.task.task_combat_ped(ped,playerPed,0,16)
    native.entity.set_entity_invincible(ped, true)
end)
     
annoying_sub:add_button("Pig Boomb", {"Spawn pig boomb(生成小猪炸弹)"}, function (playerIdx)
    local playerPed = native.player.get_player_ped(playerIdx) 
    local posVec = native.entity.get_offset_from_entity_in_world_coords(playerPed, 0, 0, 0) 
    ped = spanw_ped(0xE8CBC01C,posVec)
    native.ped._set_random_outfit_variation(ped, true)
  
    native.task.task_combat_ped(ped,playerPed,0,16)
    thread.yield(4000)
    for i = 1, 15 do
        local posVec1 = native.entity.get_offset_from_entity_in_world_coords(playerPed, 0, 0, 0) 
        native.fire.add_explosion(posVec1.x, posVec1.y, posVec1.z, 17, 9999, true, true, 100.0)
        thread.yield(200)
    end
end)

annoying_sub:add_button("Raccoon Boomb", {"Spawn raccoon boomb(生成自爆浣熊)"}, function (playerIdx)
    local playerPed = native.player.get_player_ped(playerIdx) 
    local posVec = native.entity.get_offset_from_entity_in_world_coords(playerPed, 0, 0, 0) 
    ped = spanw_ped(0x56EF91BF,posVec)
    native.ped._set_random_outfit_variation(ped, true)
  
    native.task.task_combat_ped(ped,playerPed,0,16)
    thread.yield(6000)
    for i = 1, 15 do
        local posVec1 = native.entity.get_offset_from_entity_in_world_coords(ped, 0, 0, 0) 
        native.fire.add_explosion(posVec1.x, posVec1.y, posVec1.z, 17, 9999, true, true, 10.0)
        thread.yield(200)
    end
end)

annoying_sub:add_button("Eagle Boomb", {"Spawn Eagle boomb(生成自爆白头雕)"}, function (playerIdx)
    local playerPed = native.player.get_player_ped(playerIdx) 
    local posVec = native.entity.get_offset_from_entity_in_world_coords(playerPed, 0, 0, 5) 
    ped = spanw_ped(0x57027587,posVec)
    native.ped._set_random_outfit_variation(ped, true)
  
    native.task.task_combat_ped(ped,playerPed,0,16)
    thread.yield(6000)
    for i = 1, 15 do
        local posVec1 = native.entity.get_offset_from_entity_in_world_coords(ped, 0, 0, 0) 
        native.fire.add_explosion(posVec1.x, posVec1.y, posVec1.z, 17, 9999, true, true, 10.0)
        thread.yield(200)
    end
end)

annoying_sub:add_button("Ox Boomb", {"Spawn Ox boomb(生成自爆牛子)"}, function (playerIdx)
    local playerPed = native.player.get_player_ped(playerIdx) 
    local posVec = native.entity.get_offset_from_entity_in_world_coords(playerPed, 0, 0, 0) 
    ped = spanw_ped(0xC971C4C6,posVec)
    native.ped._set_random_outfit_variation(ped, true)
  
    native.task.task_combat_ped(ped,playerPed,0,16)
    thread.yield(5000)
    for i = 1, 15 do
        local posVec1 = native.entity.get_offset_from_entity_in_world_coords(ped, 0, 0, 0) 
        native.fire.add_explosion(posVec1.x, posVec1.y, posVec1.z, 17, 9999, true, true, 10.0)
        thread.yield(200)
    end
end)

annoying_sub:add_button("Shark Boomb", {"Spawn Shark boomb(生成自爆锤头鲨)"}, function (playerIdx)
    local playerPed = native.player.get_player_ped(playerIdx) 
    local posVec = native.entity.get_offset_from_entity_in_world_coords(playerPed, -5, 0, 10) 
    ped = spanw_ped(0xCDE2619F,posVec)
    native.ped._set_random_outfit_variation(ped, true)
  
    native.task.task_combat_ped(ped,playerPed,0,16)
    thread.yield(2500)
    for i = 1, 15 do
        local posVec1 = native.entity.get_offset_from_entity_in_world_coords(ped, 0, 0, 0) 
        native.fire.add_explosion(posVec1.x, posVec1.y, posVec1.z, 17, 9999, true, true, 10.0)
        thread.yield(200)
    end
end)

annoying_sub:add_button("Scary Boomb", {"Spawn Body boomb(生成自爆尸体)"}, function (playerIdx)
    local playerPed = native.player.get_player_ped(playerIdx) 
    local posVec = native.entity.get_offset_from_entity_in_world_coords(playerPed, -5, 0, 0) 
    ped = spanw_ped(0x4C6C6086,posVec)
    native.ped._set_random_outfit_variation(ped, true)
  
    native.task.task_combat_ped(ped,playerPed,0,16)
    thread.yield(5000)
    for i = 1, 15 do
        local posVec1 = native.entity.get_offset_from_entity_in_world_coords(ped, 0, 0, 0) 
        native.fire.add_explosion(posVec1.x, posVec1.y, posVec1.z, 17, 9999, true, true, 10.0)
        thread.yield(200)
    end
end)

annoying_sub:add_button("Ghost Woman Boomb", {"Spawn Ghost boomb(生成自爆女鬼)"}, function (playerIdx)
    local playerPed = native.player.get_player_ped(playerIdx) 
    local posVec = native.entity.get_offset_from_entity_in_world_coords(playerPed, 3, 0, 0) 
    ped = spanw_ped(0x0596AA7B,posVec)
    native.ped._set_random_outfit_variation(ped, true)
  
    native.task.task_combat_ped(ped,playerPed,0,16)
    thread.yield(6000)
    for i = 1, 15 do
        local posVec1 = native.entity.get_offset_from_entity_in_world_coords(ped, 0, 0, 0) 
        native.fire.add_explosion(posVec1.x, posVec1.y, posVec1.z, 17, 9999, true, true, 10.0)
        thread.yield(200)
    end
end)

annoying_sub:add_button("Fatman Boomb", {"Spawn Fatman boomb(生成自爆胖子)"}, function (playerIdx)
    local playerPed = native.player.get_player_ped(playerIdx) 
    local posVec = native.entity.get_offset_from_entity_in_world_coords(playerPed, 3, 0, 0) 
    ped = spanw_ped(0x41907533,posVec)
    native.ped._set_random_outfit_variation(ped, true)
  
    native.task.task_combat_ped(ped,playerPed,0,16)
    thread.yield(6000)
    for i = 1, 15 do
        local posVec1 = native.entity.get_offset_from_entity_in_world_coords(ped, 0, 0, 0) 
        native.fire.add_explosion(posVec1.x, posVec1.y, posVec1.z, 17, 9999, true, true, 10.0)
        thread.yield(200)
    end
end)

annoying_sub:add_button("Alligator Boomb", {"Spawn Alligator boomb(生成自爆帅宝)"}, function (playerIdx)
    local playerPed = native.player.get_player_ped(playerIdx) 
    local posVec = native.entity.get_offset_from_entity_in_world_coords(playerPed, 3, 0, 0) 
    ped = spanw_ped(0x2830CF33,posVec)
    native.ped._set_random_outfit_variation(ped, true)
  
    native.task.task_combat_ped(ped,playerPed,0,16)
    thread.yield(6000)
    for i = 1, 15 do
        local posVec1 = native.entity.get_offset_from_entity_in_world_coords(ped, 0, 0, 0) 
        native.fire.add_explosion(posVec1.x, posVec1.y, posVec1.z, 17, 9999, true, true, 10.0)
        thread.yield(200)
    end
end)

annoying_sub:add_button("Puma Boomb", {"Spawn Puma boomb(生成自爆山狮)"}, function (playerIdx)
    local playerPed = native.player.get_player_ped(playerIdx) 
    local posVec = native.entity.get_offset_from_entity_in_world_coords(playerPed, 3, 0, 0) 
    ped = spanw_ped(0xAA89BB8D,posVec)
    native.ped._set_random_outfit_variation(ped, true)
  
    native.task.task_combat_ped(ped,playerPed,0,16)
    thread.yield(6000)
    for i = 1, 15 do
        local posVec1 = native.entity.get_offset_from_entity_in_world_coords(ped, 0, 0, 0) 
        native.fire.add_explosion(posVec1.x, posVec1.y, posVec1.z, 17, 9999, true, true, 10.0)
        thread.yield(200)
    end
end)

annoying_sub:add_button("Robot Boomb", {"Spawn Robot boomb(生成自爆机器人)"}, function (playerIdx)
    local playerPed = native.player.get_player_ped(playerIdx) 
    local posVec = native.entity.get_offset_from_entity_in_world_coords(playerPed, 3, 0, 0) 
    ped = spanw_ped(0x3BF7829E,posVec)
    native.ped._set_random_outfit_variation(ped, true)
  
    native.task.task_combat_ped(ped,playerPed,0,16)
    thread.yield(6000)
    for i = 1, 15 do
        local posVec1 = native.entity.get_offset_from_entity_in_world_coords(ped, 0, 0, 0) 
        native.fire.add_explosion(posVec1.x, posVec1.y, posVec1.z, 17, 9999, true, true, 10.0)
        thread.yield(200)
    end
end)

annoying_sub:add_button("Goat Boomb", {"Spawn Goat boomb(生成自爆山羊)"}, function (playerIdx)
    local playerPed = native.player.get_player_ped(playerIdx) 
    local posVec = native.entity.get_offset_from_entity_in_world_coords(playerPed, 3, 0, 0) 
    ped = spanw_ped(0xD3105A6D,posVec)
    native.ped._set_random_outfit_variation(ped, true)
  
    native.task.task_combat_ped(ped,playerPed,0,16)
    thread.yield(6000)
    for i = 1, 15 do
        local posVec1 = native.entity.get_offset_from_entity_in_world_coords(ped, 0, 0, 0) 
        native.fire.add_explosion(posVec1.x, posVec1.y, posVec1.z, 17, 9999, true, true, 10.0)
        thread.yield(200)
    end
end)

annoying_sub:add_button("Big Pig Boomb", {"Spawn Big Pig boomb(生成自爆巨大野猪)"}, function (playerIdx)
    local playerPed = native.player.get_player_ped(playerIdx) 
    local posVec = native.entity.get_offset_from_entity_in_world_coords(playerPed, 3, 0, 0) 
    ped = spanw_ped(0xDE99DA6D,posVec)
    native.ped._set_random_outfit_variation(ped, true)
  
    native.task.task_combat_ped(ped,playerPed,0,16)
    thread.yield(6000)
    for i = 1, 15 do
        local posVec1 = native.entity.get_offset_from_entity_in_world_coords(ped, 0, 0, 0) 
        native.fire.add_explosion(posVec1.x, posVec1.y, posVec1.z, 17, 9999, true, true, 10.0)
        thread.yield(200)
    end
end)

annoying_sub:add_button("Rat micahbell Boomb", {"Spawn rat boomb(生成爆炸传说老鼠)"}, function (playerIdx)
    local playerPed = native.player.get_player_ped(playerIdx) 
    local posVec = native.entity.get_offset_from_entity_in_world_coords(playerPed, 3, 0, 0) 
    ped = spanw_ped(0xDE361D65,posVec)
    native.ped._set_random_outfit_variation(ped, true)
  
    native.task.task_combat_ped(ped,playerPed,0,16)
    thread.yield(6000)
    for i = 1, 15 do
        local posVec1 = native.entity.get_offset_from_entity_in_world_coords(ped, 0, 0, 0) 
        native.fire.add_explosion(posVec1.x, posVec1.y, posVec1.z, 17, 9999, true, true, 10.0)
        thread.yield(200)
    end
end)

annoying_sub:add_button("Dutch Plan Boomb", {"Spawn Dutch boomb(生成爆炸点子王)"}, function (playerIdx)
    local playerPed = native.player.get_player_ped(playerIdx) 
    local posVec = native.entity.get_offset_from_entity_in_world_coords(playerPed, 3, 0, 0) 
    ped = spanw_ped(0x73E82274,posVec)
    native.ped._set_random_outfit_variation(ped, true)
  
    native.task.task_combat_ped(ped,playerPed,0,16)
    thread.yield(6000)
    for i = 1, 15 do
        local posVec1 = native.entity.get_offset_from_entity_in_world_coords(ped, 0, 0, 0) 
        native.fire.add_explosion(posVec1.x, posVec1.y, posVec1.z, 17, 9999, true, true, 10.0)
        thread.yield(200)
    end
end)




















































































    
local attackers = {
    0x9BD92566, --Harriet Davenport
    0x8C5F7BCC, --Cult Priest
    0x25D32467, --Naked Male'
    0xAB6C83B9, --Pig Farmer
    0x892944C5, --Bounty Hunter
    0x3BF7829E, --Robot
    0xC061B459, --Old Lady
    0x71F7EE1B, --Jack Marston
    0xD9E8B86A, --cs_genstorymale
    0x16681434,  --11--u_m_m_valpoopingman_01
    0x34F835DE,  --12--cs_chelonianmaster
    0x19E97506,  --13--cs_poorjoe
    0x39FD28AE,  --14--cs_germandaughter
    0xA91215CD,  --15--cs_oddfellowspinhead
    0xE20455E9, --16--cs_mp_travellingsaleswoman
    0x3CCC99B1,  --17--cs_genstoryfemale
    0x84490A12,  --18--cs_mud2bigguy
    0xCAB23E50,  --19--re_murdercamp_males_01
    0x74DF3938,  --20--u_f_y_braithwaitessecret_01
    0x6A5B1E21, --21--re_voice_females_01
    0xA9A328D5,  --22--cs_swampfreak
    0xF3C61748,  --23--cs_baptiste
    0x442FBDDC,  --24cs_johnthebaptisingmadman
    0x75CC2B66,  --25a_m_y_unicorpse_01

}
local spawnAttacker = function(playerIdx, hash, s)
    local player = native.player.get_player_ped(playerIdx)
    local posVec = native.entity.get_offset_from_entity_in_world_coords(player, 0, 1.0, 0)
    if native.entity.does_entity_exist(player) then
    for s=1, attackersAmount do
    attacker = spanw_ped(hash, posVec, s)
    
    end
    if attackersWeapon == 0 then
        native.weapon.remove_all_ped_weapons(attacker, true, true)
       native.ped.set_ped_combat_attributes(attacker, 93, true)
    elseif attackersWeapon == 1 then
        native.weapon.give_weapon_to_ped(attacker, native.misc.get_hash_key("weapon_melee_knife"), -1, true, false, 4, false, 0.5, 1.0, 0x2CD419DC, true, 0, true)
       native.ped.set_ped_combat_attributes(attacker, 93, false)
    elseif attackersWeapon == 2 then
        native.weapon.give_weapon_to_ped(attacker, native.misc.get_hash_key("WEAPON_LASSO"), -1, true, false, 5, false, 0.5, 1.0, 0x2CD419DC, true, 0, true)
       native.ped.set_ped_combat_attributes(attacker, 93, false)
    elseif attackersWeapon == 3 then
        native.weapon.give_weapon_to_ped(attacker, native.misc.get_hash_key("weapon_pistol_mauser"), -1, true, false, 2, false, 0.5, 1.0, 0x2CD419DC, true, 0, true)
       native.ped.set_ped_combat_attributes(attacker, 93, false)
    elseif attackersWeapon == 4 then
        native.weapon.give_weapon_to_ped(attacker, native.misc.get_hash_keyy("weapon_shotgun_pump"), -1, true, false, 0, false, 0.5, 1.0, 0x2CD419DC, true, 0, true)
       native.ped.set_ped_combat_attributes(attacker, 93, false)
    elseif attackersWeapon == 5 then
        native.weapon.give_weapon_to_ped(attacker, native.misc.get_hash_key("weapon_rifle_boltaction"), -1, true, false, 9, false, 0.5, 1.0, 0x2CD419DC, true, 0, true)
       native.ped.set_ped_combat_attributes(attacker, 93, false)
    end


 
    if attackerMount == true then
       native.ped.set_ped_combat_attributes(attacker, 2, true)
       native.ped.set_ped_combat_attributes(attacker, 1, true)
       native.ped.set_ped_combat_attributes(attacker, 3, false)
       native.ped.set_ped_combat_attributes(attacker, 52, true)
       horse = spanw_ped(0x88D6A59E, posVec)
       native.ped._set_random_outfit_variation(horse, true)
 
       if attackerInvincible == true then
        native.ped.set_ped_config_flag(horse, 254, true)
        native.ped.set_ped_config_flag(attacker, 254, true)

  
          --native.entity.set_entity_invincible(horse, true)
       end
 
       native.ped.set_ped_onto_mount(attacker, horse, -1, 1)
       native.ped.set_combat_float(attacker, 31, 0)
       native.ped._set_ped_combat_style(attacker, native.misc.get_hash_key("Mounted_Chase"), 1, -1)
    end
 
    native.network.set_network_id_exists_on_all_machines(native.network.ped_to_net(attacker), true)
    native.entity.set_entity_as_mission_entity(attacker, false, true)
    native.network.set_network_id_always_exists_for_player(native.network.ped_to_net(attacker), player, true)
    native.ped._set_random_outfit_variation(attacker, true)
    native.ped.get_ped_combat_movement(attacker, 3)
    native.ped.set_ped_combat_attributes(attacker, 5, true)
    native.ped._set_ped_can_be_lassoed(attacker, false)
    native.ped.set_ped_can_be_targetted(attacker, false)
    native.ped.set_ped_can_ragdoll(attacker, false)
    native.ped.set_ped_config_flag(attacker, 254, true)
    native.entity.set_entity_invincible(attacker, true)
    native.ped.set_ped_lasso_hogtie_flag(attacker, 0, false)
    native.ped.set_ped_can_be_targetted(attacker, false)
    native.ped.set_ped_combat_attributes(attacker, 31, true)
    native.ped.set_ped_combat_attributes(attacker, 41, true)
    native.ped.set_ped_combat_attributes(attacker, 50, true)
    native.ped.set_ped_combat_attributes(attacker, 46, true)
    native.ped.set_ped_combat_attributes(attacker, 21, true)
    native.ped.set_ped_combat_attributes(attacker, 27, true)
    native.ped.set_ped_flee_attributes(attacker, 0, false)
    native.ped.set_ped_combat_ability(attacker, 100)
    native.ped.set_ped_combat_range(attacker, 100)
    native.ped.set_ped_firing_pattern(attacker, 0xC6EE6B4C)
    native.ped.set_ped_lasso_hogtie_flag(attacker, 0, false)
    native.task.task_follow_to_offset_of_entity(attacker, player, -1, -1, 0, 1.0, 0, -1, true, false, false, false, false, false)
    native.task.task_set_blocking_of_non_temporary_events(attacker, true)
 
    native.task.task_combat_ped(attacker, player, 0, 16)
 
    if attackersWeapon == 2 then
        native.task.task_lasso_ped(attacker, player)
    end
 
    native.ped.set_ped_keep_task(attacker, true)
    native.streaming.set_model_as_no_longer_needed(attacker)
 
    return attacker
 end
end























attacker_sub:add_separator("Attackers")

attacker_sub:add_button("unicorpse_01", {""}, function(player)
    for i=1, attackersAmount do
        spawnAttacker(player, attackers[23], i)
        
     end
    --end
  end)

  attacker_sub:add_button("cs_johnthebaptisingmadman", {""}, function(player)
    for s=1, attackersAmount do
        spawnAttacker(player, attackers[22], i)
        
     end
  end)

attacker_sub:add_button("cs_baptiste", {""}, function(player)
    for i=1, attackersAmount do
        spawnAttacker(player, attackers[21], i)
        
     end
  end)

  attacker_sub:add_button("cs_swampfreak", {""}, function(player)
    for i=1, attackersAmount do
        spawnAttacker(player, attackers[20], i)
        
     end
  end)

  attacker_sub:add_button("braithwaitessecret_01", {""}, function(player)
    for i=1, attackersAmount do
        spawnAttacker(player, attackers[19], i)
        
     end
  end)

  attacker_sub:add_button("murdercamp_males_01", {""}, function(player)
    for i=1, attackersAmount do
        spawnAttacker(player, attackers[18], i)
        
     end
  end)

  attacker_sub:add_button("cs_mud2bigguy", {""}, function(player)
    for i=1, attackersAmount do
        spawnAttacker(player, attackers[17], i)
        
     end
  end)

  attacker_sub:add_button("cs_genstoryfemale", {""}, function(player)
    for i=1, attackersAmount do
        spawnAttacker(player, attackers[16], i)
        
     end
  end)

  attacker_sub:add_button("mp_travellingsaleswoman", {""}, function(player)
    for i=1, attackersAmount do
        spawnAttacker(player, attackers[15], i)
        
     end
  end)

  attacker_sub:add_button("cs_oddfellowspinhead", {""}, function(player)
    for i=1, attackersAmount do
        spawnAttacker(player, attackers[14], i)
        
    end
  end)

attacker_sub:add_button("cs_germandaughter", {""}, function(player)
    for i=1, attackersAmount do
        spawnAttacker(player, attackers[13], i)
        
     end
  end)

  attacker_sub:add_button("cs_poorjoe", {""}, function(player)
    for i=1, attackersAmount do
        spawnAttacker(player, attackers[12], i)
        
     end
  end)

  attacker_sub:add_button("cs_chelonianmaster", {""}, function(player)
    for i=1, attackersAmount do
        spawnAttacker(player, attackers[11], i)
        
     end
  end)

  attacker_sub:add_button("valpoopingman_01", {""}, function(player)
    for i=1, attackersAmount do
        spawnAttacker(player, attackers[10], i)
        
     end
  end)


attacker_sub:add_button("Harriet Davenport", {""}, function(player)
    for i=1, attackersAmount do
        spawnAttacker(player, attackers[1], i)
        
     end
  end)

  attacker_sub:add_button("Cult Priest", {""}, function(player)
    for i=1, attackersAmount do
        spawnAttacker(player, attackers[2])
        
     end
  end)

  attacker_sub:add_button("Naked Male", {""}, function(player)
    for i=1, attackersAmount do
        spawnAttacker(player, attackers[3])
     end
  end)

  attacker_sub:add_button("Pig Farmer", {""}, function(player)
    for i=1, attackersAmount do
        spawnAttacker(player, attackers[4])
     end
  end)

  attacker_sub:add_button("Bounty Hunter", {""}, function(player)
    for i=1, attackersAmount do
        spawnAttacker(player, attackers[5])
        
     end
  end)

  attacker_sub:add_button("Robot", {""}, function(player)
    for i=1, attackersAmount do
        spawnAttacker(player, attackers[6])
        
     end
  end)

  attacker_sub:add_button( "Old Lady", {""}, function(player)
    for i=1, attackersAmount do
        spawnAttacker(player, attackers[7])
        
     end
  end)

  attacker_sub:add_button("Weird Blue Dudee", {""}, function(player)
    for i=1, attackersAmount do
        spawnAttacker(player, attackers[9])
        
     end
  end)

  attacker_sub:add_button("Jack Marston", {""}, function(player)
    for i=1, attackersAmount do
        spawnAttacker(player, attackers[8])
        
     end
  end)




















     
    attacker_sub:add_separator("CrazyPony Attackers")
    
    attacker_sub:add_button("Spawn 4 Panthers", {"Spawn 4 Legendary Panthers with:\n\t-God Mode\n\t-Invisible\n\t-Mad af"}, function (playerIdx)
    toast.add_info("Done")
         local playerPed = native.player.get_player_ped(playerIdx)
      
        local posVec = native.entity.get_offset_from_entity_in_world_coords(playerPed, 1, 2, 1)
        ped1 = spanw_ped(0xB91BAB89,posVec)
        ped2 = spanw_ped(0xB91BAB89,posVec)
        ped3 = spanw_ped(0xB91BAB89,posVec)
        ped4 = spanw_ped(0xB91BAB89,posVec)
     
        native.entity.set_entity_invincible(ped1, true)
        native.entity.set_entity_invincible(ped2, true)
        native.entity.set_entity_invincible(ped3, true)
        native.entity.set_entity_invincible(ped4, true)
    
        native.task.task_combat_ped(ped1,playerPed,0,16)
        native.task.task_combat_ped(ped2,playerPed,0,16)
        native.task.task_combat_ped(ped3,playerPed,0,16)
        native.task.task_combat_ped(ped4,playerPed,0,16)
     end)
    

    

    
    menu.player_root():add_button("Get Player Details", {}, function(index)
        local player_name = player.get_name(index)
        local player_ped = native.player.get_player_ped(index)
        local health = native.entity.get_entity_health(index)
        local float_health = native.entity._get_entity_health_float(player_ped)
        local ped = native.entity.get_entity_model(player_ped)
        local proofs = native.entity._get_entity_proofs(player_ped)
        local coords = native.entity.get_entity_coords(player_ped, false, true)
        local heading = player.get_heading(player_ped)
        local b1, b2, b3, b4 = player.get_ip(index)
        local ip = b1.."."..b2.."."..b3.."."..b4
        local port = player.get_port(index)
        toast.add_info("Extra Info on "..player_name, "Coords:\n" ..coords.x.."\n"..coords.y.."\n"..coords.z.. "\nIP:" ..ip.. "\nPort:" ..port.."\nHeading:" ..heading.. "\nHealth:" ..health.. "\nFloat Health:" ..float_health.. "\nPed: "..ped.."\nGod?: "..proofs)
    end)


menu.player_root():add_separator("KIND OF SOLO LOBBY")

menu.player_root():add_toggle("Ghost-Not Internal",{ "network_start_solo_tutorial_session\n\t\t\t\tand\nnetwork_end_solo_tutorial_session" }, function(state)
    if state == true then
        toast.add_warning("Ghosting:", "Enabled")
        native.network.network_start_solo_tutorial_session()
    elseif state == false then
        toast.add_warning("Ghosting:", "Disabled")
        native.network.network_end_tutorial_session()
    end
end)
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    
    
    
    local self_sub = menu.script_root():add_submenu("Self", {"https://exodusmenu.com/\n"}, function()
    end, nil)

    local ability_sub, ability_sub_opt =  self_sub:add_submenu("Abilities", {"You will gain following abilities:\n\nCAN_AUTOESCAPE_FROM_LASSO,\nHAT_BLOCKS_FIRST_HEADSHOT,\nFULL_AUTO_FOR_ALL_WEAPONS,\nMIGHT_LIVE_AFTER_DEADLY_DAMAGE,\nIGNORE_AIM_BEFORE_FIRING_RESTRICTIONS,\nDEADEYE_INSTANT_RELOAD,\nUSE_PHOSPHOROUS_ROUNDS,\nCONT_DEADEYE_ON_TAKING_COVER,\nCONT_DEADEYE_ON_RELOAD,\nCONT_DEADEYE_ON_SHOOTING,\nCONT_DEADEYE_ON_EXITING_AIM,\nDISABLE_PLAYER_CANCELLING_DEADEYE,\nCONT_DEADEYE_ON_RAGDOLL,\nUSE_EXPLOSIVE_ROUNDS,\nEXIT_DEADEYE_ON_TAKING_DAMAGE,\nCARRY_TWO_MONEYBAGS,\nABILITY_LONG_PICK_HERBS,\nABILITY_UNBREAKABLE_LASSO,\nCONT_DEADEYE_ON_SPRINTING,\nCANT_DEAL_HEADSHOTS,\nHANGMAN,\nALLOW_DEADEYE_WITH_MELEE_WEAPONS,\nALLOW_DEADEYE_WHILE_UNARMED,\nDISABLE_DEADEYE_PERFECT_ACCURACY,\nCANT_DEAL_HEADSHOTS_TO_PLAYERS,\nCANT_DEAL_CRITICAL_DAMAGE,\nCANT_DEAL_CRITICAL_DAMAGE_TO_PLAYERS,\nALLOW_EAGLEEYE_IN_COMBAT,\nCONT_EAGLEEYE_ON_SPRINT,\nSUPPRESS_LENGENDARY_EAGLEEYE_TRAIL_COLOR"}, function()
    end)
    
    local emote_sub = menu.script_root():add_submenu("Emotes/Animations", {"Will be adding more over time:\n\tChicken\n\tClap Alone\n\tDamn You\n\tDancing - [animations]\n\tDancing - [emotes]\n\tDrunk\n\tLaughing\n\tMisc Stuff\n\tMoonshine Greets and Taunts\n\tNSFW\n\tPeeing\n\tScare/Be Scared\n\tSmall PP\n\tSmoking\n\tSnot Rocket\n\tSpooky\n\tThank You! / Wave\n\tVomit\n\tWant to fight?\n\tWar Cry\n\nhttps://exodusmenu.com/\n"}, function()
    end)
    
    chicken_sub = emote_sub:add_submenu("Chicken", {"https://exodusmenu.com/\n"}, function()end)
    clap_alone_sub = emote_sub:add_submenu("Clap Alone", {"https://exodusmenu.com/\n"},function()end)
    damn_sub = emote_sub:add_submenu("Damn You", {"https://exodusmenu.com/\n"}, function()end)
    anim_dance_sub = emote_sub:add_submenu("Dancing - [animations]", {"https://exodusmenu.com/\n"},function()end)
    dance_sub = emote_sub:add_submenu("Dancing - [emotes]", {"https://exodusmenu.com/\n"},function()end)
    drunk_sub = emote_sub:add_submenu("Drunk", {"All mixed up drunk emotes/scenarious\n\nhttps://exodusmenu.com/\n"}, function()end)
    haha_sub = emote_sub:add_submenu("Laughing", {"https://exodusmenu.com/\n"}, function()end)
    anim_misc_sub = emote_sub:add_submenu("Misc Stuff", {"https://exodusmenu.com/\n"}, function()end)
    moonsh_sub = emote_sub:add_submenu("Moonshine Greets and Taunts", {"https://exodusmenu.com/\n"},function()end)
    nsfw_sub = emote_sub:add_submenu("NSFW", {"https://exodusmenu.com/\n"},function()end)
    pee_sub = emote_sub:add_submenu("Peeing", {"https://exodusmenu.com/\n"},function()end)
    scare_sub = emote_sub:add_submenu("Scare/Be Scared", {"https://exodusmenu.com/\n"}, function()end)
    pp_sub = emote_sub:add_submenu("Small PP", {"https://exodusmenu.com/\n"}, function()end)
    smoke_sub = emote_sub:add_submenu("Smoking", {"https://exodusmenu.com/\n"}, function()end)
    snot_rocket_sub = emote_sub:add_submenu("Snot Rocket", {"https://exodusmenu.com/\n"}, function()end)
    spooky_sub = emote_sub:add_submenu("Spooky", {"https://exodusmenu.com/\n"}, function()end)
    thank_you_sub = emote_sub:add_submenu("Thank You! / Wave", {"https://exodusmenu.com/\n"}, function()end)
    vomit_sub = emote_sub:add_submenu("Vomit", {"https://exodusmenu.com/\n"},function()end)
    fight_sub = emote_sub:add_submenu("Want to fight?", {"https://exodusmenu.com/\n"}, function()end)
    war_cry_sub = emote_sub:add_submenu("War Cry", {"https://exodusmenu.com/\n"}, function()end)

local mount_sub, mount_sub_opt = menu.script_root():add_submenu("Mount", {"Credits go to our\nstaff member \'Crazypony\'\n\nhttps://exodusmenu.com/\n"}, function()
end, nil)

local scenario_sub = menu.script_root():add_submenu("Scenarios[SOON]", {"https://exodusmenu.com/\n"}, function()
end)


   local vehicle_sub = menu.script_root():add_submenu("Vehicle[SOON]", {"https://exodusmenu.com/\n"}, function()
end, nil)
   
    
local function playAnimation(ped, anim_dict, animName, speed, speedMultiplier, duration, flags, playbackRate, p8, p9, p10, taskFilter, p12)
        if not native.streaming.has_anim_dict_loaded(anim_dict) then
            native.streaming.request_anim_dict(anim_dict)
            while not native.streaming.has_anim_dict_loaded(anim_dict) do
                thread.yield(0)
            end
        end
        native.task.task_play_anim(ped, anim_dict, animName, speed, speedMultiplier, duration, flags, playbackRate, p8, p9, p10, taskFilter, p12)
end
    
    
local isAnimationPlaying = false
    
local function stopAnimation(ped)
    native.task.clear_ped_tasks(ped, true, true)
end
    
local function ClearTasks(ped)
    native.ped.set_ped_should_play_immediate_scenario_exit(ped)
    native.task.clear_ped_tasks_immediately(ped, true, true)
    thread.yield(50)
end
    
local function UpdateLPlayer()
    PlayerPed = native.player.get_player_ped(0)
    PosX, PosY, PosZ = native.entity.get_entity_coords(PlayerPed, false, true)
end
    
local function CleanUP()
    CleanUp = true
    if CleanUp == true then
        thread.create(function(index)
            isAnimationPlaying = false
                if not isAnimationPlaying then
                    local PlayerPed = native.player.get_player_ped(native.player.player_id())
                    UpdateLPlayer()
                    native.entity.detach_entity(PlayerPed, true, true)
                    thread.yield(100)
                    ClearTasks(PlayerPed)
                    else
                    end
                    thread.yield()
            end)
        end
    end
    
    
    
    local ped = native.player.get_player_ped(0)
    local anim_dict = {
        "script_re@peep_tom@spanking_cowboy",
        "amb_misc@world_human_pee@male_a@idle_a",
        "script_shows@escapeartist",
        "script_shows@snakedancer@act2_p1",
        "script_shows@firebreather@act2_p1",
        "script_shows@sworddance@act3_p1",
        "script_shows@firedancer@act3_p1",
        "amb_misc@world_human_pee@male_a@idle_b",
        "amb_misc@world_human_pee@male_a@idle_c",
        "amb_misc@world_human_pee@male_a@base",
        "amb_misc@world_human_vomit_kneel@male_a@idle_a",
        "amb_rest_drunk@world_human_drunk_brace_wall@vomit@male_a@idle_a",
        "script_re@unpaid_debt@paid",
        "script_mp@emotes@pointlaugh@male@unarmed@full",
        "script_mp@emotes@jovial_laugh@male@unarmed@full",
        "mech_melee@unarmed@posse@ambient@healthy@noncombat",
        "amb_rest_sit@world_human_sit_ground@smoke@female_a@walk_exit_withprop",
        "script_mp@emotes@smoke_cigarette@female@unarmed@upper",
        "cnv_camp@rcbch@cnv@bcunc4",
        "amb_rest_sit@world_human_sit_ground@smoke@female_a@walk_exit_withprop",
        "script_mp@emotes@smoke_cigarette@female@unarmed@full",
        "script_mp@emotes@smoke_cigarette@female@unarmed@upper",
        "script_mp@emotes@spooky@male@unarmed@upper",
        "script_mp@emotes@war_cry@male@unarmed@upper",
        "script_mp@emotes@chicken@male@unarmed@full",
        "script_mp@emotes@war_cry@male@unarmed@full",
        "script_mp@emotes@scare@male@unarmed@upper",
        "script_common@other@unapproved",
        "script_common@crowd_control@unapproved@a@ped_a@intro",
        "script_common@wave@male@unapproved",
        "script_common@return@male@unapproved",
        "script_common@thank@male@unapproved",
        "script_common@crowd_control@unapproved@a@ped_d@cower",
        "script_story@rdst2@unapproved@mech_grapple@core_choke@grab_back@a",
        "script_common@service_bell@unapproved",
        "script_rc@downe@unapproved",
        "amb_rest_drunk@world_human_sit_ground@drinking_drunk@passed_out@male_b@idle_c",
        "amb_rest_drunk@world_human_sit_ground@drinking_drunk@passed_out@male_b@idle_b",
        "script_rc@ktty@leadout@s3@ext",
        "amb_rest_drunk@world_human_sit_ground@drinking_drunk@passed_out@male_b@idle_a",
        "script_rc@cal@ig@rc1_calloway_passed_out",
        "creatures_mammal@cougar@melee@streamed_taunts",
        "script_mp@emotes@pointlaugh@male@unarmed@upper",
        "script_mp@emotes@male",
        "mech_busted@arrest",
        "veh_horseback@seat_rear@male@normal@gallop@slope_max@down",
        "script_mp@emotes@rough_housing@male@unarmed@full",
        "script_mp@emotes@cruisin_for_a_bruisin@male@unarmed@upper",
        "script_mp@emotes@cruisin_for_a_bruisin@male@unarmed@full",
        "script_mp@emotes@insignificant@male@unarmed@full",
        "script_mp@emotes@insignificant@male@unarmed@upper",
        "script_mp@emotes@snot_rocket@male@unarmed@full",
        "script_mp@emotes@snot_rocket@male@unarmed@upper",
        "script_mp@emotes@chicken@male@unarmed@upper",
        "script_mp@emotes@scare@male@unarmed@full",
        "script_story@sal1@unapproved@mech_cover@fidgetsciv@@female@scared@a@unarmed@high@a",
    }









    local animNames = {
        "spanking_idle_female",
        "spanking_idle_cowboy",
        "idle_a",
        "assistant_a_performance",
        "dance_dancer",
        "dancer_dance",
        "dancer_sworddance",
        "dance",
        "idle_b",
        "idle_c",
        "idle_e",
        "idle_d",
        "idle_f",
        "idle_h",
        "idle_g",
        "base",
        "slap_loop_attacker",
        "fullbody",
        "slap_back_drunk_vs_drunk_light_v1_att",
        "slap_back_drunk_vs_sober_light_v1_att",
        "slap_front_drunk_vs_drunk_heavy_v1_att",
        "slap_front_drunk_vs_drunk_light_v1_att",
        "slap_front_drunk_vs_drunk_heavy_v2_att",
        "slap_front_drunk_vs_drunk_heavy_v3_att",
        "slap_front_drunk_vs_drunk_heavy_v4_att",
        "slap_front_drunk_vs_drunk_heavy_v5_att",
        "slap_front_drunk_vs_drunk_heavy_v6_att",
        "shove_greet_back_drunk_vs_drunk_v1_att",
        "shove_greet_front_drunk_vs_drunk_v1_att",
        "shove_greet_front_drunk_vs_sober_v3_att",
        "shove_greet_front_drunk_vs_sober_v1_att",
        "shove_greet_left_drunk_vs_drunk_v1_att",
        "shove_greet_back_drunk_vs_sober_v1_att",
        "exit_backleft",
        "exit_frontright",
        "exit_left",
        "exit_back",
        "exit_backright",
        "exit_frontleft",
        "exit_right",
        "exit_front",
        "action",
        "action_alt1",
        "intro",
        "loop",
        "outro",
        "poop_01_action",
        "poop_01_base",
        "poop_02^1_action",
        "poop_02^1_base",
        "poop_02_action",
        "poop_02_base",
        "poop_03_action",
        "poop_03_base",
        "exit_backleft",
        "exit_frontright",
        "exit_left",
        "exit_back",
        "exit_backright",
        "exit_frontleft",
        "exit_right",
        "exit_front",
        "action",
        "action_alt1",
        "action_alt2",
        "action_alt2_face",
        "action_face",
        "intro",
        "intro_face",
        "loop",
        "loop_face",
        "outro",
        "outro_face",
        "fullbody_alt1",
        "fullbody_alt2",
        "standsmoking",
        "smoking_idle_a",
        "bum_slumped@base",
        "bum_slumped@exit",
        "carwash",
        "world_human_prostitute@idle_a",
        "world_human_drinking@beer@base",
        "world_human_drinking@beer@idle_a",
        "world_human_drinking@beer@idle_b",
        "sunbathe@male@back@base",
        "guard_beatup_kickidle_dockworker",
        "guard_beatup_kickidle_guard2",
        "windowwasher_idle_to_up",
        "protest_female_idle_a",
        "protest_female_idle_b",
        "protest_female_idle_c",
        "wave_idle_d",
        "wave_idle_b",
        "wave_idle_c",
        "wave_idle_a",
        "gped_excited_return_1",
        "thank_idle_b",
        "thank_idle_c",
        "thank_idle_a",
        "thank_idle_d",
        "cower",
        "idle_vic",
        "ko_front_vic",
        "ko_front_att",
        "idle_att",
        "tied_up_base",
        "idle_ringmaster",
        "idle_tigerhandler",
        "@rc1_ig_calloway_passed_out_calloway",
        "@rc1_ig_calloway_passed_out_stool",
        "growling",
        "hands_up_transition",
        "hands_up_loop",
        "move",
        "fullbody_face",
        "idle_l",
        "idle_r",
    
    }
    
    


    
    
    tesAnimDisc = {
        "script_re@males_taunting@dead_end",
        "script_re@males_taunting@initial",
        "script_mp@emotes@subtle_wave@male@unarmed@upper",
        "script_mp@emotes@gentlewave@male@unarmed@upper",
        "script_mp@emotes@clap_along@male@unarmed@upper",
        "veh_horseback@seat_rear@male@normal@gallop@slope_max@down",
        "script_re@mounted_chase@thug_approach",
        "script_re@mounted_chase@civ_approach",
        "script_story@sal1@ig@sal1_18_lenny_on_lenny",
        "script_story@mud3@ig@ig_3_room2a",
        "script_story@mud3@ig@ig_1_throw_whore"
    
    }
    tesAnimNames = {
        "laugh_male_a",
        "point_l_male_a",
        "line02_male_b",
        "mock_trap_male_b",
        "mock_trap_male_a",
        "fullbody",
         "fullbody_alt1",
         "intro",
         "action",
         "action_alt1",
         "loop",
         "move",
         "horse_line_vic",
         "thug_approach_vic",
         "thug_line_alt_thug",
         "thug_approach_gun",
         "panic_idle_02_vic",
         "panic_idle_01_vic",
         "thug_line_thug",
         "thug_approach_thug",
         "thanks_vic",
         "civb_line01",
         "civb_line02",
         "civ_approach_crim",
         "crim_idle",
         "civ_approach_gun",
         "civ_approach_civa",
         "thanks_civa",
         "loop_female",
         "ig3_enterroom_pooper",
         "base_att",
         "base_vtm"
    }

    
    

    

    
    
    
    

    

    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

















































































    clap_alone_sub:add_button("==============--- CLEAN ---=================", {"Clean Your Animation"}, function(index)
    CleanUP()
    end) 
    
    clap_alone_sub:add_button("CLAP ALONE - [loop]", {""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, tesAnimDisc[5], tesAnimNames[11], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    clap_alone_sub:add_button("CLAP ALONE - [loop-2] ", {""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, tesAnimDisc[5], tesAnimNames[10], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)


    
    clap_alone_sub:add_button("CLAP ALONE - [loop-3]", {""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, tesAnimDisc[5], tesAnimNames[9], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)






























    
    damn_sub:add_button("==============--- CLEAN ---=================", {"Clean Your Animation"}, function(index)
    CleanUP()
    end)

    
    damn_sub:add_button("DAMN YOU - [loop]", {"\"script_mp@emotes@male\"\n\"fullbody\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[44], animNames[18], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    damn_sub:add_button("DAMN YOU - [loop] - 2", {"\"script_mp@emotes@male\"\n\"fullbody_alt1\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[44], animNames[74], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    damn_sub:add_button("DAMN YOU - [loop with glitch]", {"\"script_mp@emotes@male\"\n\"outro\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[44], animNames[46], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    damn_sub:add_button("DAMN YOU - [weird loop]", {"\"script_mp@emotes@male\"\n\"intro\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[44], animNames[43], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    damn_sub:add_button("DAMN YOU - [nein,nein,nein loop?]", {"\"script_mp@emotes@male\"\n\"action\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[44], animNames[42], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    damn_sub:add_button("DAMN YOU - [loop mad af]", {"\"script_mp@emotes@male\"\n\"loop\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[44], animNames[45], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    fight_sub:add_button("==============--- CLEAN ---=================", {"Clean Your Animation"}, function(index)
    CleanUP()
    end)
    
    
    
    
    fight_sub:add_button("WANT TO FIGHT?", {"\"script_mp@emotes@rough_housing@male@unarmed@full\"\n"}, function(index)
    if isAnimationPlaying then
        stopAnimation(ped)
        isAnimationPlaying = false
    end
    playAnimation(ped, anim_dict[47], animNames[18], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
    isAnimationPlaying = true
    end)
    
    fight_sub:add_button("ABOUT TO HIT", {"\"script_mp@emotes@cruisin_for_a_bruisin@male@unarmed@upper\"\n"}, function(index)
    if isAnimationPlaying then
        stopAnimation(ped)
        isAnimationPlaying = false
    end
    playAnimation(ped, anim_dict[48], animNames[42], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
    isAnimationPlaying = true
    end)
    
    fight_sub:add_button("ABOUT TO HIT - 2", {"\"script_mp@emotes@cruisin_for_a_bruisin@male@unarmed@upper\"\n"}, function(index)
    if isAnimationPlaying then
        stopAnimation(ped)
        isAnimationPlaying = false
    end
    playAnimation(ped, anim_dict[48], animNames[43], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
    isAnimationPlaying = true
    end)
    
    fight_sub:add_button("BOUNCER", {"\"script_mp@emotes@cruisin_for_a_bruisin@male@unarmed@upper\"\n"}, function(index)
    if isAnimationPlaying then
        stopAnimation(ped)
        isAnimationPlaying = false
    end
    playAnimation(ped, anim_dict[48], animNames[65], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
    isAnimationPlaying = true
    end)
    
    fight_sub:add_button("BOUNCER - 2", {"\"script_mp@emotes@cruisin_for_a_bruisin@male@unarmed@upper\"\n"}, function(index)
    if isAnimationPlaying then
        stopAnimation(ped)
        isAnimationPlaying = false
    end
    playAnimation(ped, anim_dict[48], animNames[45], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
    isAnimationPlaying = true
    end)
    
    
    fight_sub:add_button("BOUNCER - 3", {"\"script_mp@emotes@cruisin_for_a_bruisin@male@unarmed@full\"\n"}, function(index)
    if isAnimationPlaying then
        stopAnimation(ped)
        isAnimationPlaying = false
    end
    playAnimation(ped, anim_dict[49], animNames[18], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
    isAnimationPlaying = true
    end)
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    snot_rocket_sub:add_button("==============--- CLEAN ---=================", {"Clean Your Animation"}, function(index)
        CleanUP()
    end)
    
    
    
    snot_rocket_sub:add_button("SNOT ROCKET - [slow loop]", {"\"script_mp@emotes@snot_rocket@male@unarmed@full\""}, function(index)
    if isAnimationPlaying then
        stopAnimation(ped)
        isAnimationPlaying = false
    end
    playAnimation(ped, anim_dict[52], animNames[18], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
    isAnimationPlaying = true
    end)
    
    
    
    snot_rocket_sub:add_button("SNOT ROCKET - [loop] ", {"\"script_mp@emotes@snot_rocket@male@unarmed@upper\""}, function(index)
    if isAnimationPlaying then
        stopAnimation(ped)
        isAnimationPlaying = false
    end
    playAnimation(ped, anim_dict[53], animNames[42], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
    isAnimationPlaying = true
    end)
    
    snot_rocket_sub:add_button("SNOT ROCKET - [faster loop]", {"\"script_mp@emotes@snot_rocket@male@unarmed@upper\""}, function(index)
    if isAnimationPlaying then
        stopAnimation(ped)
        isAnimationPlaying = false
    end
    playAnimation(ped, anim_dict[53], animNames[65], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
    isAnimationPlaying = true
    end)
    
    snot_rocket_sub:add_button("SNOT ROCKET - [loop+wipe]", {"\"script_mp@emotes@snot_rocket@male@unarmed@upper\""}, function(index)
    if isAnimationPlaying then
        stopAnimation(ped)
        isAnimationPlaying = false
    end
    playAnimation(ped, anim_dict[53], animNames[43], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
    isAnimationPlaying = true
    end)
    
    
    
    snot_rocket_sub:add_button("SNOT ROCKET - [about to blow]", {"\"script_mp@emotes@snot_rocket@male@unarmed@upper\""}, function(index)
    if isAnimationPlaying then
        stopAnimation(ped)
        isAnimationPlaying = false
    end
    playAnimation(ped, anim_dict[53], animNames[70], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
    isAnimationPlaying = true
    end)
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    pp_sub:add_button("==============--- CLEAN ---=================", {"Clean Your Animation"}, function(index)
        CleanUP()
    end)
    
    
    pp_sub:add_button("YOU HAVE SMALL PP", {"\"script_mp@emotes@insignificant@male@unarmed@upper\""}, function(index)
    if isAnimationPlaying then
        stopAnimation(ped)
        isAnimationPlaying = false
    end
    playAnimation(ped, anim_dict[50], animNames[18], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
    isAnimationPlaying = true
    end)
    
    pp_sub:add_button("I SNAP YOUR SMALL PP [pointing]", {"\"script_mp@emotes@insignificant@male@unarmed@upper\""}, function(index)
    if isAnimationPlaying then
        stopAnimation(ped)
        isAnimationPlaying = false
    end
    playAnimation(ped, anim_dict[51], animNames[43], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
    isAnimationPlaying = true
    end)
    
    
    pp_sub:add_button("SMALL PP [snap]", {"\"script_mp@emotes@insignificant@male@unarmed@upper\""}, function(index)
    if isAnimationPlaying then
        stopAnimation(ped)
        isAnimationPlaying = false
    end
    playAnimation(ped, anim_dict[51], animNames[42], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
    isAnimationPlaying = true
    end)
    
    
    
    pp_sub:add_button("SMALL PP [snap] - 2", {"\"script_mp@emotes@insignificant@male@unarmed@upper\""}, function(index)
    if isAnimationPlaying then
        stopAnimation(ped)
        isAnimationPlaying = false
    end
    playAnimation(ped, anim_dict[51], animNames[65], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
    isAnimationPlaying = true
    end)
    
    
    pp_sub:add_button("SMALL PP [frozen]", {"\"script_mp@emotes@insignificant@male@unarmed@upper\""}, function(index)
    if isAnimationPlaying then
        stopAnimation(ped)
        isAnimationPlaying = false
    end
    playAnimation(ped, anim_dict[51], animNames[70], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
    isAnimationPlaying = true
    end)
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    drunk_sub:add_button("==============--- CLEAN ---=================", {"Clean Your Animation"}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
    end)
    
    
    
    
    drunk_sub:add_button("PASSED OUT VOL1", {"\"amb_rest_drunk@world_human_sit_ground@drinking_drunk@passed_out@male_b@idle_b\"\n\n\"idle_d\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[38], animNames[12], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    drunk_sub:add_button("PASSED OUT VOL2", {"\"amb_rest_drunk@world_human_sit_ground@drinking_drunk@passed_out@male_b@idle_b\"\n\n\"idle_e\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[38], animNames[11], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    drunk_sub:add_button("PASSED OUT-VOL3", {"\"amb_rest_drunk@world_human_sit_ground@drinking_drunk@passed_out@male_b@idle_c\"\n\n\"idle_h\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[37], animNames[14], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    drunk_sub:add_button("DRINK DRUNK VOL4", {"\"amb_rest_drunk@world_human_sit_ground@drinking_drunk@passed_out@male_b@idle_a\"\n\n\"idle_b\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[40], animNames[9], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    
    drunk_sub:add_button("DRINK DRUNK VOL6", {"\"amb_rest_drunk@world_human_sit_ground@drinking_drunk@passed_out@male_b@idle_c\"\n\n\"idle_g\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[37], animNames[15], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    drunk_sub:add_button("DRINK DRUNK VOL7", {"\"amb_rest_drunk@world_human_sit_ground@drinking_drunk@passed_out@male_b@idle_c\"\n\n\"idle_h\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[37], animNames[14], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    
    drunk_sub:add_button("PASSED OUT-[scratch balls]", {"\"amb_rest_drunk@world_human_sit_ground@drinking_drunk@passed_out@male_b@idle_b\"\n\n\"\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[38], animNames[13], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    drunk_sub:add_button("PASSED OUT-[scratch ass]", {"\"amb_rest_drunk@world_human_sit_ground@drinking_drunk@passed_out@male_b@idle_c\"\n\n\"\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[37], animNames[15], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    local dance_disc = {
        "script_mp@emotes@dance@drunk@b@male@unarmed@full_looped",
        "script_mp@emotes@dance@confident@b@male@unarmed@full",
        "script_mp@emotes@dance@formal@a@male@unarmed@full_looped",
        "script_mp@emotes@dance@confident@a@male@unarmed@full_looped"
    }
    
    local dance_name = {
        "intro",
        "loop",
        "outro_alt1",
        "fullbody",
        "fullbody_face",
        "action",   
        "action_alt2",   
        "action_alt1", 
    }
    
    
    
    dance_sub:add_button("==============--- CLEAN ---=================", {"Clean Your Animation"}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
    end)
    
    
    dance_sub:add_button("DRUNK DANCE - [loop]", {"\"script_mp@emotes@dance@drunk@b@male@unarmed@full_looped\"\n\n\"\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, dance_disc[1], dance_name[2], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    dance_sub:add_button("DRUNK DANCE - [loop with glitch]", {"\"script_mp@emotes@dance@drunk@b@male@unarmed@full_looped\"\n\n\"\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, dance_disc[1], dance_name[1], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    
    
    
    
    
    dance_sub:add_button("==============--- CLEAN ---=================", {"Clean Your Animation"}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
    end)
    
    dance_sub:add_button("CONFIDENT - [loop]", {"\"script_mp@emotes@dance@confident@a@male@unarmed@full_looped\"\n\n\"\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, dance_disc[4], dance_name[2], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    dance_sub:add_button("CONFIDENT - [loop with glitch]", {"d"}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, dance_disc[2], dance_name[4], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    
    
    
    
    
    
    
    
    
    dance_sub:add_separator("FORMAL")
    
    dance_sub:add_button("==============--- CLEAN ---=================", {"Clean Your Animation"}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
    end)
    
    dance_sub:add_button("FORMAL - [loop]", {"\"script_mp@emotes@dance@formal@a@male@unarmed@full_looped\"\n\n\"\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, dance_disc[3], dance_name[2], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    dance_sub:add_button("FORMAL - [loop with glitch]", {"\"script_mp@emotes@dance@formal@a@male@unarmed@full_looped\"\n\n\"\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, dance_disc[3], dance_name[1], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    scare_sub:add_button("==============--- CLEAN ---=================", {"Clean Your Animation"}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
    end)
    
    scare_sub:add_separator("Being Scared")
    
    scare_sub:add_button("BEING SCARED", {"\"script_story@sal1@unapproved@mech_cover@fidgetsciv@@female@scared@a@unarmed@high@a\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[56], animNames[116], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    scare_sub:add_button("BEING SCARED - 2", {"\"script_story@sal1@unapproved@mech_cover@fidgetsciv@@female@scared@a@unarmed@high@a\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[56], animNames[117], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    scare_sub:add_button("BEING SCARED - 2", {"\"script_common@crowd_control@unapproved@a@ped_d@cower\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[33], animNames[101], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    scare_sub:add_separator("Scare Others")
    
    scare_sub:add_button("SCARE - fullbody", {"\"script_mp@emotes@scare@male@unarmed@full\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[55], animNames[18], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    
    scare_sub:add_button("SCARE-action", {"\"script_mp@emotes@scare@male@unarmed@upper\"\n\n\"action\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[27], animNames[42], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    scare_sub:add_button("SCARE-action_alt1", {"\"script_mp@emotes@scare@male@unarmed@upper\"\n\n\"action_alt1\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[27], animNames[43], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    scare_sub:add_button("SCARE-intro", {"\"script_mp@emotes@scare@male@unarmed@upper\"\n\n\"intro\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[27], animNames[44], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    scare_sub:add_button("SCARE-loop", {"\"script_mp@emotes@scare@male@unarmed@upper\"\n\n\"loop\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[27], animNames[45], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    scare_sub:add_button("SCARE-outro", {"\"script_mp@emotes@scare@male@unarmed@upper\"\n\n\"outro\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[27], animNames[46], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    chicken_sub:add_button("==============--- CLEAN ---=================", {"Clean Your Animation"}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
    end)
    
    chicken_sub:add_button("CHICKEN - [play chicken]", {"\"script_mp@emotes@chicken@male@unarmed@upper\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[54], animNames[42], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    chicken_sub:add_button("CHICKEN - [play chicken] - 2", {"\"script_mp@emotes@chicken@male@unarmed@upper\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[54], animNames[65], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    chicken_sub:add_button("CHICKEN - [want to fly]", {"\"script_mp@emotes@chicken@male@unarmed@upper\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[54], animNames[43], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    
    chicken_sub:add_button("CHICKEN - [flap wings]", {"\"script_mp@emotes@chicken@male@unarmed@upper\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[54], animNames[70], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    chicken_sub:add_button("CHICKEN-fullbody", {"\"script_mp@emotes@chicken@male@unarmed@full\"\n\n\"fullbody\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[25], animNames[18], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    chicken_sub:add_button("CHICKEN-fullbody_alt1", {"\"script_mp@emotes@chicken@male@unarmed@full\"\n\n\"fullbody_alt1\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[25], animNames[74], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    chicken_sub:add_button("CHICKEN-fullbody_alt1", {"\"script_mp@emotes@chicken@male@unarmed@full\"\n\n\"fullbody_alt2\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[25], animNames[75], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    war_cry_sub:add_button("==============--- CLEAN ---=================", {"Clean Your Animation"}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
    end)
    
    war_cry_sub:add_button("WAR CRY-fullbody", {"\"script_mp@emotes@war_cry@male@unarmed@full\"\n\n\"fullbody\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[26], animNames[18], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    war_cry_sub:add_button("WAR CRY-action", {"\"script_mp@emotes@war_cry@male@unarmed@upper\"\n\n\"action\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[24], animNames[42], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    war_cry_sub:add_button("WAR CRY-action_alt1", {"\"script_mp@emotes@war_cry@male@unarmed@upper\"\n\n\"action\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[24], animNames[43], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    war_cry_sub:add_button("WAR CRY-intro", {"\"script_mp@emotes@war_cry@male@unarmed@upper\"\n\n\"action\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[24], animNames[44], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    war_cry_sub:add_button("WAR CRY-loop", {"\"script_mp@emotes@war_cry@male@unarmed@upper\"\n\n\"action\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[24], animNames[45], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    war_cry_sub:add_button("WAR CRY-outro", {"\"script_mp@emotes@war_cry@male@unarmed@upper\"\n\n\"action\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[24], animNames[46], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    spooky_sub:add_button("==============--- CLEAN ---=================", {"Clean Your Animation"}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
    end)
    
    spooky_sub:add_button("SPOOKY-action", {"\"script_mp@emotes@spooky@male@unarmed@upper\"\n\n\"action\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[23], animNames[42], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    spooky_sub:add_button("SPOOKY-action_alt1", {"\"script_mp@emotes@spooky@male@unarmed@upper\"\n\n\"action\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[23], animNames[43], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    spooky_sub:add_button("SPOOKY-intro", {"\"script_mp@emotes@spooky@male@unarmed@upper\"\n\n\"action\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[23], animNames[44], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    spooky_sub:add_button("SPOOKY-loop", {"\"script_mp@emotes@spooky@male@unarmed@upper\"\n\n\"action\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[23], animNames[45], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    spooky_sub:add_button("SPOOKY-outro", {"\"script_mp@emotes@spooky@male@unarmed@upper\"\n\n\"action\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[23], animNames[46], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    haha_sub:add_button("==============--- CLEAN ---=================", {"Clean Your Animation"}, function(index)
    if isAnimationPlaying then
        stopAnimation(ped)
        isAnimationPlaying = false
    end
    end)
    
    haha_sub:add_button("POINT AND LAUGH", {"LAUGH\n\n\"script_mp@emotes@pointlaugh@male@unarmed@full\"\n\"fullbody\""}, function(index)
    if isAnimationPlaying then
        stopAnimation(ped)
        isAnimationPlaying = false
    end
    playAnimation(ped, anim_dict[14], animNames[18], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
    isAnimationPlaying = true
    end)
    
    
    haha_sub:add_button("POINT AND LAUGH-action", {"LAUGH\n\n\"script_mp@emotes@pointlaugh@male@unarmed@upper\"\n\"action\""}, function(index)
    if isAnimationPlaying then
        stopAnimation(ped)
        isAnimationPlaying = false
    end
    playAnimation(ped, anim_dict[43], animNames[63], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
    isAnimationPlaying = true
    end)
    
    haha_sub:add_button("POINT AND LAUGH-action_alt1", {"LAUGH\n\n\"script_mp@emotes@pointlaugh@male@unarmed@upper\"\n\"action_alt1\""}, function(index)
    if isAnimationPlaying then
        stopAnimation(ped)
        isAnimationPlaying = false
    end
    playAnimation(ped, anim_dict[43], animNames[64], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
    isAnimationPlaying = true
    end)
    
    haha_sub:add_button("POINT AND LAUGH-intro", {"LAUGH\n\n\"script_mp@emotes@pointlaugh@male@unarmed@upper\"\n\"intro\""}, function(index)
    if isAnimationPlaying then
        stopAnimation(ped)
        isAnimationPlaying = false
    end
    playAnimation(ped, anim_dict[43], animNames[44], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
    isAnimationPlaying = true
    end)
    
    haha_sub:add_button("POINT AND LAUGH-loop", {"LAUGH\n\n\"script_mp@emotes@pointlaugh@male@unarmed@upper\"\n\"loop\""}, function(index)
    if isAnimationPlaying then
        stopAnimation(ped)
        isAnimationPlaying = false
    end
    playAnimation(ped, anim_dict[43], animNames[45], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
    isAnimationPlaying = true
    end)
    
    
    haha_sub:add_button("JOVIAL LAUGH", {"LAUGH\n\n\"script_mp@emotes@jovial_laugh@male@unarmed@full\"\n\"fullbody\""}, function(index)
    if isAnimationPlaying then
        stopAnimation(ped)
        isAnimationPlaying = false
    end
    playAnimation(ped, anim_dict[15], animNames[18], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
    isAnimationPlaying = true
    end)
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    thank_you_sub:add_separator("SUBLE WAVE")
    
    thank_you_sub:add_button("==============--- CLEAN ---=================", {"Clean Your Animation"}, function(index)
   CleanUP()
   end)   
    
   thank_you_sub:add_button("SUBLE WAVE - [loop]", {""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, tesAnimDisc[3], tesAnimNames[11], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    
    thank_you_sub:add_button("SUBLE WAVE - [loop] - 2", {""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, tesAnimDisc[3], tesAnimNames[10], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    thank_you_sub:add_button("SUBLE WAVE - [loop] - 3", {""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, tesAnimDisc[3], tesAnimNames[9], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    
    
     thank_you_sub:add_separator("GENTLE WAVE")
    
     thank_you_sub:add_button("==============--- CLEAN ---=================", {"Clean Your Animation"}, function(index)
    CleanUP()
    end) 
    
    thank_you_sub:add_button("GENTLE WAVE - [loop]", {""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, tesAnimDisc[4], tesAnimNames[11], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    thank_you_sub:add_button("GENTLE WAVE - [loop] - 2", {""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, tesAnimDisc[4], tesAnimNames[10], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    thank_you_sub:add_button("GENTLE WAVE - [loop] - 3", {""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, tesAnimDisc[4], tesAnimNames[9], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    
    
    thank_you_sub:add_separator("THANK YOU!")
    
    thank_you_sub:add_button("==============--- CLEAN ---=================", {"Clean Your Animation"}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
    end)
    
    thank_you_sub:add_button("THANK YOU A", {"\"script_common@thank@male@unapproved\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[32], animNames[97], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    thank_you_sub:add_button("THANK YOU B", {"\"script_common@thank@male@unapproved\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[32], animNames[98], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    thank_you_sub:add_button("THANK YOU C", {"\"script_common@thank@male@unapproved\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[32], animNames[99], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    thank_you_sub:add_button("THANK YOU D", {"\"script_common@thank@male@unapproved\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[32], animNames[100], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    
    
    thank_you_sub:add_separator("WAVE [male]")
    
    thank_you_sub:add_button("==============--- CLEAN ---=================", {"Clean Your Animation"}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
    end)
    
    thank_you_sub:add_button("WAVE-[come here? fast]", {"\"script_common@wave@male@unapproved\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[30], animNames[92], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    thank_you_sub:add_button("WAVE-[come here?]", {"\"script_common@wave@male@unapproved\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[30], animNames[93], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    thank_you_sub:add_button("WAVE-[come here? slow] - B", {"\"script_common@wave@male@unapproved\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[30], animNames[94], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    thank_you_sub:add_button("WAVE-[miss my train?]", {"\"script_common@wave@male@unapproved\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[30], animNames[95], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    smoke_sub:add_separator("SCENARIO_SMOKE_CIGARETTE")
    
    smoke_sub:add_button("==============--- CLEAN ---=================", {"Clean Your Animation"}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
    end)
    
    smoke_sub:add_button("SMOKE CIGARETTE-action", {"\"script_mp@emotes@smoke_cigarette@female@unarmed@upper\"\n\n\"action\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[18], animNames[42], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    smoke_sub:add_button("SMOKE CIGARETTE-action_alt1", {"\"script_mp@emotes@smoke_cigarette@female@unarmed@upper\"\n\n\"action_alt1\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[18], animNames[43], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    
    smoke_sub:add_button("SMOKE CIGARETTE-intro", {"\"script_mp@emotes@smoke_cigarette@female@unarmed@upper\"\n\n\"intro\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[18], animNames[44], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    
    smoke_sub:add_button("SMOKE CIGARETTE-loop", {"\"script_mp@emotes@smoke_cigarette@female@unarmed@upper\"\n\n\"loop\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[18], animNames[45], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    
    smoke_sub:add_button("SMOKE CIGARETTE-outro", {"\"script_mp@emotes@smoke_cigarette@female@unarmed@upper\"\n\n\"outro\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[18], animNames[46], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    
    
    
    
    smoke_sub:add_separator("EMOTE_SMOKE_CIGARETTE")
    
    smoke_sub:add_button("==============--- CLEAN ---=================", {"Clean Your Animation"}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
    end)
    
    smoke_sub:add_button("SMOKE CIGARETTE", {"\"script_mp@emotes@smoke_cigarette@female@unarmed@full\"\n\n\"fullbody\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[21], animNames[18], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    
    smoke_sub:add_separator("SMOKE FEMALE WITH SCENARIO")
    
    smoke_sub:add_button("==============--- CLEAN ---=================", {"Clean Your Animation"}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
    end)
    
    smoke_sub:add_button("SMOKE", {"\"amb_rest_sit@world_human_sit_ground@smoke@female_a@walk_exit_withprop\""}, function(index)
            if isAnimationPlaying then
                stopAnimation(ped)
                isAnimationPlaying = false
            end
            playAnimation(ped, anim_dict[17], animNames[34], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
            isAnimationPlaying = true
        end)
        
    smoke_sub:add_button("SMOKE2", {"\"amb_rest_sit@world_human_sit_ground@smoke@female_a@walk_exit_withprop\""}, function(index)
            if isAnimationPlaying then
                stopAnimation(ped)
                isAnimationPlaying = false
            end
            playAnimation(ped, anim_dict[17], animNames[35], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
            isAnimationPlaying = true
        end)
        
    smoke_sub:add_button("SMOKE3", {"\"amb_rest_sit@world_human_sit_ground@smoke@female_a@walk_exit_withprop\""}, function(index)
            if isAnimationPlaying then
                stopAnimation(ped)
                isAnimationPlaying = false
            end
            playAnimation(ped, anim_dict[17], animNames[36], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
            isAnimationPlaying = true
        end)
        
    smoke_sub:add_button("SMOKE4", {"\"amb_rest_sit@world_human_sit_ground@smoke@female_a@walk_exit_withprop\""}, function(index)
            if isAnimationPlaying then
                stopAnimation(ped)
                isAnimationPlaying = false
            end
            playAnimation(ped, anim_dict[17], animNames[37], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
            isAnimationPlaying = true
        end)
        
    smoke_sub:add_button("SMOKE5", {"\"amb_rest_sit@world_human_sit_ground@smoke@female_a@walk_exit_withprop\""}, function(index)
            if isAnimationPlaying then
                stopAnimation(ped)
                isAnimationPlaying = false
            end
            playAnimation(ped, anim_dict[17], animNames[38], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
            isAnimationPlaying = true
        end)
        
    smoke_sub:add_button("SMOKE6", {"\"amb_rest_sit@world_human_sit_ground@smoke@female_a@walk_exit_withprop\""}, function(index)
            if isAnimationPlaying then
                stopAnimation(ped)
                isAnimationPlaying = false
            end
            playAnimation(ped, anim_dict[17], animNames[39], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
            isAnimationPlaying = true
        end)
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    nsfw_sub:add_button("==============--- CLEAN ---=================", {"Clean Your Animation"}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
    end)
    
    nsfw_sub:add_button("MY C IS IN YOUR BUM", {""}, function(index)
            if isAnimationPlaying then
                stopAnimation(ped)
                isAnimationPlaying = false
            end
            playAnimation(ped, tesAnimDisc[11], tesAnimNames[31], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
            isAnimationPlaying = true
        end)
        
    nsfw_sub:add_button("MY C IS IN YOUR BUM - [on your knees]", {""}, function(index)
            if isAnimationPlaying then
                stopAnimation(ped)
                isAnimationPlaying = false
            end
            playAnimation(ped, tesAnimDisc[9], tesAnimNames[29], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
            isAnimationPlaying = true
        end)
        
        
    nsfw_sub:add_button("YOUR C IS IN MY BUM", {""}, function(index)
            if isAnimationPlaying then
                stopAnimation(ped)
                isAnimationPlaying = false
            end
            playAnimation(ped, tesAnimDisc[11], tesAnimNames[32], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
            isAnimationPlaying = true
        end)
    
    
    nsfw_sub:add_button("==============--- CLEAN ---=================", {"Clean Your Animation"}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
    end)
    
    nsfw_sub:add_button("SPANK SOMEONE", {"You are spanking someone\n\n\"script_re@peep_tom@spanking_cowboy\"\n\"spanking_idle_female\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[1], animNames[1], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    
    
    nsfw_sub:add_button("GET SPANKED", {"You are getting spanked\n\n\"script_re@peep_tom@spanking_cowboy\"\n\"spanking_idle_cowboy\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[1], animNames[2], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    pee_sub:add_button("==============--- CLEAN ---=================", {"Clean Your Animation"}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
    end)
    
    
    pee_sub:add_button("PEE-[around and around]", {"\"amb_misc@world_human_pee@male_a@idle_a\"\n\"idle_a\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[2], animNames[3], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    pee_sub:add_button("PEE-[on your toes]", {"\"amb_misc@world_human_pee@male_a@idle_a\"\n\"idle_b\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[2], animNames[9], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    pee_sub:add_button("PEE-[left hand scrach head]", {"\"amb_misc@world_human_pee@male_a@idle_a\"\n\"idle_c\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[2], animNames[10], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    pee_sub:add_button("PEE-[hands free]", {"\"amb_misc@world_human_pee@male_a@idle_b\"\n\"idle_e\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[8], animNames[11], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    pee_sub:add_button("PEE-[left hand scrach bum]", {"\"amb_misc@world_human_pee@male_a@idle_b\"\n\"idle_d\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[8], animNames[12], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    pee_sub:add_button("PEE-[right hand tired]", {"\"amb_misc@world_human_pee@male_a@idle_b\"\n\"idle_f\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[8], animNames[13], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    pee_sub:add_button("PEE-[happy pee]", {"\"amb_misc@world_human_pee@male_a@idle_c\"\n\"idle_h\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[9], animNames[14], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    pee_sub:add_button("PEE-[shake left leg]", {"\"amb_misc@world_human_pee@male_a@idle_b\"\n\"idle_g\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[9], animNames[15], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    pee_sub:add_button("PEE-[long pee]", {"\"amb_misc@world_human_pee@male_a@base\"\n\"base\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[10], animNames[16], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    vomit_sub:add_button("==============--- CLEAN ---=================", {"Clean Your Animation"}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
    end)
    
    vomit_sub:add_button("VOMIT VOL1", {""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[12], animNames[3], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    vomit_sub:add_button("VOMIT VOL2", {""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[12], animNames[9], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    vomit_sub:add_button("VOMIT VOL3", {""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[12], animNames[10], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    vomit_sub:add_button("VOMIT VOL4", {""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[11], animNames[3], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    vomit_sub:add_button("VOMIT VOL5", {""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[11], animNames[9], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    vomit_sub:add_button("VOMIT VOL6", {""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[11], animNames[10], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    moonsh_sub:add_separator("MOONSHINE SHACK GREETS")
    
    moonsh_sub:add_button("==============--- CLEAN ---=================", {"Clean Your Animation"}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
    end)
    
    moonsh_sub:add_button("SHOVE GREET", {""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[16], animNames[28], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    moonsh_sub:add_button("SHOVE GREET VOL2", {""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[16], animNames[29], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    moonsh_sub:add_button("SHOVE GREET VOL3", {""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[16], animNames[30], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    moonsh_sub:add_button("SHOVE GREET VOL4", {""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[16], animNames[31], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    moonsh_sub:add_button("SHOVE GREET VOL5", {""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[16], animNames[32], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    moonsh_sub:add_button("SHOVE GREET VOL6", {""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[16], animNames[33], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    
    
    
    
    
    
    
    
    
    
    
    moonsh_sub:add_separator("MOONSHINE SHACK TAUNTS")
    
    moonsh_sub:add_button("==============--- CLEAN ---=================", {"Clean Your Animation"}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
    end)
    
    moonsh_sub:add_button("SLAP", {""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[16], animNames[19], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    moonsh_sub:add_button("SLAP VOL2", {""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[16], animNames[20], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    moonsh_sub:add_button("SLAP VOL3", {""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[16], animNames[21], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    moonsh_sub:add_button("SLAP VOL4", {""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[16], animNames[22], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    moonsh_sub:add_button("SLAP VOL5", {""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[16], animNames[23], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    moonsh_sub:add_button("SLAP VOL6", {""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[16], animNames[24], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    moonsh_sub:add_button("SLAP VOL7", {""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[16], animNames[25], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    moonsh_sub:add_button("SLAP VOL8", {""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[16], animNames[26], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    moonsh_sub:add_button("SLAP VOL9", {""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[16], animNames[27], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    anim_dance_sub:add_button("==============--- CLEAN ---=================", {"Clean Your Animation"}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
    end)
    
    
    anim_dance_sub:add_button("Escape Artist", {"\"script_shows@escapeartist\"\n\"assistant_a_performance\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[3], animNames[4], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    
    
    anim_dance_sub:add_button("Snake Dancer", {"\"script_shows@snakedancer@act2_p1\"\n\"dance_dancer\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[4], animNames[5], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    
    anim_dance_sub:add_button("Fire Breather", {"\"script_shows@firebreather@act2_p1\"\n\"dance_dancer\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[5], animNames[6], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    
    anim_dance_sub:add_button("Sword Dance", {"\"script_shows@sworddance@act3_p1\"\n\"dancer_sworddance\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[6], animNames[7], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    anim_dance_sub:add_button("Fire Dancer", {"\"script_shows@firedancer@act3_p1\"\n\"dance\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[7], animNames[8], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    anim_misc_sub:add_button("==============--- CLEAN ---=================", {"Clean Your Animation"}, function(index)
    CleanUP()
    end)

    anim_misc_sub:add_separator("From 09/02/2024")
    
    anim_misc_sub:add_button("POINT FINGER", {""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, tesAnimDisc[7], tesAnimNames[19], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    anim_misc_sub:add_button("CALM DOWN", {""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, tesAnimDisc[8], tesAnimNames[28], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)

    anim_misc_sub:add_button("LURK AROUND", {""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, tesAnimDisc[8], tesAnimNames[24], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)


    anim_misc_sub:add_button("RIDE HORSE", {""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, tesAnimDisc[6], tesAnimNames[12], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)


    anim_misc_sub:add_button("POOP", {""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, tesAnimDisc[10], tesAnimNames[30], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)



    anim_misc_sub:add_button("MALE WAITING IN LINE", {""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, tesAnimDisc[2], tesAnimNames[3], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    anim_misc_sub:add_button("MALE WAITING IN LINE -[pointing]", {""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, tesAnimDisc[2], tesAnimNames[2], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)

        anim_misc_sub:add_button("TRY TO EXPLAIN - [with walking]", {""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, tesAnimDisc[8], tesAnimNames[27], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    

    
    anim_misc_sub:add_separator("Average Conversation With Shelby")
    
    anim_misc_sub:add_button("TRY TO EXPLAIN", {""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, tesAnimDisc[7], tesAnimNames[21], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)

    anim_misc_sub:add_separator("From Previous Update")
    
    
    
    anim_misc_sub:add_button("==============--- CLEAN ---=================", {"Clean Your Animation"}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
    end)
    
    anim_misc_sub:add_button("PROSTITUDE - [chilling]", {""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[28], animNames[81], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    anim_misc_sub:add_button("SERVISE BELL", {"\"script_common@service_bell@unapproved\""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[35], animNames[16], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    
    
    
    
    
    anim_misc_sub:add_button("WASHING CAR?", {""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, anim_dict[28], animNames[80], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    
    
    anim_misc_sub:add_button("WINDOW WASHER", {""}, function(index)
    if isAnimationPlaying then
        stopAnimation(ped)
        isAnimationPlaying = false
    end
    playAnimation(ped, anim_dict[28], animNames[88], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
    isAnimationPlaying = true
    end)
    
    anim_misc_sub:add_button("FEMALE PROTEST - 1", {""}, function(index)
    if isAnimationPlaying then
    stopAnimation(ped)
    isAnimationPlaying = false
    end
    playAnimation(ped, anim_dict[28], animNames[89], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
    isAnimationPlaying = true
    end)
    
    anim_misc_sub:add_button("FEMALE PROTEST - 2", {""}, function(index)
    if isAnimationPlaying then
    stopAnimation(ped)
    isAnimationPlaying = false
    end
    playAnimation(ped, anim_dict[28], animNames[90], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
    isAnimationPlaying = true
    end)
    
    
    anim_misc_sub:add_button("FEMALE PROTEST - 3", {""}, function(index)
    if isAnimationPlaying then
    stopAnimation(ped)
    isAnimationPlaying = false
    end
    playAnimation(ped, anim_dict[28], animNames[91], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
    isAnimationPlaying = true
    end)
    
    anim_misc_sub:add_button("BUM SLUMPED", {""}, function(index)
    if isAnimationPlaying then
    stopAnimation(ped)
    isAnimationPlaying = false
    end
    playAnimation(ped, anim_dict[28], animNames[78], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
    isAnimationPlaying = true
    end)
    
    anim_misc_sub:add_button("BUM SLUMPED - [exit]", {""}, function(index)
    if isAnimationPlaying then
    stopAnimation(ped)
    isAnimationPlaying = false
    end
    playAnimation(ped, anim_dict[28], animNames[79], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
    isAnimationPlaying = true
    end)
    
    
    anim_misc_sub:add_button("TIGER HANDLER?", {"\"script_rc@ktty@leadout@s3@ext\"\n\"idle_tigerhandler\""}, function(index)
    if isAnimationPlaying then
    stopAnimation(ped)
    isAnimationPlaying = false
    end
    playAnimation(ped, anim_dict[39], animNames[108], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
    isAnimationPlaying = true
    end)
    
    anim_misc_sub:add_button("RINGMASTER?", {"sitting and holding invisible glass\n[looks like he is wanking off]\n\"script_rc@ktty@leadout@s3@ext\"\n\"idle_ringmaster\""}, function(index)
    if isAnimationPlaying then
    stopAnimation(ped)
    isAnimationPlaying = false
    end
    playAnimation(ped, anim_dict[39], animNames[107], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
    isAnimationPlaying = true
    end)
    
    anim_misc_sub:add_button("SUNBATH", {"\"sunbathe@male@back@base\""}, function(index)
    if isAnimationPlaying then
        stopAnimation(ped)
        isAnimationPlaying = false
    end
    playAnimation(ped, anim_dict[28], animNames[85], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
    isAnimationPlaying = true
    end)
    
    anim_misc_sub:add_button("GET BEATEN ON THE GROUND", {"\"guard_beatup_kickidle_dockworker\""}, function(index)
    if isAnimationPlaying then
        stopAnimation(ped)
        isAnimationPlaying = false
    end
    playAnimation(ped, anim_dict[28], animNames[86], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
    isAnimationPlaying = true
    end)
    
    anim_misc_sub:add_button("GUARD BEAT BODY", {"\"guard_beatup_kickidle_guard2\""}, function(index)
    if isAnimationPlaying then
        stopAnimation(ped)
        isAnimationPlaying = false
    end
    playAnimation(ped, anim_dict[28], animNames[87], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
    isAnimationPlaying = true
    end)
    
    anim_misc_sub:add_button("TIED UP [standing] - \"\"", {"\"script_rc@downe@unapproved\""}, function(index)
    if isAnimationPlaying then
        stopAnimation(ped)
        isAnimationPlaying = false
    end
    playAnimation(ped, anim_dict[36], animNames[106], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
    isAnimationPlaying = true
    end)
    
    anim_misc_sub:add_button("TOUCHING SOMETHING?", {"\"script_re@unpaid_debt@paid\"\n\"slap_loop_attacker\""}, function(index)
    if isAnimationPlaying then
        stopAnimation(ped)
        isAnimationPlaying = false
    end
    playAnimation(ped, anim_dict[13], animNames[17], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
    isAnimationPlaying = true
    end)
    
    anim_misc_sub:add_button("COME HERE!", {""}, function(index)
    if isAnimationPlaying then
        stopAnimation(ped)
        isAnimationPlaying = false
    end
    playAnimation(ped, anim_dict[31], animNames[96], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
    isAnimationPlaying = true
    end)
    
    anim_misc_sub:add_button("mock_trap_male_b", {""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, tesAnimDisc[1], tesAnimNames[4], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    anim_misc_sub:add_button("mock_trap_male_a", {""}, function(index)
        if isAnimationPlaying then
            stopAnimation(ped)
            isAnimationPlaying = false
        end
        playAnimation(ped, tesAnimDisc[1], tesAnimNames[5], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
        isAnimationPlaying = true
    end)
    
    
    anim_misc_sub:add_separator("GET GAGGED")
    
    anim_misc_sub:add_button("==============--- CLEAN ---=================", {"Clean Your Animation"}, function(index)
    if isAnimationPlaying then
        stopAnimation(ped)
        isAnimationPlaying = false
    end
    end)
    
    anim_misc_sub:add_button("GRAB BACK - 1", {"\"script_story@rdst2@unapproved@mech_grapple@core_choke@grab_back@a\""}, function(index)
    if isAnimationPlaying then
        stopAnimation(ped)
        isAnimationPlaying = false
    end
    playAnimation(ped, anim_dict[34], animNames[102], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
    isAnimationPlaying = true
    end)
    
    anim_misc_sub:add_button("GRAB BACK - 2", {"\"script_story@rdst2@unapproved@mech_grapple@core_choke@grab_back@a\""}, function(index)
    if isAnimationPlaying then
        stopAnimation(ped)
        isAnimationPlaying = false
    end
    playAnimation(ped, anim_dict[34], animNames[103], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
    isAnimationPlaying = true
    end)
    
    anim_misc_sub:add_button("GRAB BACK - 3", {"\"script_story@rdst2@unapproved@mech_grapple@core_choke@grab_back@a\""}, function(index)
    if isAnimationPlaying then
        stopAnimation(ped)
        isAnimationPlaying = false
    end
    playAnimation(ped, anim_dict[34], animNames[104], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
    isAnimationPlaying = true
    end)
    
    anim_misc_sub:add_button("GRAB BACK - 4", {"\"script_story@rdst2@unapproved@mech_grapple@core_choke@grab_back@a\""}, function(index)
    if isAnimationPlaying then
        stopAnimation(ped)
        isAnimationPlaying = false
    end
    playAnimation(ped, anim_dict[34], animNames[105], 8.0, -8.0, -1, 1, 0.0, false, 0, false, "", false)
isAnimationPlaying = true
end)




















































































self_attach_sub = self_sub:add_submenu("Self Attachments", {}, function()end)

local male_attach_sub = self_attach_sub:add_submenu("Male", {"Self Attachments For Male Character"}, function()end, nil)
local female_attach_sub = self_attach_sub:add_submenu("Female", {"Self Attachments For Female Character"}, function()end, nil)



function request_control(Ped, timeout)
    local timer <const> = time.unix_milliseconds() + timeout
    while native.network.network_has_control_of_entity(Ped) or timer > time.unix_milliseconds() do
        native.network.network_request_control_of_entity(Ped)
        thread.yield()
    end
    if native.network.network_has_control_of_entity(Ped) then
        return true
    else
        return false
    end
end

local function request_model(hash)
    local timer <const> = time.unix_milliseconds() + 1000
    while not native.streaming.has_model_loaded(hash) and timer > time.unix_milliseconds() do
        native.streaming.request_model(hash, true)
        thread.yield()
    end
 end

 local function spanw_ped(hash,posVec, posVecy, posVecz)
    request_model(hash)
    local Ped = native.ped.create_ped(hash, posVec.x, posVec.y, posVec.z-1, 0, true, true, true, false)
    if Ped   then
        return Ped
        else
           return false,toast.add_info("Spawn Failed")
        end
     end 
     

     local anim_dict = {
        "amb_creatures_bird@world_carolinaparakeet_on_perch@idle",
        "creatures_bird@parrot@normal@idle@idle_variations@var_c",
        "creatures_mammal@squirrel@normal@idle@variation@idle_b",
    }

    local anim_name = {
        "idle",
        "idle_a",
		"idle_b",
    }

    MaleBoneName = {
        ["Left Shoulder"]  = 286,
        ["Right Shoulder"]  = 386,
    }

    FemaleBoneName = {
        ["Left Shoulder"] = 353,
        ["Right Shoulder"] = 440 
    }

   local Peds = {
        ["Parrot"] = 0x94DD14B8, 
        ["Squirrel"] = 0x5758D069,  
        ["Parakeet"] = 0x681E834B,  
    }



female_attach_sub:add_separator("Left Shoulder")
    

female_attach_sub:add_button("Squirrel", {"A_C_Squirrel_01\nwith config flag overkill"}, function()
    local player_ped <const> = native.player.player_ped_id()
    if native.entity.does_entity_exist(player_ped) then
        local posVec <const> = native.entity.get_entity_coords(player_ped, true, true)
        local Ped = spanw_ped(Peds["Squirrel"], posVec)
        native.ped._equip_meta_ped_outfit_preset(Ped, 1, false)
        native.ped._set_random_outfit_variation(Ped, true)
        native.task.clear_ped_tasks_immediately(Ped, true, true)
        native.streaming.request_anim_dict(anim_dict[3])
        native.task.task_play_anim(Ped, anim_dict[3], anim_name[1], 1.0, 1.0, -1, 1, 0.0, false, 0, false, "", false)
        native.entity.freeze_entity_position(Ped, true)
        native.entity.attach_entity_to_entity(Ped, player_ped, FemaleBoneName["Left Shoulder"], 0.015, 0.01, 0.08, 0.0,0.0, 150.0, false, false, false, true, 0, true, false, false)
        native.ped.set_ped_config_flag(Ped, 61, true)  
        native.ped.set_ped_config_flag(Ped, 254, true) 
        native.ped.set_ped_config_flag(Ped, 29, true)  
        native.ped.set_ped_config_flag(Ped, 54, true)  
        native.ped.set_ped_config_flag(Ped, 72, true)  
        native.ped.set_ped_config_flag(Ped, 77, true)  
        native.ped.set_ped_config_flag(Ped, 111, true) 
        native.ped.set_ped_config_flag(Ped, 113, true) 
        native.ped.set_ped_config_flag(Ped, 121, true) 
        native.ped.set_ped_config_flag(Ped, 137, true) 
        native.ped.set_ped_config_flag(Ped, 136, true) 
        native.ped.set_ped_config_flag(Ped, 192, true) 
        native.ped.set_ped_config_flag(Ped, 207, false)
        native.ped.set_ped_config_flag(Ped, 213, true) 
        native.ped.set_ped_config_flag(Ped, 217, true) 
        native.ped.set_ped_config_flag(Ped, 279, true) 
        native.ped.set_ped_config_flag(Ped, 302, true) 
        native.ped.set_ped_config_flag(Ped, 340, true) 
        native.ped.set_ped_config_flag(Ped, 370, true) 
        native.ped.set_ped_config_flag(Ped, 72, true)
        native.ped.set_ped_config_flag(Ped, 72, true)
        native.ped.set_ped_combat_attributes(Ped, 68, true) 
        native.ped._set_ped_can_be_lassoed(Ped, false)
        native.ped.set_ped_can_be_targetted(Ped, false)
        native.ped.set_ped_can_ragdoll(Ped, false)
        native.streaming.set_model_as_no_longer_needed(Ped)
        native.ped.set_blocking_of_non_temporary_events(Ped, true)
    end
end)



female_attach_sub:add_button("Carolina Parakeet", {"A_C_CarolinaParakeet_01\nwith config flag overkil"}, function()
    local player_ped <const> = native.player.player_ped_id()
    if native.entity.does_entity_exist(player_ped) then
        local posVec <const> = native.entity.get_entity_coords(player_ped, true, true)
        local Ped = spanw_ped(Peds["Parakeet"], posVec)
        native.ped._equip_meta_ped_outfit_preset(Ped, 1, false)
        native.ped._set_random_outfit_variation(Ped, true)
        native.task.clear_ped_tasks_immediately(Ped, true, true)
        native.streaming.request_anim_dict(anim_dict[1])
        native.task.task_play_anim(Ped, anim_dict[1], anim_name[3], 1.0, 1.0, -1, 1, 0.0, false, 0, false, "", false)
        native.entity.freeze_entity_position(Ped, true)
        native.entity.attach_entity_to_entity(Ped, player_ped, FemaleBoneName["Left Shoulder"], 0.0, 0.0, 0.06, 0.0,0.0, 160.0, false, false, false, true, 0, true, false, false)
        native.ped.set_ped_config_flag(Ped, 61, true)  
        native.ped.set_ped_config_flag(Ped, 254, true) 
        native.ped.set_ped_config_flag(Ped, 29, true)  
        native.ped.set_ped_config_flag(Ped, 54, true)  
        native.ped.set_ped_config_flag(Ped, 72, true)  
        native.ped.set_ped_config_flag(Ped, 77, true)  
        native.ped.set_ped_config_flag(Ped, 111, true) 
        native.ped.set_ped_config_flag(Ped, 113, true) 
        native.ped.set_ped_config_flag(Ped, 121, true) 
        native.ped.set_ped_config_flag(Ped, 137, true) 
        native.ped.set_ped_config_flag(Ped, 136, true) 
        native.ped.set_ped_config_flag(Ped, 192, true) 
        native.ped.set_ped_config_flag(Ped, 207, false)
        native.ped.set_ped_config_flag(Ped, 213, true) 
        native.ped.set_ped_config_flag(Ped, 217, true) 
        native.ped.set_ped_config_flag(Ped, 279, true) 
        native.ped.set_ped_config_flag(Ped, 302, true) 
        native.ped.set_ped_config_flag(Ped, 340, true) 
        native.ped.set_ped_config_flag(Ped, 370, true) 
        native.ped.set_ped_config_flag(Ped, 72, true)
        native.ped.set_ped_config_flag(Ped, 72, true)
        native.ped.set_ped_combat_attributes(Ped, 68, true) 
        native.ped._set_ped_can_be_lassoed(Ped, false)
        native.ped.set_ped_can_be_targetted(Ped, false)
        native.ped.set_ped_can_ragdoll(Ped, false)
        native.streaming.set_model_as_no_longer_needed(Ped)
        native.ped.set_blocking_of_non_temporary_events(Ped, true)
    end
end)

female_attach_sub:add_button("Parrot", {"A_C_Parrot_01\nwith config flag overkill"}, function()
    local player_ped <const> = native.player.player_ped_id()
    if native.entity.does_entity_exist(player_ped) then
        local posVec <const> = native.entity.get_entity_coords(player_ped, true, true)
        local Ped = spanw_ped(Peds["Parrot"], posVec)
        native.ped._equip_meta_ped_outfit_preset(Ped, 1, false)
        native.ped._set_random_outfit_variation(Ped, true)
        native.task.clear_ped_tasks_immediately(Ped, true, true)
        native.streaming.request_anim_dict(anim_dict[2])
        native.task.task_play_anim(Ped, anim_dict[2], anim_name[1], 1.0, 1.0, -1, 1, 0.0, false, 0, false, "", false)
        native.entity.freeze_entity_position(Ped, true)
        native.entity.attach_entity_to_entity(Ped, player_ped, FemaleBoneName["Left Shoulder"], 0.0, 0.05, 0.12, 0.0, -15.0, 180.0, false, false, false, true, 0, true, false, false)
        native.ped.set_ped_config_flag(Ped, 61, true)  
        native.ped.set_ped_config_flag(Ped, 254, true) 
        native.ped.set_ped_config_flag(Ped, 29, true)  
        native.ped.set_ped_config_flag(Ped, 54, true)  
        native.ped.set_ped_config_flag(Ped, 72, true)  
        native.ped.set_ped_config_flag(Ped, 77, true)  
        native.ped.set_ped_config_flag(Ped, 111, true) 
        native.ped.set_ped_config_flag(Ped, 113, true) 
        native.ped.set_ped_config_flag(Ped, 121, true) 
        native.ped.set_ped_config_flag(Ped, 137, true) 
        native.ped.set_ped_config_flag(Ped, 136, true) 
        native.ped.set_ped_config_flag(Ped, 192, true) 
        native.ped.set_ped_config_flag(Ped, 207, false)
        native.ped.set_ped_config_flag(Ped, 213, true) 
        native.ped.set_ped_config_flag(Ped, 217, true) 
        native.ped.set_ped_config_flag(Ped, 279, true) 
        native.ped.set_ped_config_flag(Ped, 302, true) 
        native.ped.set_ped_config_flag(Ped, 340, true) 
        native.ped.set_ped_config_flag(Ped, 370, true) 
        native.ped.set_ped_config_flag(Ped, 72, true)
        native.ped.set_ped_config_flag(Ped, 72, true)
        native.ped.set_ped_combat_attributes(Ped, 68, true)
        native.ped._set_ped_can_be_lassoed(Ped, false)
        native.ped.set_ped_can_be_targetted(Ped, false)
        native.ped.set_ped_can_ragdoll(Ped, false)
        native.streaming.set_model_as_no_longer_needed(Ped)
        native.ped.set_blocking_of_non_temporary_events(Ped, true)
    end
end)

































































male_attach_sub:add_separator("Left Shoulder")




male_attach_sub:add_button("Squirrel", {"A_C_Squirrel_01\nwith config flag overkill"}, function()
    local player_ped <const> = native.player.player_ped_id()
    if native.entity.does_entity_exist(player_ped) then
        local posVec <const> = native.entity.get_entity_coords(player_ped, true, true)
        local Ped = spanw_ped(Peds["Squirrel"], posVec)
        native.ped._equip_meta_ped_outfit_preset(Ped, 1, false)
        native.ped._set_random_outfit_variation(Ped, true)
        native.task.clear_ped_tasks_immediately(Ped, true, true)
        native.streaming.request_anim_dict(anim_dict[3])
        native.task.task_play_anim(Ped, anim_dict[3], anim_name[1], 1.0, 1.0, -1, 1, 0.0, false, 0, false, "", false)
        native.entity.freeze_entity_position(Ped, true)
        native.entity.attach_entity_to_entity(Ped, player_ped, MaleBoneName["Left Shoulder"], 0.00, 0.03, 0.1, 0.0,0.0, 190.0, false, false, false, true, 0, true, false, false)
        native.ped.set_ped_config_flag(Ped, 61, true)  
        native.ped.set_ped_config_flag(Ped, 254, true) 
        native.ped.set_ped_config_flag(Ped, 29, true)  
        native.ped.set_ped_config_flag(Ped, 54, true)  
        native.ped.set_ped_config_flag(Ped, 72, true)  
        native.ped.set_ped_config_flag(Ped, 77, true)  
        native.ped.set_ped_config_flag(Ped, 111, true) 
        native.ped.set_ped_config_flag(Ped, 113, true) 
        native.ped.set_ped_config_flag(Ped, 121, true) 
        native.ped.set_ped_config_flag(Ped, 137, true) 
        native.ped.set_ped_config_flag(Ped, 136, true) 
        native.ped.set_ped_config_flag(Ped, 192, true) 
        native.ped.set_ped_config_flag(Ped, 207, false)
        native.ped.set_ped_config_flag(Ped, 213, true) 
        native.ped.set_ped_config_flag(Ped, 217, true) 
        native.ped.set_ped_config_flag(Ped, 279, true) 
        native.ped.set_ped_config_flag(Ped, 302, true) 
        native.ped.set_ped_config_flag(Ped, 340, true) 
        native.ped.set_ped_config_flag(Ped, 370, true) 
        native.ped.set_ped_config_flag(Ped, 72, true)
        native.ped.set_ped_config_flag(Ped, 72, true)
        native.ped.set_ped_combat_attributes(Ped, 68, true) 
        native.ped._set_ped_can_be_lassoed(Ped, false)
        native.ped.set_ped_can_be_targetted(Ped, false)
        native.ped.set_ped_can_ragdoll(Ped, false)
        native.streaming.set_model_as_no_longer_needed(Ped)
        native.ped.set_blocking_of_non_temporary_events(Ped, true)
    end
end)


male_attach_sub:add_button("Carolina Parakeet", {"A_C_CarolinaParakeet_01\nwith config flag overkil"}, function()
    local player_ped <const> = native.player.player_ped_id()
    if native.entity.does_entity_exist(player_ped) then
        local posVec <const> = native.entity.get_entity_coords(player_ped, true, true)
        local Ped = spanw_ped(Peds["Parakeet"], posVec)
        native.ped._equip_meta_ped_outfit_preset(Ped, 1, false)
        native.ped._set_random_outfit_variation(Ped, true)
        native.task.clear_ped_tasks_immediately(Ped, true, true)
        native.entity.freeze_entity_position(Ped, true)
        native.entity.attach_entity_to_entity(Ped, player_ped, MaleBoneName["Left Shoulder"], 0.0, -0.006, 0.06, 0.0,0.0, 180.0, false, false, false, true, 0, true, false, false)
        native.ped.set_ped_config_flag(Ped, 61, true)  
        native.ped.set_ped_config_flag(Ped, 254, true) 
        native.ped.set_ped_config_flag(Ped, 29, true)  
        native.ped.set_ped_config_flag(Ped, 54, true)  
        native.ped.set_ped_config_flag(Ped, 72, true)  
        native.ped.set_ped_config_flag(Ped, 77, true)  
        native.ped.set_ped_config_flag(Ped, 111, true) 
        native.ped.set_ped_config_flag(Ped, 113, true) 
        native.ped.set_ped_config_flag(Ped, 121, true) 
        native.ped.set_ped_config_flag(Ped, 137, true) 
        native.ped.set_ped_config_flag(Ped, 136, true) 
        native.ped.set_ped_config_flag(Ped, 192, true) 
        native.ped.set_ped_config_flag(Ped, 207, false)
        native.ped.set_ped_config_flag(Ped, 213, true) 
        native.ped.set_ped_config_flag(Ped, 217, true) 
        native.ped.set_ped_config_flag(Ped, 279, true) 
        native.ped.set_ped_config_flag(Ped, 302, true) 
        native.ped.set_ped_config_flag(Ped, 340, true) 
        native.ped.set_ped_config_flag(Ped, 370, true) 
        native.ped.set_ped_config_flag(Ped, 72, true)
        native.ped.set_ped_config_flag(Ped, 72, true)
        native.ped.set_ped_combat_attributes(Ped, 68, true) 
        native.ped._set_ped_can_be_lassoed(Ped, false)
        native.ped.set_ped_can_be_targetted(Ped, false)
        native.ped.set_ped_can_ragdoll(Ped, false)
        native.streaming.set_model_as_no_longer_needed(Ped)
        native.ped.set_blocking_of_non_temporary_events(Ped, true)
    end
end)

male_attach_sub:add_button("Parrot", {"A_C_Parrot_01\nwith config flag overkill"}, function()
    local player_ped <const> = native.player.player_ped_id()
    if native.entity.does_entity_exist(player_ped) then
        local posVec <const> = native.entity.get_entity_coords(player_ped, true, true)
        local Ped = spanw_ped(Peds["Parrot"], posVec)
        native.ped._equip_meta_ped_outfit_preset(Ped, 1, false)
        native.ped._set_random_outfit_variation(Ped, true)
        native.task.clear_ped_tasks_immediately(Ped, true, true)
        native.streaming.request_anim_dict(anim_dict[2])
        native.task.task_play_anim(Ped, anim_dict[2], anim_name[1], 1.0, 1.0, -1, 1, 0.0, false, 0, false, "", false)
        native.entity.freeze_entity_position(Ped, true)
        native.entity.attach_entity_to_entity(Ped, player_ped, MaleBoneName["Left Shoulder"], 0.045, 0.05, 0.12, 0.0, -15.0, 180.0, false, false, false, true, 0, true, false, false)
        native.ped.set_ped_config_flag(Ped, 61, true)  
        native.ped.set_ped_config_flag(Ped, 254, true) 
        native.ped.set_ped_config_flag(Ped, 29, true)  
        native.ped.set_ped_config_flag(Ped, 54, true)  
        native.ped.set_ped_config_flag(Ped, 72, true)  
        native.ped.set_ped_config_flag(Ped, 77, true)  
        native.ped.set_ped_config_flag(Ped, 111, true) 
        native.ped.set_ped_config_flag(Ped, 113, true) 
        native.ped.set_ped_config_flag(Ped, 121, true) 
        native.ped.set_ped_config_flag(Ped, 137, true) 
        native.ped.set_ped_config_flag(Ped, 136, true) 
        native.ped.set_ped_config_flag(Ped, 192, true) 
        native.ped.set_ped_config_flag(Ped, 207, false)
        native.ped.set_ped_config_flag(Ped, 213, true) 
        native.ped.set_ped_config_flag(Ped, 217, true) 
        native.ped.set_ped_config_flag(Ped, 279, true) 
        native.ped.set_ped_config_flag(Ped, 302, true) 
        native.ped.set_ped_config_flag(Ped, 340, true) 
        native.ped.set_ped_config_flag(Ped, 370, true) 
        native.ped.set_ped_config_flag(Ped, 72, true)
        native.ped.set_ped_config_flag(Ped, 72, true)
        native.ped.set_ped_combat_attributes(Ped, 68, true)
        native.ped._set_ped_can_be_lassoed(Ped, false)
        native.ped.set_ped_can_be_targetted(Ped, false)
        native.ped.set_ped_can_ragdoll(Ped, false)
        native.streaming.set_model_as_no_longer_needed(Ped)
        native.ped.set_blocking_of_non_temporary_events(Ped, true)
    end
end)



























female_attach_sub:add_separator("Right Shoulder")

female_attach_sub:add_button("Squirrel", {"A_C_Squirrel_01\n With a lot of config"}, function()
        local player_ped <const> = native.player.player_ped_id()
        if native.entity.does_entity_exist(player_ped) then
            local posVec <const> = native.entity.get_entity_coords(player_ped, true, true)
            local player_heading =native.entity.get_entity_heading(player_ped)
            local Ped = spanw_ped(Peds["Squirrel"], posVec)
            native.ped._equip_meta_ped_outfit_preset(Ped, 1, false)
            native.ped._set_random_outfit_variation(Ped, true)
            native.task.clear_ped_tasks_immediately(Ped, true, true)
            native.streaming.request_anim_dict(anim_dict[3])
            native.task.task_play_anim(Ped, anim_dict[3], anim_name[1], 1.0, 1.0, -1, 1, 0.0, false, 0, false, "", false)
            native.entity.freeze_entity_position(Ped, true)
            native.entity.attach_entity_to_entity(Ped, player_ped, FemaleBoneName["Right Shoulder"] ,-0.0, -0.025, 0.08, 0.0,0.0, 15.0, false, false, false, true, 0, true, false, false)
            native.ped.set_ped_config_flag(Ped, 61, true) 
            native.ped.set_ped_config_flag(Ped, 254, true)
            native.ped.set_ped_config_flag(Ped, 29, true) 
            native.ped.set_ped_config_flag(Ped, 54, true) 
            native.ped.set_ped_config_flag(Ped, 72, true) 
            native.ped.set_ped_config_flag(Ped, 77, true) 
            native.ped.set_ped_config_flag(Ped, 111, true)
            native.ped.set_ped_config_flag(Ped, 113, true)
            native.ped.set_ped_config_flag(Ped, 121, true)
            native.ped.set_ped_config_flag(Ped, 137, true)
            native.ped.set_ped_config_flag(Ped, 136, true)
            native.ped.set_ped_config_flag(Ped, 192, true)
            native.ped.set_ped_config_flag(Ped, 207, false)
            native.ped.set_ped_config_flag(Ped, 213, true)
            native.ped.set_ped_config_flag(Ped, 217, true)
            native.ped.set_ped_config_flag(Ped, 279, true)
            native.ped.set_ped_config_flag(Ped, 302, true)
            native.ped.set_ped_config_flag(Ped, 340, true)
            native.ped.set_ped_config_flag(Ped, 370, true)
            native.ped.set_ped_config_flag(Ped, 72, true)
            native.ped.set_ped_config_flag(Ped, 72, true)
            native.ped.set_ped_combat_attributes(Ped, 68, true)
            native.ped._set_ped_can_be_lassoed(Ped, false)
            native.ped.set_ped_can_be_targetted(Ped, false)
            native.ped.set_ped_can_ragdoll(Ped, false)
            native.entity.set_entity_heading(Ped, player_heading+180)
            native.ped.set_blocking_of_non_temporary_events(Ped, true)
        end
    end)



    female_attach_sub:add_button("Carolina Parakeet", {"A_C_CarolinaParakeet_01\n With a lot of config"}, function()
        local player_ped <const> = native.player.player_ped_id()
        if native.entity.does_entity_exist(player_ped) then
            local posVec <const> = native.entity.get_entity_coords(player_ped, true, true)
            local player_heading =native.entity.get_entity_heading(player_ped)
            local Ped = spanw_ped(Peds["Parakeet"], posVec)
            native.ped._equip_meta_ped_outfit_preset(Ped, 1, false)
            native.ped._set_random_outfit_variation(Ped, true)
            native.task.clear_ped_tasks_immediately(Ped, true, true)
        native.streaming.request_anim_dict(anim_dict[1])
        native.task.task_play_anim(Ped, anim_dict[1], anim_name[3], 1.0, 1.0, -1, 1, 0.0, false, 0, false, "", false)
            native.entity.freeze_entity_position(Ped, true)
            native.entity.attach_entity_to_entity(Ped, player_ped, FemaleBoneName["Right Shoulder"] ,0.0, 0.00, 0.05, 0.0,0.0, 0.0, false, false, false, true, 0, true, false, false)
            native.ped.set_ped_config_flag(Ped, 61, true)  
            native.ped.set_ped_config_flag(Ped, 254, true)
            native.ped.set_ped_config_flag(Ped, 29, true)  
            native.ped.set_ped_config_flag(Ped, 54, true)  
            native.ped.set_ped_config_flag(Ped, 72, true)  
            native.ped.set_ped_config_flag(Ped, 77, true)  
            native.ped.set_ped_config_flag(Ped, 111, true) 
            native.ped.set_ped_config_flag(Ped, 113, true) 
            native.ped.set_ped_config_flag(Ped, 121, true) 
            native.ped.set_ped_config_flag(Ped, 137, true) 
            native.ped.set_ped_config_flag(Ped, 136, true) 
            native.ped.set_ped_config_flag(Ped, 192, true) 
            native.ped.set_ped_config_flag(Ped, 207, false)
            native.ped.set_ped_config_flag(Ped, 213, true) 
            native.ped.set_ped_config_flag(Ped, 217, true) 
            native.ped.set_ped_config_flag(Ped, 279, true) 
            native.ped.set_ped_config_flag(Ped, 302, true) 
            native.ped.set_ped_config_flag(Ped, 340, true) 
            native.ped.set_ped_config_flag(Ped, 370, true) 
            native.ped.set_ped_config_flag(Ped, 72, true)
            native.ped.set_ped_config_flag(Ped, 72, true)
            native.ped.set_ped_combat_attributes(Ped, 68, true) 
            native.ped._set_ped_can_be_lassoed(Ped, false)
            native.ped.set_ped_can_be_targetted(Ped, false)
            native.ped.set_ped_can_ragdoll(Ped, false)
            native.entity.set_entity_heading(Ped, player_heading+180)
            native.ped.set_blocking_of_non_temporary_events(Ped, true)
        end
        end)





female_attach_sub:add_button("Parrot", {"A_C_Parrot_01\n*Just Chilling*"}, function()
    local player_ped <const> = native.player.player_ped_id()
    if native.entity.does_entity_exist(player_ped) then
        local posVec <const> = native.entity.get_entity_coords(player_ped, true, true)
        local player_heading =native.entity.get_entity_heading(player_ped)
        local Ped = spanw_ped(Peds["Parrot"], posVec)
        native.ped._equip_meta_ped_outfit_preset(Ped, 1, false)
        native.ped._set_random_outfit_variation(Ped, true)
        native.task.clear_ped_tasks_immediately(Ped, true, true)
        native.streaming.request_anim_dict(anim_dict[2])
        native.task.task_play_anim(Ped, anim_dict[2], anim_name[1], 1.0, 1.0, -1, 1, 0.0, false, 0, false, "", false)
        native.entity.freeze_entity_position(Ped, true)
        native.entity.attach_entity_to_entity(Ped, player_ped, FemaleBoneName["Right Shoulder"] ,0.0, -0.032, 0.12, 0.0, 15.0, 0.0, false, false, false, true, 0, true, false, false)
        native.ped.set_ped_config_flag(Ped, 61, true)  
        native.ped.set_ped_config_flag(Ped, 254, true)
        native.ped.set_ped_config_flag(Ped, 29, true)  
        native.ped.set_ped_config_flag(Ped, 54, true)  
        native.ped.set_ped_config_flag(Ped, 72, true)  
        native.ped.set_ped_config_flag(Ped, 77, true)  
        native.ped.set_ped_config_flag(Ped, 111, true) 
        native.ped.set_ped_config_flag(Ped, 113, true) 
        native.ped.set_ped_config_flag(Ped, 121, true) 
        native.ped.set_ped_config_flag(Ped, 137, true) 
        native.ped.set_ped_config_flag(Ped, 136, true) 
        native.ped.set_ped_config_flag(Ped, 192, true) 
        native.ped.set_ped_config_flag(Ped, 207, false)
        native.ped.set_ped_config_flag(Ped, 213, true) 
        native.ped.set_ped_config_flag(Ped, 217, true) 
        native.ped.set_ped_config_flag(Ped, 279, true) 
        native.ped.set_ped_config_flag(Ped, 302, true) 
        native.ped.set_ped_config_flag(Ped, 340, true) 
        native.ped.set_ped_config_flag(Ped, 370, true) 
        native.ped.set_ped_config_flag(Ped, 72, true)
        native.ped.set_ped_config_flag(Ped, 72, true)
        native.ped.set_ped_combat_attributes(Ped, 68, true) 
        native.ped._set_ped_can_be_lassoed(Ped, false)
        native.ped.set_ped_can_be_targetted(Ped, false)
        native.ped.set_ped_can_ragdoll(Ped, false)
        native.entity.set_entity_heading(Ped, player_heading+180)
        native.ped.set_blocking_of_non_temporary_events(Ped, true)
    end
    end)










































    male_attach_sub:add_separator("Right Shoulder")

    male_attach_sub:add_button("Squirrel", {"A_C_Squirrel_01\nwith config flag overkill"}, function()
        local player_ped <const> = native.player.player_ped_id()
        if native.entity.does_entity_exist(player_ped) then
            local posVec <const> = native.entity.get_entity_coords(player_ped, true, true)
            local Ped = spanw_ped(Peds["Squirrel"], posVec)
            native.ped._equip_meta_ped_outfit_preset(Ped, 1, false)
            native.ped._set_random_outfit_variation(Ped, true)
            native.task.clear_ped_tasks_immediately(Ped, true, true)
            native.entity.freeze_entity_position(Ped, true)
            native.entity.attach_entity_to_entity(Ped, player_ped, MaleBoneName["Right Shoulder"], -0.03, -0.03, 0.1, 0.0,0.0, -30.0, false, false, false, true, 0, true, false, false)
            native.ped.set_ped_config_flag(Ped, 61, true)  
            native.ped.set_ped_config_flag(Ped, 254, true) 
            native.ped.set_ped_config_flag(Ped, 29, true)  
            native.ped.set_ped_config_flag(Ped, 54, true)  
            native.ped.set_ped_config_flag(Ped, 72, true)  
            native.ped.set_ped_config_flag(Ped, 77, true)  
            native.ped.set_ped_config_flag(Ped, 111, true) 
            native.ped.set_ped_config_flag(Ped, 113, true) 
            native.ped.set_ped_config_flag(Ped, 121, true) 
            native.ped.set_ped_config_flag(Ped, 137, true) 
            native.ped.set_ped_config_flag(Ped, 136, true) 
            native.ped.set_ped_config_flag(Ped, 192, true) 
            native.ped.set_ped_config_flag(Ped, 207, false)
            native.ped.set_ped_config_flag(Ped, 213, true) 
            native.ped.set_ped_config_flag(Ped, 217, true) 
            native.ped.set_ped_config_flag(Ped, 279, true) 
            native.ped.set_ped_config_flag(Ped, 302, true) 
            native.ped.set_ped_config_flag(Ped, 340, true) 
            native.ped.set_ped_config_flag(Ped, 370, true) 
            native.ped.set_ped_config_flag(Ped, 72, true)
            native.ped.set_ped_config_flag(Ped, 72, true)
            native.ped.set_ped_combat_attributes(Ped, 68, true) 
            native.ped._set_ped_can_be_lassoed(Ped, false)
            native.ped.set_ped_can_be_targetted(Ped, false)
            native.ped.set_ped_can_ragdoll(Ped, false)
            native.streaming.set_model_as_no_longer_needed(Ped)
            native.ped.set_blocking_of_non_temporary_events(Ped, true)
        end
    end)
    
    
    male_attach_sub:add_button("Carolina Parakeet", {"A_C_CarolinaParakeet_01\nwith config flag overkil"}, function()
        local player_ped <const> = native.player.player_ped_id()
        if native.entity.does_entity_exist(player_ped) then
            local posVec <const> = native.entity.get_entity_coords(player_ped, true, true)
            local Ped = spanw_ped(Peds["Parakeet"], posVec)
            native.ped._equip_meta_ped_outfit_preset(Ped, 1, false)
            native.ped._set_random_outfit_variation(Ped, true)
            native.task.clear_ped_tasks_immediately(Ped, true, true)
            native.entity.freeze_entity_position(Ped, true)
            native.entity.attach_entity_to_entity(Ped, player_ped, MaleBoneName["Right Shoulder"], -0.00, -0.012, 0.07, 0.0,0.0, 0.0, false, false, false, true, 0, true, false, false)
            native.ped.set_ped_config_flag(Ped, 61, true)  
            native.ped.set_ped_config_flag(Ped, 254, true) 
            native.ped.set_ped_config_flag(Ped, 29, true)  
            native.ped.set_ped_config_flag(Ped, 54, true)  
            native.ped.set_ped_config_flag(Ped, 72, true)  
            native.ped.set_ped_config_flag(Ped, 77, true)  
            native.ped.set_ped_config_flag(Ped, 111, true) 
            native.ped.set_ped_config_flag(Ped, 113, true) 
            native.ped.set_ped_config_flag(Ped, 121, true) 
            native.ped.set_ped_config_flag(Ped, 137, true) 
            native.ped.set_ped_config_flag(Ped, 136, true) 
            native.ped.set_ped_config_flag(Ped, 192, true) 
            native.ped.set_ped_config_flag(Ped, 207, false)
            native.ped.set_ped_config_flag(Ped, 213, true) 
            native.ped.set_ped_config_flag(Ped, 217, true) 
            native.ped.set_ped_config_flag(Ped, 279, true) 
            native.ped.set_ped_config_flag(Ped, 302, true) 
            native.ped.set_ped_config_flag(Ped, 340, true) 
            native.ped.set_ped_config_flag(Ped, 370, true) 
            native.ped.set_ped_config_flag(Ped, 72, true)
            native.ped.set_ped_config_flag(Ped, 72, true)
            native.ped.set_ped_combat_attributes(Ped, 68, true) 
            native.ped._set_ped_can_be_lassoed(Ped, false)
            native.ped.set_ped_can_be_targetted(Ped, false)
            native.ped.set_ped_can_ragdoll(Ped, false)
            native.streaming.set_model_as_no_longer_needed(Ped)
            native.ped.set_blocking_of_non_temporary_events(Ped, true)
        end
    end)

    
                                                                                                         --[[  
                                                                                                              Offsets are the position where you want to attach yourself to the player.
                                                                                                                  PosX - left/right
                                                                                                                  PosY - forward/backward
                                                                                                                  PosZ - up/down
                                                                                                              Rotations are the rotation of the player. They rotate you around x, y, z axis.
                                                                                                           
                                                                                                              You can adjust position in PosX, PosY, PosZ, RotX, RotY, RotZ
                                                                                                        ]]
    
    male_attach_sub:add_button("Parrot", {"A_C_Parrot_01\nwith config flag overkill"}, function()
        local player_ped <const> = native.player.player_ped_id()
        if native.entity.does_entity_exist(player_ped) then
            local posVec <const> = native.entity.get_entity_coords(player_ped, true, true)
            local Ped = spanw_ped(Peds["Parrot"], posVec)
            native.ped._equip_meta_ped_outfit_preset(Ped, 1, false)
            native.ped._set_random_outfit_variation(Ped, true)
            native.task.clear_ped_tasks_immediately(Ped, true, true)
            native.streaming.request_anim_dict(anim_dict[2])
            native.task.task_play_anim(Ped, anim_dict[2], anim_name[1], 1.0, 1.0, -1, 1, 0.0, false, 0, false, "", false)
            native.entity.freeze_entity_position(Ped, true)
            native.entity.attach_entity_to_entity(Ped, player_ped, MaleBoneName["Right Shoulder"], 0.045, -0.05, 0.12, 0.0, 15.0, 0.0, false, false, false, true, 0, true, false, false)
            native.ped.set_ped_config_flag(Ped, 61, true)  
            native.ped.set_ped_config_flag(Ped, 254, true) 
            native.ped.set_ped_config_flag(Ped, 29, true)  
            native.ped.set_ped_config_flag(Ped, 54, true)  
            native.ped.set_ped_config_flag(Ped, 72, true)  
            native.ped.set_ped_config_flag(Ped, 77, true)  
            native.ped.set_ped_config_flag(Ped, 111, true) 
            native.ped.set_ped_config_flag(Ped, 113, true) 
            native.ped.set_ped_config_flag(Ped, 121, true) 
            native.ped.set_ped_config_flag(Ped, 137, true) 
            native.ped.set_ped_config_flag(Ped, 136, true) 
            native.ped.set_ped_config_flag(Ped, 192, true) 
            native.ped.set_ped_config_flag(Ped, 207, false)
            native.ped.set_ped_config_flag(Ped, 213, true) 
            native.ped.set_ped_config_flag(Ped, 217, true) 
            native.ped.set_ped_config_flag(Ped, 279, true) 
            native.ped.set_ped_config_flag(Ped, 302, true) 
            native.ped.set_ped_config_flag(Ped, 340, true) 
            native.ped.set_ped_config_flag(Ped, 370, true) 
            native.ped.set_ped_config_flag(Ped, 72, true)
            native.ped.set_ped_config_flag(Ped, 72, true)
            native.ped.set_ped_combat_attributes(Ped, 68, true)
            native.ped._set_ped_can_be_lassoed(Ped, false)
            native.ped.set_ped_can_be_targetted(Ped, false)
            native.ped.set_ped_can_ragdoll(Ped, false)
            native.streaming.set_model_as_no_longer_needed(Ped)
            native.ped.set_blocking_of_non_temporary_events(Ped, true)
        end
    end)















































































    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
 
    
    





































    
    
    
    
    


ability_sub:add_separator("INF DEAD EYE")

ability_sub:add_toggle("DANK's Special Dead Eye", { "" }, function(state)
    thread.create(function(ability)
        if state == true then
            native.player._set_local_player_persona_ability_flag(4, true)
            native.player._set_local_player_persona_ability_flag(5, true)
            native.player._set_local_player_persona_ability_flag(7, true)
            native.player._set_local_player_persona_ability_flag(8, true)
            native.player._set_local_player_persona_ability_flag(9, true)
            native.player._set_local_player_persona_ability_flag(10, true)
            native.player._set_local_player_persona_ability_flag(12, true)
            native.player._set_local_player_persona_ability_flag(18, true)
            native.player._set_local_player_persona_ability_flag(21, true)
            native.player._set_local_player_persona_ability_flag(22, true)
            native.player._set_local_player_persona_ability_flag(27, true)
            native.player._set_local_player_persona_ability_flag(28, true)

        else
            native.player._set_local_player_persona_ability_flag(0, false)
            native.player._set_local_player_persona_ability_flag(1, false)
            native.player._set_local_player_persona_ability_flag(2, false)
            native.player._set_local_player_persona_ability_flag(3, false)
            native.player._set_local_player_persona_ability_flag(4, false)
            native.player._set_local_player_persona_ability_flag(5, false)
            native.player._set_local_player_persona_ability_flag(6, false)
            native.player._set_local_player_persona_ability_flag(7, false)
            native.player._set_local_player_persona_ability_flag(8, false)
            native.player._set_local_player_persona_ability_flag(9, false)
            native.player._set_local_player_persona_ability_flag(10, false)
            native.player._set_local_player_persona_ability_flag(11, false)
            native.player._set_local_player_persona_ability_flag(12, false)
            native.player._set_local_player_persona_ability_flag(13, false)
            native.player._set_local_player_persona_ability_flag(14, false)
            native.player._set_local_player_persona_ability_flag(15, false)
            native.player._set_local_player_persona_ability_flag(16, false)
            native.player._set_local_player_persona_ability_flag(17, false)
            native.player._set_local_player_persona_ability_flag(18, false)
            native.player._set_local_player_persona_ability_flag(19, false)
            native.player._set_local_player_persona_ability_flag(20, false)
            native.player._set_local_player_persona_ability_flag(21, false)
            native.player._set_local_player_persona_ability_flag(22, false)
            native.player._set_local_player_persona_ability_flag(23, false)
            native.player._set_local_player_persona_ability_flag(24, false)
            native.player._set_local_player_persona_ability_flag(25, false)
            native.player._set_local_player_persona_ability_flag(26, false)
            native.player._set_local_player_persona_ability_flag(27, false)
            native.player._set_local_player_persona_ability_flag(28, false)
            native.player._set_local_player_persona_ability_flag(29, false)
            thread.yield()
        end
    end)
end)

ability_sub:add_separator("ALL ABILITIES")
    
ability_sub:add_toggle("Add All Abilities", { "You will gain all abilities mentioned above" }, function(state)
    thread.create(function(ability)
        if state == true then
            native.player._set_local_player_persona_ability_flag(0, true)
            native.player._set_local_player_persona_ability_flag(1, true)
            native.player._set_local_player_persona_ability_flag(2, true)
            native.player._set_local_player_persona_ability_flag(3, true)
            native.player._set_local_player_persona_ability_flag(4, true)
            native.player._set_local_player_persona_ability_flag(5, true)
            native.player._set_local_player_persona_ability_flag(6, true)
            native.player._set_local_player_persona_ability_flag(7, true)
            native.player._set_local_player_persona_ability_flag(8, true)
            native.player._set_local_player_persona_ability_flag(9, true)
            native.player._set_local_player_persona_ability_flag(10, true)
            native.player._set_local_player_persona_ability_flag(11, true)
            native.player._set_local_player_persona_ability_flag(12, true)
            native.player._set_local_player_persona_ability_flag(13, true)
            native.player._set_local_player_persona_ability_flag(14, true)
            native.player._set_local_player_persona_ability_flag(15, true)
            native.player._set_local_player_persona_ability_flag(16, true)
            native.player._set_local_player_persona_ability_flag(17, true)
            native.player._set_local_player_persona_ability_flag(18, true)
            native.player._set_local_player_persona_ability_flag(19, true)
            native.player._set_local_player_persona_ability_flag(20, true)
            native.player._set_local_player_persona_ability_flag(21, true)
            native.player._set_local_player_persona_ability_flag(22, true)
            native.player._set_local_player_persona_ability_flag(23, true)
            native.player._set_local_player_persona_ability_flag(24, true)
            native.player._set_local_player_persona_ability_flag(25, true)
            native.player._set_local_player_persona_ability_flag(26, true)
            native.player._set_local_player_persona_ability_flag(27, true)
            native.player._set_local_player_persona_ability_flag(28, true)
            native.player._set_local_player_persona_ability_flag(29, true)
        else
            native.player._set_local_player_persona_ability_flag(0, false)
            native.player._set_local_player_persona_ability_flag(1, false)
            native.player._set_local_player_persona_ability_flag(2, false)
            native.player._set_local_player_persona_ability_flag(3, false)
            native.player._set_local_player_persona_ability_flag(4, false)
            native.player._set_local_player_persona_ability_flag(5, false)
            native.player._set_local_player_persona_ability_flag(6, false)
            native.player._set_local_player_persona_ability_flag(7, false)
            native.player._set_local_player_persona_ability_flag(8, false)
            native.player._set_local_player_persona_ability_flag(9, false)
            native.player._set_local_player_persona_ability_flag(10, false)
            native.player._set_local_player_persona_ability_flag(11, false)
            native.player._set_local_player_persona_ability_flag(12, false)
            native.player._set_local_player_persona_ability_flag(13, false)
            native.player._set_local_player_persona_ability_flag(14, false)
            native.player._set_local_player_persona_ability_flag(15, false)
            native.player._set_local_player_persona_ability_flag(16, false)
            native.player._set_local_player_persona_ability_flag(17, false)
            native.player._set_local_player_persona_ability_flag(18, false)
            native.player._set_local_player_persona_ability_flag(19, false)
            native.player._set_local_player_persona_ability_flag(20, false)
            native.player._set_local_player_persona_ability_flag(21, false)
            native.player._set_local_player_persona_ability_flag(22, false)
            native.player._set_local_player_persona_ability_flag(23, false)
            native.player._set_local_player_persona_ability_flag(24, false)
            native.player._set_local_player_persona_ability_flag(25, false)
            native.player._set_local_player_persona_ability_flag(26, false)
            native.player._set_local_player_persona_ability_flag(27, false)
            native.player._set_local_player_persona_ability_flag(28, false)
            native.player._set_local_player_persona_ability_flag(29, false)
            thread.yield()
        end
    end)
end)


ability_sub:add_separator("INDIVIDUAL ABILITIES")
    
    ability_sub:add_toggle("CAN_AUTOESCAPE_FROM_LASSO", { "" }, function(state)
        thread.create(function(ability)
            if state == true then
                native.player._set_local_player_persona_ability_flag(0, true)
            else
                native.player._set_local_player_persona_ability_flag(0, false)
                thread.yield()
            end
        end)
    end)
    
    ability_sub:add_toggle("HAT_BLOCKS_FIRST_HEADSHOT", { "" }, function(state)
        thread.create(function(ability)
            if state == true then
                native.player._set_local_player_persona_ability_flag(1, true)
            else
                native.player._set_local_player_persona_ability_flag(1, false)
                thread.yield()
            end
        end)
    end)
    
    ability_sub:add_toggle("FULL_AUTO_FOR_ALL_WEAPONS", { "" }, function(state)
        thread.create(function(ability)
            if state == true then
                native.player._set_local_player_persona_ability_flag(2, true)
            else
                native.player._set_local_player_persona_ability_flag(2, false)
                thread.yield()
            end
        end)
    end)
    
    ability_sub:add_toggle("MIGHT_LIVE_AFTER_DEADLY_DAMAGE", { "" }, function(state)
        thread.create(function(ability)
            if state == true then
                native.player._set_local_player_persona_ability_flag(3, true)
            else
                native.player._set_local_player_persona_ability_flag(3, false)
                thread.yield()
            end
        end)
    end)
    
    ability_sub:add_toggle("IGNORE_AIM_BEFORE_FIRING_RESTRICTIONS", { "" }, function(state)
        thread.create(function(ability)
            if state == true then
                native.player._set_local_player_persona_ability_flag(4, true)
            else
                native.player._set_local_player_persona_ability_flag(4, false)
                thread.yield()
            end
        end)
    end)
    
    ability_sub:add_toggle("DEADEYE_INSTANT_RELOAD", { "" }, function(state)
        thread.create(function(ability)
            if state == true then
                native.player._set_local_player_persona_ability_flag(5, true)
            else
                native.player._set_local_player_persona_ability_flag(5, false)
                thread.yield()
            end
        end)
    end)
    
    ability_sub:add_toggle("USE_PHOSPHOROUS_ROUNDS", { "" }, function(state)
        thread.create(function(ability)
            if state == true then
                native.player._set_local_player_persona_ability_flag(6, true)
            else
                native.player._set_local_player_persona_ability_flag(6, false)
                thread.yield()
            end
        end)
    end)
    
    ability_sub:add_toggle("CONT_DEADEYE_ON_TAKING_COVER", { "" }, function(state)
        thread.create(function(ability)
            if state == true then
                native.player._set_local_player_persona_ability_flag(7, true)
            else
                native.player._set_local_player_persona_ability_flag(7, false)
                thread.yield()
            end
        end)
    end)
    ability_sub:add_toggle("CONT_DEADEYE_ON_RELOAD", { "" }, function(state)
        thread.create(function(ability)
            if state == true then
                native.player._set_local_player_persona_ability_flag(8, true)
            else
                native.player._set_local_player_persona_ability_flag(8, false)
                thread.yield()
            end
        end)
    end)
    
    ability_sub:add_toggle("CONT_DEADEYE_ON_SHOOTING", { "" }, function(state)
        thread.create(function(ability)
            if state == true then
                native.player._set_local_player_persona_ability_flag(9, true)
            else
                native.player._set_local_player_persona_ability_flag(9, false)
                thread.yield()
            end
        end)
    end)
    
    ability_sub:add_toggle("CONT_DEADEYE_ON_EXITING_AIM", { "" }, function(state)
        thread.create(function(ability)
            if state == true then
                native.player._set_local_player_persona_ability_flag(10, true)
            else
                native.player._set_local_player_persona_ability_flag(10, false)
                thread.yield()
            end
        end)
    end)
    
    ability_sub:add_toggle("DISABLE_PLAYER_CANCELLING_DEADEYE", { "" }, function(state)
        thread.create(function(ability)
            if state == true then
                native.player._set_local_player_persona_ability_flag(11, true)
            else
                native.player._set_local_player_persona_ability_flag(11, false)
                thread.yield()
            end
        end)
    end)
    
    ability_sub:add_toggle("CONT_DEADEYE_ON_RAGDOLL", { "" }, function(state)
        thread.create(function(ability)
            if state == true then
                native.player._set_local_player_persona_ability_flag(12, true)
            else
                native.player._set_local_player_persona_ability_flag(12, false)
                thread.yield()
            end
        end)
    end)
    
    ability_sub:add_toggle("USE_EXPLOSIVE_ROUNDS", { "" }, function(state)
        thread.create(function(ability)
            if state == true then
                native.player._set_local_player_persona_ability_flag(13, true)
            else
                native.player._set_local_player_persona_ability_flag(13, false)
                thread.yield()
            end
        end)
    end)
    
    ability_sub:add_toggle("EXIT_DEADEYE_ON_TAKING_DAMAGE", { "" }, function(state)
        thread.create(function(ability)
            if state == true then
                native.player._set_local_player_persona_ability_flag(14, true)
            else
                native.player._set_local_player_persona_ability_flag(14, false)
                thread.yield()
            end
        end)
    end)
    
    ability_sub:add_toggle("CARRY_TWO_MONEYBAGS", { "" }, function(state)
        thread.create(function(ability)
            if state == true then
                native.player._set_local_player_persona_ability_flag(15, true)
            else
                native.player._set_local_player_persona_ability_flag(15, false)
                thread.yield()
            end
        end)
    end)
    
    ability_sub:add_toggle("ABILITY_LONG_PICK_HERBS", { "" }, function(state)
        thread.create(function(ability)
            if state == true then
                native.player._set_local_player_persona_ability_flag(16, true)
            else
                native.player._set_local_player_persona_ability_flag(16, false)
                thread.yield()
            end
        end)
    end)
    
    ability_sub:add_toggle("CONT_DEADEYE_ON_SPRINTING", { "" }, function(state)
        thread.create(function(ability)
            if state == true then
                native.player._set_local_player_persona_ability_flag(18, true)
            else
                native.player._set_local_player_persona_ability_flag(18, false)
                thread.yield()
            end
        end)
    end)
    
    ability_sub:add_toggle("CANT_DEAL_HEADSHOTS", { "" }, function(state)
        thread.create(function(ability)
            if state == true then
                native.player._set_local_player_persona_ability_flag(19, true)
            else
                native.player._set_local_player_persona_ability_flag(19, false)
                thread.yield()
            end
        end)
    end)
    
    ability_sub:add_toggle("HANGMAN", { "" }, function(state)
        thread.create(function(ability)
            if state == true then
                native.player._set_local_player_persona_ability_flag(20, true)
            else
                native.player._set_local_player_persona_ability_flag(20, false)
                thread.yield()
            end
        end)
    end)
    
    ability_sub:add_toggle("ABILITY_UNBREAKABLE_LASSO", { "" }, function(state)
        thread.create(function(ability)
            if state == true then
                native.player._set_local_player_persona_ability_flag(17, true)
            else
                native.player._set_local_player_persona_ability_flag(17, false)
                thread.yield()
            end
        end)
    end)
    
    ability_sub:add_toggle("ALLOW_DEADEYE_WITH_MELEE_WEAPONS", { "" }, function(state)
        thread.create(function(ability)
            if state == true then
                native.player._set_local_player_persona_ability_flag(21, true)
            else
                native.player._set_local_player_persona_ability_flag(21, false)
                thread.yield()
            end
        end)
    end)
    
    ability_sub:add_toggle("ALLOW_DEADEYE_WHILE_UNARMED", { "" }, function(state)
        thread.create(function(ability)
            if state == true then
                native.player._set_local_player_persona_ability_flag(22, true)
            else
                native.player._set_local_player_persona_ability_flag(22, false)
                thread.yield()
            end
        end)
    end)
    
    
    ability_sub:add_toggle("DISABLE_DEADEYE_PERFECT_ACCURACY", { "" }, function(state)
        thread.create(function(ability)
            if state == true then
                native.player._set_local_player_persona_ability_flag(23, true)
            else
                native.player._set_local_player_persona_ability_flag(23, false)
                thread.yield()
            end
        end)
    end)
    
    ability_sub:add_toggle("CANT_DEAL_HEADSHOTS_TO_PLAYERS", { "" }, function(state)
        thread.create(function(ability)
            if state == true then
                native.player._set_local_player_persona_ability_flag(24, true)
            else
                native.player._set_local_player_persona_ability_flag(24, false)
                thread.yield()
            end
        end)
    end)
    
    ability_sub:add_toggle("CANT_DEAL_CRITICAL_DAMAGE", { "" }, function(state)
        thread.create(function(ability)
            if state == true then
                native.player._set_local_player_persona_ability_flag(25, true)
            else
                native.player._set_local_player_persona_ability_flag(25, false)
                thread.yield()
            end
        end)
    end)
    
    ability_sub:add_toggle("CANT_DEAL_CRITICAL_DAMAGE_TO_PLAYERS", { "" }, function(state)
        thread.create(function(ability)
            if state == true then
                native.player._set_local_player_persona_ability_flag(26, true)
            else
                native.player._set_local_player_persona_ability_flag(26, false)
                thread.yield()
            end
        end)
    end)
    
    ability_sub:add_toggle("ALLOW_EAGLEEYE_IN_COMBAT", { "" }, function(state)
        thread.create(function(ability)
            if state == true then
                native.player._set_local_player_persona_ability_flag(27, true)
            else
                native.player._set_local_player_persona_ability_flag(27, false)
                thread.yield()
            end
        end)
    end)
    
    ability_sub:add_toggle("CONT_EAGLEEYE_ON_SPRINT", { "" }, function(state)
        thread.create(function(ability)
            if state == true then
                native.player._set_local_player_persona_ability_flag(28, true)
            else
                native.player._set_local_player_persona_ability_flag(28, false)
                thread.yield()
            end
        end)
    end)
    
    ability_sub:add_toggle("SUPPRESS_LENGENDARY_EAGLEEYE_TRAIL_COLOR", { "" }, function(state)
        thread.create(function(ability)
            if state == true then
                native.player._set_local_player_persona_ability_flag(29, true)
            else
                native.player._set_local_player_persona_ability_flag(29, false)
                thread.yield()
            end
        end)
    end)
    














































































    
    
    




  
   
    
    local function request_model(hash)
        local timer <const> = time.unix_milliseconds() + 1000
        while not native.streaming.has_model_loaded(hash) and timer > time.unix_milliseconds() do
            native.streaming.request_model(hash, true)
            thread.yield()
        end
     end
     local function spanw_ped(hash,posVecX, posVecY, posVecZ)
        request_model(hash)
        local player = native.player.player_ped_id()
        local posVec = native.entity.get_offset_from_entity_in_world_coords(player, 0, 1.0, 0)
        local ped = native.ped.create_ped(hash, posVec.x, posVec.y, posVec.z-1, 0, true, true, true, false)
        if ped   then
            return ped
            else
               return false,toast.add_info("Spawn Failed")
            end
         end
    
    mount_sub:add_button("Spawn Fire Horse [First Version]", {}, function ()
    toast.add_info("Fire Horse Created!")
        local playerPed = native.player.get_player_ped(0)
      
        local posVec = native.entity.get_offset_from_entity_in_world_coords(playerPed, 0, 0, 0)
        local object1 = native.object.create_object_no_offset(0x14529D92,posVec.x, posVec.y, posVec.z, true, true, false, false)
        local object2 = native.object.create_object_no_offset(0x14529D92,posVec.x, posVec.y, posVec.z, true, true, false, false)
        local object3 = native.object.create_object_no_offset(0x64AAA69C,posVec.x, posVec.y, posVec.z, true, true, false, false)
        local object4 = native.object.create_object_no_offset(0x14529D92,posVec.x, posVec.y, posVec.z, true, true, false, false)
        local object5 = native.object.create_object_no_offset(0x14529D92,posVec.x, posVec.y, posVec.z, true, true, false, false)
        local object6 = native.object.create_object_no_offset(0x28D1468F,posVec.x, posVec.y, posVec.z, true, true, false, false)
        local object7 = native.object.create_object_no_offset(0x28D1468F,posVec.x, posVec.y, posVec.z, true, true, false, false)
        local object8 = native.object.create_object_no_offset(0x64AAA69C,posVec.x, posVec.y, posVec.z, true, true, false, false)
        local object9 = native.object.create_object_no_offset(0x64AAA69C,posVec.x, posVec.y, posVec.z, true, true, false, false)
        local object10 = native.object.create_object_no_offset(0x64AAA69C,posVec.x, posVec.y, posVec.z, true, true, false, false)
        local object11 = native.object.create_object_no_offset(0x28D1468F,posVec.x, posVec.y, posVec.z, true, true, false, false)
        local object12= native.object.create_object_no_offset(0x14529D92,posVec.x, posVec.y, posVec.z, true, true, false, false)
        local object13 = native.object.create_object_no_offset(0x64AAA69C,posVec.x, posVec.y, posVec.z, true, true, false, false)
        local object14 = native.object.create_object_no_offset(0x64AAA69C,posVec.x, posVec.y, posVec.z, true, true, false, false)
        local object15 = native.object.create_object_no_offset(0x64AAA69C,posVec.x, posVec.y, posVec.z, true, true, false, false)
        local object16 = native.object.create_object_no_offset(0xD696159F,posVec.x, posVec.y, posVec.z, true, true, false, false)
        local object17 = native.object.create_object_no_offset(0xD696159F,posVec.x, posVec.y, posVec.z, true, true, false, false)
        local object18 = native.object.create_object_no_offset(0xD696159F,posVec.x, posVec.y, posVec.z, true, true, false, false)
        local object19 = native.object.create_object_no_offset(0xD696159F,posVec.x, posVec.y, posVec.z, true, true, false, false)
        local object20 = native.object.create_object_no_offset(0xD696159F,posVec.x, posVec.y, posVec.z, true, true, false, false)
        local object21 = native.object.create_object_no_offset(0xD696159F,posVec.x, posVec.y, posVec.z, true, true, false, false)
        local object22 = native.object.create_object_no_offset(0xD696159F,posVec.x, posVec.y, posVec.z, true, true, false, false)
        local object23 = native.object.create_object_no_offset(0xD696159F,posVec.x, posVec.y, posVec.z, true, true, false, false)
        local object24 = native.object.create_object_no_offset(0xD696159F,posVec.x, posVec.y, posVec.z, true, true, false, false)
        local object25 = native.object.create_object_no_offset(0x14529D92,posVec.x, posVec.y, posVec.z, true, true, false, false)
        local object26 = native.object.create_object_no_offset(0x14529D92,posVec.x, posVec.y, posVec.z, true, true, false, false)
        local object27 = native.object.create_object_no_offset(0x845743DE,posVec.x, posVec.y, posVec.z, true, true, false, false)
        local object28 = native.object.create_object_no_offset(0x1298EF27,posVec.x, posVec.y, posVec.z, true, true, false, false)
        local object29 = native.object.create_object_no_offset(0x1298EF27,posVec.x, posVec.y, posVec.z, true, true, false, false)
        local object30 = native.object.create_object_no_offset(0xD696159F,posVec.x, posVec.y, posVec.z, true, true, false, false)
        local object31 = native.object.create_object_no_offset(0x14529D92,posVec.x, posVec.y, posVec.z, true, true, false, false)
        local object32 = native.object.create_object_no_offset(0x14529D92,posVec.x, posVec.y, posVec.z, true, true, false, false)
        local object33 = native.object.create_object_no_offset(0x64AAA69C,posVec.x, posVec.y, posVec.z, true, true, false, false)
        local object34 = native.object.create_object_no_offset(0x64AAA69C,posVec.x, posVec.y, posVec.z, true, true, false, false)
        local object35 = native.object.create_object_no_offset(0x64AAA69C,posVec.x, posVec.y, posVec.z, true, true, false, false)
        local object36 = native.object.create_object_no_offset(0x64AAA69C,posVec.x, posVec.y, posVec.z, true, true, false, false)
    
        ped = spanw_ped(0xB57D0193,posVec)
        native.ped._set_random_outfit_variation(ped, true)
      
    
    
        native.entity.attach_entity_to_entity(object1, ped, 96,0.0, 0.0, 0.0, 0.0, 0.0, 86.399979, false, false, false, true, 0, true, false, false)
        native.entity.attach_entity_to_entity(object2, ped, 96,0.01,-0.03, 0.01, -6.399998, -247.999619, 92.799973, false, false, false, true, 0, true, false, false)
        native.entity.attach_entity_to_entity(object3, ped, 406,0.09,-0.15, -0.09, 343.199677, 192.300262, 60.999969, false, false, false, true, 0, true, false, false)
        native.entity.attach_entity_to_entity(object4, ped, 143,-0.01,-0.07, -0.02, 135.899979, -264.999603, 241.899780, false, false, false, true, 0, true, false, false)
        native.entity.attach_entity_to_entity(object5, ped, 143,-0.06,0.07, 0.01, 155.399948, -264.999603, 241.899780, false, false, false, true, 0, true, false, false)
        native.entity.attach_entity_to_entity(object6, ped, 12,-0.22,0.00, 0.04, 3.899998, 54.599972, 89.699974, false, false, false, true, 0, true, false, false)
        native.entity.attach_entity_to_entity(object7, ped, 12,-0.06,-0.06, 0.01, 89.699974, 272.999756, 6.599626, false, false, false, true, 0, true, false, false)
        native.entity.attach_entity_to_entity(object8, ped, 20,0.05,-0.08, -0.09, 0.000008, 360.000000, 205.299881, false, false, false, true, 0, true, false, false)
        native.entity.attach_entity_to_entity(object9, ped, 403,0.20,-0.15, -0.03, 0.000008, -168.900299, 220.899857, false, false, false, true, 0, true, false, false)
        native.entity.attach_entity_to_entity(object10, ped, 416,-0.20,0.14, 0.00, 155.999954, 215.700226, 99.999985, false, false, false, true, 0, true, false, false)
        native.entity.attach_entity_to_entity(object11, ped, 12,-0.39,0.19, 0.03, 74.099968, 272.999756, 6.599626, false, false, false, true, 0, true, false, false)
        native.entity.attach_entity_to_entity(object12, ped, 414,0.08,-0.06, 0.12, 27.299988, 19.499992, 129.299988, false, false, false, true, 0, true, false, false)
        native.entity.attach_entity_to_entity(object13, ped, 95,0.03,0.09, 0.04, 0.000001, 185.599884,-6.399998, false, false, false, true, 0, true, false, false)
        native.entity.attach_entity_to_entity(object14, ped, 403,0.05,-0.15, 0.03, 0.000008, -168.900299,220.899857, false, false, false, true, 0, true, false, false)
        native.entity.attach_entity_to_entity(object15, ped, 415,0.08,-0.09, 0.03,-7.799989, 2.699627,220.899857, false, false, false, true, 0, true, false, false)
        native.entity.attach_entity_to_entity(object16, ped, 11,-0.38,-0.18, 0.03,91.799965, 25.499989,72.199951, false, false, false, true, 0, true, false, false)
        native.entity.attach_entity_to_entity(object17, ped, 11,-0.06,0.06, 0.03,91.799965, 25.499989,20.399990, false, false, false, true, 0, true, false, false)
        native.entity.attach_entity_to_entity(object18, ped, 11,-0.06,0.06, 0.03,91.799965, 25.499989,20.399990, false, false, false, true, 0, true, false, false)
        native.entity.attach_entity_to_entity(object19, ped, 12,-0.20,-0.14, 0.02,91.799965, 25.499989,86.999939, false, false, false, true, 0, true, false, false)
        native.entity.attach_entity_to_entity(object20, ped, 12,-0.30,-0.11, 0.03,91.799965, 25.499989,86.999939, false, false, false, true, 0, true, false, false)
        native.entity.attach_entity_to_entity(object21, ped, 13,-0.15,-0.01, 0.03,91.799965, 25.499989,72.199951, false, false, false, true, 0, true, false, false)
        native.entity.attach_entity_to_entity(object22, ped, 13,-0.24,0.01, 0.03,91.799965, 25.499989,72.199951, false, false, false, true, 0, true, false, false)
        native.entity.attach_entity_to_entity(object23, ped, 11,0.10,0.17, 0.03,91.799965, 25.499989,-60.999954, false, false, false, true, 0, true, false, false)
        native.entity.attach_entity_to_entity(object24, ped, 11,-0.27,0.02, 0.03,91.799965, 25.499989,20.399990, false, false, false, true, 0, true, false, false)
        native.entity.attach_entity_to_entity(object25, ped, 410,0.07,-0.12, -0.05,38.399990,-241.599625,159.999908, false, false, false, true, 0, true, false, false)
        native.entity.attach_entity_to_entity(object26, ped, 416,0.21,0.13, 0.05,-5.099998,91.799965,25.499977, false, false, false, true, 0, true, false, false)
        native.entity.attach_entity_to_entity(object27, ped, 0,0.00,0.00, 0.00,0.000000,0.000000,0.000000, false, false, false, true, 0, true, false, false)
        native.entity.attach_entity_to_entity(object28, ped, 7,0.31,-0.14, 0.10,0.000000,0.000000,-0.300004, false, false, false, true, 0, true, false, false)
        native.entity.attach_entity_to_entity(object29, ped, 194,0.14,-0.10, 0.08,82.499947,119.999908,-7.799999, false, false, false, true, 0, true, false, false)
        native.entity.attach_entity_to_entity(object30, ped, 314,0.14,-0.10, -0.12,82.499947,44.999973,74.699951, false, false, false, true, 0, true, false, false)
        native.entity.attach_entity_to_entity(object31, ped, 410,-0.08,0.15, -0.08,87.799988,-259.699615,156.099915, false, false, false, true, 0, true, false, false)
        native.entity.attach_entity_to_entity(object32, ped, 410,-0.08,-0.03, 0.01,102.399963,-292.799744,15.999996, false, false, false, true, 0, true, false, false)
        native.entity.attach_entity_to_entity(object33, ped, 176,0.00,0.07, 0.19,15.599996,-275.600098,6.399999, false, false, false, true, 0, true, false, false)
        native.entity.attach_entity_to_entity(object34, ped, 201,0.03,-0.01, 0.02,-3.899996,188.400269,76.599976, false, false, false, true, 0, true, false, false)
        native.entity.attach_entity_to_entity(object35, ped, 24,0.13,0.04, -0.01,7.799997,188.400269,33.699986, false, false, false, true, 0, true, false, false)
        native.entity.attach_entity_to_entity(object36, ped, 416,0.02,-0.06, 0.12,187.199905,188.400269,49.299976, false, false, false, true, 0, true, false, false)
    
    
        native.entity.set_entity_invincible(ped, true)
    
        
        native.entity.set_entity_invincible(object1, true)
        native.entity.set_entity_invincible(object2, true)
        native.entity.set_entity_invincible(object3, true)
        native.entity.set_entity_invincible(object4, true)
        native.entity.set_entity_invincible(object5, true)
        native.entity.set_entity_invincible(object6, true)
        native.entity.set_entity_invincible(object7, true)
        native.entity.set_entity_invincible(object8, true)
        native.entity.set_entity_invincible(object9, true)
        native.entity.set_entity_invincible(object10, true)
        native.entity.set_entity_invincible(object11, true)
        native.entity.set_entity_invincible(object12, true)
        native.entity.set_entity_invincible(object13, true)
        native.entity.set_entity_invincible(object14, true)
        native.entity.set_entity_invincible(object15, true)
        native.entity.set_entity_invincible(object16, true)
        native.entity.set_entity_invincible(object17, true)
        native.entity.set_entity_invincible(object18, true)
        native.entity.set_entity_invincible(object19, true)
        native.entity.set_entity_invincible(object20, true)
        native.entity.set_entity_invincible(object21, true)
        native.entity.set_entity_invincible(object22, true)
        native.entity.set_entity_invincible(object23, true)
        native.entity.set_entity_invincible(object24, true)
        native.entity.set_entity_invincible(object25, true)
        native.entity.set_entity_invincible(object26, true)
        native.entity.set_entity_invincible(object27, true)
        native.entity.set_entity_invincible(object28, true)
        native.entity.set_entity_invincible(object29, true)
        native.entity.set_entity_invincible(object30, true)
        native.entity.set_entity_invincible(object31, true)
        native.entity.set_entity_invincible(object32, true)
        native.entity.set_entity_invincible(object33, true)
        native.entity.set_entity_invincible(object34, true)
        native.entity.set_entity_invincible(object35, true)
        native.entity.set_entity_invincible(object36, true)
    
    
        native.task.task_set_blocking_of_non_temporary_events(ped, true)
    end)
    
    
    
    
    
    
    mount_sub:add_button("Spawn Unicorn", {}, function ()
        toast.add_info("Unicorn Created")
            local playerPed = native.player.get_player_ped(0)
          
            local posVec = native.entity.get_offset_from_entity_in_world_coords(playerPed, 0, 0, 0)
        
            local object1 = native.object.create_object_no_offset(0x4A7F72F3,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object2 = native.object.create_object_no_offset(0x6C7F7700,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object3 = native.object.create_object_no_offset(0xA153804D,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object4 = native.object.create_object_no_offset(0xA153804D,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object5 = native.object.create_object_no_offset(0xA153804D,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object6 = native.object.create_object_no_offset(0xA153804D,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object7 = native.object.create_object_no_offset(0xA153804D,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object8 = native.object.create_object_no_offset(0xA153804D,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object9 = native.object.create_object_no_offset(0xA153804D,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object10 = native.object.create_object_no_offset(0xA153804D,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object11 = native.object.create_object_no_offset(0xA153804D,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object12= native.object.create_object_no_offset(0xA153804D,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object13 = native.object.create_object_no_offset(0x6C7F7700,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object14 = native.object.create_object_no_offset(0xA153804D,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object15 = native.object.create_object_no_offset(0xA153804D,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object16 = native.object.create_object_no_offset(0xA153804D,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object17 = native.object.create_object_no_offset(0xA153804D,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object18 = native.object.create_object_no_offset(0xA153804D,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object19 = native.object.create_object_no_offset(0xA153804D,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object20 = native.object.create_object_no_offset(0xA153804D,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object21 = native.object.create_object_no_offset(0x7617211F,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object22 = native.object.create_object_no_offset(0xA153804D,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object23 = native.object.create_object_no_offset(0xA153804D,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object24 = native.object.create_object_no_offset(0xA153804D,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object25 = native.object.create_object_no_offset(0x3F479FBF,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object26 = native.object.create_object_no_offset(0xA153804D,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object27 = native.object.create_object_no_offset(0xA153804D,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object28 = native.object.create_object_no_offset(0xA153804D,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object29 = native.object.create_object_no_offset(0xA153804D,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object30 = native.object.create_object_no_offset(0xA153804D,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object31 = native.object.create_object_no_offset(0xA153804D,posVec.x, posVec.y, posVec.z, true, true, false, false)
            
            ped = spanw_ped(0xC8DA3400,posVec)
            native.ped._set_random_outfit_variation(ped, true)
        
        
            native.entity.attach_entity_to_entity(object1, ped, 26,0.12, -0.15, 0.00, 5.299997, -144.999908, -178.300049, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object2, ped, 222,0.22, 0.02, -0.04,-40.999920, -17.499935, 28.199986, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object3, ped, 222,-0.30,0.19,1.95,0.000000,181.899902, -62.299984, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object4, ped, 222,0.26, 0.37, 1.39, 8.899998, 181.899902,-53.399986, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object5, ped, 222,-0.13, 0.23, 1.87,0.000000,181.899902, -62.299984, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object6, ped, 222,0.16, 0.35, 1.63, 8.899998,181.899902, -62.299984, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object7, ped, 222,-0.47, 1.20, 1.21, 8.899998,151.300507, -62.299984, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object8, ped, 222,-0.66, 1.19, 1.31, 15.699879,154.700439, -48.700222, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object9, ped, 222,-0.65, 1.02, 0.95, -14.899584, 137.700775, -92.899445, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object10, ped,222,-0.23, 0.96, 0.79, 15.699879,144.500641, -58.900040, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object11, ped,222,-0.60, 0.95, 0.72, -4.699762,141.100708, -96.299385, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object12, ped, 222,-0.51, 1.24, 1.24,-1.299822, 137.700775, -86.099564, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object13, ped, 222,0.30, 0.00, -0.10, -6.000056, -20.899876, 28.199986, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object14, ped, 222,0.21, 0.90, 0.61, 32.699581, 151.300507, -58.900040, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object15, ped, 222,-0.45, 1.03, 0.85, -8.099703, 137.700775, -89.499504, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object16, ped, 222,-0.08, 1.22, 1.09, 12.299938,141.100708, -72.499802, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object17, ped, 222,-0.26, 1.14, 1.06, -1.299822, 144.500641, -92.899445, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object18, ped, 222,-0.65, 1.24, 1.40, 15.699879,154.700439, -48.700222, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object19, ped, 222,0.07, 1.04, 0.89, 5.500058, 144.500641, -92.899445, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object20, ped, 222,-0.27, 1.24, 1.13, -1.299822, 137.700775,-86.099564, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object21, ped, 27,0.00, 0.14, 0.05, 197.397049, 0.000000, 0.000000, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object22, ped, 222,-0.19, 1.38, 1.37, 32.699581, 155.500443, -29.500462, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object23, ped, 222,-0.43, 1.38, 1.37, 32.699581, 155.500443, -29.500462, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object24, ped, 222,0.06, 0.26, 1.27, 0.000000, 181.899902, 0.000000, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object25, ped, 27,0.00, 0.14, 0.02,-15.900002, 360.000000, 180.199936, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object26, ped, 222,-0.06, 0.22, 1.37, 0.000000, 181.899902, 0.000000, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object27, ped, 222,-0.20, 0.17, 1.51, 0.000000, 181.899902, 0.000000, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object28, ped, 222,-0.32, 0.14, 1.65, 0.000000, 181.899902, 0.000000, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object29, ped, 222,0.17, 0.30, 1.15, 0.000000, 181.899902, 0.000000, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object30, ped, 222,0.34, 0.44, 1.03, 0.000000, 199.699890, 53.399986, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object31, ped, 222,0.02, 0.29, 1.67, 8.899998, 181.899902, -53.399986, false, false, false, true, 0, true, false, false)
        
            native.entity.set_entity_invincible(ped, true)
        
            native.entity.set_entity_invincible(object1, true)
            native.entity.set_entity_invincible(object2, true)
            native.entity.set_entity_invincible(object3, true)
            native.entity.set_entity_invincible(object4, true)
            native.entity.set_entity_invincible(object5, true)
            native.entity.set_entity_invincible(object6, true)
            native.entity.set_entity_invincible(object7, true)
            native.entity.set_entity_invincible(object8, true)
            native.entity.set_entity_invincible(object9, true)
            native.entity.set_entity_invincible(object10, true)
            native.entity.set_entity_invincible(object11, true)
            native.entity.set_entity_invincible(object12, true)
            native.entity.set_entity_invincible(object13, true)
            native.entity.set_entity_invincible(object14, true)
            native.entity.set_entity_invincible(object15, true)
            native.entity.set_entity_invincible(object16, true)
            native.entity.set_entity_invincible(object17, true)
            native.entity.set_entity_invincible(object18, true)
            native.entity.set_entity_invincible(object19, true)
            native.entity.set_entity_invincible(object20, true)
            native.entity.set_entity_invincible(object21, true)
            native.entity.set_entity_invincible(object22, true)
            native.entity.set_entity_invincible(object23, true)
            native.entity.set_entity_invincible(object24, true)
            native.entity.set_entity_invincible(object25, true)
            native.entity.set_entity_invincible(object26, true)
            native.entity.set_entity_invincible(object27, true)
            native.entity.set_entity_invincible(object28, true)
            native.entity.set_entity_invincible(object29, true)
            native.entity.set_entity_invincible(object30, true)
            native.entity.set_entity_invincible(object31, true)
        
        
        
            native.task.task_set_blocking_of_non_temporary_events(ped, true)
        end)
    

        mount_sub:add_button("Spawn Ghost Rider", {}, function ()
            toast.add_info("Ghost Rider Created!")
                local playerPed = native.player.get_player_ped(0)
              
                local posVec = native.entity.get_offset_from_entity_in_world_coords(playerPed, 0, 0, 0)
                local object1 = native.object.create_object_no_offset(0xD696159F,posVec.x, posVec.y, posVec.z, true, true, false, false)
                local object2 = native.object.create_object_no_offset(0xD696159F,posVec.x, posVec.y, posVec.z, true, true, false, false)
                local object3 = native.object.create_object_no_offset(0xD696159F,posVec.x, posVec.y, posVec.z, true, true, false, false)
                local object4 = native.object.create_object_no_offset(0xD696159F,posVec.x, posVec.y, posVec.z, true, true, false, false)
                local object5 = native.object.create_object_no_offset(0xD696159F,posVec.x, posVec.y, posVec.z, true, true, false, false)
                local object6 = native.object.create_object_no_offset(0xD696159F,posVec.x, posVec.y, posVec.z, true, true, false, false)
                local object7 = native.object.create_object_no_offset(0xD696159F,posVec.x, posVec.y, posVec.z, true, true, false, false)
                local object8 = native.object.create_object_no_offset(0xD696159F,posVec.x, posVec.y, posVec.z, true, true, false, false)
                local object9 = native.object.create_object_no_offset(0xD696159F,posVec.x, posVec.y, posVec.z, true, true, false, false)
                local object10 = native.object.create_object_no_offset(0xD696159F,posVec.x, posVec.y, posVec.z, true, true, false, false)
                local object11 = native.object.create_object_no_offset(0xD696159F,posVec.x, posVec.y, posVec.z, true, true, false, false)
                local object12 = native.object.create_object_no_offset(0xD696159F,posVec.x, posVec.y, posVec.z, true, true, false, false)
                local object13 = native.object.create_object_no_offset(0xD696159F,posVec.x, posVec.y, posVec.z, true, true, false, false)
                local object14 = native.object.create_object_no_offset(0xD696159F,posVec.x, posVec.y, posVec.z, true, true, false, false)
                local object15 = native.object.create_object_no_offset(0xD696159F,posVec.x, posVec.y, posVec.z, true, true, false, false)
                local object16 = native.object.create_object_no_offset(0xD696159F,posVec.x, posVec.y, posVec.z, true, true, false, false)
                local object17 = native.object.create_object_no_offset(0xD696159F,posVec.x, posVec.y, posVec.z, true, true, false, false)
                local object18 = native.object.create_object_no_offset(0xD696159F,posVec.x, posVec.y, posVec.z, true, true, false, false)
                local object19 = native.object.create_object_no_offset(0xD696159F,posVec.x, posVec.y, posVec.z, true, true, false, false)
                local object20 = native.object.create_object_no_offset(0xD696159F,posVec.x, posVec.y, posVec.z, true, true, false, false)
                local object21 = native.object.create_object_no_offset(0xD696159F,posVec.x, posVec.y, posVec.z, true, true, false, false)
                local object22 = native.object.create_object_no_offset(0xD696159F,posVec.x, posVec.y, posVec.z, true, true, false, false)
                local object23 = native.object.create_object_no_offset(0xD696159F,posVec.x, posVec.y, posVec.z, true, true, false, false)
                local object24 = native.object.create_object_no_offset(0xD696159F,posVec.x, posVec.y, posVec.z, true, true, false, false)
                local object25 = native.object.create_object_no_offset(0xD696159F,posVec.x, posVec.y, posVec.z, true, true, false, false)
                local object26 = native.object.create_object_no_offset(0xD696159F,posVec.x, posVec.y, posVec.z, true, true, false, false)
                ped = spanw_ped(0x7E67718B,posVec)
                native.ped._set_random_outfit_variation(ped, true)
            
                native.entity.attach_entity_to_entity(object1, ped, 28,-0.06, 0.24, 0.01, 169.199890, 105.500015, 86.699944, false, false, false, true, 0, true, false, false)
                native.entity.attach_entity_to_entity(object2, ped, 28,-0.09,0.23, 0.00, 176.199860, 75.300011, 100.199966, false, false, false, true, 0, true, false, false)
                native.entity.attach_entity_to_entity(object3, ped, 28,-0.04,-0.07, 0.00, 0.000000, 88.800034, 0.000000, false, false, false, true, 0, true, false, false)
                native.entity.attach_entity_to_entity(object4, ped, 3,-0.15,0.07, 0.07, -3.599989, 51.600060, -2.200000, false, false, false, true, 0, true, false, false)
                native.entity.attach_entity_to_entity(object5, ped, 403,-0.10,-0.10, 0.02, -148.599930, 287.399750,-2.200000, false, false, false, true, 0, true, false, false)
                native.entity.attach_entity_to_entity(object6, ped, 176,-0.16,0.17, 0.21, 49.400017, 242.199860,88.599983, false, false, false, true, 0, true, false, false)
                native.entity.attach_entity_to_entity(object7, ped, 12,-0.36,-0.09, 0.00, 68.400009, -124.400230, 134.199936, false, false, false, true, 0, true, false, false)
                native.entity.attach_entity_to_entity(object8, ped, 94,0.03,0.09, 0.00, 41.800018, -124.400230, 134.199936, false, false, false, true, 0, true, false, false)
                native.entity.attach_entity_to_entity(object9, ped, 28,-0.06, 0.24, 0.01, 169.199890, 105.500015, 86.699944, false, false, false, true, 0, true, false, false)
                native.entity.attach_entity_to_entity(object10, ped, 28,-0.09,0.23, 0.00, 176.199860, 75.300011, 100.199966, false, false, false, true, 0, true, false, false)
                native.entity.attach_entity_to_entity(object11, ped, 28,-0.04,-0.07, 0.00, 0.000000, 88.800034, 0.000000, false, false, false, true, 0, true, false, false)
                native.entity.attach_entity_to_entity(object12, ped, 3,-0.05,0.07, 0.07, -3.599989, 51.600060, -2.200000, false, false, false, true, 0, true, false, false)
                native.entity.attach_entity_to_entity(object13, ped, 403,-0.06,-0.10, 0.02, -148.599930, 287.399750,-2.200000, false, false, false, true, 0, true, false, false)
                native.entity.attach_entity_to_entity(object14, ped, 176,-0.10,0.17, 0.21, 49.400017, 242.199860,88.599983, false, false, false, true, 0, true, false, false)
                native.entity.attach_entity_to_entity(object15, ped, 12,-0.30,-0.09, 0.00, 68.400009, -124.400230, 134.199936, false, false, false, true, 0, true, false, false)
                native.entity.attach_entity_to_entity(object16, ped, 94,0.05,0.09, 0.00, 41.800018, -124.400230, 134.199936, false, false, false, true, 0, true, false, false)
                native.entity.attach_entity_to_entity(object17, ped, 3,-0.00,0.07, 0.07, -3.599989, 51.600060, -2.200000, false, false, false, true, 0, true, false, false)
                native.entity.attach_entity_to_entity(object18, ped, 403,-0.04,-0.10, 0.02, -148.599930, 287.399750,-2.200000, false, false, false, true, 0, true, false, false)
                native.entity.attach_entity_to_entity(object19, ped, 176,-0.30,0.17, 0.21, 49.400017, 242.199860,88.599983, false, false, false, true, 0, true, false, false)
                native.entity.attach_entity_to_entity(object20, ped, 12,-0.36,-0.09, 0.00, 68.400009, -124.400230, 134.199936, false, false, false, true, 0, true, false, false)
                native.entity.attach_entity_to_entity(object21, ped, 94,0.10,0.09, 0.00, 41.800018, -124.400230, 134.199936, false, false, false, true, 0, true, false, false)
                native.entity.attach_entity_to_entity(object22, ped, 3,-0.15,0.07, 0.07, -3.599989, 51.600060, -2.200000, false, false, false, true, 0, true, false, false)
                native.entity.attach_entity_to_entity(object23, ped, 403,0.10,-0.10, 0.02, -148.599930, 287.399750,-2.200000, false, false, false, true, 0, true, false, false)
                native.entity.attach_entity_to_entity(object24, ped, 176,-0.20,0.17, 0.21, 49.400017, 242.199860,88.599983, false, false, false, true, 0, true, false, false)
                native.entity.attach_entity_to_entity(object25, ped, 12,-0.50,-0.09, 0.00, 68.400009, -124.400230, 134.199936, false, false, false, true, 0, true, false, false)
                native.entity.attach_entity_to_entity(object26, ped, 94,0.15,0.09, 0.00, 41.800018, -124.400230, 134.199936, false, false, false, true, 0, true, false, false)
            
                native.entity.set_entity_invincible(ped, true)
            
                native.entity.set_entity_invincible(object1, true)
                native.entity.set_entity_invincible(object2, true)
                native.entity.set_entity_invincible(object3, true)
                native.entity.set_entity_invincible(object4, true)
                native.entity.set_entity_invincible(object5, true)
                native.entity.set_entity_invincible(object6, true)
                native.entity.set_entity_invincible(object7, true)
                native.entity.set_entity_invincible(object8, true)
                native.entity.set_entity_invincible(object9, true)
                native.entity.set_entity_invincible(object10, true)
                native.entity.set_entity_invincible(object11, true)
                native.entity.set_entity_invincible(object12, true)
                native.entity.set_entity_invincible(object13, true)
                native.entity.set_entity_invincible(object14, true)
                native.entity.set_entity_invincible(object15, true)
                native.entity.set_entity_invincible(object16, true)
                native.entity.set_entity_invincible(object17, true)
                native.entity.set_entity_invincible(object18, true)
                native.entity.set_entity_invincible(object19, true)
                native.entity.set_entity_invincible(object20, true)
                native.entity.set_entity_invincible(object21, true)
                native.entity.set_entity_invincible(object22, true)
                native.entity.set_entity_invincible(object23, true)
                native.entity.set_entity_invincible(object24, true)
                native.entity.set_entity_invincible(object25, true)
                native.entity.set_entity_invincible(object26, true)
            
                native.task.task_set_blocking_of_non_temporary_events(ped, true)
            end)
    
    
    mount_sub:add_button("Spawn Fire Horse", {"From 24/01/2024"}, function ()
        toast.add_info("Fire Horse Created!")
            local playerPed = native.player.get_player_ped(0)
          
            local posVec = native.entity.get_offset_from_entity_in_world_coords(playerPed, 0, 0, 0)
        
            local object1 = native.object.create_object_no_offset(0x14529D92,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object2 = native.object.create_object_no_offset(0x14529D92,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object3 = native.object.create_object_no_offset(0x64AAA69C,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object4 = native.object.create_object_no_offset(0x14529D92,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object5 = native.object.create_object_no_offset(0x14529D92,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object6 = native.object.create_object_no_offset(0x28D1468F,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object7 = native.object.create_object_no_offset(0x28D1468F,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object8 = native.object.create_object_no_offset(0x64AAA69C,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object9 = native.object.create_object_no_offset(0x64AAA69C,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object10 = native.object.create_object_no_offset(0x64AAA69C,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object11 = native.object.create_object_no_offset(0x28D1468F,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object12= native.object.create_object_no_offset(0x14529D92,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object13 = native.object.create_object_no_offset(0x64AAA69C,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object14 = native.object.create_object_no_offset(0x64AAA69C,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object15 = native.object.create_object_no_offset(0x64AAA69C,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object16 = native.object.create_object_no_offset(0xD696159F,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object17 = native.object.create_object_no_offset(0xD696159F,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object18 = native.object.create_object_no_offset(0xD696159F,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object19 = native.object.create_object_no_offset(0xD696159F,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object20 = native.object.create_object_no_offset(0xD696159F,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object21 = native.object.create_object_no_offset(0xD696159F,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object22 = native.object.create_object_no_offset(0xD696159F,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object23 = native.object.create_object_no_offset(0xD696159F,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object24 = native.object.create_object_no_offset(0xD696159F,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object25 = native.object.create_object_no_offset(0x14529D92,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object26 = native.object.create_object_no_offset(0x14529D92,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object27 = native.object.create_object_no_offset(0x845743DE,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object28 = native.object.create_object_no_offset(0x1298EF27,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object29 = native.object.create_object_no_offset(0x1298EF27,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object30 = native.object.create_object_no_offset(0xD696159F,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object31 = native.object.create_object_no_offset(0x14529D92,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object32 = native.object.create_object_no_offset(0x14529D92,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object33 = native.object.create_object_no_offset(0x64AAA69C,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object34 = native.object.create_object_no_offset(0x64AAA69C,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object35 = native.object.create_object_no_offset(0x64AAA69C,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object36 = native.object.create_object_no_offset(0x64AAA69C,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object37 = native.object.create_object_no_offset(0x64AAA69C,posVec.x, posVec.y, posVec.z, true, true, false, false)
            local object38 = native.object.create_object_no_offset(0x1DE8FD60,posVec.x, posVec.y, posVec.z, true, true, false, false)
            
            ped = spanw_ped(0xB57D0193,posVec)
        
            native.ped._set_random_outfit_variation(ped, true)
        
        
            native.entity.attach_entity_to_entity(object1, ped, 96,0.0, 0.0, 0.0, 0.0, 0.0, 86.399979, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object2, ped, 96,0.01,-0.03, 0.01, -6.399998, -247.999619, 92.799973, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object3, ped, 406,0.09,-0.15, -0.09, 343.199677, 192.300262, 60.999969, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object4, ped, 143,-0.01,-0.07, -0.02, 135.899979, -264.999603, 241.899780, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object5, ped, 143,-0.06,0.07, 0.01, 155.399948, -264.999603, 241.899780, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object6, ped, 12,-0.22,0.00, 0.04, 3.899998, 54.599972, 89.699974, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object7, ped, 12,-0.06,-0.06, 0.01, 89.699974, 272.999756, 6.599626, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object8, ped, 20,0.05,-0.08, -0.09, 0.000008, 360.000000, 205.299881, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object9, ped, 403,0.20,-0.15, -0.03, 0.000008, -168.900299, 220.899857, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object10, ped, 416,-0.20,0.14, 0.00, 155.999954, 215.700226, 99.999985, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object11, ped, 12,-0.39,0.19, 0.03, 74.099968, 272.999756, 6.599626, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object12, ped, 414,0.08,-0.06, 0.12, 27.299988, 19.499992, 129.299988, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object13, ped, 95,0.03,0.09, 0.04, 0.000001, 185.599884,-6.399998, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object14, ped, 403,0.05,-0.15, 0.03, 0.000008, -168.900299,220.899857, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object15, ped, 415,0.08,-0.09, 0.03,-7.799989, 2.699627,220.899857, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object16, ped, 11,-0.38,-0.18, 0.03,91.799965, 25.499989,72.199951, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object17, ped, 11,-0.06,0.06, 0.03,91.799965, 25.499989,20.399990, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object18, ped, 11,-0.06,0.06, 0.03,91.799965, 25.499989,20.399990, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object19, ped, 12,-0.20,-0.14, 0.02,91.799965, 25.499989,86.999939, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object20, ped, 12,-0.30,-0.11, 0.03,91.799965, 25.499989,86.999939, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object21, ped, 13,-0.15,-0.01, 0.03,91.799965, 25.499989,72.199951, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object22, ped, 13,-0.24,0.01, 0.03,91.799965, 25.499989,72.199951, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object23, ped, 11,0.10,0.17, 0.03,91.799965, 25.499989,-60.999954, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object24, ped, 11,-0.27,0.02, 0.03,91.799965, 25.499989,20.399990, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object25, ped, 410,0.07,-0.12, -0.05,38.399990,-241.599625,159.999908, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object26, ped, 416,0.21,0.13, 0.05,-5.099998,91.799965,25.499977, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object27, ped, 0,0.00,0.00, 0.00,0.000000,0.000000,0.000000, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object28, ped, 7,0.31,-0.14, 0.10,0.000000,0.000000,-0.300004, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object29, ped, 194,0.14,-0.10, 0.08,82.499947,119.999908,-7.799999, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object30, ped, 314,0.14,-0.10, -0.12,82.499947,44.999973,74.699951, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object31, ped, 410,-0.08,0.15, -0.08,87.799988,-259.699615,156.099915, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object32, ped, 410,-0.08,-0.03, 0.01,102.399963,-292.799744,15.999996, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object33, ped, 176,0.00,0.07, 0.19,15.599996,-275.600098,6.399999, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object34, ped, 201,0.03,-0.01, 0.02,-3.899996,188.400269,76.599976, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object35, ped, 24,0.13,0.04, -0.01,7.799997,188.400269,33.699986, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object36, ped, 416,0.02,-0.06, 0.12,187.199905,188.400269,49.299976, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object37, ped, 12,0.02,-0.06, 0.12,187.199905,188.400269,49.299976, false, false, false, true, 0, true, false, false)
            native.entity.attach_entity_to_entity(object38, ped, 13,0.12,0.31, 0.00,-45.000000,-90.000000,180.000000, false, false, false, true, 0, true, false, false)
            native.entity.set_entity_invincible(ped, true)

            native.entity.set_entity_invincible(object1, true)
            native.entity.set_entity_invincible(object2, true)
            native.entity.set_entity_invincible(object3, true)
            native.entity.set_entity_invincible(object4, true)
            native.entity.set_entity_invincible(object5, true)
            native.entity.set_entity_invincible(object6, true)
            native.entity.set_entity_invincible(object7, true)
            native.entity.set_entity_invincible(object8, true)
            native.entity.set_entity_invincible(object9, true)
            native.entity.set_entity_invincible(object10, true)
            native.entity.set_entity_invincible(object11, true)
            native.entity.set_entity_invincible(object12, true)
            native.entity.set_entity_invincible(object13, true)
            native.entity.set_entity_invincible(object14, true)
            native.entity.set_entity_invincible(object15, true)
            native.entity.set_entity_invincible(object16, true)
            native.entity.set_entity_invincible(object17, true)
            native.entity.set_entity_invincible(object18, true)
            native.entity.set_entity_invincible(object19, true)
            native.entity.set_entity_invincible(object20, true)
            native.entity.set_entity_invincible(object21, true)
            native.entity.set_entity_invincible(object22, true)
            native.entity.set_entity_invincible(object23, true)
            native.entity.set_entity_invincible(object24, true)
            native.entity.set_entity_invincible(object25, true)
            native.entity.set_entity_invincible(object26, true)
            native.entity.set_entity_invincible(object27, true)
            native.entity.set_entity_invincible(object28, true)
            native.entity.set_entity_invincible(object29, true)
            native.entity.set_entity_invincible(object30, true)
            native.entity.set_entity_invincible(object31, true)
            native.entity.set_entity_invincible(object32, true)
            native.entity.set_entity_invincible(object33, true)
            native.entity.set_entity_invincible(object34, true)
            native.entity.set_entity_invincible(object35, true)
            native.entity.set_entity_invincible(object36, true)
            native.entity.set_entity_invincible(object37, true)
            native.entity.set_entity_invincible(object38, true)
            native.task.task_set_blocking_of_non_temporary_events(ped, true)
        end)


        mount_sub:add_separator("Credits go to:")
        mount_sub:add_separator("↘↘↘↘ ↙↙↙↙")
        mount_sub:add_separator("CrazyPony")




















































































































    player_ped = native.player.player_ped_id()
    
    self_sub:add_toggle("Allow grapple and drag", { "Allows you to grapple and drag peds." }, function(toggle)
        local default = native.ped._get_ped_brawling_style(PlayerPed)
        local grappleStyle = native.misc.get_hash_key("GS_DRAGGING")
        thread.create(function(ability)
            if toggle == true then
                native.ped._set_ped_brawling_style(PlayerPed, grappleStyle)
             else
                native.ped._set_ped_brawling_style(PlayerPed, default)
                thread.yield()
             end
          end)
       end)
       

    
       self_sub:add_slider_int("Change Fighting Style", 1, 1, 4, 1, false, {"native.ped._set_ped_brawling_style\n(int ped, int brawling_style)"}, nil, function(value)
        if value == 1 then
            native.ped._set_ped_brawling_style(PlayerPed, 0x78BAEF07)
         elseif value == 2 then
            native.ped._set_ped_brawling_style(PlayerPed, 0x1F0BB27A)
         elseif value == 3 then
            native.ped._set_ped_brawling_style(PlayerPed, 0x3C6A802F)
         elseif value == 4 then
            native.ped._set_ped_brawling_style(PlayerPed, 0xF9E77D2D)
         end
    end)

    self_sub:add_toggle("God Mode", { "Make your character invincible" }, function(state)
        local player_ped = native.player.player_ped_id()
        if native.entity.does_entity_exist(player_ped) then
            native.entity.set_entity_invincible(player_ped, state)
        end
        do
            toast.add_info("God Mode", "God Mode has been " .. (state and "enabled" or "disabled"))
        end
    end)
    
    self_sub:add_toggle("Everyone Ignore", {"Makes everyone Ignore you."}, function(state)
        if state == true then
            native.player.set_everyone_ignore_player(player_ped, true)
        else
            native.player.set_everyone_ignore_player(player_ped, false)
        end
    end)
    
    self_sub:add_toggle("Invisible", { "Make your character invisible" }, function(state)
        local player_ped = native.player.player_ped_id()
        if native.entity.does_entity_exist(player_ped) then
            native.entity.set_entity_visible(player_ped, not state)
        end
    end)

    self_sub:add_toggle("Jump Loop", { "Jump on Loop.\n\nCredits go to InvalidName" }, function(state)
        isJumping = state
    end)
    
    thread.create(function()
        while true do 
            if isJumping then
                local playerPed = native.player.get_player_ped(native.player.player_id())
                native.task.task_jump(playerPed, true)
                thread.yield(1000)
            else
                thread.yield(1000)
            end
        end
    end)
    


self_sub:add_separator("  Credits go to:\n↘ Ruddle Bear ↙")



self_sub:add_toggle("Become Drunk", {"Makes your Character Drunk."}, function(state)
    local player_ped = native.player.player_ped_id()
    if state == true then
        native.ped._set_ped_drunkness(player_ped, true, 100.0)
        native.audio.set_ped_is_drunk(player_ped, true)
    else
        native.ped._set_ped_drunkness(player_ped, false, 1.0)
        native.audio.set_ped_is_drunk(player_ped, false)
    end
end)

self_sub:add_button("Clean Player", {"Cleans your Ped."}, function()
    local player_ped = native.player.player_ped_id()
    native.ped.clear_ped_env_dirt(player_ped)
    native.ped.set_ped_sweat(player_ped, 0)
    native.ped.clear_ped_blood_damage(player_ped)
    native.ped.clear_ped_wetness(player_ped)
    native.ped._clear_ped_blood_damage_facial(player_ped, 0)
end)

    self_sub:add_button("Clear Wanted Level", {"Makes everyone Ignore you."}, function()
        native.player.clear_player_wanted_level(player_ped)
    end)
    
    self_sub:add_toggle("\"Cops Love You\"", {"Get Wanted much Easier."}, function(state)
        if state == true then
            native.player.set_wanted_level_multiplier(10)
        else
            native.player.set_wanted_level_multiplier(1)
        end
    end)
    
    self_sub:add_toggle("Disable Cops", {"Disables all Cops."}, function(state)
        if state == true then
            native.law._set_law_disabled(true)
        else
            native.law._set_law_disabled(false)
        end
    end)
    
    self_sub:add_button("Force Law on Yourself", {"Forces Law on your Player Immediately."}, function()
        native.law._force_law_on_local_player_immediately()
    end)
    

    

    
    self_sub:add_toggle("Flashing Player", { "Makes your Character continuously Flash."}, function(state)
        isExisting = state
    end)
    thread.create(function()
        while true do 
            if isExisting then
                local player_ped = native.player.get_player_ped(native.player.player_id())
                thread.yield(10)
                native.entity._set_entity_fade_in(player_ped)
                thread.yield(600)
            else
                thread.yield(1000)
            end
        end
    end)
    
    
    
    self_sub:add_toggle("Freeze Yourself", {"Freeze your Character in Place."}, function(state)
        local player_ped = native.player.player_ped_id()
        if native.entity.does_entity_exist(player_ped) then
            native.entity.freeze_entity_position(player_ped, state)
            toast.add_info("Ruddle", "Some description:\n" .. (state and "Frozen" or "Unfrozen"))
        end
    end)
    
    self_sub:add_toggle("Massive Bullets", {"Makes all your Bullet Impacts Massive."}, function(state)
        if state == true then
            native.graphics.set_particle_fx_bullet_impact_scale(50)
        else
            native.graphics.set_particle_fx_bullet_impact_scale(1)
        end
    end)
    
    self_sub:add_toggle("No AI Damage", {"Prevents AI from damaging you with Weapons."}, function(state)
        if state == true then
            native.ped.set_ai_weapon_damage_modifier(0)
            native.ped.set_ai_melee_weapon_damage_modifier(0)
        else
            native.ped.set_ai_weapon_damage_modifier(1)
            native.ped.set_ai_melee_weapon_damage_modifier(1)
        end
    end)

    self_sub:add_toggle("Sniper Glints", {"Makes Sniper Glints Visible."}, function(state)
        if state == true then
            native.graphics._set_sniper_glints_enabled(true)
        else
            native.graphics._set_sniper_glints_enabled(false)
        end
    end)
    
    

    

    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

















































































    local spawner_sub = menu.script_root():add_submenu("Spawner",
    {
        "Main > Spawner:\n\t• Peds >\n\t• Animals >\n\t• Objects >\n\t• Vehicles\n\nhttps://exodusmenu.com/\n" },
    function()
    end, nil)
    
    
    
    

    


    
    

    

    
    
    
    ---@----------------------------------------------//PEDS//-------------------------------------------------------------
    local ped_sub, ped_sub_opt = spawner_sub:add_submenu("Peds",{"Thank you TNC!"}, function()
    end)
    

    peds = {
        0x9BD92566, --1--Harriet Davenport
        0x8C5F7BCC, --2--Cult Priest
        0x25D32467, --3--re_wildman_01
        0x40C07582, --4-- "MP_RE_WILDMAN_MALES_01"
        0xAB6C83B9, --5--Pig Farmer
        0x892944C5, --6--Bounty Hunter
        0x3BF7829E, --7--Robot
        0xC061B459, --8--Old Lady
        0x71F7EE1B, --9--Jack Marston
        0xD9E8B86A, --10--cs_genstorymale
        0x16681434,  --11--u_m_m_valpoopingman_01
        0x34F835DE,  --12--cs_chelonianmaster
        0x19E97506,  --13--cs_poorjoe
        0x39FD28AE,  --14--cs_germandaughter
        0xA91215CD,  --15--cs_oddfellowspinhead
        0xE20455E9, --16--cs_mp_travellingsaleswoman
        0x3CCC99B1,  --17--cs_genstoryfemale
        0x84490A12,  --18--cs_mud2bigguy
        0xCAB23E50,  --19--re_murdercamp_males_01
        0x74DF3938,  --20--u_f_y_braithwaitessecret_01
        0x6A5B1E21, --21--re_voice_females_01
        0xA9A328D5,  --22--cs_swampfreak
        0xF3C61748,  --23--cs_baptiste
        0x442FBDDC,  --24cs_johnthebaptisingmadman
        0x75CC2B66,  --25a_m_y_unicorpse_01
    }



    local function spanw_ped(hash,posVec, i)
        request_model(hash)
        local ped = native.ped.create_ped(hash, posVec.x, posVec.y+2, posVec.z, 0, true, true, true, false)
        if ped   then
            return ped
            else
               return false,toast.add_info("Spawn Failed")
            end
         end
    
    
    local spawnPed = function(hash, posVecX, posVecY, posVecZ)
        local player = native.player.player_ped_id()
        local posVec = native.entity.get_offset_from_entity_in_world_coords(player, 0, 1.0, 0)
        for i=1, animalcount do
        Ped = spanw_ped(hash, posVec, i)
        end

        if AttackerVisible == true then
            native.ped._set_random_outfit_variation(Ped, true)
    end
    
        if SpawnDead == true then
            native.entity.set_entity_health(Ped, 0, 0)
        end
    
        if SpawnSedated == true then
            native.ped.set_ped_config_flag(Ped, 500, true)
        end
    
        if SpawnDrunk == true then
            native.ped._set_ped_drunkness(Ped, true, 100.0)
            native.audio.set_ped_is_drunk(Ped, true)
        elseif SpawnDrunk == false then
            native.ped._set_ped_drunkness(Ped, false, 1)
            native.audio.set_ped_is_drunk(Ped, false)
        end
        
     
        if PedInvincible == true then
            native.ped.set_ped_config_flag(Ped, 254, true)
           native.entity.set_entity_invincible(Ped, true)
        end
    
        if CanBeTargeted == true then
            native.ped.set_ped_lasso_hogtie_flag(Ped, 0, false)
            native.ped.set_ped_can_be_targetted(Ped, false)
        end
        
    
    
        if PedMount == true then
           native.ped.set_ped_combat_attributes(Ped, 2, true)
           native.ped.set_ped_combat_attributes(Ped, 1, true)
           native.ped.set_ped_combat_attributes(Ped, 3, false)
           native.ped.set_ped_combat_attributes(Ped, 52, true)
           horse = spanw_ped(0x88D6A59E, posVec)
           native.ped._set_random_outfit_variation(horse, true)
     
           if PedInvincible == true then
            native.ped.set_ped_config_flag(horse, 254, true)
           end
           native.ped.set_ped_onto_mount(Ped, horse, -1, true)
           native.ped.set_combat_float(Ped, 31, 0)
           native.ped._set_ped_combat_style(Ped, native.misc.get_hash_key("Mounted_Chase"), 1, -1)
        end
     
        native.network.set_network_id_exists_on_all_machines(native.network.ped_to_net(Ped), true)
        native.entity.set_entity_as_mission_entity(Ped, false, true)
        native.network.set_network_id_always_exists_for_player(native.network.ped_to_net(Ped), player, true)
        native.task.task_follow_to_offset_of_entity(Ped, player, -1, -1, 0, 1.0, 0, -1, true, false, false, false, false, false)
        native.task.task_set_blocking_of_non_temporary_events(Ped, true)
     
        native.ped.set_ped_keep_task(Ped, true)
        native.streaming.set_model_as_no_longer_needed(Ped)
     
        return Ped
     end
    
    ped_sub:add_separator("Settings")
    
    ped_sub:add_slider_int("Amount", 1, 1, 30, 1, false, { "Ped Amount" }, nil, function(value, i)
        for i=1, animalcount do
        animalcount = value
        end
    end)
    
    ped_sub:add_slider_int("Ped Variant", 1, 1, 10, 1, false, { "Change your spawned Ped variant.\n[Every legendary animal have 3 variants]" }, nil, function(value)
        variant = value
    end)
    
    ped_sub:add_slider_int("Ped distance", 1, 1, 100, 1, false, { "Change your spawned Ped variant.\n[Every legendary animal have 3 variants]" }, nil, function(distance)
        Value = distance
    end)
    
    ped_sub:add_toggle("Spawn Dead", {""},  function(state)
        SpawnDead = state
        SpawnSedated = false
    end)
    

    
    ped_sub:add_toggle("God Mode",{ "Choose to give Ped God Mode or no" }, function(toggle)
        PedInvincible = toggle
    end)
    
    
    
    ped_sub:add_toggle("Spawn Drunk", {""},  function(state)
        if SpawnDead == true then
            return
        end
        SpawnDrunk = state
        SpawnDead = false
        SpawnSedated = false
        CanBeTargeted = false
    end)
    
        ped_sub:add_toggle("Melee and Lasso Proof",{ "" }, function(toggle)
        CanBeTargeted = toggle
    end)
    
    ped_sub:add_toggle("On Mount",{ "Spawn Ped on horse." }, function(toggle)
        PedMount = toggle
    end)
    
    
    
    
    ped_sub:add_separator("Peds")
    
    ped_sub:add_button("u_m_m_valpoopingman_01", {""}, function()
        local player_ped <const> = native.player.player_ped_id()
        if native.entity.does_entity_exist(player_ped) then
            local posVec <const> = native.entity.get_entity_coords(player_ped, true, true)
            for i=1, animalcount do
            local Ped <const> = spawnPed(peds[11], posVec, i)
            native.ped._equip_meta_ped_outfit_preset(Ped, variant, false)
            --
            end
        end
    end)

ped_sub:add_button("Harriet Davenport", {""}, function()
    local player_ped <const> = native.player.player_ped_id()
    if native.entity.does_entity_exist(player_ped) then
        local posVec <const> = native.entity.get_entity_coords(player_ped, true, true)
        for i=1, animalcount do
        local Ped <const> = spawnPed(peds[1], posVec, i)
        native.ped._equip_meta_ped_outfit_preset(Ped, variant, false)
        
        end
    end
end)

ped_sub:add_button("Cult Priest", {""}, function()
    local player_ped <const> = native.player.player_ped_id()
    if native.entity.does_entity_exist(player_ped) then
        local posVec <const> = native.entity.get_entity_coords(player_ped, true, true)
        for i=1, animalcount do
        local Ped <const> = spawnPed(peds[2], posVec, i)
        native.ped._equip_meta_ped_outfit_preset(Ped, variant, false)
        
        end
    end
end)



ped_sub:add_button("re_wildman_01", {""}, function()
    local player_ped <const> = native.player.player_ped_id()
    if native.entity.does_entity_exist(player_ped) then
        local posVec <const> = native.entity.get_entity_coords(player_ped, true, true)
        for i=1, animalcount do
        local Ped <const> = spawnPed(peds[3], posVec, i)
        native.ped._equip_meta_ped_outfit_preset(Ped, variant, false)
        
        end
    end
end)

ped_sub:add_button("MP_RE_WILDMAN_MALES_01", {""}, function()
    local player_ped <const> = native.player.player_ped_id()
    if native.entity.does_entity_exist(player_ped) then
        local posVec <const> = native.entity.get_entity_coords(player_ped, true, true)
        for i=1, animalcount do
        local Ped <const> = spawnPed(peds[4], posVec, i)
        native.ped._equip_meta_ped_outfit_preset(Ped, variant, false)
        
        end
    end
end)

ped_sub:add_button("Pig Farmer", {""}, function()
    local player_ped <const> = native.player.player_ped_id()
    if native.entity.does_entity_exist(player_ped) then
        local posVec <const> = native.entity.get_entity_coords(player_ped, true, true)
        for i=1, animalcount do
        local Ped <const> = spawnPed(peds[5], posVec, i)
        native.ped._equip_meta_ped_outfit_preset(Ped, variant, false)
        
        end
    end
end)

ped_sub:add_button("Bounty Hunter", {""}, function()
    local player_ped <const> = native.player.player_ped_id()
    if native.entity.does_entity_exist(player_ped) then
        local posVec <const> = native.entity.get_entity_coords(player_ped, true, true)
        for i=1, animalcount do
        local Ped <const> = spawnPed(peds[6], posVec, i)
        native.ped._equip_meta_ped_outfit_preset(Ped, variant, false)
        
        end
    end
end)

ped_sub:add_button("Robot", {""}, function()
    local player_ped <const> = native.player.player_ped_id()
    if native.entity.does_entity_exist(player_ped) then
        local posVec <const> = native.entity.get_entity_coords(player_ped, true, true)
        for i=1, animalcount do
        local Ped <const> = spawnPed(peds[7], posVec, i)
        native.ped._equip_meta_ped_outfit_preset(Ped, variant, false)
        
        end
    end
end)

ped_sub:add_button("Old Lady", {""}, function()
    local player_ped <const> = native.player.player_ped_id()
    if native.entity.does_entity_exist(player_ped) then
        local posVec <const> = native.entity.get_entity_coords(player_ped, true, true)
        for i=1, animalcount do
        local Ped <const> = spawnPed(peds[8], posVec, i)
        native.ped._equip_meta_ped_outfit_preset(Ped, variant, false)
        
        end
    end
end)

ped_sub:add_button("Jack Marston", {""}, function()
    local player_ped <const> = native.player.player_ped_id()
    if native.entity.does_entity_exist(player_ped) then
        local posVec <const> = native.entity.get_entity_coords(player_ped, true, true)
        for i=1, animalcount do
        local Ped <const> = spawnPed(peds[9], posVec, i)
        native.ped._equip_meta_ped_outfit_preset(Ped, variant, false)
        
        end
    end
end)

ped_sub:add_button("cs_genstorymale", {""}, function()
    local player_ped <const> = native.player.player_ped_id()
    if native.entity.does_entity_exist(player_ped) then
        local posVec <const> = native.entity.get_entity_coords(player_ped, true, true)
        for i=1, animalcount do
        local Ped <const> = spawnPed(peds[10], posVec, i)
        native.ped._equip_meta_ped_outfit_preset(Ped, variant, false)
        
        end
    end
end)

ped_sub:add_button("cs_chelonianmaster", {""}, function()
    local player_ped <const> = native.player.player_ped_id()
    if native.entity.does_entity_exist(player_ped) then
        local posVec <const> = native.entity.get_entity_coords(player_ped, true, true)
        for i=1, animalcount do
        local Ped <const> = spawnPed(peds[12], posVec, i)
        native.ped._equip_meta_ped_outfit_preset(Ped, variant, false)
        
        end
    end
end)

ped_sub:add_button("cs_poorjoe", {""}, function()
    local player_ped <const> = native.player.player_ped_id()
    if native.entity.does_entity_exist(player_ped) then
        local posVec <const> = native.entity.get_entity_coords(player_ped, true, true)
        for i=1, animalcount do
        local Ped <const> = spawnPed(peds[13], posVec, i)
        native.ped._equip_meta_ped_outfit_preset(Ped, variant, false)
        
        end
    end
end)

ped_sub:add_button("cs_germandaughter", {""}, function()
    local player_ped <const> = native.player.player_ped_id()
    if native.entity.does_entity_exist(player_ped) then
        local posVec <const> = native.entity.get_entity_coords(player_ped, true, true)
        for i=1, animalcount do
        local Ped <const> = spawnPed(peds[14], posVec, i)
        native.ped._equip_meta_ped_outfit_preset(Ped, variant, false)
        
        end
    end
end)

ped_sub:add_button("cs_oddfellowspinhead", {""}, function()
    local player_ped <const> = native.player.player_ped_id()
    if native.entity.does_entity_exist(player_ped) then
        local posVec <const> = native.entity.get_entity_coords(player_ped, true, true)
        for i=1, animalcount do
        local Ped <const> = spawnPed(peds[15], posVec, i)
        native.ped._equip_meta_ped_outfit_preset(Ped, variant, false)
        
        end
    end
end)

ped_sub:add_button("cs_mp_travellingsaleswoman", {""}, function()
    local player_ped <const> = native.player.player_ped_id()
    if native.entity.does_entity_exist(player_ped) then
        local posVec <const> = native.entity.get_entity_coords(player_ped, true, true)
        for i=1, animalcount do
        local Ped <const> = spawnPed(peds[16], posVec, i)
        native.ped._equip_meta_ped_outfit_preset(Ped, variant, false)
        
        end
    end
end)

ped_sub:add_button("cs_genstoryfemale", {""}, function()
    local player_ped <const> = native.player.player_ped_id()
    if native.entity.does_entity_exist(player_ped) then
        local posVec <const> = native.entity.get_entity_coords(player_ped, true, true)
        for i=1, animalcount do
        local Ped <const> = spawnPed(peds[17], posVec, i)
        native.ped._equip_meta_ped_outfit_preset(Ped, variant, false)
        
        end
    end
end)

ped_sub:add_button("cs_mud2bigguy", {""}, function()
    local player_ped <const> = native.player.player_ped_id()
    if native.entity.does_entity_exist(player_ped) then
        local posVec <const> = native.entity.get_entity_coords(player_ped, true, true)
        for i=1, animalcount do
        local Ped <const> = spawnPed(peds[18], posVec, i)
        native.ped._equip_meta_ped_outfit_preset(Ped, variant, false)
        
        end
    end
end)

ped_sub:add_button("re_murdercamp_males_01", {""}, function()
    local player_ped <const> = native.player.player_ped_id()
    if native.entity.does_entity_exist(player_ped) then
        local posVec <const> = native.entity.get_entity_coords(player_ped, true, true)
        for i=1, animalcount do
        local Ped <const> = spawnPed(peds[19], posVec, i)
        native.ped._equip_meta_ped_outfit_preset(Ped, variant, false)
        
        end
    end
end)

ped_sub:add_button("cs_johnthebaptisingmadman", {""}, function()
    local player_ped <const> = native.player.player_ped_id()
    if native.entity.does_entity_exist(player_ped) then
        local posVec <const> = native.entity.get_entity_coords(player_ped, true, true)
        for i=1, animalcount do
        local Ped <const> = spawnPed(peds[24], posVec, i)
        native.ped._equip_meta_ped_outfit_preset(Ped, variant, false)
        
        end
    end
end)

ped_sub:add_button("a_m_y_unicorpse_01", {""}, function()
    local player_ped <const> = native.player.player_ped_id()
    if native.entity.does_entity_exist(player_ped) then
        local posVec <const> = native.entity.get_entity_coords(player_ped, true, true)
        for i=1, animalcount do
        local Ped <const> = spawnPed(peds[25], posVec, i)
        native.ped._equip_meta_ped_outfit_preset(Ped, variant, false)
        
        end
    end
end)


ped_sub:add_button("cs_baptiste", {""}, function()
    local player_ped <const> = native.player.player_ped_id()
    if native.entity.does_entity_exist(player_ped) then
        local posVec <const> = native.entity.get_entity_coords(player_ped, true, true)
        for i=1, animalcount do
        local Ped <const> = spawnPed(peds[23], posVec, i)
        native.ped._equip_meta_ped_outfit_preset(Ped, variant, false)
        
        end
    end
end)

ped_sub:add_button("cs_swampfreak", {""}, function()
    local player_ped <const> = native.player.player_ped_id()
    if native.entity.does_entity_exist(player_ped) then
        local posVec <const> = native.entity.get_entity_coords(player_ped, true, true)
        for i=1, animalcount do
        local Ped <const> = spawnPed(peds[22], posVec, i)
        native.ped._equip_meta_ped_outfit_preset(Ped, variant, false)
        
        end
    end
end)

ped_sub:add_button("re_voice_females_01", {""}, function()
    local player_ped <const> = native.player.player_ped_id()
    if native.entity.does_entity_exist(player_ped) then
        local posVec <const> = native.entity.get_entity_coords(player_ped, true, true)
        for i=1, animalcount do
        local Ped <const> = spawnPed(peds[21], posVec, i)
        native.ped._equip_meta_ped_outfit_preset(Ped, variant, false)
        
        end
    end
end)

ped_sub:add_button("u_f_y_braithwaitessecret_01", {""}, function()
    local player_ped <const> = native.player.player_ped_id()
    if native.entity.does_entity_exist(player_ped) then
        local posVec <const> = native.entity.get_entity_coords(player_ped, true, true)
        for i=1, animalcount do
        local Ped <const> = spawnPed(peds[20], posVec, i)
        native.ped._equip_meta_ped_outfit_preset(Ped, variant, false)
        
        end
    end
end)


    
 
    
    
    
    
    
    
    































































    
    
    ---@----------------------------------------------//ANIMALS//-------------------------------------------------------------
    local animals_sub, animal_sub_opt = spawner_sub:add_submenu("Animals[SOON MORE]",{}, function()
    end)
    


    
    
    animals_sub:add_slider_int("Amount", 1, 1, 30, 1, false, { "Peds Amount" }, nil, function(value, i)
        for i=1, animalcount do
        animalcount = value
        end
    end)
    
    animals_sub:add_toggle("Spawn Dead", {""},  function(state)
        SpawnDead = state
        SpawnSedated = false
    end)
    
    
    animals_sub:add_toggle("Spawn Sedated", {""},  function(state)
        SpawnSedated = state
        SpawnDead = false
        end)
    
    animals_sub:add_slider_int("Animal Variant", 1, 1, 10, 1, false, { "Change your spawned  animal variant." }, nil, function(value)
        variant = value
    end)
    
    animals_sub:add_toggle("Fire Hooves", {""},  function(state)
        FireHooves = state
    end)
    
    
animals_sub:add_separator("Animals- [SOON MORE]")

animals_sub:add_button("Duck", {"Request from:\n\n*OuT_oF_amMO*"}, function()
    local player_ped <const> = native.player.player_ped_id()
    if native.entity.does_entity_exist(player_ped) then
        local posVec <const> = native.entity.get_entity_coords(player_ped, true, true)
        for i=1, animalcount do
        local Ped <const> = spawnPed(0xC42E08CB, posVec, i)
        native.ped._equip_meta_ped_outfit_preset(Ped, variant, false)       
        end
    end
end)

animals_sub:add_button("a_c_horse_arabian_black [fire hooves]", {""}, function()
    local player_ped <const> = native.player.player_ped_id()
    if native.entity.does_entity_exist(player_ped) then
        local posVec <const> = native.entity.get_entity_coords(player_ped, true, true)
        for i=1, animalcount do
        local Ped <const> = spanw_ped(0x88D6A59E, posVec, i)
        native.ped._equip_meta_ped_outfit_preset(Ped, 1, false)
        native.ped.clear_ped_env_dirt(Ped)
        native.ped.set_ped_sweat(Ped, 0)
        native.ped.clear_ped_blood_damage(Ped)
        native.ped.clear_ped_wetness(Ped)
        native.ped._clear_ped_blood_damage_facial(Ped, 0)
        native.ped._set_ped_can_be_lassoed(Ped, false)
        native.ped.set_ped_can_be_targetted(Ped, false)
        native.ped.set_ped_can_ragdoll(Ped, false)
        native.ped.set_ped_config_flag(Ped, 254, true)
        native.streaming.set_model_as_no_longer_needed(Ped)
        native.ped.set_blocking_of_non_temporary_events(Ped, true)
        
        if FireHooves == true then
            native.ped.set_ped_config_flag(Ped, 207, true)
        end
    end
end
end)
    
    
    
    
    
    
    
    
    
    
    
    ---@----------------------------------------------//OBJECTS//-------------------------------------------------------------
    local objects_sub = spawner_sub:add_submenu("Objects[SOON]",{}, function()
    end)
    
    
    
    
    
    
    
    
    
    ---@----------------------------------------------//VEHICLE//-------------------------------------------------------------
    local veh_sub = spawner_sub:add_submenu("Vehicles[SOON]",{}, function()
    end)
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


























    local weap_sub = menu.script_root():add_submenu("Weapon", {"https://exodusmenu.com/\n"}, function()
    end)

    weap_sub:add_toggle("Instant Kill", {"Kill everything with One Shot."}, function(state)
        if state == true then
            native.player.set_player_weapon_damage_modifier(player_ped, 9999)
        else
            native.player.set_player_weapon_damage_modifier(player_ped, 1)
        end
    end)

    weap_sub:add_toggle("Super Lasso", { "I don't see any difference..\n\nwith ENABLED should make it much\nharder to break loose from your lasso" }, function(state)
        thread.create(function(index)
            if state == true then
                CurrentWeapon = native.weapon._get_ped_current_held_weapon(index)
                if   native.weapon._is_weapon_kit(CurrentWeapon) == true then
                    native.player._set_local_player_persona_ability_flag(17, true)
                    native.player._set_local_player_persona_ability_flag(20, true)
                 end
              else
                 native.player._set_local_player_persona_ability_flag(17, false)
                 native.player._set_local_player_persona_ability_flag(20, false)
                thread.yield()
            end
        end)
    end)























































































local tp_sub, self_sub_opt = menu.script_root():add_submenu("Teleport",{"No Clip must be turned OFF when using Teleports\n\nhttps://exodusmenu.com/\n"},function()
end)

local nested_tp = tp_sub:add_submenu("Places", {"No Clip must be turned OFF when using Teleports"}, function()
end)

tp_sub:add_separator("Self tp")

tp_sub:add_button("Animated Teleport to??", {"Thank you TNC!\nHight:\n90000002981m"}, function()
    local player_ped = native.player.player_ped_id()
    native.cam.set_third_person_cam_orbit_distance_limits_this_update(1.0, 5000.0)
    native.entity.set_entity_coords(player_ped, 906, -1500, 90000002981, false, false, false, false)
end)

tp_sub:add_button("Self [0, 0, 0]", { "Teleport self to [0, 0, 0]" }, function()
    local player_ped = native.player.player_ped_id()
    if native.entity.does_entity_exist(player_ped) then
        native.entity.set_entity_coords(player_ped, 0.0, 0.0, 0.0, true, true, true, true)
    end
end)

tp_sub:add_button("Self [1000, 1000, 1000]", { "Teleport self to [1000, 1000, 1000]" }, function()
    local player_ped = native.player.player_ped_id()
    if native.entity.does_entity_exist(player_ped) then
        native.entity.set_entity_coords(player_ped, 1000.0, 1000.0, 1000.0, true, true, true, true)
    end
end)


tp_sub:add_button("Self [10000, 10000, 10000]", { "Teleport self to [10000, 10000, 10000]" }, function()
    local player_ped = native.player.player_ped_id()
    if native.entity.does_entity_exist(player_ped) then
        native.entity.set_entity_coords(player_ped, 10000.0, 10000.0, 10000.0, true, true, true, true)
    end
end)





nested_tp:add_separator("Guarma")

nested_tp:add_button("Guarma Dock", { "" }, function()
    local player_ped = native.player.player_ped_id()
    if native.entity.does_entity_exist(player_ped) then
        native.entity.set_entity_coords(player_ped, 1276.674560546875, 6857.1240234375, 43.3184928894043, true, true, true, true)
    end
end)

nested_tp:add_button("Testbed", { "Empty flat field." }, function()
    local player_ped = native.player.player_ped_id()
    if native.entity.does_entity_exist(player_ped) then
        native.entity.set_entity_coords(player_ped, -1791.6947021484375, -6401.033203125, 117.76360321044922, true, true, true, true)
    end
end)

nested_tp:add_button("Guarma Ruins", { "" }, function()
    local player_ped = native.player.player_ped_id()
    if native.entity.does_entity_exist(player_ped) then
        native.entity.set_entity_coords(player_ped, 1167.8306884765625, -7258.22265625, 69.22354888916016, true, true, true, true)
    end
end)

nested_tp:add_button("Guarma Camp", { "" }, function()
    local player_ped = native.player.player_ped_id()
    if native.entity.does_entity_exist(player_ped) then
        native.entity.set_entity_coords(player_ped, 1424.854248046875, -7326.02197265625, 81.45873260498047, true, true, true, true)
    end
end)

nested_tp:add_button("Guarma Cave Entrance", { "" }, function()
    local player_ped = native.player.player_ped_id()
    if native.entity.does_entity_exist(player_ped) then
        native.entity.set_entity_coords(player_ped, 1505.6893310546875, -7188.0068359375, 63.85354232788086, true, true, true, true)
    end
end)

nested_tp:add_button("Guarma Cave <locked inside>", { "" }, function()
    local player_ped = native.player.player_ped_id()
    if native.entity.does_entity_exist(player_ped) then
        native.entity.set_entity_coords(player_ped, 1504.280517578125, -7142.642578125, 57.40495300292969, true, true, true, true)
    end
end)

nested_tp:add_separator("Misc")

nested_tp:add_button("Self Himalaya", { "" }, function()
    local player_ped = native.player.player_ped_id()
    if native.entity.does_entity_exist(player_ped) then
        native.entity.set_entity_coords(player_ped, -1986.3790283203125, 3096.802490234375, 691.7725830078125, true, true, true, true)
    end
end)

nested_tp:add_button("Sepulcro", { "Graves" }, function()
    local player_ped = native.player.player_ped_id()
    if native.entity.does_entity_exist(player_ped) then
        native.entity.set_entity_coords(player_ped, -2824.09033203125, -4413.234375, -2824.09033203125, true, true, true, true)
    end
end)



tp_sub:add_separator("Peds")

tp_sub:add_button("Peds [0, 0, 0]", { "Teleport all peds to [0, 0, 0]" }, function()
    for _, ped in ipairs(game.get_world_peds()) do
        if native.entity.does_entity_exist(ped) and ped ~= native.player.player_ped_id() then
            native.entity.set_entity_coords(ped, 0.0, 0.0, 0.0, true, true, true, true)
        end
    end
end)
































---@----------->>>>>>>>>>---------->>>>>>>>>>>>>------------->>>>>>>>>>>>>>----------->>>>>>>>>>>>>------------->>>>>>>>>>>>>>----------->>>>>>>>>>>>>------------->>>>>>>>>>>>>

---@----------------------------------------------//WORLD//-------------------------------------------------------------

---@----------->>>>>>>>>>>>>------------->>>>>>>>>>>>>>----------->>>>>>>>>>>>>------------->>>>>>>>>>>>>>----------->>>>>>>>>>>>>------------->>>>>>>>>>>>>>----------->>>>>>>>>>



local world_sub, world_sub_opt = menu.script_root():add_submenu("World",{"https://exodusmenu.com/\n" },
    function()
        --toast.add_info("Enter", "Main > World")
    end)




local function SetWeather()
local transition_time_in_seconds = 15.0
local next_weather_type_hash = native.misc.get_hash_key("HIGHPRESSURE")
    native.misc.set_weather_type(next_weather_type_hash, true, true, true, transition_time_in_seconds, false)
end

world_sub:add_separator("Weather")

world_sub:add_button("High Pressure", { "Your weather will change to \'High Pressure\'\nwith 15sec transition time" }, function()
    toast.add_info("Weather", "Changing weather to:\nHigh Pressure.\nChanging in:\n15sec")
    SetWeather()
    thread.yield(5000)
    toast.add_info("Weather", "Changing weather to:\nHigh Pressure.\nChanging in:\n10sec")
    thread.yield(5000)
    toast.add_info("Weather", "Changing weather to:\nHigh Pressure.\nChanging in:\n5sec")
    thread.yield(5000)
    toast.add_info("Weather", "Weather should be set to:\nHigh Pressure")
end)

world_sub_opt:add_hint("Weather will\nbe changed\nin 15sec")

world_sub:add_button("Reset weather", { "" }, function()
    native.misc.clear_weather_type_persist()
end)
    

world_sub:add_button("Remove Show", { "" }, function()
    native.graphics._set_snow_coverage_type(0)
end)


world_sub:add_separator("World Entity Related")

world_sub:add_button("Fill Population", {""}, function()
    native.ped.instantly_fill_ped_population()
        native.vehicle.instantly_fill_vehicle_population()
        native.misc.populate_now()
end)


























---@----------->>>>>>>>>>---------->>>>>>>>>>>>>------------->>>>>>>>>>>>>>----------->>>>>>>>>>>>>------------->>>>>>>>>>>>>>----------->>>>>>>>>>>>>------------->>>>>>>>>>>>>

---@----------------------------------------------//THEME//-------------------------------------------------------------

---@----------->>>>>>>>>>>>>------------->>>>>>>>>>>>>>----------->>>>>>>>>>>>>------------->>>>>>>>>>>>>>----------->>>>>>>>>>>>>------------->>>>>>>>>>>>>>----------->>>>>>>>>>


custom_log_key = "Exodus™"

custom_log_thread = false

custom_log_r, custom_log_g, custom_log_b = 1.0, 1.0, 1.0

function custom_log(str)
    if not log.has_key(custom_log_key) then
        log.new_key(custom_log_key, 1.0, 0.0, 0.0, true)
        if not custom_log_thread then
            custom_log_thread = thread.create(function() -- rainbow log
                local custom_log_hue = 0.0
                while true do
                    custom_log_hue = custom_log_hue + 0.001
                    if custom_log_hue >= 1.0 then custom_log_hue = 0.0 end
                    custom_log_r, custom_log_g, custom_log_b = gui.hsv_to_rgb(custom_log_hue, 0.5, 1.0)
                    log.set_key_colour(custom_log_key, custom_log_r, custom_log_g, custom_log_b)
                    thread.yield()
                end
            end)
        end
    end
    log.add(custom_log_key, str)
end






local function Rainbow_Option(hOption, pState)
    local oR, oG, oB, oA = hOption:get_colour()
    local oHue, oSat, oVal = gui.rgb_to_hsv(oR, oG, oB)
    while memory.read_s32(pState) == 1 do
        oHue = oHue + 0.001
        if oHue > 1.0 then
            oHue = 0.0
        end
        local nR, nG, nB = gui.hsv_to_rgb(oHue, oSat, oVal)
        hOption:set_colour(nR, nG, nB, 1.0, false)
        thread.yield(1)
    end
    hOption:set_colour(oR, oG, oB, oA, false)
end

tRainbow_Option = {}




local theme_sub, theme_sub_opt = menu.script_root():add_submenu("RGB Theme",{"Thank you Ado for your brilliant brain!\n\nMain > Theme > RGB:\n\n\t•  Menu Header Text\n\t•  Menu Title Text\n\t•  Menu Option Text\n\t•  Toast Info\n\t•  Prompt Text (Inactive)\n\t•  Menu Particles\n\t•  Menu Option Separator Text\n\t•  Menu Option Selector\n\t•  Debug Info Text\n\t•  Menu Footer Text\n\t•  Menu Option Hint Text\n\t•  Menu Option Text (Selected)\n\t•  Nav Indicator Thumb\n\t•  Nav Indicator Thumb (Viewport)\n\t•  Info Box Background\n\t•  Info Box Header Text\n\t•  Info Box Text\n\t•  Info Box Header Background\n\t•  Visual Friendly (Visible Primary)\n\t•  Visual Friendly (Concealed Primary)\n\t•  Visual Crosshair (Secondary)\n\t•  Visual Crosshair (Primary)\n\t•  Aimbot Field of View\n\t•  Drops Colour\n\t•  Light Colour\n\t•  Atmosphere Colour\n\t•  Moon Colour\n\t•  Sun Colour\n\nhttps://exodusmenu.com/\n" },
    function()
    end)



theme_sub:add_separator("Main > Settings > Theme")

theme_sub:add_toggle("Menu Header Text", {}, function(s)
    if s then
        if tRainbow_Option[2] == nil then
            tRainbow_Option[2] = memory.alloc_mem(4)
        end
        memory.write_s32(memory.get_address(tRainbow_Option[2]), 1)
        thread.create(function()
            Rainbow_Option(menu.get_internal_option("Main/Settings/Theme/Menu Header Text"),
                memory.get_address(tRainbow_Option[2]))
        end)
    else
        memory.write_s32(memory.get_address(tRainbow_Option[2]), 0)
    end
end)

theme_sub:add_toggle("Menu Title Text", {}, function(s)
    if s then
        if tRainbow_Option[26] == nil then
            tRainbow_Option[26] = memory.alloc_mem(4)
        end
        memory.write_s32(memory.get_address(tRainbow_Option[26]), 1)
        thread.create(function()
            Rainbow_Option(menu.get_internal_option("Main/Settings/Theme/Menu Title Text"),
                memory.get_address(tRainbow_Option[26]))
        end)
    else
        memory.write_s32(memory.get_address(tRainbow_Option[26]), 0)
    end
end)

theme_sub:add_toggle("Menu Option Text", {}, function(s)
    if s then
        if tRainbow_Option[27] == nil then
            tRainbow_Option[27] = memory.alloc_mem(4)
        end
        memory.write_s32(memory.get_address(tRainbow_Option[27]), 1)
        thread.create(function()
            Rainbow_Option(menu.get_internal_option("Main/Settings/Theme/Menu Option Text"),
                memory.get_address(tRainbow_Option[27]))
        end)
    else
        memory.write_s32(memory.get_address(tRainbow_Option[27]), 0)
    end
end)


theme_sub:add_toggle("Toast Info", {}, function(s)
    if s then
        if tRainbow_Option[6] == nil then
            tRainbow_Option[6] = memory.alloc_mem(4)
        end
        memory.write_s32(memory.get_address(tRainbow_Option[6]), 1)
        thread.create(function()
            Rainbow_Option(menu.get_internal_option("Main/Settings/Theme/Toast Info"),
                memory.get_address(tRainbow_Option[6]))
        end)
    else
        memory.write_s32(memory.get_address(tRainbow_Option[6]), 0)
    end
end)

theme_sub:add_toggle("Prompt Text (Inactive)", {}, function(s)
    if s then
        if tRainbow_Option[7] == nil then
            tRainbow_Option[7] = memory.alloc_mem(4)
        end
        memory.write_s32(memory.get_address(tRainbow_Option[7]), 1)
        thread.create(function()
            Rainbow_Option(menu.get_internal_option("Main/Settings/Theme/Prompt Text (Inactive)"),
                memory.get_address(tRainbow_Option[7]))
        end)
    else
        memory.write_s32(memory.get_address(tRainbow_Option[7]), 0)
    end
end)



theme_sub:add_toggle("Menu Particles", {}, function(s)
    if s then
        if tRainbow_Option[8] == nil then
            tRainbow_Option[8] = memory.alloc_mem(4)
        end
        memory.write_s32(memory.get_address(tRainbow_Option[8]), 1)
        thread.create(function()
            Rainbow_Option(menu.get_internal_option("Main/Settings/Theme/Menu Particles"),
                memory.get_address(tRainbow_Option[8]))
        end)
    else
        memory.write_s32(memory.get_address(tRainbow_Option[8]), 0)
    end
end)

theme_sub:add_toggle("Menu Option Separator Text", {}, function(s)
    if s then
        if tRainbow_Option[9] == nil then
            tRainbow_Option[9] = memory.alloc_mem(4)
        end
        memory.write_s32(memory.get_address(tRainbow_Option[9]), 1)
        thread.create(function()
            Rainbow_Option(menu.get_internal_option("Main/Settings/Theme/Menu Option Separator Text"),
                memory.get_address(tRainbow_Option[9]))
        end)
    else
        memory.write_s32(memory.get_address(tRainbow_Option[9]), 0)
    end
end)




theme_sub:add_toggle("Menu Option Selector", {}, function(s)
    if s then
        if tRainbow_Option[10] == nil then
            tRainbow_Option[10] = memory.alloc_mem(4)
        end
        memory.write_s32(memory.get_address(tRainbow_Option[10]), 1)
        thread.create(function()
            Rainbow_Option(menu.get_internal_option("Main/Settings/Theme/Menu Option Selector"),
                memory.get_address(tRainbow_Option[10]))
        end)
    else
        memory.write_s32(memory.get_address(tRainbow_Option[10]), 0)
    end
end)

theme_sub:add_toggle("Debug Info Text", {}, function(s)
    if s then
        if tRainbow_Option[11] == nil then
            tRainbow_Option[11] = memory.alloc_mem(4)
        end
        memory.write_s32(memory.get_address(tRainbow_Option[11]), 1)
        thread.create(function()
            Rainbow_Option(menu.get_internal_option("Main/Settings/Theme/Debug Info Text"),
                memory.get_address(tRainbow_Option[11]))
        end)
    else
        memory.write_s32(memory.get_address(tRainbow_Option[11]), 0)
    end
end)
theme_sub:add_toggle("Menu Footer Text", {}, function(s)
    if s then
        if tRainbow_Option[12] == nil then
            tRainbow_Option[12] = memory.alloc_mem(4)
        end
        memory.write_s32(memory.get_address(tRainbow_Option[12]), 1)
        thread.create(function()
            Rainbow_Option(menu.get_internal_option("Main/Settings/Theme/Menu Footer Text"),
                memory.get_address(tRainbow_Option[12]))
        end)
    else
        memory.write_s32(memory.get_address(tRainbow_Option[12]), 0)
    end
end)

theme_sub:add_toggle("Menu Option Hint Text", {}, function(s)
    if s then
        if tRainbow_Option[25] == nil then
            tRainbow_Option[25] = memory.alloc_mem(4)
        end
        memory.write_s32(memory.get_address(tRainbow_Option[25]), 1)
        thread.create(function()
            Rainbow_Option(menu.get_internal_option("Main/Settings/Theme/Menu Option Hint Text"),
                memory.get_address(tRainbow_Option[25]))
        end)
    else
        memory.write_s32(memory.get_address(tRainbow_Option[25]), 0)
    end
end)

theme_sub:add_toggle("Menu Option Text (Selected)", {}, function(s)
    if s then
        if tRainbow_Option[24] == nil then
            tRainbow_Option[24] = memory.alloc_mem(4)
        end
        memory.write_s32(memory.get_address(tRainbow_Option[24]), 1)
        thread.create(function()
            Rainbow_Option(menu.get_internal_option("Main/Settings/Theme/Menu Option Text (Selected)"),
                memory.get_address(tRainbow_Option[24]))
        end)
    else
        memory.write_s32(memory.get_address(tRainbow_Option[24]), 0)
    end
end)

theme_sub:add_toggle("Nav Indicator Thumb", {}, function(s)
    if s then
        if tRainbow_Option[13] == nil then
            tRainbow_Option[13] = memory.alloc_mem(4)
        end
        memory.write_s32(memory.get_address(tRainbow_Option[13]), 1)
        thread.create(function()
            Rainbow_Option(menu.get_internal_option("Main/Settings/Theme/Nav Indicator Thumb"),
                memory.get_address(tRainbow_Option[13]))
        end)
    else
        memory.write_s32(memory.get_address(tRainbow_Option[13]), 0)
    end
end)

theme_sub:add_toggle("Nav Indicator Thumb (ViewPoint)", {}, function(s)
    if s then
        if tRainbow_Option[14] == nil then
            tRainbow_Option[14] = memory.alloc_mem(4)
        end
        memory.write_s32(memory.get_address(tRainbow_Option[14]), 1)
        thread.create(function()
            Rainbow_Option(menu.get_internal_option("Main/Settings/Theme/Nav Indicator Thumb (Viewport)"),
                memory.get_address(tRainbow_Option[14]))
        end)
    else
        memory.write_s32(memory.get_address(tRainbow_Option[14]), 0)
    end
end)

theme_sub:add_toggle("Info Box Background", {}, function(s)
    if s then
        if tRainbow_Option[15] == nil then
            tRainbow_Option[15] = memory.alloc_mem(4)
        end
        memory.write_s32(memory.get_address(tRainbow_Option[15]), 1)
        thread.create(function()
            Rainbow_Option(menu.get_internal_option("Main/Settings/Theme/Info Box Background"),
                memory.get_address(tRainbow_Option[15]))
        end)
    else
        memory.write_s32(memory.get_address(tRainbow_Option[15]), 0)
    end
end)



theme_sub:add_toggle("Info Box Header Text", {}, function(s)
    if s then
        if tRainbow_Option[16] == nil then
            tRainbow_Option[16] = memory.alloc_mem(4)
        end
        memory.write_s32(memory.get_address(tRainbow_Option[16]), 1)
        thread.create(function()
            Rainbow_Option(menu.get_internal_option("Main/Settings/Theme/Info Box Header Text"),
                memory.get_address(tRainbow_Option[16]))
        end)
    else
        memory.write_s32(memory.get_address(tRainbow_Option[16]), 0)
    end
end)


theme_sub:add_toggle("Info Box Text", {}, function(s)
    if s then
        if tRainbow_Option[28] == nil then
            tRainbow_Option[28] = memory.alloc_mem(4)
        end
        memory.write_s32(memory.get_address(tRainbow_Option[28]), 1)
        thread.create(function()
            Rainbow_Option(menu.get_internal_option("Main/Settings/Theme/Info Box Text"),
                memory.get_address(tRainbow_Option[28]))
        end)
    else
        memory.write_s32(memory.get_address(tRainbow_Option[28]), 0)
    end
end)

theme_sub:add_toggle("Info Box Header Background", {}, function(s)
    if s then
        if tRainbow_Option[17] == nil then
            tRainbow_Option[17] = memory.alloc_mem(4)
        end
        memory.write_s32(memory.get_address(tRainbow_Option[17]), 1)
        thread.create(function()
            Rainbow_Option(menu.get_internal_option("Main/Settings/Theme/Info Box Header Background"),
                memory.get_address(tRainbow_Option[17]))
        end)
    else
        memory.write_s32(memory.get_address(tRainbow_Option[17]), 0)
    end
end)



theme_sub:add_toggle("Visual Friendly (Visible Primary)", {}, function(s)
    if s then
        if tRainbow_Option[18] == nil then
            tRainbow_Option[18] = memory.alloc_mem(4)
        end
        memory.write_s32(memory.get_address(tRainbow_Option[18]), 1)
        thread.create(function()
            Rainbow_Option(menu.get_internal_option("Main/Settings/Theme/Visual Friendly (Visible Primary)"),
                memory.get_address(tRainbow_Option[18]))
        end)
    else
        memory.write_s32(memory.get_address(tRainbow_Option[18]), 0)
    end
end)

theme_sub:add_toggle("Visual Friendly (Concealed Primary)", {}, function(s)
    if s then
        if tRainbow_Option[19] == nil then
            tRainbow_Option[19] = memory.alloc_mem(4)
        end
        memory.write_s32(memory.get_address(tRainbow_Option[19]), 1)
        thread.create(function()
            Rainbow_Option(menu.get_internal_option("Main/Settings/Theme/Visual Friendly (Concealed Primary)"),
                memory.get_address(tRainbow_Option[19]))
        end)
    else
        memory.write_s32(memory.get_address(tRainbow_Option[19]), 0)
    end
end)


theme_sub:add_toggle("Visual Crosshair (Secondary)", {}, function(s)
    if s then
        if tRainbow_Option[21] == nil then
            tRainbow_Option[21] = memory.alloc_mem(4)
        end
        memory.write_s32(memory.get_address(tRainbow_Option[21]), 1)
        thread.create(function()
            Rainbow_Option(menu.get_internal_option("Main/Settings/Theme/Visual Crosshair (Secondary)"),
                memory.get_address(tRainbow_Option[21]))
        end)
    else
        memory.write_s32(memory.get_address(tRainbow_Option[21]), 0)
    end
end)



theme_sub:add_toggle("Visual Crosshair (Primary)", {}, function(s)
    if s then
        if tRainbow_Option[23] == nil then
            tRainbow_Option[23] = memory.alloc_mem(4)
        end
        memory.write_s32(memory.get_address(tRainbow_Option[23]), 1)
        thread.create(function()
            Rainbow_Option(menu.get_internal_option("Main/Settings/Theme/Visual Crosshair (Primary)"),
                memory.get_address(tRainbow_Option[23]))
        end)
    else
        memory.write_s32(memory.get_address(tRainbow_Option[23]), 0)
    end
end)

theme_sub:add_toggle("Aimbot Field of View", {}, function(s)
    if s then
        if tRainbow_Option[30] == nil then
            tRainbow_Option[30] = memory.alloc_mem(4)
        end
        memory.write_s32(memory.get_address(tRainbow_Option[30]), 1)
        thread.create(function()
            Rainbow_Option(menu.get_internal_option("Main/Settings/Theme/Aimbot Field of View"),
                memory.get_address(tRainbow_Option[30]))
        end)
    else
        memory.write_s32(memory.get_address(tRainbow_Option[30]), 0)
    end
end)


theme_sub:add_separator("Main > World > Drops")

theme_sub:add_toggle("Drops Colour", {}, function(s)
    if s then
        if tRainbow_Option[31] == nil then
            tRainbow_Option[31] = memory.alloc_mem(4)
        end
        memory.write_s32(memory.get_address(tRainbow_Option[31]), 1)
        thread.create(function()
            Rainbow_Option(menu.get_internal_option("Main/World/Drops/Colour"), memory.get_address(tRainbow_Option[31]))
        end)
    else
        memory.write_s32(memory.get_address(tRainbow_Option[31]), 0)
    end
end)


theme_sub:add_separator("Main > World > Light")

theme_sub:add_toggle("Light Colour", {}, function(s)
    if s then
        if tRainbow_Option[3] == nil then
            tRainbow_Option[3] = memory.alloc_mem(4)
        end
        memory.write_s32(memory.get_address(tRainbow_Option[3]), 1)
        thread.create(function()
            Rainbow_Option(menu.get_internal_option("Main/World/Light/Colour"), memory.get_address(tRainbow_Option[3]))
        end)
    else
        memory.write_s32(memory.get_address(tRainbow_Option[3]), 0)
    end
end)



theme_sub:add_separator("Main > World > Sky")

theme_sub:add_toggle("Atmosphere Colour", {}, function(s)
    if s then
        if tRainbow_Option[5] == nil then
            tRainbow_Option[5] = memory.alloc_mem(4)
        end
        memory.write_s32(memory.get_address(tRainbow_Option[5]), 1)
        thread.create(function()
            Rainbow_Option(menu.get_internal_option("Main/World/Sky/Atmosphere Colour"),
                memory.get_address(tRainbow_Option[5]))
        end)
    else
        memory.write_s32(memory.get_address(tRainbow_Option[5]), 0)
    end
end)


theme_sub:add_toggle("Moon Colour", {}, function(s)
    if s then
        if tRainbow_Option[4] == nil then
            tRainbow_Option[4] = memory.alloc_mem(4)
        end
        memory.write_s32(memory.get_address(tRainbow_Option[4]), 1)
        thread.create(function()
            Rainbow_Option(menu.get_internal_option("Main/World/Sky/Moon Colour"), memory.get_address(tRainbow_Option[4]))
        end)
    else
        memory.write_s32(memory.get_address(tRainbow_Option[4]), 0)
    end
end)

theme_sub:add_toggle("Sun Colour", {}, function(s)
    if s then
        if tRainbow_Option[29] == nil then
            tRainbow_Option[29] = memory.alloc_mem(4)
        end
        memory.write_s32(memory.get_address(tRainbow_Option[29]), 1)
        thread.create(function()
            Rainbow_Option(menu.get_internal_option("Main/World/Sky/Sun Colour"), memory.get_address(tRainbow_Option[29]))
        end)
    else
        memory.write_s32(memory.get_address(tRainbow_Option[29]), 0)
    end
end)





















































---@----------->>>>>>>>>>---------->>>>>>>>>>>>>------------->>>>>>>>>>>>>>----------->>>>>>>>>>>>>------------->>>>>>>>>>>>>>----------->>>>>>>>>>>>>------------->>>>>>>>>>>>>

---@----------------------------------------------//SETTINGS//-------------------------------------------------------------

---@----------->>>>>>>>>>>>>------------->>>>>>>>>>>>>>----------->>>>>>>>>>>>>------------->>>>>>>>>>>>>>----------->>>>>>>>>>>>>------------->>>>>>>>>>>>>>----------->>>>>>>>>>


































    local misc_sub, misc_sub_opt = menu.script_root():add_submenu("Misc",{"https://exodusmenu.com/\n"},function(index)
end, nil)





misc_sub:add_separator("KIND OF SOLO LOBBY")

misc_sub:add_toggle("Ghost-Not Internal",{ "network_start_solo_tutorial_session\n\t\t\t\tand\nnetwork_end_solo_tutorial_session" }, function(state)
    if state == true then
        toast.add_warning("Ghosting:", "Enabled")
        native.network.network_start_solo_tutorial_session()
    elseif state == false then
        toast.add_warning("Ghosting:", "Disabled")
        native.network.network_end_tutorial_session()
    end
end)










misc_sub:add_separator("HUD/LOG")

misc_sub:add_toggle("Hud", { "Toggle hud ON/OFF" }, function(state)
    if state then
        native.hud.display_hud(true) -- a function from the game for hud disabling.. (you can find more stuff on Exodus Docs)
    else
        native.hud.display_hud(false)
    end
end)

misc_sub:add_button("True", {"log.set_key_visibility(True)"}, function()
        log.set_key_visibility("Exodus", true)
        toast.add_success("•log.set_key_visibility•", "True!")
end)

misc_sub:add_button("False", {"log.set_key_visibility"}, function()
        log.set_key_visibility("Exodus™", false)
        toast.add_warning("•log.set_key_visibility(False)•", "Key Visibility set to False!")
end)

misc_sub_opt:set_toggle(true) -- sets it to true on default...

misc_sub:add_button("Log Matrix", { "Output matrix to custom log" }, function()
    local player_ped = native.player.player_ped_id()
    if native.entity.does_entity_exist(player_ped) then
        local right_vector = vec3:new()
        local forward_vector = vec3:new()
        local up_vector = vec3:new()
        local position = vec3:new()
        native.entity.get_entity_matrix(player_ped, right_vector, forward_vector, up_vector, position)
        custom_log("right_vector: " .. right_vector.x .. " | " .. right_vector.y .. " | " .. right_vector.z)
        custom_log("forward_vector: " .. forward_vector.x .. " | " .. forward_vector.y .. " | " .. forward_vector.z)
        custom_log("up_vector: " .. up_vector.x .. " | " .. up_vector.y .. " | " .. up_vector.z)
        custom_log("position: " .. position.x .. " | " .. position.y .. " | " .. position.z)
    end
end)

misc_sub:add_separator("OTHER STUFF")
local exs_sub = misc_sub:add_submenu("Examples",
    {
        "Features:\n\n\t• Feature | [info]\n\t• Feature | [info]\n\t• Feature | [info]\n\t• Feature | [info]\n\t• Feature | [info]\n\nhttps://exodusmenu.com/\n" },
    function()
        toast.add_info("Enter", "Main > Examples")
    end)

exs_sub:add_button("Info", { "toast.add_info" }, function(on_click)
    do
        toast.add_info("• info •", "Button was pressed!")
    end
end)

exs_sub:add_button("Error", { "toast.add_error" }, function(on_click)
    do
        toast.add_error("• Error •", "Button was pressed!")
    end
end)

exs_sub:add_button("Warning", { "toast.add_warning" }, function(on_click)
    do
        toast.add_warning("• Warning •", "Button was pressed!")
    end
end)

exs_sub:add_button("Success", { "toast.add_success" }, function(on_click)
    do
        toast.add_success("• Success •", "Button was pressed!")
    end
end)

exs_sub:add_text_input("Text Input", "Initial Text...", 16, true, false, { "This is a text input example" },
    function(value)
        toast.add_info("Text Input", "On Submit\nValue: " .. value)
    end)

exs_sub:add_slider_int("Int Slider", 1, 1, 10, 1, false, { "This is a int slider example" }, function(value)
    toast.add_info("Int Slider", "On Click\nValue: " .. value)
end, nil)

exs_sub:add_slider_float("Float Slider", 240, 10, 1000, 10, true, { "This is a float slider example" }, function(value)
    toast.add_info("Float Slider", "On Click\nValue: " .. value)
end, nil)

exs_sub:add_list("List", { "Item 1", "Item 2" }, true, { "This is a list example" }, function(value, state)
    toast.add_info("List", "On Click\nValue: " .. tostring(value) .. "\nState: " .. tostring(state))
end, nil)

local nested_sub, nested_sub_opt = exs_sub:add_submenu("Nested Submenu", { "This is a nested submenu example" },
    function()
        toast.add_info("Submenu enter called", "Test")
    end, nil)

nested_sub:add_colour("Colour", 1.0, 0.0, 1.0, 1.0, { "This is a colour example" })

exs_sub:add_separator("add_separator('Example')")

