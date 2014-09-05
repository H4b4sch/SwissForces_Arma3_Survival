waitUntil { isServer || !isNull player };

enableSaving [true,true];

// Set global variables & functions
call compile preprocessFileLineNumbers "init\variables.sqf";
call compile preprocessFileLineNumbers "init\functions.sqf";

// Initialize Scripts
_null = execVM "funct\loot\loot.sqf";
[] execVM "plugins\SAF_Field_Repair\Field_Repair.sqf";
[] execVM "plugins\R3F_LOG\init.sqf";

// Create start marker
var_startPos = [] call fnc_FindGoodPos;			// Start Position
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
if (!isNull player) then {
	call compile preprocessFileLineNumbers "init\initClient.sqf";
}; 

diag_log format["SWISS_SURVIVAL: Initialisation Complete", time];