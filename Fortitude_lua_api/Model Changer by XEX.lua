--In the works 7/8/2025

system.setScriptName("All Models Changer by XEX")

system.registerConstructor(function()
  logger.logInfo("--===============--")
  logger.logInfo("--           All Models Changer     --")
  logger.logInfo("--              v0.1              --")
  logger.logInfo("--===============--")
end)

local pedNames = {
  "mp_male", "mp_female", "a_c_alligator_01", "a_c_alligator_02", "a_c_alligator_03", "a_c_armadillo_01", "a_c_badger_01", "a_c_bat_01",
  "a_c_bearblack_01", "a_c_bear_01", "a_c_beaver_01", "a_c_bighornram_01", "a_c_bluejay_01", "a_c_boarlegendary_01", "a_c_boar_01", "a_c_buck_01",
  "a_c_buffalo_01", "a_c_buffalo_tatanka_01", "a_c_bull_01", "a_c_californiacondor_01", "a_c_cardinal_01", "a_c_carolinaparakeet_01", "a_c_cat_01", "a_c_cedarwaxwing_01",
  "a_c_chicken_01", "a_c_chipmunk_01", "a_c_cormorant_01", "a_c_cougar_01", "a_c_cow", "a_c_coyote_01", "a_c_crab_01", "a_c_cranewhooping_01",
  "a_c_crawfish_01", "a_c_crow_01", "a_c_deer_01", "a_c_dogamericanfoxhound_01", "a_c_dogaustraliansheperd_01", "a_c_dogbluetickcoonhound_01", "a_c_dogcatahoulacur_01", "a_c_dogchesbayretriever_01",
  "a_c_dogcollie_01", "a_c_doghobo_01", "a_c_doghound_01", "a_c_doghusky_01", "a_c_doglab_01", "a_c_doglion_01", "a_c_dogpoodle_01", "a_c_dogrufus_01",
  "a_c_dogstreet_01", "re_lostdog_dogs_01", "a_c_donkey_01", "a_c_duck_01", "a_c_eagle_01", "a_c_egret_01", "a_c_elk_01", "a_c_fishbluegil_01_ms",
  "a_c_fishbluegil_01_sm", "a_c_fishbullheadcat_01_ms", "a_c_fishbullheadcat_01_sm", "a_c_fishchainpickerel_01_ms", "a_c_fishchainpickerel_01_sm", "a_c_fishchannelcatfish_01_lg", "a_c_fishchannelcatfish_01_xl", "a_c_fishlakesturgeon_01_lg",
  "a_c_fishlargemouthbass_01_lg", "a_c_fishlargemouthbass_01_ms", "a_c_fishlongnosegar_01_lg", "a_c_fishmuskie_01_lg", "a_c_fishnorthernpike_01_lg", "a_c_fishperch_01_ms", "a_c_fishperch_01_sm", "a_c_fishrainbowtrout_01_lg",
  "a_c_fishrainbowtrout_01_ms", "a_c_fishredfinpickerel_01_ms", "a_c_fishredfinpickerel_01_sm", "a_c_fishrockbass_01_ms", "a_c_fishrockbass_01_sm", "a_c_fishsalmonsockeye_01_lg", "a_c_fishsalmonsockeye_01_ml", "a_c_fishsalmonsockeye_01_ms",
  "a_c_fishsmallmouthbass_01_lg", "a_c_fishsmallmouthbass_01_ms", "a_c_fox_01", "a_c_frogbull_01", "a_c_gilamonster_01", "a_c_goat_01", "a_c_goosecanada_01", "a_c_hawk_01",
  "a_c_heron_01", "a_c_horsemulepainted_01", "a_c_horsemule_01", "p_c_horse_01", "a_c_horse_americanpaint_greyovero", "a_c_horse_americanpaint_overo", "a_c_horse_americanpaint_splashedwhite", "a_c_horse_americanpaint_tobiano",
  "a_c_horse_americanstandardbred_black", "a_c_horse_americanstandardbred_buckskin", "a_c_horse_americanstandardbred_lightbuckskin", "a_c_horse_americanstandardbred_palominodapple", "a_c_horse_americanstandardbred_silvertailbuckskin", "a_c_horse_andalusian_darkbay", "a_c_horse_andalusian_perlino", "a_c_horse_andalusian_rosegray",
  "a_c_horse_appaloosa_blacksnowflake", "a_c_horse_appaloosa_blanket", "a_c_horse_appaloosa_brownleopard", "a_c_horse_appaloosa_fewspotted_pc", "a_c_horse_appaloosa_leopard", "a_c_horse_appaloosa_leopardblanket", "a_c_horse_arabian_black", "a_c_horse_arabian_grey",
  "a_c_horse_arabian_redchestnut", "a_c_horse_arabian_redchestnut_pc", "a_c_horse_arabian_rosegreybay", "a_c_horse_arabian_warpedbrindle_pc", "a_c_horse_arabian_white", "a_c_horse_ardennes_bayroan", "a_c_horse_ardennes_irongreyroan", "a_c_horse_ardennes_strawberryroan",
  "a_c_horse_belgian_blondchestnut", "a_c_horse_belgian_mealychestnut", "a_c_horse_breton_grullodun", "a_c_horse_breton_mealydapplebay", "a_c_horse_breton_redroan", "a_c_horse_breton_sealbrown",
  "a_c_horse_breton_sorrel", "a_c_horse_breton_steelgrey", "a_c_horse_buell_warvets", "a_c_horse_criollo_baybrindle", "a_c_horse_criollo_bayframeovero",
  "a_c_horse_criollo_blueroanovero", "a_c_horse_criollo_dun", "a_c_horse_criollo_marblesabino", "a_c_horse_criollo_sorrelovero", "a_c_horse_dutchwarmblood_chocolateroan",
  "a_c_horse_dutchwarmblood_sealbrown", "a_c_horse_dutchwarmblood_sootybuckskin", "a_c_horse_eagleflies", "a_c_horse_gang_bill", "a_c_horse_gang_charles", "a_c_horse_gang_charles_endlesssummer", "a_c_horse_gang_dutch", "a_c_horse_gang_hosea", "a_c_horse_gang_javier", "a_c_horse_gang_john", "a_c_horse_gang_karen", "a_c_horse_gang_kieran",
  "a_c_horse_gang_lenny", "a_c_horse_gang_micah", "a_c_horse_gang_sadie", "a_c_horse_gang_sadie_endlesssummer", "a_c_horse_gang_sean", "a_c_horse_gang_trelawney", "a_c_horse_gang_uncle", "a_c_horse_gang_uncle_endlesssummer", "a_c_horse_hungarianhalfbred_darkdapplegrey", "a_c_horse_hungarianhalfbred_flaxenchestnut", "a_c_horse_hungarianhalfbred_liverchestnut", "a_c_horse_hungarianhalfbred_piebaldtobiano",
  "a_c_horse_john_endlesssummer", "a_c_horse_kentuckysaddle_black", "a_c_horse_kentuckysaddle_buttermilkbuckskin_pc", "a_c_horse_kentuckysaddle_chestnutpinto", "a_c_horse_kentuckysaddle_grey", "a_c_horse_kentuckysaddle_silverbay", "a_c_horse_kladruber_black", "a_c_horse_kladruber_cremello", "a_c_horse_kladruber_dapplerosegrey", "a_c_horse_kladruber_grey", "a_c_horse_kladruber_silver", "a_c_horse_kladruber_white",
  "a_c_horse_missourifoxtrotter_amberchampagne", "a_c_horse_missourifoxtrotter_sablechampagne", "a_c_horse_missourifoxtrotter_silverdapplepinto", "a_c_horse_morgan_bay", "a_c_horse_morgan_bayroan", "a_c_horse_morgan_flaxenchestnut", "a_c_horse_morgan_liverchestnut_pc", "a_c_horse_morgan_palomino", "a_c_horse_mp_mangy_backup", "a_c_horse_murfreebrood_mange_01", "a_c_horse_murfreebrood_mange_02", "a_c_horse_murfreebrood_mange_03",
  "a_c_horse_mustang_goldendun", "a_c_horse_mustang_grullodun", "a_c_horse_mustang_tigerstripedbay", "a_c_horse_mustang_wildbay", "a_c_horse_nokota_blueroan", "a_c_horse_nokota_reversedappleroan", "a_c_horse_nokota_whiteroan", "a_c_horse_shire_darkbay", "a_c_horse_shire_lightgrey", "a_c_horse_shire_ravenblack", "a_c_horse_suffolkpunch_redchestnut", "a_c_horse_suffolkpunch_sorrel",
  "a_c_horse_tennesseewalker_blackrabicano", "a_c_horse_tennesseewalker_chestnut", "a_c_horse_tennesseewalker_dapplebay", "a_c_horse_tennesseewalker_flaxenroan", "a_c_horse_tennesseewalker_goldpalomino_pc", "a_c_horse_tennesseewalker_mahoganybay", "a_c_horse_tennesseewalker_redroan", "a_c_horse_thoroughbred_blackchestnut", "a_c_horse_thoroughbred_bloodbay", "a_c_horse_thoroughbred_brindle", "a_c_horse_thoroughbred_dapplegrey", "a_c_horse_thoroughbred_reversedappleblack",
  "a_c_horse_turkoman_darkbay", "a_c_horse_turkoman_gold", "a_c_horse_turkoman_silver", "a_c_horse_winter02_01", "a_c_iguanadesert_01", "a_c_iguana_01", "a_c_javelina_01", "a_c_lionmangy_01", "a_c_loon_01", "a_c_moose_01", "a_c_muskrat_01", "a_c_oriole_01",
  "a_c_owl_01", "a_c_ox_01", "a_c_panther_01", "a_c_parrot_01", "a_c_pelican_01", "a_c_pheasant_01", "a_c_pigeon", "a_c_pig_01", "a_c_possum_01", "a_c_prairiechicken_01", "a_c_pronghorn_01", "a_c_quail_01",
  "a_c_rabbit_01", "a_c_raccoon_01", "a_c_rat_01", "a_c_raven_01", "a_c_redfootedbooby_01", "a_c_robin_01", "a_c_rooster_01", "a_c_roseatespoonbill_01", "a_c_seagull_01", "a_c_sharkhammerhead_01", "a_c_sharktiger", "a_c_sheep_01",
  "a_c_skunk_01", "a_c_snakeblacktailrattle_01", "a_c_snakeblacktailrattle_pelt_01", "a_c_snakeferdelance_01", "a_c_snakeferdelance_pelt_01", "a_c_snakeredboa10ft_01", "a_c_snakeredboa_01", "a_c_snakeredboa_pelt_01", "a_c_snakewater_01", "a_c_snakewater_pelt_01", "a_c_snake_01", "a_c_snake_pelt_01",
  "a_c_songbird_01", "a_c_sparrow_01", "a_c_squirrel_01", "a_c_toad_01", "a_c_turkeywild_01", "a_c_turkey_01", "a_c_turkey_02", "a_c_turtlesea_01", "a_c_turtlesnapping_01", "a_c_vulture_01", "A_C_Wolf", "a_c_wolf_medium",
  "a_c_wolf_small", "a_c_woodpecker_01", "a_c_woodpecker_02", "mcclellan_saddle_01", "charro_saddle_01", "western_saddle_01", "western_saddle_02", "western_saddle_03", "western_saddle_04", "motherhubbard_saddle_01", "amsp_robsdgunsmith_males_01", "am_valentinedoctors_females_01",
  "a_f_m_armcholeracorpse_01", "a_f_m_armtownfolk_01", "a_f_m_armtownfolk_02", "a_f_m_asbtownfolk_01", "a_f_m_bivfancytravellers_01", "a_f_m_blwtownfolk_01", "a_f_m_blwtownfolk_02", "a_f_m_blwupperclass_01", "a_f_m_btchillbilly_01", "a_f_m_btcobesewomen_01", "a_f_m_bynfancytravellers_01", "a_f_m_familytravelers_cool_01",
  "a_f_m_familytravelers_warm_01", "a_f_m_gamhighsociety_01", "a_f_m_grifancytravellers_01", "a_f_m_guatownfolk_01", "a_f_m_htlfancytravellers_01", "a_f_m_lagtownfolk_01", "a_f_m_lowersdtownfolk_01", "a_f_m_lowersdtownfolk_02", "a_f_m_lowersdtownfolk_03", "a_f_m_lowertrainpassengers_01", "a_f_m_middlesdtownfolk_01", "a_f_m_middlesdtownfolk_02",
  "a_f_m_middlesdtownfolk_03", "a_f_m_middletrainpassengers_01", "a_f_m_nbxslums_01", "a_f_m_nbxupperclass_01", "a_f_m_nbxwhore_01", "a_f_m_rhdprostitute_01", "a_f_m_rhdtownfolk_01", "a_f_m_rhdtownfolk_02", "a_f_m_rhdupperclass_01", "a_f_m_rkrfancytravellers_01", "a_f_m_roughtravellers_01", "a_f_m_sclfancytravellers_01",
  "a_f_m_sdchinatown_01", "a_f_m_sdfancywhore_01", "a_f_m_sdobesewomen_01", "a_f_m_sdserversformal_01", "a_f_m_sdslums_02", "a_f_m_skpprisononline_01", "a_f_m_strtownfolk_01", "a_f_m_tumtownfolk_01", "a_f_m_tumtownfolk_02", "a_f_m_unicorpse_01", "a_f_m_uppertrainpassengers_01", "a_f_m_valprostitute_01",
  "a_f_m_valtownfolk_01", "a_f_m_vhtprostitute_01", "a_f_m_vhttownfolk_01", "a_f_m_waptownfolk_01", "a_f_o_blwupperclass_01", "a_f_o_btchillbilly_01", "a_f_o_guatownfolk_01", "a_f_o_lagtownfolk_01", "a_f_o_sdchinatown_01", "a_f_o_sdupperclass_01", "a_f_o_waptownfolk_01", "a_m_m_armcholeracorpse_01",
  "a_m_m_armdeputyresident_01", "a_m_m_armtownfolk_01", "a_m_m_armtownfolk_02", "a_m_m_asbboatcrew_01", "a_m_m_asbdeputyresident_01", "a_m_m_asbminer_01", "a_m_m_asbminer_02", "a_m_m_asbminer_03", "a_m_m_asbminer_04", "a_m_m_asbtownfolk_01", "a_m_m_asbtownfolk_01_laborer", "a_m_m_bivfancydrivers_01",
  "a_m_m_bivfancytravellers_01", "a_m_m_bivroughtravellers_01", "a_m_m_bivworker_01", "a_m_m_blwforeman_01", "a_m_m_blwlaborer_01", "a_m_m_blwlaborer_02", "a_m_m_blwobesemen_01", "a_m_m_blwtownfolk_01", "a_m_m_blwupperclass_01", "a_m_m_btchillbilly_01", "a_m_m_btcobesemen_01", "a_m_m_bynfancydrivers_01",
  "a_m_m_bynfancytravellers_01", "a_m_m_bynroughtravellers_01", "a_m_m_bynsurvivalist_01", "a_m_m_cardgameplayers_01", "a_m_m_chelonian_01", "a_m_m_deliverytravelers_cool_01", "a_m_m_deliverytravelers_warm_01", "a_m_m_dominoesplayers_01", "a_m_m_emrfarmhand_01", "a_m_m_familytravelers_cool_01", "a_m_m_familytravelers_warm_01", "a_m_m_farmtravelers_cool_01",
  "a_m_m_farmtravelers_warm_01", "a_m_m_fivefingerfilletplayers_01", "a_m_m_foreman", "a_m_m_gamhighsociety_01", "a_m_m_grifancydrivers_01", "a_m_m_grifancytravellers_01", "a_m_m_griroughtravellers_01", "a_m_m_grisurvivalist_01", "a_m_m_guatownfolk_01", "a_m_m_htlfancydrivers_01", "a_m_m_htlfancytravellers_01", "a_m_m_htlroughtravellers_01",
  "a_m_m_htlsurvivalist_01", "a_m_m_huntertravelers_cool_01", "a_m_m_huntertravelers_warm_01", "a_m_m_jamesonguard_01", "a_m_m_lagtownfolk_01", "a_m_m_lowersdtownfolk_01", "a_m_m_lowersdtownfolk_02", "a_m_m_lowertrainpassengers_01", "a_m_m_middlesdtownfolk_01", "a_m_m_middlesdtownfolk_02", "a_m_m_middlesdtownfolk_03", "a_m_m_middletrainpassengers_01",
  "a_m_m_moonshiners_01", "a_m_m_nbxdockworkers_01", "a_m_m_nbxlaborers_01", "a_m_m_nbxslums_01", "a_m_m_nbxupperclass_01", "a_m_m_nearoughtravellers_01", "a_m_m_ranchertravelers_cool_01", "a_m_m_ranchertravelers_warm_01", "a_m_m_rancher_01", "a_m_m_rhddeputyresident_01", "a_m_m_rhdforeman_01", "a_m_m_rhdobesemen_01",
  "a_m_m_rhdtownfolk_01", "a_m_m_rhdtownfolk_01_laborer", "a_m_m_rhdtownfolk_02", "a_m_m_rhdupperclass_01", "a_m_m_rkrfancydrivers_01", "a_m_m_rkrfancytravellers_01", "a_m_m_rkrroughtravellers_01", "a_m_m_rkrsurvivalist_01", "a_m_m_sclfancydrivers_01", "a_m_m_sclfancytravellers_01", "a_m_m_sclroughtravellers_01", "a_m_m_sdchinatown_01",
  "a_m_m_sddockforeman_01", "a_m_m_sddockworkers_02", "a_m_m_sdfancytravellers_01", "a_m_m_sdlaborers_02", "a_m_m_sdobesemen_01", "a_m_m_sdroughtravellers_01", "a_m_m_sdserversformal_01", "a_m_m_sdslums_02", "a_m_m_skpprisoner_01", "a_m_m_skpprisonline_01", "a_m_m_smhthug_01", "a_m_m_strdeputyresident_01",
  "a_m_m_strfancytourist_01", "a_m_m_strlaborer_01", "a_m_m_strtownfolk_01", "a_m_m_tumtownfolk_01", "a_m_m_tumtownfolk_02", "a_m_m_uniboatcrew_01", "a_m_m_unicoachguards_01", "a_m_m_unicorpse_01", "a_m_m_unigunslinger_01", "a_m_m_uppertrainpassengers_01", "a_m_m_valcriminals_01", "a_m_m_valdeputyresident_01",
  "a_m_m_valfarmer_01", "a_m_m_vallaborer_01", "a_m_m_valtownfolk_01", "a_m_m_valtownfolk_02", "a_m_m_vhtboatcrew_01", "a_m_m_vhtthug_01", "a_m_m_vhttownfolk_01", "a_m_m_wapwarriors_01", "a_m_o_blwupperclass_01", "a_m_o_btchillbilly_01", "a_m_o_guatownfolk_01", "a_m_o_lagtownfolk_01",
  "a_m_o_sdchinatown_01", "a_m_o_sdupperclass_01", "a_m_o_waptownfolk_01", "a_m_y_asbminer_01", "a_m_y_asbminer_02", "a_m_y_asbminer_03", "a_m_y_asbminer_04", "a_m_y_nbxstreetkids_01", "a_m_y_nbxstreetkids_slums_01", "a_m_y_sdstreetkids_slums_02", "a_m_y_unicorpse_01", "casp_coachrobbery_lenny_males_01",
  "casp_coachrobbery_micah_males_01", "casp_hunting02_males_01", "cr_strawberry_males_01", "cs_abe", "cs_aberdeenpigfarmer", "cs_aberdeensister", "cs_abigailroberts", "cs_acrobat", "cs_adamgray", "cs_agnesdowd", "cs_albertcakeesquire", "cs_albertmason",
  "cs_andershelgerson", "cs_angel", "cs_angryhusband", "cs_angusgeddes", "cs_ansel_atherton", "cs_antonyforemen", "cs_archerfordham", "cs_archibaldjameson", "cs_archiedown", "cs_artappraiser", "cs_asbdeputy_01", "cs_ashton",
  "cs_balloonoperator", "cs_bandbassist", "cs_banddrummer", "cs_bandpianist", "cs_bandsinger", "cs_baptiste", "cs_bartholomewbraithwaite", "cs_bathingladies_01", "cs_beatenupcaptain", "cs_beaugray", "cs_billwilliamson", "cs_bivcoachdriver",
  "cs_blwphotographer", "cs_blwwitness", "cs_braithwaitebutler", "cs_braithwaitemaid", "cs_braithwaiteservant", "cs_brendacrawley", "cs_bronte", "cs_brontesbutler", "cs_brotherdorkins", "cs_brynntildon", "cs_bubba", "cs_cabaretmc",
  "cs_cajun", "cs_cancanman_01", "cs_cancan_01", "cs_cancan_02", "cs_cancan_03", "cs_cancan_04", "cs_captainmonroe", "cs_cassidy", "cs_catherinebraithwaite", "cs_cattlerustler", "cs_cavehermit", "cs_chainprisoner_01",
  "cs_chainprisoner_02", "cs_charlessmith", "cs_chelonianmaster", "cs_cigcardguy", "cs_clay", "cs_cleet", "cs_clive", "cs_colfavours", "cs_colmodriscoll", "cs_cooper", "cs_cornwalltrainconductor", "cs_crackpotinventor",
  "cs_crackpotrobot", "cs_creepyoldlady", "cs_creolecaptain", "cs_creoledoctor", "cs_creoleguy", "cs_dalemaroney", "cs_daveycallender", "cs_davidgeddes", "cs_desmond", "cs_didsbury", "cs_dinoboneslady", "cs_disguisedduster_01",
  "cs_disguisedduster_02", "cs_disguisedduster_03", "cs_doroetheawicklow", "cs_drhiggins", "cs_drmalcolmmacintosh", "cs_duncangeddes", "cs_dusterinformant_01", "cs_dutch", "cs_eagleflies", "cs_edgarross", "cs_edithdown", "cs_edith_john",
  "cs_edmundlowry", "cs_escapeartist", "cs_escapeartistassistant", "cs_evelynmiller", "cs_exconfedinformant", "cs_exconfedsleader_01", "cs_exoticcollector", "cs_famousgunslinger_01", "cs_famousgunslinger_02", "cs_famousgunslinger_03", "cs_famousgunslinger_04", "cs_famousgunslinger_05",
  "cs_famousgunslinger_06", "cs_featherstonchambers", "cs_featsofstrength", "cs_fightref", "cs_fire_breather", "cs_fishcollector", "cs_forgivenhusband_01", "cs_forgivenwife_01", "cs_formyartbigwoman", "cs_francis_sinclair", "cs_frenchartist", "cs_frenchman_01",
  "cs_fussar", "cs_garethbraithwaite", "cs_gavin", "cs_genstoryfemale", "cs_genstorymale", "cs_geraldbraithwaite", "cs_germandaughter", "cs_germanfather", "cs_germanmother", "cs_germanson", "cs_gilbertknightly", "cs_gloria",
  "cs_grizzledjon", "cs_guidomartelli", "cs_hamish", "cs_hectorfellowes", "cs_henrilemiux", "cs_herbalist", "cs_hercule", "cs_hestonjameson", "cs_hobartcrawley", "cs_hoseamatthews", "cs_iangray", "cs_jackmarston",
  "cs_jackmarston_teen", "cs_jamie", "cs_janson", "cs_javierescuella", "cs_jeb", "cs_jimcalloway", "cs_jockgray", "cs_joe", "cs_joebutler", "cs_johnmarston", "cs_johnthebaptisingmadman", "cs_johnweathers",
  "cs_josiahtrelawny", "cs_jules", "cs_karen", "cs_karensjohn_01", "cs_kieran", "cs_laramie", "cs_leighgray", "cs_lemiuxassistant", "cs_lenny", "cs_leon", "cs_leostrauss", "cs_levisimon",
  "cs_leviticuscornwall", "cs_lillianpowell", "cs_lillymillet", "cs_londonderryson", "cs_lucanapoli", "cs_magnifico", "cs_mamawatson", "cs_marshall_thurwell", "cs_marybeth", "cs_marylinton", "cs_meditatingmonk", "cs_meredith",
  "cs_meredithsmother", "cs_micahbell", "cs_micahsnemesis", "cs_mickey", "cs_miltonandrews", "cs_missmarjorie",
  "cs_mixedracekid", "cs_moira", "cs_mollyoshea", "cs_mp_alfredo_montez", "cs_mp_allison", "cs_mp_amos_lansing", "cs_mp_bonnie", "cs_mp_bountyhunter", "cs_mp_camp_cook", "cs_mp_cliff", "cs_mp_cripps", "cs_mp_grace_lancing",
  "cs_mp_hans", "cs_mp_henchman", "cs_mp_horley", "cs_mp_jeremiah_shaw", "cs_mp_jessica", "cs_mp_jorge_montez", "cs_mp_langston", "cs_mp_lee", "cs_mp_mabel", "cs_mp_marshall_davies", "cs_mp_moonshiner", "cs_mp_mradler",
  "cs_mp_oldman_jones", "cs_mp_revenge_marshall", "cs_mp_samson_finch", "cs_mp_shaky", "cs_mp_sherifffreeman", "cs_mp_teddybrown", "cs_mp_terrance", "cs_mp_the_boy", "cs_mp_travellingsaleswoman", "cs_mp_went", "cs_mradler", "cs_mrdevon",
  "cs_mrlinton", "cs_mrpearson", "cs_mrsadler", "cs_mrsfellows", "cs_mrsgeddes", "cs_mrslondonderry", "cs_mrsweathers", "cs_mrs_calhoun", "cs_mrs_sinclair", "cs_mrwayne", "cs_mud2bigguy", "cs_mysteriousstranger",
  "cs_nbxdrunk", "cs_nbxexecuted", "cs_nbxpolicechiefformal", "cs_nbxreceptionist_01", "cs_nial_whelan", "cs_nicholastimmins", "cs_nils", "cs_norrisforsythe", "cs_obediahhinton", "cs_oddfellowspinhead", "cs_odprostitute", "cs_operasinger",
  "cs_paytah", "cs_penelopebraithwaite", "cs_pinkertongoon", "cs_poisonwellshaman", "cs_poorjoe", "cs_priest_wedding", "cs_princessisabeau", "cs_professorbell", "cs_rainsfall", "cs_ramon_cortez", "cs_reverendfortheringham", "cs_revswanson",
  "cs_rhodeputy_01", "cs_rhodeputy_02", "cs_rhodesassistant", "cs_rhodeskidnapvictim", "cs_rhodessaloonbouncer", "cs_ringmaster", "cs_rockyseven_widow", "cs_samaritan", "cs_scottgray", "cs_sddoctor_01", "cs_sdpriest", "cs_sdsaloondrunk_01",
  "cs_sdstreetkidthief", "cs_sd_streetkid_01", "cs_sd_streetkid_01a", "cs_sd_streetkid_01b", "cs_sd_streetkid_02", "cs_sean", "cs_sherifffreeman", "cs_sheriffowens", "cs_sistercalderon", "cs_slavecatcher", "cs_soothsayer", "cs_strawberryoutlaw_01",
  "cs_strawberryoutlaw_02", "cs_strdeputy_01", "cs_strdeputy_02", "cs_strsheriff_01", "cs_sunworshipper", "cs_susangrimshaw", "cs_swampfreak", "cs_swampweirdosonny", "cs_sworddancer", "cs_tavishgray", "cs_taxidermist", "cs_theodorelevin",
  "cs_thomasdown", "cs_tigerhandler", "cs_tilly", "cs_timothydonahue", "cs_tinyhermit", "cs_tomdickens", "cs_towncrier", "cs_treasurehunter", "cs_twinbrother_01", "cs_twinbrother_02", "cs_twingroupie_01", "cs_twingroupie_02",
  "cs_uncle", "cs_unidusterjail_01", "cs_valauctionboss_01", "cs_valdeputy_01", "cs_valprayingman", "cs_valprostitute_01", "cs_valprostitute_02", "cs_valsheriff", "cs_vampire", "cs_vht_bathgirl", "cs_wapitiboy", "cs_warvet",
  "cs_watson_01", "cs_watson_02", "cs_watson_03", "cs_welshfighter", "cs_wintonholmes", "cs_wrobel", "female_skeleton", "gc_lemoynecaptive_males_01", "gc_skinnertorture_males_01", "ge_delloboparty_females_01", "g_f_m_uniduster_01", "g_m_m_bountyhunters_01",
  "g_m_m_uniafricanamericangang_01", "g_m_m_unibanditos_01", "g_m_m_unibraithwaites_01", "g_m_m_unibrontegoons_01", "g_m_m_unicornwallgoons_01", "g_m_m_unicriminals_01", "g_m_m_unicriminals_02", "g_m_m_uniduster_01", "g_m_m_uniduster_02", "g_m_m_uniduster_03", "g_m_m_uniduster_04", "g_m_m_uniduster_05",
  "g_m_m_unigrays_01", "g_m_m_unigrays_02", "g_m_m_uniinbred_01", "g_m_m_unilangstonboys_01", "g_m_m_unimicahgoons_01", "g_m_m_unimountainmen_01", "g_m_m_uniranchers_01", "g_m_m_uniswamp_01", "g_m_o_uniexconfeds_01", "g_m_y_uniexconfeds_01", "g_m_y_uniexconfeds_02", "loansharking_asbminer_males_01",
  "loansharking_horsechase1_males_01", "loansharking_undertaker_females_01", "loansharking_undertaker_males_01", "male_skeleton", "mbh_rhodesrancher_females_01", "mbh_rhodesrancher_teens_01", "mbh_skinnersearch_males_01", "mes_abigail2_males_01", "mes_finale2_females_01", "mes_finale2_males_01", "mes_finale3_males_01", "mes_marston1_males_01",
  "mes_marston2_males_01", "mes_marston5_2_males_01", "mes_marston6_females_01", "mes_marston6_males_01", "mes_marston6_teens_01", "mes_sadie4_males_01", "mes_sadie5_males_01", "mp_asntrk_elysianpool_males_01", "mp_asntrk_grizzlieswest_males_01", "mp_asntrk_hagenorchard_males_01", "mp_asntrk_isabella_males_01", "mp_asntrk_talltrees_males_01", "mp_asntrk_tumbleweed_males_01"
  
}



local selectedIndex = 0

menu.addStringSpinner('self', 'Select Ped Model', 'Pick your ped model', selectedIndex, pedNames, function(valueIdx)
  selectedIndex = valueIdx
  --logger.logInfo('Selected model: ' .. pedNames[selectedIndex + 1])
end)

menu.addButton('self', 'Change Model', 'Change your ped model', function()
  local modelName = pedNames[selectedIndex + 1]
  logger.logInfo('Changing model to: ' .. modelName)

  local modelHash = natives.misc_getHashKey(modelName)
  utility.changePlayerModel(modelHash)
  
  --logger.logInfo("Player model changed to: " .. modelName)
end)
