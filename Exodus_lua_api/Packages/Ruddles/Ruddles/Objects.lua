--//Useful//--
--https://alloc8or.re/rdr3/nativedb/
--https://docs.exodusmenu.com/scripting/namespaces/native/_namespace4/

--
--
-- Please ping TNC_Zen if you find errors in the quick call natives :)
-- This is my first attempt not get mad...please :(
--
lua_object = {}

--//[Start of Objects]//--
local function create_object(hash, posx, posy, posz, is_network, b_script_host_obj, dynamic, p7, p8)
    if request_model(hash) then 
        native.object.create_object(hash, posx, posy, posz)
    end
end
local function create_object_no_offset(hash, floatx, floaty, floatz, is_network, b_script_host_obj, dynamic, p7)
    if request_model(hash) then 
        native.object.create_object_no_offset()
    end
end
local function delete_object(object)
    native.object.delete_object(object)
end
local function place_object_on_ground_properly(object, bool)
    native.object.place_object_on_ground_properly(object, bool)
end
local function slide_object(hash, to_x, to_y, to_z, speed_x, speed_y, speed_z, collision)
    native.object.slide_object(hash)
end
local function set_object_targettable(hash, targettable)
    native.object.set_object_targettable(hash)
end
local function set_object_targettable_2(hash, targettable)
    native.object._set_object_targettable_2(hash)
end
local function set_object_targettable_focus(hash, p1, p2)
    native.object._set_object_targettable_focus(hash)
end
local function _0xf6e88489b4e6ebe5(p0, p1)
    native.object._0xf6e88489b4e6ebe5()
end
local function _0xe157a8a336c7f04a(p0, p1)
    native.object._0xe157a8a336c7f04a()
end
local function _0x46cbcf0e98a4e156(p0, p1)
    native.object._0x46cbcf0e98a4e156()
end
local function get_closest_object_of_type(floatx, floaty, floatz, radius, model_hash, mission_script_object, script_host_object, network_object)
    native.object.get_closest_object_of_type()
end
local function has_object_been_broken(p0)
    native.object.has_object_been_broken()
end
local function has_closest_object_of_type_been_broken(p0, p1, p2, p3, hash, p5)
    native.object.has_closest_object_of_type_been_broken()
end
local function get_offset_from_coord_and_heading_in_world_coords(x_pos, y_pos, z_pos, heading, x_offset, y_offset, z_offset)
    native.object.get_offset_from_coord_and_heading_in_world_coords()
end
local function add_door_to_system_new(door_hash, p1, p2, p3, thread_id, p5, p6)
    native.object._add_door_to_system()
end
local function is_door_registered_with_network(door_hash)
    native.object._is_door_registered_with_network()
end
local function remove_door_from_system(door_hash)
    native.object.remove_door_from_system()
end
local function door_system_set_door_state(door_hash, state)
    native.object.door_system_set_door_state()
end
local function door_system_get_door_state(door_hash)
    native.object.door_system_get_door_state()
end
local function door_system_set_automatic_rate(door_hash, rate)
    native.object.door_system_set_automatic_rate()
end
local function door_system_set_automatic_distance(door_hash, distance)
    native.object.door_system_set_automatic_distance()
end
local function _0xb3b1546d23df8de1(p0, p1, p2, p3, p4)
    native.object._0xb3b1546d23df8de1()
end
local function door_system_set_open_ratio(door_hash, ajar, force_update)
    native.object.door_system_set_open_ratio()
end
local function _0x3a77dae8b4fd7586(p0, p1)
    native.object._0x3a77dae8b4fd7586()
end
local function door_system_set_able_to_change_open_ratio_while_locked(door_hash, p1)
    native.object._door_system_set_able_to_change_open_ratio_while_locked()
end
local function is_door_registered_with_owner(door_hash)
    native.object._is_door_registered_with_owner()
end
local function door_system_change_script_owner(door_hash)
    native.object._door_system_change_script_owner(door_hash)
end
local function _0x6e2aa80bb0c03728(p0, p1)
    native.object._0x6e2aa80bb0c03728()
end
local function door_system_set_automatic_state(door_hash, disable)
    native.object._door_system_set_automatic_state()
end
local function door_system_get_open_ratio(door_hash)
    native.object.door_system_get_open_ratio()
end
local function is_door_registered_with_system(door_hash)
    native.object.is_door_registered_with_system()
end
local function is_door_closed(door_hash)
    native.object.is_door_closed()
end
local function door_system_force_shut(door_hash, p1)
    native.object._door_system_force_shut()
end
local function does_object_of_type_exist_at_coords(x, y, z, radius, hash, p5)
    native.object.does_object_of_type_exist_at_coords()
end
local function is_point_in_angled_area(p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11)
    native.object.is_point_in_angled_area()
end
local function set_object_allow_low_lod_buoyancy(hash, toggle)
    native.object.set_object_allow_low_lod_buoyancy()
end
local function set_object_physics_params(object, weight, p2, p3, p4, p5, gravity, p7, p8, p9, p10, buoyancy)
    native.object.set_object_physics_params()
end
local function get_object_fragment_damage_health(p0, p1)
    native.object.get_object_fragment_damage_health()
end

local function set_activate_object_physics_as_soon_as_it_is_unfrozen(hash, toggle)
    native.object.set_activate_object_physics_as_soon_as_it_is_unfrozen()
end
local function break_object_fragment_child(hash, p1, p2)
    native.object.break_object_fragment_child()
end
local function break_all_object_fragment_bones(hash)
    native.object.break_all_object_fragment_bones()
end
local function damage_bone_on_prop(hash, bone)
    native.object._damage_bone_on_prop()
end
local function fix_object_fragment(hash)
    native.object.fix_object_fragment()
end
local function set_object_break_scale(hash, scale)
    native.object._set_object_break_scale()
end
local function track_object_visibility(hash)
    native.object.track_object_visibility()
end
local function is_object_visible(hash)
    native.object.is_object_visible()
end
local function set_object_takes_damage_from_colliding_with_buildings(hash, enabled)
    native.object.set_object_takes_damage_from_colliding_with_buildings()
end
local function allow_damage_events_for_non_networked_objects(enabled)
    native.object.allow_damage_events_for_non_networked_objects()
end
local function get_light_intensity_from_object(hash)
    native.object._get_light_intensity_from_object()
end
local function set_light_intensity_for_object(hash, light_intensity)
    native.object.set_light_intensity_for_object()
end
local function set_light_translucency_for_object(hash, value)
    native.object._set_light_translucency_for_object()
end
local function set_light_scattering_disabled_for_object(hash, disable)
    native.object._set_light_scattering_disabled_for_object()
end
local function get_rayfire_map_object(x, y, z, radius, name)
    native.object.get_rayfire_map_object()
end
local function set_state_of_rayfire_map_object(hash, state)
    native.object.set_state_of_rayfire_map_object()
end
local function get_state_of_rayfire_map_object(hash)
    native.object.get_state_of_rayfire_map_object()
end
local function does_rayfire_map_object_exist(hash)
    native.object.does_rayfire_map_object_exist()
end
local function get_rayfire_map_object_anim_phase(hash)
    native.object.get_rayfire_map_object_anim_phase()
end
local function create_pickup(hash, x, y, z, flags, p5, p6, model_hash, p8, p9, p10)
    if request_model(hash) then
        native.object.create_pickup()
    end
end
local function create_pickup_rotate(pickup_hash, pos_x, pos_y, pos_z, rot_x, rot_y, rot_z, flags, p8, p9, p10, model_hash, p12, p13, p14)
    if request_model(hash) then 
        native.object.create_pickup_rotate()
    end
end
local function create_ambient_pickup(pickup_hash, x, y, z, flags, value, model_hash, p7, p8, p9, p10)
    if request_model(hash) then
        native.object.create_ambient_pickup()
    end
end
local function create_portable_pickup(pickup_hash, floatx, floaty, floatz, place_on_ground, model_hash)
    if request_model(hash) then 
        native.object.create_portable_pickup()
    end
end
local function attach_portable_pickup_to_ped(pickup_object, ped)
    native.object.attach_portable_pickup_to_ped()
end
local function detach_portable_pickup_from_ped(pickup_hash)
    native.object.detach_portable_pickup_from_ped()
end
local function hide_pickup_object(pickup_hash, toggle)
    native.object._hide_pickup_object()
end
local function set_max_num_portable_pickups_carried_by_player(hash, p1)
    native.object.set_max_num_portable_pickups_carried_by_player()
end
local function set_local_player_can_collect_portable_pickups(toggle)
    native.object.set_local_player_can_collect_portable_pickups()
end
local function get_safe_pickup_coords(p0, p1, p2, p3, p4, p5)
    native.object.get_safe_pickup_coords()
end
local function get_pickup_coords(pickup)
    native.object.get_pickup_coords()
end
local function remove_all_pickups_of_type(pickup_hash)
    native.object.remove_all_pickups_of_type()
end
local function has_pickup_been_collected(pickup)
    native.object.has_pickup_been_collected()
end
local function remove_pickup(pickup)
    native.object.remove_pickup()
end
local function set_pickup_do_not_auto_place_on_ground(pickup_object)
    native.object.set_pickup_do_not_auto_place_on_ground()
end
local function does_pickup_exist(pickup)
    native.object.does_pickup_exist(pickup)
end
local function does_pickup_object_exist(pickup_object)
    native.object.does_pickup_object_exist()
end
local function get_pickup_object(pickup)
    native.object.get_pickup_object()
end
local function is_object_a_portable_pickup()
    native.object.is_object_a_portable_pickup()
end
local function _is_pickup_type_valid(pickup_hash)
    native.object._is_pickup_type_valid()
end
local function does_pickup_of_object_type_exist_in_area(pickup_hash, floatx, floaty, floatz, radius)
    native.object.does_pickup_of_object_type_exist_in_area()
end
local function set_pickup_regeneration_time(pickup, duration)
    native.object.set_pickup_regeneration_time()
end
local function force_pickup_regenerate(p0)
    native.object.force_pickup_regenerate()
end
local function set_network_pickup_usable_for_player(player, pickup_hash, is_usable)
    native.object._set_network_pickup_usable_for_player()
end
local function set_local_player_permitted_to_collect_pickups_with_model(model_hash, toggle)
    native.object.set_local_player_permitted_to_collect_pickups_with_model()
end
local function block_pickup_from_player_collection(p0, p1)
    native.object.block_pickup_from_player_collection()
end
local function set_pickup_not_lootable(p0, p1)
    native.object.set_pickup_not_lootable()
end
local function set_team_pickup_object(hash, p1, p2)
    native.object.set_team_pickup_object()
end
local function prevent_collection_of_portable_pickup(object, p1, p2)
    native.object.prevent_collection_of_portable_pickup()
end
local function set_pickup_generation_range_multiplier(multiplier)
    native.object.set_pickup_generation_range_multiplier()
end
local function set_pickup_uncollectable(p0, p1)
    native.object.set_pickup_uncollectable()
end
local function set_pickup_hidden_when_uncollectable(p0, p1)
    native.object.set_pickup_hidden_when_uncollectable()
end
local function set_ambient_pickup_lifetime(lifetime)
    native.object._set_ambient_pickup_lifetime()
end
local function set_pickup_particle_fx_spawn(p0, p1)
    native.object.set_pickup_particle_fx_spawn()
end
local function set_pickup_particle_fx_highlight(p0, p1)
    native.object.set_pickup_particle_fx_highlight()
end
local function suppress_pickup_reward_type(reward_type, suppress)
    native.object.suppress_pickup_reward_type()
end
local function set_pickup_collectable_on_mount(hash)
    naitve.object._set_pickup_collectable_on_mount()
end
local function get_weapon_type_from_pickup_type(pickup_hash)
    native.object.get_weapon_type_from_pickup_type()
end
local function get_ammo_type_from_pickup_type(pickup_hash)
    native.object._get_ammo_type_from_pickup_type()
end
local function set_object_tint_index(hash, texture_variation)
    native.object.set_object_tint_index()
end
local function get_object_light_intensity(hash)
    native.object._get_object_light_intensity()
end
local function set_object_burn_opacity(hash, opacity)
    native.object._get_object_light_intensity()
end
local function set_object_burn_intensity(hash, intensity)
    naitve.object._set_object_burn_intensity()
end
local function set_object_burn_level(hash, burn_level, affect_ash)
    native.object._set_object_burn_level()
end
local function reset_object_velocity(hash)
    native.object._reset_object_velocity()
end
local function set_object_burn_speed(hash, speed, p2)
    native.object._set_object_burn_speed()
end
local function convert_old_pickup_type_to_new(pickup_hash)
    native.object.convert_old_pickup_type_to_new()
end
local function set_force_object_this_frame(pickup_hash)
    native.object.set_force_object_this_frame()
end
local function only_clean_up_object_when_out_of_range(hash)
    native.object.only_clean_up_object_when_out_of_range()
end
local function create_object_skeleton(hash)
    native.object.create_object_skeleton()
end
local function make_item_carriable(hash)
    native.object._make_item_carriable()
end
local function set_auto_jumpable_by_horse(hash, p1)
    native.object._set_auto_jumpable_by_horse()
end
local function set_not_jumpable_by_horse(hash, p1)
    native.object._set_not_jumpable_by_horse()
end
local function set_object_kickable(hash, toggle)
    native.object._set_object_kickable()
end
local function set_custom_textures_on_object(hash, txd_hash, p2, p3)
    native.object.set_custom_textures_on_object()
end

--//[Unnamed Objects]//--
local function _0xf6e88489b4e6ebe5(p0, p1)
    native.object._0xf6e88489b4e6ebe5()
end
local function _0xe157a8a336c7f04a(p0, p1)
    native.object._0xe157a8a336c7f04a()
end
local function _0x46cbcf0e98a4e156(p0, p1)
    native.object._0x46cbcf0e98a4e156()
end
local function _0xb3b1546d23df8de1(p0, p1, p2, p3, p4)
    native.object._0xb3b1546d23df8de1()
end
local function _0x3a77dae8b4fd7586(p0, p1)
    native.object._0x3a77dae8b4fd7586()
end
local function _0x6e2aa80bb0c03728(p0, p1)
    native.object._0x6e2aa80bb0c03728()
end
local function _0x7f458b543006c8fe(p0, p1)
    native.object._0x7f458b543006c8fe()
end
local function _0xacd4f9831dfad7f5(p0)
    native.object._0xacd4f9831dfad7f5()
end
local function _0x0c0a373d181bf900(p0)
    native.object._0x0c0a373d181bf900()
end
local function _0xa93f925f1942e434(p0, p1)
    native.object._0xa93f925f1942e434()
end
local function _0x4d8611dfe1126478(p0)
    naitve.object._0x4d8611dfe1126478()
end
local function _0x57c242543b7b8fb9(p0, p1)
    native.object._0x57c242543b7b8fb9()
end
local function _0x4ae07eba3462c5d5(p0, p1)
    native.object._0x4ae07eba3462c5d5()
end
local function _0x22031584496cfb70(p0, p1)
    native.object._0x22031584496cfb70()
end
local function _0xc07b91b996c1de89(p0, p1)
    native.object._0xc07b91b996c1de89()
end
local function _0x0943113e02322164(hash, p1)
    native.object._0x0943113e02322164()
end
local function _0x614d0b4533f842d3(p0)
    native.object._0x614d0b4533f842d3()
end
local function _0xeba314768fb35d58(p0)
    native.object._0xeba314768fb35d58()
end
local function _0x5230bf34eb0ec645(p0)
    native.object._0x5230bf34eb0ec645()
end
local function _0x235c863da77bd88d(p0, p1, p2)
    native.object._0x235c863da77bd88d()
end
local function _0xaaacf33cbf9b990a(p0, p1)
    naitve.object._0xaaacf33cbf9b990a()
end
local function _0x58de624fa7fb0e7f(p0)
    native.object._0x58de624fa7fb0e7f()
end
local function _0x491439aef410a2fc(p0)
    native.object._0x491439aef410a2fc()
end
local function _0xceab54f4632c6ef6(p0, p1)
    native.object._0xceab54f4632c6ef6()
end
local function _0x6579860a5558524a(p0, p1)
    native.object._0x6579860a5558524a()
end
local function _0xdfa1237f5228263f(p0, p1)
    native.object._0xdfa1237f5228263f()
end
local function _0x7fcd49388bc9b775(p0, p1)
    native.object._0x7fcd49388bc9b775()
end
local function _0xfa99e8e575f2fef8(p0)
    native.object._0xfa99e8e575f2fef8()
end
local function _0x3e2616e7ea539480(p0)
    native.object._0x3e2616e7ea539480()
end
local function _0x9f52ad67d1a91bad(p0, p1)
    native.object._0x9f52ad67d1a91bad()
end
local function _0x20135af9c10d2a3d(p0)
    native.object._0x20135af9c10d2a3d()
end
local function _0xde116ecffdd4b997(p0, p1)
    native.object._0xde116ecffdd4b997()
end
local function _0x9a74a9cadfa8a598(p0)
    native.object._0x9a74a9cadfa8a598()
end
local function _0xcbfbd38f2e0a263b(p0, p1)
    native.object._0xcbfbd38f2e0a263b()
end
local function _0xd91e55b6c005eb09(p0, p1)
    native.object._0xd91e55b6c005eb09()
end
local function _0xcaaf2bccfef37f77(hash, p1)
    native.object._0xcaaf2bccfef37f77()
end
local function _0x08c5825a2932ea7b(p0)
    native.object._0x08c5825a2932ea7b()
end
local function _0x7d4411d6736cd295(p0, p1)
    native.object._0x7d4411d6736cd295()
end
local function _0x250ebb11e81a10be(p0)
    native.object._0x250ebb11e81a10be()
end
local function _0x2bf1953c0c21ac88(p0)
    native.object._0x2bf1953c0c21ac88()
end
local function _0xf65ede5d02a7a760(p0, p1)
    native.object._0xf65ede5d02a7a760()
end
local function _0xd503d6f0986d58bc(p0, p1)
    native.object._0xd503d6f0986d58bc()
end
local function _0xaee6c800e124cfe1(p0, p1)
    native.object._0xaee6c800e124cfe1()
end
local function _0x3df1a0a58498e209(hash, p1)
    native.object._0x3df1a0a58498e209()
end
return lua_object