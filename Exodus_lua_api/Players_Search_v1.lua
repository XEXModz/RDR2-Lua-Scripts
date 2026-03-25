---@diagnostic disable: lowercase-global
script.keep_alive()
script.set_name("Players Search by Folke™")
timen = os.date("%H:%M:%S")
date = os.date("%d.%m.%Y")
cashhh = native.money._network_get_string_cash_balance()
script.set_desc("Can't take full credit for this script.\nUnfortunately i can't remember who made something similar first\nand then shared it with me.\nIf you recognise yourself then dm me in discord.\n\n|ΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞΞ\\||____\n|      The STFU Truck\t   |||''''''|'''''\\__,_\n| _̳_̳_̳_̳_̳_̳_̳_̳_̳_̳_̳_̳_̳_̳_̳_̳_̳_̳_̳_̳_̳_̳ l||__|__|__|__|)\n\t|(〇)〇)``````````***|(〇)(〇)***|(〇)\n\n\thttps://exodusmenu.com/\n")
log.new_key("By Folke™", 0.89, 0.44, 0.11, true)
log.add("By Folke™", "`---------------------~___~---------------------''")
log.add("By Folke™", "||/====================\\:/=====================\\||")
log.add("By Folke™", "||||__________________  :  ___________________||||")
log.add("By Folke™", "||||   exodusmenu.com   :    	               ||||")
log.add("By Folke™", "||||                    :                     ||||")
log.add("By Folke™", "||||                    :                     ||||")
log.add("By Folke™", "||||                    :                     ||||")
log.add("By Folke™", "||||       Folke™       :      "..os.date("%d.%m.%Y").."     ||||")
log.add("By Folke™", "||||         by:        :        Date:        ||||")
log.add("By Folke™", "||||        Made        :                     ||||")
log.add("By Folke™", "||||                    :       "..os.date("%H:%M:%S".."      ||||"))
log.add("By Folke™", "||||       Search       :        Time:        ||||")
log.add("By Folke™", "||||      Players       :                     ||||")
log.add("By Folke™", "||||                    :                     ||||")
log.add("By Folke™", ".-/|  01   ~~**~~      \\:/      ~~**~~    02  |\\-.")
log.add("By Folke™", "    ___________________   ____________________   ")
toast.add_warning("Quick Tip!", "Leave it running when afk..\n(simply enter some random name and activate)\nKicking fort while afk,\nkill two birds with same stone.")
toast.add_info("Players Search by Folke™","Welcome: "..player.get_name(0))

script.on_shutdown(function()
    log.clear_key("- Players Search")
    log.clear_key("- Players Ignored")
    log.delete_key("- Players Ignored")
    log.delete_key("- Players Search")
        local date = os.date("%H:%M:%S\n%d/%m/%Y")
        local cashhh = native.money._network_get_string_cash_balance()
        toast.add_info("Players Search by Folke™", "Process Ended\n"..date .. "\nWith current balance:\n"..cashhh.."\nTil next time!\n___________________\n"..player.get_name(0).."\n___________________\nPlayers Search by Folke™\nis shutting down...")
end)

player_search_sub = menu.script_root():add_submenu("Search by Name",{"Quick Tip!","Leave it running when aff..\n(simply enter some sandom name and activate)\nKicking fort while afk,\nkill two birds with same stone.","https://exodusmenu.com/\n"}, function()
end)


player_search_sub_r = menu.script_root():add_submenu("Search by RID",{"Quick Tip!","Leave it running when aff..\n(simply enter some sandom name and activate)\nKicking fort while afk,\nkill two birds with same stone.","https://exodusmenu.com/\n"}, function()
end)


ChangeTimeInterval = 0
ChangeTimeInterval2 = 0

LookPlayer2 = false
LookPlayer3 = false

changetable = {
    ["10sec"] = 10000,
    ["15sec"] = 15000,
    ["20sec"] = 20000,
    ["25sec"] = 25000,
    ["30sec"] = 30000,
    ["35sec"] = 35000,
    ["40sec"] = 40000,
    ["45sec"] = 45000,
    ["50sec"] = 50000,
    ["55sec"] = 55000,
    ["1min"] = 60000,
    ["2min"] = 120000,
}



