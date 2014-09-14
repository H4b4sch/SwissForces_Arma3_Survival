/*
  # HEADER #
	Script: 		Server\Functions\Server_BuildDefense.sqf
	Alias:			CTI_SE_FNC_BuildDefense
	Description:	Construct a defense at a given position
	Author: 		Benny
	Creation Date:	20-09-2013
	Revision Date:	02-06-2014 (Sari)
	
  # PARAMETERS #
    0	[String]: The defense variable name
    1	[Array]: The position of the defense
    2	[Number]: The direction of the defense
	
  # RETURNED VALUE #
	[Object]: The constructed defense
	
  # SYNTAX #
	[DEFENSE VARIABLE, SIDE, POSITION, DIRECTION, AUTOALIGN, MANNED] call CTI_SE_FNC_BuildDefense
	
  # DEPENDENCIES #
	Common Function: CTI_CO_FNC_GetSideID
	Common Function: CTI_CO_FNC_GetSideLogic
	Common Function: CTI_CO_FNC_NetSend
	Server Function: CTI_SE_FNC_HandleStaticDefenses
	Server Function: funcCalcAlignPosDir
	
  # EXAMPLE #
    _object = [_variable, CTI_P_SideJoined, [_pos select 0, _pos select 1], _dir, CTI_P_WallsAutoAlign, CTI_P_DefensesAutoManning] call CTI_SE_FNC_BuildDefense;
*/

private ["_direction", "_position", "_var"];

_var = _this select 0;
_position = _this select 1;
_direction = _this select 2;
_position set [2, 0];

// Create vehicle
_object = _var createVehicle _position;
_object setDir _direction;
_object setPos _position;

// Treatment of "special" buildings (pun intended)
switch (_var) do {
	case "Land_i_House_Small_03_V1_F": {	// Base
		
		// Create Marker and add to building variable
		_mkr = createMarker ["respawn_west" + str var_baseMarkerIndex, _position];
		_mkr setMarkerShape "ICON";
		_mkr setMarkerType "b_unknown";
		_mkr setMarkerText "Base";
		_object setVariable ["baseMarker", _mkr];
		
		// Add to the list of respawn-points (BTC-Revive)
		BTC_CUSTOM_respawn_points = BTC_CUSTOM_respawn_points + [_object];
		BTC_CUSTOM_respawn_points_str = BTC_CUSTOM_respawn_points_str + ["Base " + str var_baseMarkerIndex];
		publicVariable "BTC_CUSTOM_respawn_points";
		publicVariable "BTC_CUSTOM_respawn_points_str";
		
		// Keep the index number to the base
		_object setVariable ["baseIndex",var_baseMarkerIndex];
		
		// Add Action to rename base
		_id = _object addAction ["Rename Base", "createDialog 'name_base';"];
		
		// Add to the index
		var_baseMarkerIndex = var_baseMarkerIndex + 1;
		
		// Set Flag at least 1 base established
		var_baseEstablished = true;
	};
	case "Land_i_Garage_V1_F": {	// Land Vehicle Refit
		// Create Marker for area
		_mkr = createMarker ["vehicleArea" + str var_vehicleRefitMarkerIndex, _position];
		_mkr setMarkerShape "RECTANGLE";
		_mkr setMarkerSize [5,5];
		_mkr setMarkerColor "ColorWEST";
		_mkr setMarkerAlpha 1;
		_mkr setMarkerDir getDir player;
		_mkr setMarkerPos getMarkerPos _mkr; // Synchronize among MP
		
		// Create Marker for Icon
		_mkr = createMarker ["vehicleIcon" + str var_vehicleRefitMarkerIndex, _position];
		_mkr setMarkerShape "ICON";
		_mkr setMarkerType "b_motor_inf";
		_mkr setMarkerText "Land Refit";
		_mkr setMarkerAlpha 1;
		_mkr setMarkerDir getDir player;
		_mkr setMarkerPos getMarkerPos _mkr; // Synchronize among MP
		
		// Create Trigger for Repairing
		_trg=createTrigger["EmptyDetector",_position];
		_trg setTriggerArea[5,5,0,true];
		_trg setTriggerActivation ["WEST", "PRESENT", true];
		_trg setTriggerStatements ["('LandVehicle' countType thislist  > 0)", "_handle = [thisList] execVM 'funct\common\refitVehicle.sqf';", ""];
		
		var_vehicleRefitMarkerIndex = var_vehicleRefitMarkerIndex + 1;
	};
	case "Land_HelipadCivil_F": {	// Air Vehicle Refit
		// Create Marker for area
		_mkr = createMarker ["vehicleArea" + str var_vehicleRefitMarkerIndex, _position];
		_mkr setMarkerShape "RECTANGLE";
		_mkr setMarkerSize [5,5];
		_mkr setMarkerColor "ColorWEST";
		_mkr setMarkerAlpha 1;
		_mkr setMarkerDir getDir player;
		_mkr setMarkerPos getMarkerPos _mkr; // Synchronize among MP
		
		// Create Marker for Icon
		_mkr = createMarker ["vehicleIcon" + str var_vehicleRefitMarkerIndex, _position];
		_mkr setMarkerShape "ICON";
		_mkr setMarkerType "b_motor_inf";
		_mkr setMarkerText "Air Refit";
		_mkr setMarkerAlpha 1;
		_mkr setMarkerDir getDir player;
		_mkr setMarkerPos getMarkerPos _mkr; // Synchronize among MP
		
		// Create Trigger for Repairing
		_trg=createTrigger["EmptyDetector",_position];
		_trg setTriggerArea[5,5,0,true];
		_trg setTriggerActivation ["WEST", "PRESENT", true];
		_trg setTriggerStatements ["('Air' countType thislist  > 0)", "_handle = [thisList] execVM 'funct\common\refitVehicle.sqf';", ""];
		
		var_vehicleRefitMarkerIndex = var_vehicleRefitMarkerIndex + 1;
	};
};