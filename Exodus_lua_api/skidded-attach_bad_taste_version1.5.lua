script.keep_alive()
--[[
First I would like to thank my good friend TNC who have been helping me to learn Lua. 
Secondly i thank my copy-paste skills for skidding that lua from Fortnite.

PS! Fuck you Picard aka Jamison. :)

]]

local PlayerPed = native.player.get_player_ped(0)                            
local PosX, PosY, PosZ = native.entity.get_entity_coords(PlayerPed, false, true)    
local TargetPed = nil			                                    
local TargetPlayer = nil			                             
local TposX, TposY, TposZ = 0.0, 0.0, 0.0               


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
local Dancenoattach1 = false
local Dancenoattach2 = false
local Dancenoattach3 = false
local Dancenoattach4 = false
local Drunkhug1 = false
local Drunkhug2 = false
local Drunkhug3 = false
local Drunkhug4 = false
local Drunkhug5 = false
local Drunkhug6 = false
local Pee1 = false
local Pee2 = false
local Pee3 = false
local Pee4 = false
local Pee5 = false
local Pee6 = false
local Pee7 = false
local Pee8 = false
local Pee9 = false
local vomit1 = false
local vomit2 = false
local vomit3 = false
local vomit4 = false
local vomit5 = false
local vomit6 = false
local Peenoattach1 = false
local Peenoattach2 = false
local Peenoattach3 = false
local Peenoattach4 = false
local Peenoattach5 = false
local Peenoattach6 = false
local Peenoattach7 = false
local Peenoattach8 = false
local Peenoattach9 = false
local TUP = false
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
local laugh2 = flase 
local Porn1 = false
local Porn2 = false
local Horsefxcker = false
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
    Dancenoattach1 = false
    Dancenoattach2 = false
    Dancenoattach3 = false
    Dancenoattach4 = false
    Drunkhug1 = false
    Drunkhug2 = false
    Drunkhug3 = false
    Drunkhug4 = false
    Drunkhug5 = false
    Drunkhug6 = false
    
    hug2 = false
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
    vomit1 = false
    vomit2 = false
    vomit3 = false
    vomit4 = false
    vomit5 = false
    vomit6 = false
    Peenoattach1 = false
    Peenoattach2 = false
    Peenoattach3 = false
    Peenoattach4 = false
    Peenoattach5 = false
    Peenoattach6 = false
    Peenoattach7 = false
    Peenoattach8 = false
    Peenoattach9 = false
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
    laugh1 = flase
    laugh2 = flase
    Porn1 = false
    Porn2 = false
    Horsefxcker = false  
end


local function UpdateLPlayer()
    PlayerPed = native.player.get_player_ped(0)
    PosX, PosY, PosZ = native.entity.get_entity_coords(PlayerPed, false, true)
end

local function UpdateTPlayer(Index)
    TargetPlayer = Index
    TargetPed = native.player.get_player_ped_script_index(Index)
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
        --toast.add_warning("Fortnite fucker is", "attached to ... " .. player.get_name(TargetPlayer) .. '.')
    	native.entity.attach_entity_to_entity(PlayerPed, TargetPed, 0, PosX, PosY, PosZ, RotX, RotY, RotZ, false, false, false, true, 0, true, false, false)
	end
end

menu.script_root():add_button("Read Me", {"Those features work only:\n\tNetwork >\n\tPlayers >\n\tScripts"}, function()
end)



menu.script_root():add_separator("Have fun!")


--[[
    Offsets are the position where you want to attach yourself to the player.
        PosX - left/right
        PosY - forward/backward
        PosZ - up/down
    Rotations are the rotation of the player. They rotate you around x, y, z axis.

    You can adjust oisition in PosX, PosY, PosZ, RotX, RotY, RotZ
]]




menu.player_root():add_button("Clear Tasks", {"Clear your player tasks.\n(can be used to stop\nanimations as well.)"}, function()
    UpdateLPlayer()
    ClearTasks(PlayerPed)
end)

menu.player_root():add_button("Detach", {"Detach yourself from your `buddy`"}, function()
    UpdateLPlayer()
    native.entity.detach_entity(PlayerPed, true, true)
end)



menu.player_root():add_separator("Animations")

menu.player_root():add_button("Sit on face", {"Sit on your `buddy's` Shoulders"}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not SitOnFace then
        local anim_dict = "script_story@gry1@ig@ig_15_archibald_sit_reading"
        local anim = "held_1hand_archibald"
        AttachMeToPlayer(index, 0.0, 0.2, 0.7, 0.0, 0.0, 180.0)
        PlayAnimTask(anim_dict, anim)
		SitOnFace = true
    else
		SetAnimFalse()
	end
end)

