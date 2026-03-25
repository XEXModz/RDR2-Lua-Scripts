
system.setScriptName("Force Kill v0.1")

--[[local function forcekill(player_idx)
  local target_ped = natives.player_getPlayerPed(player_idx)
  local player_name = player.getName(player_idx)

  logger.logInfo('=== FORCEKILL START ===')

  if not natives.entity_doesEntityExist(target_ped) then
    logger.logError('ABORT: Ped does not exist')
    return
  end

  local ok, err = pcall(function()

    local px, py, pz = natives.entity_getEntityCoords(target_ped, true, true)
    logger.logInfo('Coords: ' .. tostring(px) .. ', ' .. tostring(py) .. ', ' .. tostring(pz))

    -- Bullet method (does not require entity control)
    natives.invoke(0x867654CBC7606F2C, "void",
      px, py, pz + 1.0,
      px, py, pz,
      9999, true, 0xBFEFFF6D, 0, true, false, 9999.0, true)
    logger.logInfo('Bullet fired')

    -- Apply damage
    natives.invoke(0x697157CED63F18D4, "void", target_ped, 9999, true, 0, 0)
    logger.logInfo('Damage applied')

  end)

  if not ok then
    logger.logError('ERROR: ' .. tostring(err))
  end

  logger.logInfo('=== FORCEKILL END ===')
end--]]

local function forcekill(player_idx)
  local target_ped = natives.player_getPlayerPed(player_idx)
  local player_name = player.getName(player_idx)

  logger.logInfo('=== FORCEKILL START ===')

  if not natives.entity_doesEntityExist(target_ped) then
    logger.logError('ABORT: Ped does not exist')
    return
  end

  local ok, err = pcall(function()

    local px, py, pz = natives.entity_getEntityCoords(target_ped, true, true)
    logger.logInfo('Target coords: ' .. tostring(px) .. ', ' .. tostring(py) .. ', ' .. tostring(pz))

    -- Spawn killer ped near target using Fortitude's spawner
    local killer = spawner.spawnPed(0xBBE15017, px + 1.0, py, pz, false)
    logger.logInfo('Killer ped spawned: ' .. tostring(killer))

    -- Make invincible and arm them
    natives.entity_setEntityInvincible(killer, true)
    natives.ped_giveWeaponToPed(killer, 0xBFEFFF6D, 999, true, true)

    -- Task killer to shoot target
    natives.invoke(0x08DA95E8298AE772, "void", killer, target_ped, 5000, 0xC6EE6B88, true)
    logger.logInfo('Kill task assigned, waiting...')

    system.yield(5000)

    -- Cleanup
    natives.entity_deleteEntity(killer)
    logger.logInfo('Killer ped cleaned up')

  end)

  if not ok then
    logger.logError('ERROR: ' .. tostring(err))
  end

  logger.logInfo('=== FORCEKILL END ===')
end

local function remove(player_idx)
  local target_ped = natives.player_getPlayerPed(player_idx)
  natives.invoke(0xF25DF915FA38C5F3, target_ped, true)
end

local sub0 = menu.addSubmenu('player', 'Kill Player', '')
menu.addButton(sub0, 'kill', '', forcekill)

local sub1 = menu.addSubmenu('player', 'Remove Weapons+', '')
menu.addButton(sub1, 'Remove', '', remove)
