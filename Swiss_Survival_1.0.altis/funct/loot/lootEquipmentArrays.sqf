// Arrays with equipment classes to be spawned
/*
	arr_weaponTier0, arr_weaponTier1, arr_weaponTier2, arr_weaponTier3, arr_weaponTier4,
	arr_ammoTier0, arr_ammoTier1, arr_amooTier2, arr_ammoTier3, arr_ammoTier4,
	arr_objectTier0, arr_objectTier1, arr_objectTier2,
	arr_attachTier0, arr_attachTier1, arr_attachTier2,
	arr_vestTier0, arr_vestTier1,
	arr_ruckTier0, arr_ruckTier1,
	arr_clothesTier0, arr_clothesTier1, arr_clothesTier2
*/

// Weapons
// Tier0 Pistols & Subs
arr_weaponTier0 = ["hgun_P07_F", "hgun_Rook40_F", "hgun_Pistol_heavy_01_F", "hgun_Pistol_heavy_02_F",
									 "hgun_PDW2000_F", "SMG_01_F", "hgun_ACPC2_F"];
									 
// Tier1 Better Subs & Basic Launchers & Low Assault
arr_weaponTier1 = ["launch_NLAW_F", "arifle_TRG21_F", "arifle_Mk20_F", "SMG_02_F", "launch_RPG32_F"];

// Tier2 Assault & Basic Launchers & Basic LMG & Low Assault GL
arr_weaponTier2 = ["launch_NLAW_F", "launch_RPG32_F", "LMG_Mk200_F", "arifle_Katiba_F", "arifle_MX_F",
									 "arifle_TRG21_GL_F", "arifle_Mk20_plain_F", "srifle_DMR_01_F"];
									 
// Tier3 Best Assault, Good Launchers, GL, LMG
arr_weaponTier3 = ["srifle_EBR_F", "arifle_Katiba_GL_F", "arifle_MX_GL_F", "arifle_TRG21_GL_F",
									 "launch_B_Titan_F", "launch_B_Titan_short_F", "srifle_DMR_01_F"];

// Tier4 God Tier with Sniper and LMG
arr_weaponTier4 = ["srifle_GM6_F", "srifle_LRR_F", "LMG_Zafir_F", "srifle_GM6_LRPS_F", "srifle_LRR_LRPS_F"];

arr_spawnWeapons = [arr_weaponTier0, arr_weaponTier1, arr_weaponTier2, arr_weaponTier3, arr_weaponTier4];


// Ammo
// Determinded by Weapons in each Tier
// NEED TO BE IN EXACT SAME ORDER AS WEAPONS
// Grenades added to the end of the list
arr_ammoTier0 = ["16Rnd_9x21_Mag", "16Rnd_9x21_Mag", "11Rnd_45ACP_Mag", "6Rnd_45ACP_Cylinder",
								 "16Rnd_9x21_Mag", "30Rnd_45ACP_Mag_SMG_01", "9Rnd_45ACP_Mag",
								 "SmokeShell", "Chemlight_green"];

arr_ammoTier1 = ["NLAW_F", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_9x21_Mag", "RPG32_F",
								 "MiniGrenade", "SmokeShell", "SmokeShellRed", "SmokeShellGreen"];

arr_ammoTier2 = ["NLAW_F", "RPG32_F", "200Rnd_65x39_cased_Box", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_mag",
								 "1Rnd_HE_Grenade_shell", "30Rnd_556x45_Stanag", "10Rnd_762x51_Mag",
								 "HandGrenade", "SmokeShellRed", "SmokeShellGreen"];

arr_ammoTier3 = ["20Rnd_762x51_Mag", "1Rnd_HE_Grenade_shell", "3Rnd_HE_Grenade_shell", "1Rnd_HE_Grenade_shell",
								 "Titan_AA", "Titan_AT", "10Rnd_762x51_Mag",
								 "HandGrenade"];
								 