asshole = player_search_sub:add_text_input("Target Name:", "", 16, true, false, {"Case Sensitive"}, function(namevalue)
    log.new_key("- Players Search", 1.0, 0.84, 0.0, true)
    log.add("Err", "    ___________________   ____________________   ")
    log.add("- Players Search", "Target Name: → "..tostring(asshole:get_text()).." ←")
    toast.add_info("Target Name:", " → "..tostring(asshole:get_text()).." ←")
end)
asshole:add_hint("Quick Tip!")
asshole:add_hint("Leave it running when afk..\n(simply enter some random name and activate)\nKicking fort while afk,\nkill two birds with same stone.")

thread_time = player_search_sub:add_list("Session Switch Interval", {"10sec","15sec","20sec","25sec","30sec","35sec","40sec","45sec","50sec","55sec","1min","2min"}, true, {}, function(value)
    if thread_time:get_toggle() then
        log.new_key("- Players Search", 1.0, 0.84, 0.0, true)
        log.add("- Players Search", "Session Hopper Set To: " ..value)
        toast.add_info("Session Hopper Set To: "..value)
     while thread_time:get_toggle() do
        ChangeTimeInterval = changetable[thread_time:get_item(value)]
         thread.yield()
     end
 end
 end)

 thread.create(function()
    while true do
        if LookPlayer2 then
            log.add("- Players Search","Searching: → "..tostring(asshole:get_text()).." ←")
            toast.add_info("Searching: → "..tostring(asshole:get_text()).." ←", "Interval: " ..tostring(thread_time:get_item()))
           for index = 1, 31 do
                 local playerName = player.get_name(index)
                 log.add("- Players Ignored","Ignoring Player: " ..playerName)
                if playerName == asshole:get_text() then
                    toast.add_info("¯\\_(:/)_/¯ ", tostring(asshole:get_text()).."\ni found u")
                    found = true
                    playerPed1 = native.player.get_player_ped(index)
                    posVec = native.entity.get_offset_from_entity_in_world_coords(playerPed1, 0, 0, 0)
                    break
        else
            thread.yield(1)
              end
    end

if found == true or LookPlayer2 == false then
    break
else
    toast.add_warning( "Session Hopper","Requesting New Session.")
    local session_request_option = menu.get_internal_option("Main/Network/Request Session")
    if session_request_option then
        session_request_option:set_toggle(true)

    else
        toast.add_error("Error", "Unable to find")
        return
    end
    thread.yield(ChangeTimeInterval)
end

end
thread.yield(1)
end
end)

player_search_sub:add_toggle("Start Searching", {}, function(state)
    log.new_key("- Players Ignored", 0.54, 0.17, 0.89, true)
    LookPlayer2 = state
end)

player_search_sub:add_separator("Console Log")

search_toggle_log = player_search_sub:add_toggle("Toggle 'Player Search' log visibility", {}, function(state)
    log.set_key_visibility("- Players Search", state)
end)
search_toggle_log:set_toggle(true)

player_search_sub:add_button("Clear 'Player Search' log entry", {}, function(state)
    log.clear_key("- Players Search")
end)

player_search_sub:add_button("Delete 'Player Search' log entry", {}, function(state)
    log.delete_key("- Players Search")
end)

player_search_sub:add_separator("")

search_toggle_log2 = player_search_sub:add_toggle("Toggle 'Players Ignored' log visibility", {}, function(state)
    log.set_key_visibility("- Players Ignored", state)
end)
search_toggle_log2:set_toggle(true)

player_search_sub:add_button("Clear 'Players Ignored' log entry", {}, function(state)
    log.clear_key("- Players Ignored")
end)

player_search_sub:add_button("Delete 'Players Ignored' log entry", {}, function(state)
    log.delete_key("- Players Ignored")
end)


