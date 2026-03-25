local afk_name = "Anti-AFK Script"
script.set_name("Anti-AFK")
script.set_desc("Prevents you from being idle kicked")
script.keep_alive()

log.add(afk_name, "Anti-AFK script loaded successfully.")
toast.add_success(afk_name, "Anti-AFK script loaded successfully.")

local anti_afk_running = false

local function network_is_session_started()
    return native.network.network_is_session_started()
end

local function anti_afk()
    anti_afk_running = true
    thread.create(function()
        while anti_afk_running do
            thread.yield(0)
            if network_is_session_started() then
                game.set_global_int(1102813 + 3919, 2147483647)
                game.set_global_int(1102813 + 3918, 0)
            end
        end
    end)
end

menu.script_root():add_toggle("Anti AFK", {"Prevents you from being idle kicked"}, function(state)
    if state == true then
        toast.add_success(afk_name, "Anti-AFK script enabled.")
        anti_afk()
    else
        toast.add_success(afk_name, "Anti-AFK script disabled.")
        anti_afk_running = false
        if network_is_session_started() then
            game.set_global_int(1102813 + 3918, 1)
            game.set_global_int(1102813 + 3919, 0)
        end
    end
end)
