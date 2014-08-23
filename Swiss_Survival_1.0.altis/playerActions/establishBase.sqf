private ["_position", "_mkr"];

_position = _this select 0;

// Create Trigger and check for enemies
_trg=createTrigger["EmptyDetector",_position];
_trg setTriggerArea[350,350,0,false];
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

// Create Marker
_mkr = createMarker ["respawn_west" + str var_baseMarkerIndex, _position];

_mkr setMarkerShape "ICON";
_mkr setMarkerType "b_unknown";
_mkr setMarkerText "Base";

var_baseMarkerIndex = var_baseMarkerIndex + 1;

if(!var_baseEstablished) then {
	[west, 0] call BIS_fnc_removeRespawnPosition;
};
// Set Flag at least 1 base established
var_baseEstablished = true;

// Delete old respawn marker
/*if(!isNil ("respawn_west_start")) then {
	deleteMarker "respawn_west_start";
};*/
