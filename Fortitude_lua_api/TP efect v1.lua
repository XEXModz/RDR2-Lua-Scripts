system.setScriptName("~t6~TP ~t3~efects")

system.registerConstructor(function()
logger.logInfo("TP efects ready and loaded.")
end)


local fxDict = "scr_lom_train"
local fxName = "scr_ind1_firework_burst"


local fxDictHash = natives.misc_getHashKey(fxDict)

menu.addToggleButton('self', 'TP efect', '', false, function(toggle)

    -- Request PTFX asset
    natives.streaming_requestNamedPtfxAsset(fxDictHash)

    -- Tell engine to use it
    natives.graphics_useParticleFxAsset(fxDict)

    -- Play particle effect 
    system.registerTeleportToEvent(function()
        local player_ped = player.getPed(player_idx, 0)
        local x, y, z = player.getCoords(player_ped)

        natives.graphics_startNetworkedParticleFxNonLoopedAtCoord(
            fxName, x, y, z,
            0.0, 0.0, 0.0, -- rotation
            1.0,           -- scale
            false, false, false -- axis
        )
    end)
end)												
