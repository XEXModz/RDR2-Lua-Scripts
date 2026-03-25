lua_player = {}

function lua_player.my_ped()
    return native.player.player_ped_id()
end

function lua_player.my_pid()
    return native.player.player_id()
end

function lua_player.my_name()
    return player.get_name(lua_player.my_pid())
end

function lua_player.player_list(include_me)
    local pid = -1
    if not include_me then
        include_me = lua_player.my_pid()
    end
    return function()
        repeat
            pid = pid + 1
        until pid == 32 or (include_me ~= pid and player.is_connected(pid))
        if pid ~= 32 then
            return pid
        end
    end
end

function lua_player.player_count()
    local count = 0
    for pid in lua_player.player_list(true) do
        count = count + 1
    end
    return count
end

function lua_player.get_player_ip(pid)
    local b1, b2, b3, b4 <const> = player.get_ip(pid)
    return b1 .. "." .. b2 .. "." .. b3 .. "." .. b4
end

function lua_player.get_player_port(pid)
    if player.get_port(pid) == 0 then
        return "nil"
    else
        return player.get_port(pid)
    end
end

function lua_player.its_me(pid, title, feature)
    if pid == lua_player.my_pid() then
        toast.add_warning(title, "You can't do it on yourself.")
        feature:set_toggle(false)
        return true
    else
        return false
    end
end

return lua_player