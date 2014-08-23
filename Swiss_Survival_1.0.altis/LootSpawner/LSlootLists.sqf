//	Lootspawner junction lists for classes to spawn-/lootable items
//	Author: Na_Palm (BIS forums)
//-------------------------------------------------------------------------------------
//here place Weapons an usable items (ex.: Binocular, ...)
//used with addWeaponCargoGlobal
//"lootWeapon_list" array of [class, [weaponlist]]
//								class		: 0-civil, 1-military, ... (add more as you wish)
//								weaponlist	: list of weapon class names
lootWeapon_list = [
[ 0, [							// Tier 0
"hgun_P07_F", "hgun_Pistol_heavy_01_F", "hgun_Pistol_heavy_02_F",
									 "hgun_PDW2000_F", "SMG_01_F", "launch_NLAW_F", "arifle_TRG21_F",
									 "arifle_Mk20_F", "SMG_02_F"
]],[ 1, [						// MILITARY
"arifle_TRG21_F", "arifle_Mk20_F", "SMG_02_F", "launch_RPG32_F",
"LMG_Mk200_F", "arifle_Katiba_F", "arifle_MX_F", "arifle_TRG21_GL_F", "arifle_Mk20_plain_F",
"srifle_DMR_01_F"
]],[ 2, [						// INDUSTRIAL
"launch_NLAW_F", "arifle_TRG21_F", "arifle_Mk20_F", "SMG_02_F", "launch_RPG32_F"

]],[ 3, [						// RESEARCH
"launch_NLAW_F", "launch_RPG32_F", "LMG_Mk200_F", "arifle_Katiba_F", "arifle_MX_F",
									 "arifle_TRG21_GL_F", "arifle_Mk20_plain_F", "srifle_DMR_01_F"
]]];

//here place magazines, weaponattachments and bodyitems(ex.: ItemGPS, ItemMap, Medikit, FirstAidKit, Binoculars, ...)
//used with addMagazineCargoGlobal
//"lootMagazine_list" array of [class, [magazinelist]]
//								class		: 0-civil, 1-military, ... (add more as you wish)
//								magazinelist: list of magazine class names
lootMagazine_list = [
[ 0, [							// CIVIL
"16Rnd_9x21_Mag", "11Rnd_45ACP_Mag", "6Rnd_45ACP_Cylinder",
								 "16Rnd_9x21_Mag", "30Rnd_45ACP_Mag_SMG_01", "NLAW_F", "30Rnd_556x45_Stanag",
								 "30Rnd_556x45_Stanag", "30Rnd_9x21_Mag",
								 "MiniGrenade", "SmokeShell", "SmokeShellRed",
								 "SmokeShell", "Chemlight_green"
]],[ 1, [						// MILITARY
"30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_9x21_Mag", "RPG32_F", "200Rnd_65x39_cased_Box",
"30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_mag",
								 "1Rnd_HE_Grenade_shell", "30Rnd_556x45_Stanag", "10Rnd_762x51_Mag",
								 "HandGrenade", "SmokeShellRed", "SmokeShellGreen"
]],[ 2, [						// INDUSTRIAL
"NLAW_F", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag", "30Rnd_9x21_Mag", "RPG32_F",
								 "MiniGrenade", "SmokeShell", "SmokeShellRed", "SmokeShellGreen"
]],[ 3, [						// RESEARCH
"NLAW_F", "RPG32_F", "200Rnd_65x39_cased_Box", "30Rnd_65x39_caseless_green", "30Rnd_65x39_caseless_mag",
								 "1Rnd_HE_Grenade_shell", "30Rnd_556x45_Stanag", "10Rnd_762x51_Mag",
								 "HandGrenade", "SmokeShellRed", "SmokeShellGreen"
]]];

