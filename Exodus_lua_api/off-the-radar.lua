local script_name = "Off The Radar Script"
script.set_name("Off The Radar")
script.set_desc("Hide your blip from other players on the map")
script.keep_alive()

log.add(script_name, "Off The Radar script loaded successfully.")
toast.add_success(script_name, "Off The Radar script loaded successfully.")

local off_the_radar_enabled = false

local function off_the_radar()
    off_the_radar_enabled = true
    thread.create(function()
        while off_the_radar_enabled do
            thread.yield(0)
            local ped = native.player.player_ped_id()
            
            native.decorator.decor_set_int(ped, "MP_HUD_Hide_My_Blip_FOR_TEAMS", -1)
            
            local current_flags = native.decorator.decor_get_int(ped, "MP_HUD_Bits")
            if current_flags then
                native.decorator.decor_set_int(ped, "MP_HUD_Bits", current_flags | 64)
            else
                native.decorator.decor_set_int(ped, "MP_HUD_Bits", 64)
            end
        end
    end)
end

menu.script_root():add_toggle("Off The Radar", {"Hide your blip from other players", "You won't show up on the maps of other players"}, function(state)
    if state == true then
        off_the_radar()
        toast.add_success(script_name, "Off The Radar script enabled.")
    else
        toast.add_success(script_name, "Off The Radar script disabled.")
        off_the_radar_enabled = false
        local ped = native.player.player_ped_id()
        native.decorator.decor_remove(ped, "MP_HUD_Hide_My_Blip_FOR_TEAMS")
        
        local current_flags = native.decorator.decor_get_int(ped, "MP_HUD_Bits")
        if current_flags then
            native.decorator.decor_set_int(ped, "MP_HUD_Bits", current_flags & ~64)
        end
    end
end)