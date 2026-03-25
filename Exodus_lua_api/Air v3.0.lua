script.keep_alive()

local main_menu = menu.script_root():add_submenu("菜单", { "*Air*Lua开发人员" }, nil, nil)

main_menu:add_button("个人信息", { "查看显示个人玩家信息" }, function()
    local player_index = player.get_rockstar_id(0)
    local player_name = player.get_name(0)
    local player_health = player.get_health(0)

    toast.add_info("玩家信息", string.format("名字: %s\nRockstar ID: %d\n生命值: %.2f", player_name, player_index, player_health))
end)

local add_function_menu = main_menu:add_submenu("个人功能", { "所有的功能" })
local new_submenu = add_function_menu:add_submenu("代理菜单", { "ETN" })

toast.add_success("代理菜单加载完成", "代理菜单加载成功")

local invisibility_enabled = false

local function set_player_invisibility(player_idx, state)
    local playerPed = native.player.get_player_ped(player_idx)
    
    if state then
        native.entity.set_entity_visible(playerPed, false, false)
        toast.add_success("隐身模式开启", "您已成功进入隐身模式")
    else
        native.entity.set_entity_visible(playerPed, true, false)
        toast.add_info("隐身模式关闭", "您已退出隐身模式")
    end
end

new_submenu:add_toggle("隐身模式", { "开启或关闭隐身模式" }, function(state)
    set_player_invisibility(0, state)  
end)

local WeaponManager = {}
WeaponManager.__index = WeaponManager

function WeaponManager.new()
    local self = setmetatable({}, WeaponManager)
    self.ped = nil
    self.weapon_hash = nil
    self.ammo_count = 0
    return self
end

function WeaponManager:set_character(ped)
    self.ped = ped
end

function WeaponManager:set_weapon(weapon_hash)
    self.weapon_hash = weapon_hash
end

function WeaponManager:unlock_weapon()
    if self.weapon_hash then
        return native.weapon._get_weapon_unlock(self.weapon_hash)
    end
    return nil
end

function WeaponManager:add_ammo(amount)
    if self.ped and self.weapon_hash then
        self.ammo_count = self.ammo_count + amount
        native.weapon._add_ammo_to_ped(self.ped, self.weapon_hash, amount, 0x4A6726C9)  
    end
end

function WeaponManager:remove_ammo(amount)
    if self.ped and self.weapon_hash and self.ammo_count >= amount then
        self.ammo_count = self.ammo_count - amount
        native.weapon._remove_ammo_from_ped(self.ped, self.weapon_hash, amount, 0x4A6726C9)  
        toast.add_info("弹药已移除", string.format("成功移除 %d 发弹药", amount))
    end
end

function WeaponManager:give_weapon(ammo_count)
    if self.ped and self.weapon_hash then
        native.weapon.give_weapon_to_ped(self.ped, self.weapon_hash, ammo_count, false, false, -1, false, 0.5, 1.0, 0, false, 0.5, 0)
        toast.add_success("武器已给与", string.format("成功给与 %d 发弹药的武器", ammo_count))
    end
end

function WeaponManager:remove_weapon()
    if self.ped and self.weapon_hash then
        native.weapon.remove_weapon_from_ped(self.ped, self.weapon_hash, false, 0)
        toast.add_success("武器已移除", "成功移除武器")
    end
end

local manager = WeaponManager.new()

local weapon_submenu = new_submenu:add_submenu("武器管理", { "管理武器和弹药" })

weapon_submenu:add_button("解锁武器", { "解锁当前武器" }, function()
    if manager:unlock_weapon() then
        toast.add_success("武器已解锁", "当前武器已解锁")
    else
        toast.add_warning("解锁失败", "无法解锁当前武器")
    end
end)

weapon_submenu:add_button("给武器", { "给角色指定武器并添加弹药" }, function()
    manager:set_character(0)  
    manager:set_weapon(0x1B06D571)  
    manager:give_weapon(50) 
end)

weapon_submenu:add_button("移除武器", { "移除角色的武器" }, function()
    manager:remove_weapon()  
end)

weapon_submenu:add_button("添加弹药", { "为角色当前武器添加弹药" }, function()
    local amount = 30  
    manager:add_ammo(amount)
end)

weapon_submenu:add_button("移除弹药", { "为角色当前武器移除弹药" }, function()
    local amount = 10  
    manager:remove_ammo(amount)
end)

toast.add_success("武器管理功能加载成功", "现在可以管理武器和弹药了")

local player_count = 0
local players = {}

local function getLeaveReason(playerIdx)
    return "未知"
end

local function displayPlayerInfo(index, is_joining)
    local name = player.get_name(index)
    local b1, b2, b3, b4 = player.get_ip(index)

    local status_message = string.format("玩家信息: %s\nIP: %d.%d.%d.%d", name, b1, b2, b3, b4)

    if is_joining then
        player_count = player_count + 1
        toast.add_info(status_message, "陌生玩家加入了战局")
    else
        local leave_reason = getLeaveReason(index)
        player_count = player_count - 1
        toast.add_info(status_message .. string.format("\n离开原因: %s", leave_reason), "陌生玩家离开战局")
    end
end

local function isPlayerActive(playerIdx)
    local playerPed = native.player.get_player_ped(playerIdx)
    return playerPed and native.entity.does_entity_exist(playerPed)
end

local function monitorPlayers()
    while true do
        for i = 0, 31 do
            if isPlayerActive(i) and not players[i] then
                players[i] = true
                displayPlayerInfo(i, true)
            elseif players[i] and not isPlayerActive(i) then
                players[i] = nil
                displayPlayerInfo(i, false)
            end
        end
        thread.yield(1000)
    end
end

local function delayedPlayerCountDisplay()
    local delay = math.random(60, 120)
    thread.yield(delay * 1000)

    toast.add_info(string.format("战局玩家数量: %d", player_count), "玩家数量已更新")
end

local thread_status = thread.create(monitorPlayers)
if not thread_status then
    toast.add_warning("玩家监控线程启动失败", "请检查线程创建代码")
else
    toast.add_success("玩家监控线程已启动", "监控功能正常运行")
end

local delayed_thread_status = thread.create(delayedPlayerCountDisplay)
if not delayed_thread_status then
    toast.add_warning("人数显示延迟线程启动失败", "请检查延迟线程创建代码")
else
    toast.add_success("人数显示延迟线程已启动", "玩家人数将在延迟后显示")
end

local function enable_script_after_delay()
    toast.add_info("脚本将在 3 秒后启动", "请稍等...")
    thread.yield(3000)  

    toast.add_success("脚本已启动", "现在可以使用")
end

local enable_thread_status = thread.create(enable_script_after_delay)

script.on_shutdown(function()
    toast.add_info("检测到您", "脚本已关闭")
end)

toast.add_success("脚本加载完成", "*Air*Lua开发人员")
