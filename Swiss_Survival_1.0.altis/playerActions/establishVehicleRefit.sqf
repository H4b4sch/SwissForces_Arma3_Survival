private ["_position", "_mkr", "_obj"];

_position = _this select 0;

// Create Trigger and check for enemies
_trg=createTrigger["EmptyDetector",_position];
_trg setTriggerArea[500,500,0,false];
_trg setTriggerActivation["EAST","PRESENT",true];
_trg setTriggerStatements["this", "", ""];
sleep 5;
_amountOPFOR = count list _trg;
deleteVehicle _trg;

if (_amountOPFOR > 2) exitWith {
Hint "This position is not clear from enemies";
sleep 10;
  _art = [player,"fob_support"] call BIS_fnc_addCommMenuItem;
};

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
_mkr setMarkerText "Refit";
_mkr setMarkerAlpha 1;
_mkr setMarkerDir getDir player;
_mkr setMarkerPos getMarkerPos _mkr; // Synchronize among MP

// Create Trigger for Repairing
_trg=createTrigger["EmptyDetector",_position];
_trg setTriggerArea[5,5,0,true];
_trg setTriggerActivation ["WEST", "PRESENT", true];
_trg setTriggerStatements ["('LandVehicle' countType thislist  > 0)", "_handle = [thisList] execVM 'scripts\refitVehicle.sqf';", ""];

// Create decoration
/*_posX = getMarkerPos _mkr select 0;
_posY = getMarkerPos _mkr select 1;
_posX = _posX + 
_obj = createVehicle
*/
var_vehicleRefitMarkerIndex = var_vehicleRefitMarkerIndex + 1;
