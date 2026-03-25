lua_essential = {}

function lua_essential.table_remove(table_list, delete)
    local table_delete <const> = {}
    for k, v in pairs(table_list) do
        if v == delete then
            table.insert(table_delete, k)
        end
    end
    table.sort(table_delete, function(a, b)
        return a > b
    end)
    for _, index in ipairs(table_delete) do
        table.remove(table_list, index)
    end
end

function lua_essential.create_doubling_table(size)
    local table = {}
    local value = 1
    for i = 1, size do
        table[i] = tostring(value)
        value = value * 2
    end
    return table
end

function lua_essential.filter_table(inputTable, filterString)
    local resultTable <const> = {}
    local lowercaseFilter <const> = filterString:lower()
    for _, value in ipairs(inputTable) do
        local lowercaseValue <const> = value:lower()
        local containsAllChars = true
        for char in lowercaseFilter:gmatch('.') do
            if not string.find(lowercaseValue, char, 1, true) then
                containsAllChars = false
                break
            end
        end
        if containsAllChars then
            table.insert(resultTable, value)
        end
    end
    return resultTable
end

function lua_essential.add_to_player_history(name, rid, ip, port, joined)
    if name ~= lua_player.my_name() then
        update_history_file = true
        local date = string.format("%02d/%02d/%d", os.date("*t").day, os.date("*t").month, os.date("*t").year)
        local time = string.format("%02d:%02d:%02d", os.date("*t").hour, os.date("*t").min, os.date("*t").sec)
        local history_file <const> = fs.get_workspace_path() .. "/Anarchy/history.cfg"
        local file <const> = io.open(history_file, "r")
        if file then
            local count = 0
            for line in file:lines() do
                count = count + 1
                local file_name, file_rid, file_ip, file_port, first_seen_date, first_seen_time, last_seen_date, last_seen_time, how_many_times = line:match("([^|]+)|([^|]+)|([^|]+)|([^|]+)|([^|]+)|([^|]+)|([^|]+)|([^|]+)|([^|]+)")
                local date = last_seen_date
                local time = last_seen_time
                if joined then
                    how_many_times = how_many_times + 1
                    date = string.format("%02d/%02d/%d", os.date("*t").day, os.date("*t").month, os.date("*t").year)
                    time = string.format("%02d:%02d:%02d", os.date("*t").hour, os.date("*t").min, os.date("*t").sec)
                end
                if file_name == tostring(name) then
                    lua_essential.rewrite_line(history_file, count, file_name .. "|" .. file_rid .. "|" .. file_ip .. "|" .. file_port .. "|" .. first_seen_date .. "|" .. first_seen_time .. "|" .. date .. "|" .. time .. "|" .. how_many_times)
                    io.close(file)
                    return
                end
            end
        end
        local file <const> = io.open(history_file, "a")
        if file then
            io.output(file)
            io.write(name .. "|" .. rid .. "|" .. ip .. "|" .. port .. "|" .. date .. "|" .. time .. "|" .. date .. "|" .. time .. "|" .. "1" .. "\n")
            io.close(file)
        end
    end
end

function lua_essential.rewrite_line(path, line_to_change, new_content)
    local file <const> = io.open(path, "r")
    local lines <const> = {}
    for line in file:lines() do
        table.insert(lines, line)
    end
    file:close()
    if lines[line_to_change] then
        lines[line_to_change] = new_content
    end
    local file <const> = io.open(path, "w")
    for _, line in ipairs(lines) do
        file:write(line .. "\n")
    end
    file:close()
end

function lua_essential.sort_table_alphabetically(mode, tbl)
    local sorted_table = {}
    for left, right in pairs(tbl) do
        table.insert(sorted_table, {left = left, right = right})
    end
    if mode == "left" then
        table.sort(sorted_table, function(a, b)
            return a.left < b.left
        end)
    elseif mode == "right" then
        table.sort(sorted_table, function(a, b)
            return a.right < b.right
        end)
    elseif mode == "list" then
        sorted_table = {}
        for list in pairs(tbl) do
            table.insert(sorted_table, list)
        end
        table.sort(sorted_table)
    end
    return sorted_table
end

function lua_essential.get_number_value(feature)
    return tonumber(string.format("%.2f", feature:get_value()))
end

function lua_essential.better_notify(value)
    if native.ped.is_ped_a_player(value) then
        for pid in lua_player.player_list(true) do
            if player.get_ped(pid) == value then
                return player.get_name(pid) .. " (Player)"
            end
        end
    end
    local entity_name <const> = lua_essential.better_name(lua_entity.get_hash_name(native.entity.get_entity_model(value)), "1")
    local entity_type <const> = native.entity.get_entity_type(value)
    if entity_type == 1 then
        return entity_name .. " (Ped)"
    elseif entity_type == 2 then
        return entity_name .. " (Vehicle)"
    elseif entity_type == 3 then
        return entity_name .. " (Object)"
    end
    return "nil"
end

function lua_essential.better_name(name, mode)
    local result = ""
    if mode == "1" then
        local capitalizeNext = true
        for i = 1, #name do
            local char = string.sub(name, i, i)
            if char == '_' then
                result = result .. "_"
                capitalizeNext = true
            else
                char = capitalizeNext and string.upper(char) or string.lower(char)
                result = result .. char
                capitalizeNext = false
            end
        end
    elseif mode == "2" then
        local segments <const> = {}
        for segment in string.gmatch(name, "[^_]+") do
            table.insert(segments, segment)
        end
        if string.find(name, "_") then
            table.remove(segments, 1)
        end
        for i, segment in ipairs(segments) do
            segments[i] = string.upper(string.sub(segment, 1, 1)) .. string.sub(segment, 2)
        end
        result = table.concat(segments, " ")
    end
    return result
end

local button_locked <const> = {}
function lua_essential.add_button(submenu, label, hints, callback)
    return submenu:add_button(label, hints, function(pid)
        if not button_locked[label] then
            button_locked[label] = true
            callback(pid)
            button_locked[label] = false
        end
    end)
end

local toggle_locked <const> = {}
function lua_essential.add_toggle(submenu, label, hints, callback)
    return submenu:add_toggle(label, hints, function(pid)
        if not toggle_locked[label] then
            toggle_locked[label] = true
            callback(pid)
            toggle_locked[label] = false
        end
    end)
end

local slider_int_locked <const> = {}
function lua_essential.add_slider_int(submenu, label, initial_value, minimum, maximum, step, toggle, hints, callback)
    return submenu:add_slider_int(label, initial_value, minimum, maximum, step, toggle, hints, function(pid)
        if not slider_int_locked[label] then
            slider_int_locked[label] = true
            callback(pid)
            slider_int_locked[label] = false
        end
    end)
end

local slider_float_locked <const> = {}
function lua_essential.add_slider_float(submenu, label, initial_value, minimum, maximum, step, toggle, hints, callback)
    return submenu:add_slider_float(label, initial_value, minimum, maximum, step, toggle, hints, function(pid)
        if not slider_float_locked[label] then
            slider_float_locked[label] = true
            callback(pid)
            slider_float_locked[label] = false
        end
    end)
end

local toggle_list_locked <const> = {}
function lua_essential.add_list(submenu, label, items, toggle, hints, callback)
    return submenu:add_list(label, items, toggle, hints, function(pid)
        if not toggle_list_locked[label] then
            toggle_list_locked[label] = true
            callback(pid)
            toggle_list_locked[label] = false
        end
    end)
end

return essential