//here place hats, glasses, clothes, uniforms, vests
//used with addItemCargoGlobal
//"lootItem_list" array of [class, [itemlist]]
//								class		: 0-civil, 1-military, ... (add more as you wish)
//								itemlist	: list of item class names
lootItem_list = [
[ 0, [							// CIVIL
"ItemWatch", "ItemRadio", "ItemCompass", "Binocular", "FirstAidKit", "optic_Aco", "acc_flashlight",
"V_BandollierB_blk", "V_TacVest_blk", "ItemMap"
]],[ 1, [						// MILITARY
"ItemMap", "MineDetector", "Rangefinder", "NVGoggles", "ToolKit", "FirstAidKit",
"muzzle_snds_L", "muzzle_snds_M", "muzzle_snds_H", "optic_Aco", "optic_Aco_smg",
									 "optic_Holosight", "acc_flashlight", "optic_Yorris", "muzzle_snds_acp",
									 "V_BandollierB_blk", "V_TacVest_blk", "V_HarnessO_brn",
									 "U_B_CombatUniform_mcam", "H_HelmetCrew_B", "H_HelmetB_desert"
]],[ 2, [						// INDUSTRIAL
"ItemMap", "MineDetector", "Rangefinder", "NVGoggles", "ToolKit", "FirstAidKit", "FirstAidKit",
"muzzle_snds_B", "muzzle_snds_H_MG", "optic_Arco", "optic_Holosight", "acc_flashlight", "optic_Yorris"
]],[ 3, [						// RESEARCH
"ItemGPS", "Medikit", "Laserdesignator", "B_UavTerminal", "ItemMap", "Rangefinder", "optic_SOS"
]]];

//here place backpacks, parachutes and packed drones/stationary
//used with addBackpackCargoGlobal
//"lootBackpack_list" array of [class, [backpacklist]]
//								class		: 0-civil, 1-military, ... (add more as you wish)
//								backpacklist: list of backpack class names
lootBackpack_list = [
[ 0, [							// CIVIL
"B_AssaultPack_blk"
]],[ 1, [						// MILITARY
"B_AssaultPack_blk"
]],[ 2, [						// INDUSTRIAL
"B_AssaultPack_blk"
]],[ 3, [						// RESEARCH
"B_AssaultPack_blk"
]]];

//here place any other objects(ex.: Land_Basket_F, Box_East_Wps_F, Land_Can_V3_F, ...)
//used with createVehicle directly
//"lootworldObject_list" array of [class, [objectlist]]
//								class		: 0-civil, 1-military, ... (add more as you wish)
//								objectlist	: list of worldobject class names
lootworldObject_list = [
[ 0, [							// CIVIL
"Land_CampingChair_V2_F", "Land_CampingTable_F",
											 "Land_CampingTable_small_F", "Land_TentA_F", "Land_MapBoard_F",
											 "MapBoard_altis_F", "Land_Sack_F", "Land_Sacks_heap_F", "Land_MetalBarrel_empty_F",
											 "Land_TentDome_F", "Land_FloodLight_F", "Land_BagFence_End_F", "Land_BagFence_Corner_F",
											 "Land_BagFence_Short_F", "Land_HBarrier_1_F"
]],[ 1, [						// MILITARY
"Land_PortableLight_single_F", "Land_FloodLight_F", "Land_BagFence_End_F", "Land_BagFence_Corner_F",
"Land_BagFence_Short_F", "Land_HBarrier_1_F", "Land_BagFence_Short_F", "Land_BagFence_Long_F", "Land_HBarrier_3_F"
]],[ 2, [						// INDUSTRIAL
"Land_PortableLight_single_F", "Land_FloodLight_F", "Land_BagFence_End_F", "Land_BagFence_Corner_F",
"Land_BagFence_Short_F", "Land_HBarrier_1_F", "Land_BagFence_Short_F"
]],[ 3, [						// RESEARCH
"Land_PortableLight_single_F", "Land_FloodLight_F", "Land_BagFence_End_F", "Land_BagFence_Corner_F",
"Land_BagFence_Short_F", "Land_HBarrier_1_F", "Land_BagFence_Short_F", "Land_BagFence_Long_F", "Land_HBarrier_3_F"
]]];