--In the works 7/8/2025   --Progress Continued 3/5/2026

system.setScriptName("Model Changer by XEX")

system.registerConstructor(function()
  logger.logInfo("--==========================--")
  logger.logInfo("--        Model Changer     --")
  logger.logInfo("--           v0.3           --")
  logger.logInfo("--==========================--")
end)

local pedNames = {
  "mp_male", "mp_female", "cs_eagleflies",  "cs_dutch", "cs_bubba", "cs_brotherdorkins", "cs_crackpotrobot", "cs_crackpotinventor", "cs_gloria", "cs_creepyoldlady", "cs_cigcardguy", "cs_germandaughter",
  "cs_angel", "u_f_m_rhdnudewoman_01", "re_nakedswimmer_males_01", "re_wildman_01", "u_m_m_bht_benedictallbright", "u_m_m_bht_lover", "u_m_m_apfdeadman_01", "u_m_m_bht_oldman", "cs_germanfather", "a_m_m_sdobesemen_01", "a_m_m_btcobesemen_01", "a_m_m_rhdobesemen_01",
  "a_m_m_blwobesemen_01", "a_f_m_sdobesewomen_01", "a_f_m_btcobesewomen_01", "female_skeleton", "male_skeleton", "cs_vht_bathgirl", "", "", "", "", "", ""
}

local animalNames = {
  "a_c_alligator_01", "a_c_alligator_02", "a_c_alligator_03", "a_c_armadillo_01", "a_c_badger_01", "a_c_bat_01",
  "a_c_bearblack_01", "a_c_bear_01", "a_c_beaver_01", "a_c_bighornram_01", "a_c_bluejay_01", "a_c_boarlegendary_01", "a_c_boar_01", "a_c_buck_01",
  "a_c_buffalo_01", "a_c_buffalo_tatanka_01", "a_c_bull_01", "a_c_californiacondor_01", "a_c_cardinal_01", "a_c_carolinaparakeet_01", "a_c_cat_01", "a_c_cedarwaxwing_01",
  "a_c_chicken_01", "a_c_chipmunk_01", "a_c_cormorant_01", "a_c_cougar_01", "a_c_cow", "a_c_coyote_01", "a_c_crab_01", "a_c_cranewhooping_01",
  "a_c_crawfish_01", "a_c_crow_01", "a_c_deer_01", "a_c_dogamericanfoxhound_01", "a_c_dogaustraliansheperd_01", "a_c_dogbluetickcoonhound_01", "a_c_dogcatahoulacur_01", "a_c_dogchesbayretriever_01",
  "a_c_dogcollie_01", "a_c_doghobo_01", "a_c_doghound_01", "a_c_doghusky_01", "a_c_doglab_01", "a_c_doglion_01", "a_c_dogpoodle_01", "a_c_dogrufus_01",
  "a_c_dogstreet_01", "re_lostdog_dogs_01", "a_c_donkey_01", "a_c_duck_01", "a_c_eagle_01", "a_c_egret_01", "a_c_elk_01", "a_c_fishbluegil_01_ms",
  "a_c_fox_01", "a_c_frogbull_01", "a_c_gilamonster_01", "a_c_goat_01", "a_c_goosecanada_01", "a_c_hawk_01",
  "a_c_heron_01", "a_c_horsemulepainted_01", "a_c_horsemule_01", "p_c_horse_01", "a_c_horse_americanpaint_greyovero", "a_c_horse_americanpaint_overo", "a_c_horse_americanpaint_splashedwhite", "a_c_horse_americanpaint_tobiano",
  "a_c_panther_01"
}

local selectedIndex = 0

menu.addStringSpinner('self', 'Select Ped Model', '', selectedIndex, pedNames, function(valueIdx)
  selectedIndex = valueIdx
  --logger.logInfo('Selected model: ' .. pedNames[selectedIndex + 1])
end)

menu.addButton('self', 'Ped Change', '', function()
  local modelName = pedNames[selectedIndex + 1]
  logger.logInfo('Changing model to: ' .. modelName)

  local modelHash = natives.misc_getHashKey(modelName)
  utility.changePlayerModel(modelHash)
  
  --logger.logInfo("Player model changed to: " .. modelName)
end)

menu.addStringSpinner('self', 'Select Animal Model', '', selectedIndex, animalNames, function(valueIdx)
  selectedIndex = valueIdx
  --logger.logInfo('Selected model: ' .. pedNames[selectedIndex + 1])
end)

menu.addButton('self', 'Animal Change', '', function()
  local modelName = animalNames[selectedIndex + 1]
  logger.logInfo('Changing model to: ' .. modelName)

  local modelHash = natives.misc_getHashKey(modelName)
  utility.changePlayerModel(modelHash)
  
  --logger.logInfo("Player model changed to: " .. modelName)
end)

menu.addButton('self', 'Suicide/Rest', 'Use this to reset your ped', function(player_idx)
  local ped = natives.player_getPlayerPed(player_idx)

  if not natives.entity_doesEntityExist(ped) then
    logger.logError("Ped doesn't exist!")
    return
  end

  local wasInvincible = features.isInvincibilityEnabled()

  if wasInvincible then
    infeatures.invcibilityDisable()
  end

  natives.entity_changeEntityHealth(ped, -1000.0, 0, 0)

  system.yield(1000)
  if wasInvincible then
    features.invincibilityEnable()
  end
end)
