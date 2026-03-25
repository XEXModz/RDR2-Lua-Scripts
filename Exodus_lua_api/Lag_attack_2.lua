toast.add_info("Lag attack By CRAZYPONY")
local root = menu.player_root()
 root:add_button("Start", {}, function (playerIdx)
toast.add_info("Create something")
    local playerPed = native.player.get_player_ped(playerIdx)
  
    local posVec = native.entity.get_offset_from_entity_in_world_coords(playerPed, 0, 0, 0)
    for i= 1,60 do
    local object1 = native.object.create_object_no_offset(0xEFA76886,posVec.x, posVec.y, posVec.z-2, true, true, true, false)

end
native.fire.add_explosion(posVec.x, posVec.y, posVec.z, 17, 1, true, true, 50.0)
 end)
 script.keep_alive()