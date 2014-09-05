/*
  # HEADER #
	Script: 		Client\Functions\Client_PlacingDefense.sqf
	Alias:			CTI_CL_FNC_PlacingDefense
	Description:	Prepare the placement of a defense before the construction
	Author: 		Benny
	Creation Date:	20-09-2013
	Revision Date:	14-10-2013
	
  # PARAMETERS #
    0	[String]: The defense variable name
    1	[Object]: The center (construction center)
    2	[Number]: The construction radius
	
  # RETURNED VALUE #
	None
	
  # SYNTAX #
	[DEFENSE VARIABLE, CENTER, RADIUS] spawn CTI_CL_FNC_PlacingDefense
	
  # DEPENDENCIES #
	Client Function: CTI_CL_FNC_ChangePlayerFunds
	Client Function: CTI_CL_FNC_GetPlayerFunds
	Common Function: CTI_CO_FNC_GetDirTo
	Common Function: CTI_CO_FNC_NetSend
	
  # EXAMPLE #
    [_selected, CTI_P_SideJoined call CTI_CO_FNC_GetSideHQ, CTI_BASE_CONSTRUCTION_RANGE] spawn CTI_CL_FNC_PlacingDefense;
*/

_variable = _this select 0;
_center = _this select 1;
_center_distance = _this select 2;

VAR_STRUCTPLACED = false;
VAR_STRUCTCANCELED = false;

// Create key handler
VAR_BUILD_MANROTATE = 0;
_deh = (findDisplay 46) displayAddEventHandler ["KeyDown", "nullReturn = _this spawn KeyHandler_BuildMenu"];

// Create the local vehicle (for preview) and set distance to player and direction
_local = _variable createVehicleLocal getPos player;
_distance_structure = 20;

// Disable collision with near entities
{_local disableCollisionWith _x} forEach (_center nearEntities (_center_distance+500));

// Add actions to place and cancel
_action = player addAction ["<t color='#9CF863'>Build</t>", "VAR_STRUCTPLACED = true;"];
_action2 = player addAction ["<t color='#F86363'>Cancel Building</t>", "VAR_STRUCTCANCELED = true;"];

// The whole placing thing
_dir = 0;
_pos = [];
while {!VAR_STRUCTPLACED && !VAR_STRUCTCANCELED} do {
	_pos = player modelToWorld [0, _distance_structure, 0];
	
	_dirTo = [_local, player] call FNC_GETDIRTO;	// Get dir by player dir
	_dirTo = _dirTo + VAR_BUILD_MANROTATE;				// Add custom dir to it
	_pos set [2, 0];
	
	_local setPos _pos;
	_local setDir _dirTo;
	
	sleep .01;
};

// Remove the actions
player removeAction _action;
player removeAction _action2;


if !(VAR_STRUCTCANCELED) then {	
	
	// If it was not canceled build the building
	_null = [_variable, [_pos select 0, _pos select 1], getDir _local] execVM "funct\playerActions\BuildBuilding.sqf";
}else{
	
	// If it was canceled readd the option to build a base
	switch (_variable) do {
		case "Land_i_House_Small_03_V1_F": {
			[player,"establish_base"] call BIS_fnc_addCommMenuItem
		};
		case "Land_i_Garage_V1_F": {
			[player,"establish_landvehicle_refit"] call BIS_fnc_addCommMenuItem
		};
		case "Land_HelipadCivil_F": {
			[player,"establish_airvehicle_refit"] call BIS_fnc_addCommMenuItem
		};
	};
};

// Delete le vehicül
deleteVehicle _local;