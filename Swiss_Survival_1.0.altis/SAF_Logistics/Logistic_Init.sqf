/*
Created by =BTC= Giallustio
Version: 0.13
Date: 20/03/2013
Visit us at: http://www.blacktemplars.altervista.org/
*/
if (isServer) then
{
	BTC_id_repo = 10;publicVariable "BTC_id_repo";
	BTC_cargo_repo = "Land_HBarrierBig_F" createVehicle [- 5000,- 5000,0];publicVariable "BTC_cargo_repo";
};
if (isDedicated) exitwith {};
BTC_active_lift      = 1;
BTC_active_dragging     = 1;
BTC_dir_action = "SAF_Logistics\Logistic_AddAction.sqf";
BTC_l_placement_area = 20;
if (BTC_active_lift == 1) then
{
	BTC_lift          = 1;
	BTC_lifted        = 0;
	BTC_lift_min_h    = 2;
	BTC_lift_max_h    = 35;
	BTC_lift_radius   = 4;
	BTC_def_pip       = 1;
	BTC_l_def_veh_pip = ["Air"];
	BTC_l_pip_cond    = false;
	BTC_cargo_lifted  = objNull;
	_lift = [] execVM "SAF_Logistics\Lifting_System.sqf";
	BTC_get_liftable_array =
	{
		_chopper = _this select 0;
		_array   = [];
		store_strategic = ["ReammoBox","ReammoBox_F","Strategic","StaticWeapon","Wall_F","HBarrier_base_F"];
		store_light 	= ["Quadbike_01_base_F","Ship"];
		store_medium	= ["Car","Truck","Air"];
		store_large		= ["AllVehicles"];

		switch (typeOf _chopper) do
		{
			case "B_Heli_Light_01_F"     				: {_array = store_strategic + store_light}; 								//MH-9 Hummingbird
			case "B_Heli_Light_01_armed_F"  		: {_array = store_strategic + store_light}; 								//AH-9 Pawnee
			case "B_Heli_Attack_01_F"						: {_array = store_strategic + store_light}; 								//AH-99 Blackfoot
			case "B_Heli_Transport_01_F" 				: {_array = store_strategic + store_large}; 								//UH-80 Ghost Hawk
			case "B_Heli_Transport_01_camo_F" 	: {_array = store_strategic + store_large}; 								//UH-80 Ghost Hawk (Camo)
			case "O_Heli_Light_02_F" 						: {_array = store_strategic + store_light + store_medium}; 	//PO-30
			case "O_Heli_Light_02_unarmed_F"		: {_array = store_strategic + store_light + store_medium}; 	//PO-30 Orca (Black)
			case "O_Heli_Attack_02_F"     			: {_array = store_strategic + store_light}; 								//Mi-48 Kajman
			case "O_Heli_Attack_02_black_F"     : {_array = store_strategic + store_light}; 								//Mi-48 Kajman (Black)
			case "I_Heli_light_03_F" 						: {_array = store_strategic + store_light + store_medium}; 	//WY-55 Hellcat
			case "I_Heli_light_03_unarmed_F" 		: {_array = store_strategic + store_light + store_medium}; 	//WY-55 Hellcat (Green)
			case "I_Heli_Transport_02_F" 				: {_array = store_strategic + store_large}; 								//CH-49 Mohawk
		};
		_array
	};
};
if (BTC_active_dragging == 1) then
{
	_cargo = [] execVM "SAF_Logistics\Dragging_System.sqf";
	BTC_def_vehicles = ["Tank","Wheeled_APC","Truck","Car","Helicopter"];
	BTC_def_drag = ["Land_Campfire_F", "Land_CampingChair_V2_F", "Land_CampingTable_F",
											 "Land_CampingTable_small_F", "Land_FirePlace_F", "Land_TentA_F", "Land_MapBoard_F",
											 "MapBoard_altis_F", "Land_Sack_F", "Land_Sacks_heap_F", "Land_MetalBarrel_empty_F",
											 "CamoNet_BLUFOR_F", "Land_BarGate_F", "Land_WoodenTable_small_F", "Land_Net_Fence_4m_F", "Land_TentDome_F", "Land_FloodLight_F", "Land_BagFence_End_F", "Land_BagFence_Corner_F",
											 "Land_BagFence_Short_F", "Land_HBarrier_1_F", "Land_Razorwire_F","CamoNet_BLUFOR_open_F",
											 "Land_Net_Fence_Gate_F", "Land_Net_Fence_8m_F", "Land_Mil_WiredFence_F", "Land_PortableLight_single_F", "Land_CargoBox_V1_F", "Land_BagFence_Short_F", "Land_BagFence_Long_F", "Land_HBarrier_3_F",
											 "Land_HBarrier_5_F", "CamoNet_BLUFOR_big_F", "Land_Mil_WiredFence_Gate_F", "Land_New_WiredFence_5m_F",
											 "Land_PortableLight_double_F", "Land_BagBunker_Small_F", "Land_BagFence_Long_F", "Land_BagFence_Round_F", "Land_HBarrierBig_F",
											 "Land_HBarrierWall4_F", "Land_HBarrierWall6_F", "Land_New_WiredFence_10m_F", "Land_PortableLight_double_F", "Land_BagBunker_Large_F", "Land_BagBunker_Tower_F", "Land_HBarrierTower_F",
											 "Land_HBarrierWall_corner_F", "Land_PortableLight_double_F",
											 "ReammoBox","ReammoBox_F", "StaticWeapon"];
  BTC_cargo_selected = objNull;
	BTC_def_cc =
	[
		"B_Quadbike_01_F",2,
		"B_Truck_01_transport_F",10,
		"B_Truck_01_covered_F",10,
		"I_Truck_02_covered_F",10,
		"O_Truck_02_covered_F",10,
		"I_Truck_02_transport_F",10,
		"O_Truck_02_transport_F",10,
		"O_Truck_02_transport_F",10
	];
	BTC_def_rc =
	[
		"Land_BagBunker_Small_F",4
	];
};
BTC_l_obj_fall =
{
	_obj    = _this select 0;
	_height = (getPos _obj) select 2;
	_fall   = 0.09;
	while {((getPos _obj) select 2) > 0.1} do
	{
		_fall = (_fall * 1.1);
		_obj setPos [getPos _obj select 0, getPos _obj select 1, _height];
		_height = _height - _fall;
		sleep 0.01;
	};
};