asshole2 =  player_search_sub_r:add_text_input("Target RID:", "", 16, true, false, {"Case Sensitive"}, function(namevalue)
    log.new_key("- Players Search", 1.0, 0.84, 0.0, true)
    log.add("Err", "    ___________________   ____________________   ")
    log.add("- Players Search", "Target RID: → " ..tonumber(asshole2:get_text()).. " ←")
    toast.add_info("Target RID:", " → " ..tonumber(asshole2:get_text()).. " ←")
end)
asshole2:add_hint("Quick Tip!")
asshole2:add_hint("Leave it running when afk..\n(simply enter some random name and activate)\nKicking fort while afk,\nkill two birds with same stone.")


thread_time2 = player_search_sub_r:add_list("Session Switch Interval", {"10sec","15sec","20sec","25sec","30sec","35sec","40sec","45sec","50sec","55sec","1min","2min"}, true, {}, function(value)
    if thread_time2:get_toggle() then
        log.new_key("- Players Search", 1.0, 0.84, 0.0, true)
        log.add("- Players Search", "Session Change interval set to: "..value)
        toast.add_info("Session Hopper Set To: "..value)
     while thread_time2:get_toggle() do
        ChangeTimeInterval2 = changetable[thread_time2:get_item(value)]
         thread.yield()
     end
 end
 end)

 thread.create(function()
    while true do
        if LookPlayer3 then
            log.add("- Players Search","Target RID: → " ..tonumber(asshole2:get_text()).. " ←")
            toast.add_info("Target RID: → " ..tonumber(asshole2:get_text()).. " ←","Interval: " ..tostring(thread_time2:get_item()))
           for index = 1, 31 do
                 local playerRid = player.get_rockstar_id(index)
                 log.add("- Players Ignored","Ignored RID: "..playerRid)
                if playerRid == asshole2:get_text() then
                toast.add_info("¯\\_(:/)_/¯ ", tonumber(asshole2:get_text()).."\ni found u")
                    found2 = true
                    playerPed1 = native.player.get_player_ped(index)
                    posVec = native.entity.get_offset_from_entity_in_world_coords(playerPed1, 0, 0, 0)
                    break
        else
            thread.yield(1)
              end
    end
   

if found2 == true or LookPlayer3 == false then
    break
else
    toast.add_warning( "Session Hopper","Requesting New Session.")
    local session_request_option = menu.get_internal_option("Main/Network/Request Session")
    if session_request_option then
        session_request_option:set_toggle(true)
        toast.add_info("Target RID: → " ..tonumber(asshole2:get_text()).. " ←")
    else
        toast.add_error("Error", "Unable to find")
        return
    end
    thread.yield(ChangeTimeInterval2)
end

end
thread.yield(1)
end
end)

player_search_sub_r:add_toggle("Start Searching", {}, function(state)
    log.new_key("- Players Ignored", 0.54, 0.17, 0.89, true)
    LookPlayer3 = state
end)

player_search_sub_r:add_separator("")

search_toggle_log = player_search_sub_r:add_toggle("Toggle 'Player Search' log visibility", {}, function(state)
    log.set_key_visibility("- Players Search", state)
end)
search_toggle_log:set_toggle(true)

player_search_sub_r:add_button("Clear 'Player Search' log entry", {}, function(state)
    log.clear_key("- Players Search")
end)

player_search_sub_r:add_button("Delete 'Player Search' log entry", {}, function(state)
    log.delete_key("- Players Search")
end)

player_search_sub_r:add_separator("")

search_toggle_log2 = player_search_sub_r:add_toggle("Toggle 'Players Ignored' log visibility", {}, function(state)
    log.set_key_visibility("- Players Ignored", state)
end)
search_toggle_log2:set_toggle(true)

player_search_sub_r:add_button("Clear 'Players Ignored' log entry", {}, function(state)
    log.clear_key("- Players Ignored")
end)

player_search_sub_r:add_button("Delete 'Players Ignored' log entry", {}, function(state)
    log.delete_key("- Players Ignored")
end)