menu.player_root():add_button("Sit on head", {"Sit on your `buddy's` Heads"}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not SitOnhead then
        local anim_dict = "script_story@gry1@ig@ig_15_archibald_sit_reading"
        local anim = "held_1hand_archibald"
        AttachMeToPlayer(index, 0.0, -0.2, 0.9, 0.0, 0.0, 180.0)
        PlayAnimTask(anim_dict, anim)
		SitOnhead = true
    else
		SetAnimFalse()
	end
end)

menu.player_root():add_button("Sit on Back", {"Sit on your `buddy's` back"}, function(index)
    ClearTasks(PlayerPed)
	if not BeingWeird then
		local anim_disc = "amb_rest_sit@prop_human_seat_chair_table@eating@fork_knife@rest_front@male_a@base"
		local anim = "base"
		AttachMeToPlayer(index, 0.0, -0.2, 0.1, 0.0, 0.0, 0.0)
        PlayAnimTask(anim_disc, anim)
        BeingWeird = true
    else
		SetAnimFalse()
	end
end)

menu.player_root():add_button("Hug", {"Hug Hug`not back"}, function(index)
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
menu.player_root():add_button("Eat my shit", {"Eat shit sucker` Face"}, function(index)
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
menu.player_root():add_button("Start to Fxxk", {"Do u like?` Butt"}, function(index)
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
menu.player_root():add_button("Start to Fxxk riding Horse", {"Do u like?` Horse Butt"}, function(index)
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
menu.player_root():add_button("Hit Butt", {"Happy?` Butt"}, function(index)
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
menu.player_root():add_button("Dance1", {"Firedance` Head"}, function(index)
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
menu.player_root():add_button("Dance2", {"Sworddance` Head"}, function(index)
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
menu.player_root():add_button("Dance3", {"Snackedance` Head"}, function(index)
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
menu.player_root():add_button("Dance4", {"Fire breather dance` Head"}, function(index)
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
menu.player_root():add_button("Kissbutt", {"Kiss my butt`  Face"}, function(index)
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

menu.player_root():add_button("Dance no attach1", {"Fire breather dance` Head"}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not Dancenoattach1 then
        local anim_dict = "script_shows@firebreather@act2_p1"
        local anim = "dancer_dance"
        PlayAnimTask(anim_dict, anim)
		Dancenoattach1 = true
    else
		SetAnimFalse()
	end
end)
menu.player_root():add_button("Dance no attach2", {"Snackedance` Head"}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not Dancenoattach2 then
        local anim_dict = "script_shows@snakedancer@act2_p1"
        local anim = "dance_dancer"
        PlayAnimTask(anim_dict, anim)
		Dancenoattach2 = true
    else
		SetAnimFalse()
	end
end)
menu.player_root():add_button("Dance no attach3", {"Sworddance` Head"}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not Dancenoattach3 then
        local anim_dict = "script_shows@sworddance@act3_p1"
        local anim = "dancer_sworddance"
        PlayAnimTask(anim_dict, anim)
		Dancenoattach3 = true
    else
		SetAnimFalse()
	end
end)
menu.player_root():add_button("Dance no attach4", {"Firedance` Head"}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not Dancenoattach4 then
        local anim_dict = "script_shows@firedancer@act3_p1"
        local anim = "dance"
        PlayAnimTask(anim_dict, anim)
		Dancenoattach4 = true
    else
		SetAnimFalse()
	end
end)
menu.player_root():add_button("Drunkhug1", {"HUG` HUG"}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not Drunkhug1 then
        local anim_dict = "mech_melee@unarmed@posse@ambient@healthy@noncombat"
        local anim = "shove_greet_front_drunk_vs_sober_v3_att"
        AttachMeToPlayer(index, 0.0, 0.3, 0.0, 0.0, 0.0, 180.0)
        PlayAnimTask(anim_dict, anim)
		Drunkhug1 = true
    else
		SetAnimFalse()
	end
end)
menu.player_root():add_button("Drunkhug2", {"HUG` HUG"}, function(index)
  UpdateLPlayer()
  ClearTasks(PlayerPed)
  if not Drunkhug2 then
      local anim_dict = "mech_melee@unarmed@posse@ambient@healthy@noncombat"
      local anim = "shove_greet_back_drunk_vs_drunk_v1_att"
      AttachMeToPlayer(index, 0.0, 0.4, 0.0, 0.0, 0.0, 180.0)
      PlayAnimTask(anim_dict, anim)
  Drunkhug2 = true
  else
  SetAnimFalse()
end
end)
menu.player_root():add_button("Drunkhug3", {"HUG` HUG"}, function(index)
  UpdateLPlayer()
  ClearTasks(PlayerPed)
  if not Drunkhug3 then
      local anim_dict = "mech_melee@unarmed@posse@ambient@healthy@noncombat"
      local anim = "shove_greet_front_drunk_vs_drunk_v1_att"
      AttachMeToPlayer(index, 0.0, 0.4, 0.0, 0.0, 0.0, 180.0)
      PlayAnimTask(anim_dict, anim)
  Drunkhug3 = true
  else
  SetAnimFalse()
end
end)
menu.player_root():add_button("Drunkhug4", {"HUG` HUG"}, function(index)
  UpdateLPlayer()
  ClearTasks(PlayerPed)
  if not Drunkhug4 then
      local anim_dict = "mech_melee@unarmed@posse@ambient@healthy@noncombat"
      local anim = "shove_greet_front_drunk_vs_sober_v1_att"
      AttachMeToPlayer(index, 0.0, 0.4, 0.0, 0.0, 0.0, 180.0)
      PlayAnimTask(anim_dict, anim)
  Drunkhug4 = true
  else
  SetAnimFalse()
end
end)
menu.player_root():add_button("Drunkhug5", {"HUG` HUG"}, function(index)
  UpdateLPlayer()
  ClearTasks(PlayerPed)
  if not Drunkhug5 then
      local anim_dict = "mech_melee@unarmed@posse@ambient@healthy@noncombat"
      local anim = "shove_greet_left_drunk_vs_drunk_v1_att"
      AttachMeToPlayer(index, 0.0, 0.4, 0.0, 0.0, 0.0, 180.0)
      PlayAnimTask(anim_dict, anim)
  Drunkhug5 = true
  else
  SetAnimFalse()
end
end)
menu.player_root():add_button("Drunkhug6", {"HUG` HUG"}, function(index)
  UpdateLPlayer()
  ClearTasks(PlayerPed)
  if not Drunkhug6 then
      local anim_dict = "mech_melee@unarmed@posse@ambient@healthy@noncombat"
      local anim = "shove_greet_back_drunk_vs_sober_v1_att"
      AttachMeToPlayer(index, 0.0, 0.4, 0.0, 0.0, 0.0, 180.0)
      PlayAnimTask(anim_dict, anim)
  Drunkhug6 = true
  else
  SetAnimFalse()
end
end)
menu.player_root():add_button("Pee1", {"Pee on the Head"}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not Pee1 then
        
        local anim_dict = "amb_misc@world_human_pee@male_a@idle_a"
        local anim = "idle_a"
        AttachMeToPlayer(index, 0.0, 0.3, 1.7, 0.0, 0.0, 180.0)
        PlayAnimTask(anim_dict, anim)
		Pee1 = true
    else
		SetAnimFalse()
	end
end)
menu.player_root():add_button("Pee2", {"Pee on the Head"}, function(index)
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
menu.player_root():add_button("Pee3", {"Pee on the Head"}, function(index)
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
menu.player_root():add_button("Pee4", {"Pee on the Head"}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not Pee4 then
        
        local anim_dict = "amb_misc@world_human_pee@male_a@idle_b"
        local anim = "idle_e"
        --AttachMeToPlayer(index, 0.0, 0.3, 1.7, 0.0, 0.0, 180.0)
        PlayAnimTask(anim_dict, anim)
		Pee4 = true
    else
		SetAnimFalse()
	end
end)
menu.player_root():add_button("Pee5", {"Pee on the Head"}, function(index)
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
menu.player_root():add_button("Pee6", {"Pee on the Head"}, function(index)
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
menu.player_root():add_button("Pee7", {"Pee on the Head"}, function(index)
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
menu.player_root():add_button("Pee8", {"Pee on the Head"}, function(index)
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
menu.player_root():add_button("Pee9", {"Pee on the Head"}, function(index)
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
menu.player_root():add_button("vomit1", {"vomit on the Head on the Head"}, function(index)
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
menu.player_root():add_button("vomit2", {"vomit on the Head on the Head"}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not vomit2 then
        
        local anim_dict = "amb_rest_drunk@world_human_drunk_brace_wall@vomit@male_a@idle_a"
        local anim = "idle_b"
        AttachMeToPlayer(index, 0.0, 0.3, 1.7, 0.0, 0.0, 180.0)
        PlayAnimTask(anim_dict, anim)
		vomit2 = true
    else
		SetAnimFalse()
	end
end)
menu.player_root():add_button("vomit3", {"vomit on the Head "}, function(index)
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
menu.player_root():add_button("vomit4", {"vomit on the Head"}, function(index)
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
menu.player_root():add_button("vomit5", {"vomit on the Head"}, function(index)
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
menu.player_root():add_button("vomit6", {"vomit on the Head"}, function(index)
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
menu.player_root():add_button("Pee1 no attach", {"Pee on the Head"}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not Peenoattach1 then
        
        local anim_dict = "amb_misc@world_human_pee@male_a@idle_a"
        local anim = "idle_a"
        
        PlayAnimTask(anim_dict, anim)
		Peenoattach1 = true
    else
		SetAnimFalse()
	end
end)
menu.player_root():add_button("Pee2 no attach", {"Pee on the Head"}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not Peenoattach2 then
        
        local anim_dict = "amb_misc@world_human_pee@male_a@idle_a"
        local anim = "idle_b"
        
        PlayAnimTask(anim_dict, anim)
		Peenoattach2 = true
    else
		SetAnimFalse()
	end
end)
menu.player_root():add_button("Pee3 no attach", {"Pee on the Head"}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not Peenoattach3 then
        
        local anim_dict = "amb_misc@world_human_pee@male_a@idle_a"
        local anim = "idle_c"
        
        PlayAnimTask(anim_dict, anim)
		Peenoattach3 = true
    else
		SetAnimFalse()
	end
end)
menu.player_root():add_button("Pee4 no attach", {"Pee on the Head"}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not Peenoattach4 then
        
        local anim_dict = "amb_misc@world_human_pee@male_a@idle_b"
        local anim = "idle_e"
       
        PlayAnimTask(anim_dict, anim)
		Peenoattach4 = true
    else
		SetAnimFalse()
	end
end)
menu.player_root():add_button("Pee5 no attach", {"Pee on the Head"}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not Peenoattach5 then
        
        local anim_dict = "amb_misc@world_human_pee@male_a@idle_b"
        local anim = "idle_d"
        
        PlayAnimTask(anim_dict, anim)
		Peenoattach5 = true
    else
		SetAnimFalse()
	end
end)
menu.player_root():add_button("Pee6 no attach", {"Pee on the Head"}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not Peenoattach6 then
        
        local anim_dict = "amb_misc@world_human_pee@male_a@idle_b"
        local anim = "idle_f"
        
        PlayAnimTask(anim_dict, anim)
		Peenoattach6 = true
    else
		SetAnimFalse()
	end
end)
menu.player_root():add_button("Pee7 no attach", {"Pee on the Head"}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not Peenoattach7 then
        
        local anim_dict = "amb_misc@world_human_pee@male_a@idle_c"
        local anim = "idle_h"
       
        PlayAnimTask(anim_dict, anim)
		Peenoattach7 = true
    else
		SetAnimFalse()
	end
end)
menu.player_root():add_button("Pee8 no attach", {"Pee on the Head"}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not Peenoattach8 then
        
        local anim_dict = "amb_misc@world_human_pee@male_a@idle_c"
        local anim = "idle_g"
        
        PlayAnimTask(anim_dict, anim)
		Peenoattach8 = true
    else
		SetAnimFalse()
	end
end)
menu.player_root():add_button("Pee9 no attach", {"Pee on the Head"}, function(index)
    UpdateLPlayer()
    ClearTasks(PlayerPed)
    if not Peenoattach9 then
        
        local anim_dict = "amb_misc@world_human_pee@male_a@base"
        local anim = "base"
        
        PlayAnimTask(anim_dict, anim)
		Peenoattach9 = true
    else
		SetAnimFalse()
	end
end)
menu.player_root():add_button("Slap1", {"slap on the face"}, function(index)
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
menu.player_root():add_button("Slap2", {"slap on the face"}, function(index)
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
menu.player_root():add_button("Slap3", {"slap on the face"}, function(index)
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
menu.player_root():add_button("Slap4", {"slap on the face"}, function(index)
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
menu.player_root():add_button("Slap5", {"slap on the face"}, function(index)
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
menu.player_root():add_button("Slap6", {"slap on the face"}, function(index)
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
menu.player_root():add_button("Slap7", {"slap on the face"}, function(index)
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
menu.player_root():add_button("Slap8", {"slap on the face"}, function(index)
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
menu.player_root():add_button("Slap9", {"slap on the face"}, function(index)
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
menu.player_root():add_button("laugh1", {"hhh"}, function(index)
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
menu.player_root():add_button("laugh2", {"hhh"}, function(index)
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

menu.player_root():add_button("Touch your penis", {"Your penis is so small"}, function(index)
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
menu.player_root():add_button("F*CK U", {"Enjoy it"}, function(index)
  UpdateLPlayer()
  ClearTasks(PlayerPed)
  if not Porn1 then
      
      local anim_dict ="script_story@mud3@ig@ig_1_throw_whore"
      local anim ="base_att"
      AttachMeToPlayer(index, 0.0, -0.4, 0.0, 20.0, 0.0, 0.0) 
      PlayAnimTask(anim_dict, anim)
  Porn1 = true
  else
  SetAnimFalse()
end
end)
menu.player_root():add_button("F*CK ME", {"Enjoy it"}, function(index)
  UpdateLPlayer()
  ClearTasks(PlayerPed)
  if not Porn2 then
      
      local anim_dict ="script_story@mud3@ig@ig_1_throw_whore"
      local anim ="base_vtm"
      AttachMeToPlayer(index, 0.0, 0.25, 0.0, 0.0, 0.0, 0.0) 
      PlayAnimTask(anim_dict, anim)
  Porn2 = true
  else
  SetAnimFalse()
end
end)
menu.player_root():add_button("F*CK horse", {"Enjoy it"}, function(index)
  UpdateLPlayer()
  ClearTasks(PlayerPed)
  if not Horsefxcker then
      
      local anim_dict ="script_story@mud3@ig@ig_1_throw_whore"
      local anim ="base_att"
      AttachMeToPlayer(index, 0.0, -1.0, -0.2, 20.0, 0.0, 0.0) 
      PlayAnimTask(anim_dict, anim)
  Horsefxcker = true
  else
  SetAnimFalse()
end
end)

--⣿⣿⣿⣿⣿⣿⠿⢋⣥⣴⣶⣶⣶⣬⣙⠻⠟⣋⣭⣭⣭⣭⡙⠻⣿⣿⣿⣿⣿
--⣿⣿⣿⣿⡿⢋⣴⣿⣿⠿⢟⣛⣛⣛⠿⢷⡹⣿⣿⣿⣿⣿⣿⣆⠹⣿⣿⣿⣿
--⣿⣿⣿⡿⢁⣾⣿⣿⣴⣿⣿⣿⣿⠿⠿⠷⠥⠱⣶⣶⣶⣶⡶⠮⠤⣌⡙⢿⣿
--⣿⡿⢛⡁⣾⣿⣿⣿⡿⢟⡫⢕⣪⡭⠥⢭⣭⣉⡂⣉⡒⣤⡭⡉⠩⣥⣰⠂⠹
--⡟⢠⣿⣱⣿⣿⣿⣏⣛⢲⣾⣿⠃⠄⠐⠈⣿⣿⣿⣿⣿⣿⠄⠁⠃⢸⣿⣿⡧
--⢠⣿⣿⣿⣿⣿⣿⣿⣿⣇⣊⠙⠳⠤⠤⠾⣟⠛⠍⣹⣛⣛⣢⣀⣠⣛⡯⢉⣰
--⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡶⠶⢒⣠⣼⣿⣿⣛⠻⠛⢛⣛⠉⣴⣿⣿
--⣿⣿⣿⣿⣿⣿⣿⡿⢛⡛⢿⣿⣿⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡈⢿⣿
--⣿⣿⣿⣿⣿⣿⣿⠸⣿⡻⢷⣍⣛⠻⠿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⢇⡘⣿
--⣿⣿⣿⣿⣿⣿⣿⣷⣝⠻⠶⣬⣍⣛⣛⠓⠶⠶⠶⠤⠬⠭⠤⠶⠶⠞⠛⣡⣿
--⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣬⣭⣍⣙⣛⣛⣛⠛⠛⠛⠿⠿⠿⠛⣠⣿⣿
--⣦⣈⠉⢛⠻⠿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠛⣁⣴⣾⣿⣿⣿⣿
--⣿⣿⣿⣶⣮⣭⣁⣒⣒⣒⠂⠠⠬⠭⠭⠭⢀⣀⣠⣄⡘⠿⣿⣿⣿⣿⣿⣿⣿
--⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡈⢿⣿⣿⣿⣿⣿