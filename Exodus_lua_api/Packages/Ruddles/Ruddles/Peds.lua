lua_peds = {}

function lua_peds.SpawnPed(hash, coords, coords, coords, heading)
    if lua_fast_calls.request_model(hash) then
        return native.ped.create_ped(hash, coords, coords, coords, heading, true, true, false, false)
    end
end
function lua_peds.delete_ped(ent)
	if lua_fast_calls.request_control(ent, 1000) then
		native.ped.set_ped_as_no_longer_needed(ent)
		return native.ped.delete_ped(ent)
	end
end

return lua_peds