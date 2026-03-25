--YourSelf
local localPed = natives.player_playerPedId()

--Ragdoll Globals
local ragdollOption = false
local ragdollOptionTimer = 0

--Ragdoll Toggle
menu.addToggleButton('', 'Ragdoll Loop', 'Ragdoll Loop', ragdollOption, function(toggle)
	ragdollOption = toggle

	localPed = natives.player_playerPedId()
	localPosX, localPosY, localPosZ = natives.entity_getEntityCoords(localPed, true, false)
	
	if ragdollOption then
		logger.logSuccess('initialised')
		natives.ped_resetPedRagdollTimer(localPed)
	else
		logger.logError('terminated')
		natives.ped_resetPedRagdollTimer(localPed)
	end
		ragdollOptionTimer = 0
end)

--Tick Options
system.registerTick(function(frame)

--Ragdoll Feature Loop--

	local currentTick = system.getTickCount64()
	if (ragdollOption) and (system.getTickCount64() - ragdollOptionTimer > 1050) then
		ragdollOptionTimer = currentTick

           natives.ped_setPedToRagdoll(localPed, 1000, 0, 0, true, true, true)
	end
			
end)
