waitUntil { isServer || !isNull player };

enableSaving [true,true];

// Set global variables & functions
call compile preprocessFileLineNumbers "init\variables.sqf";
call compile preprocessFileLineNumbers "init\functions.sqf";

// Initialize Scripts
[] execVM "plugins\SAF_Field_Repair\Field_Repair.sqf";
[] execVM "plugins\R3F_LOG\init.sqf";
call compile preprocessFile "plugins\=BTC=_revive\=BTC=_revive_init.sqf";

// Create start marker
if(isServer || isDedicated) then {
	var_startPos = [] call fnc_FindGoodPos;			// Start Position
	publicVariable "var_startPos";							// Broadcast it
};
_mrkr = createMarker ["respawn_west", var_startPos ];
_mrkr setMarkerShape "ICON";
_mrkr setMarkerType "mil_box";
_mrkr setMarkerColor "ColorBlue";
_mrkr setMarkerAlpha 1;

// Server Initialisation
if(isServer || isDedicated) then {
	execVM "init\initserver.sqf";
};

// Start the client initialisation
call compile preprocessFileLineNumbers "init\initClient.sqf";

diag_log format["SWISS_SURVIVAL: Initialisation Complete", time];