arr_ammoTier4 = ["5Rnd_127x108_Mag", "7Rnd_408_Mag", "150Rnd_762x51_Box_Tracer", "5Rnd_127x108_Mag", "7Rnd_408_Mag"],

arr_spawnAmmo = [arr_ammoTier0, arr_ammoTier1, arr_ammoTier2, arr_ammoTier3, arr_ammoTier4];


// Objects Like the map and binoculars and stuff
arr_objectTier0 = ["ItemWatch", "ItemRadio", "ItemCompass", "Binocular", "FirstAidKit"];
arr_objectTier1 = ["MineDetector", "Rangefinder", "NVGoggles", "ToolKit", "FirstAidKit"];
arr_objectTier2 = ["ItemGPS", "Medikit", "Laserdesignator", "B_UavTerminal"];

arr_spawnObjects = [arr_objectTier0, arr_objectTier1, arr_objectTier2];

// Weapon Attachements
arr_attachTier0 = ["muzzle_snds_L", "muzzle_snds_M", "muzzle_snds_H", "optic_Aco", "optic_Aco_smg",
									 "optic_Holosight", "acc_flashlight", "optic_Yorris", "muzzle_snds_acp"];

arr_attachTier1 = ["muzzle_snds_B", "muzzle_snds_H_MG", "optic_Arco", "optic_Hamr", "optic_SOS",
									 "acc_pointer_IR", "optic_MRCO", "optic_DMS"];

arr_attachTier2 = ["optic_LRPS", "optic_NVS", "optic_Nightstalker", "optic_tws", "optic_tws_mg"];

arr_spawnAttachs = [arr_attachTier0, arr_attachTier1, arr_attachTier2];

// Vests
arr_vestTier0 = ["V_BandollierB_blk", "V_TacVest_blk", "V_HarnessO_brn"];
arr_vestTier1 = ["V_PlateCarrier1_rgr", "V_Chestrig_blk", "V_PlateCarrier3_rgr"];

arr_spawnVests = [arr_vestTier0, arr_vestTier1];

// BackPacks
arr_ruckTier0 = ["B_AssaultPack_blk", "B_Kitbag_mcamo", "B_OutdoorPack_blk"];
arr_ruckTier1 = ["B_Bergen_mcamo", "B_FieldPack_blk", "B_Carryall_mcamo"];

arr_spawnRucks = [arr_ruckTier0, arr_ruckTier1];

// Normal Clothes
arr_clothesTier0 = ["U_Rangemaster", "U_Competitor", "U_BG_Guerilla1_1", "U_BG_Guerilla2_2",
										"U_BG_Guerilla2_3", "U_BG_Guerilla3_1", "U_B_CTRG_2", "H_Booniehat_indp",
										"H_HelmetB_plain_mcamo", "H_Cap_red", "H_Cap_headphones", "H_Cap_blk_ION",
										"H_MilCap_mcamo", "H_Shemag_khk", "H_Beret_blk"];

arr_clothesTier1 = ["U_B_CombatUniform_mcam", "U_B_CombatUniform_mcam_tshirt", "U_B_CombatUniform_mcam_vest",
										"U_B_HeliPilotCoveralls", "U_B_PilotCoveralls", "H_HelmetB_light_grass",
										"H_CrewHelmetHeli_B", "H_PilotHelmetHeli_B", "H_HelmetCrew_B", "H_HelmetB_desert"];
										
arr_clothersTier2 = ["U_B_GhillieSuit", "U_B_CTRG_1", "U_B_CTRG_3", "H_HelmetB_camo", "H_PilotHelmetFighter_B"];

arr_spawnClothes = [arr_clothesTier0, arr_clothesTier1, arr_clothersTier2];

arr_spawnEquipmentArrays = [arr_spawnWeapons, arr_spawnAmmo, arr_spawnObjects, arr_spawnAttachs, arr_spawnVests,
														arr_spawnRucks, arr_spawnClothes];