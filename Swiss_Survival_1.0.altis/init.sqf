waitUntil { isServer || !isNull player };

enableSaving [true,true];

// TcB AIS Wounding System --------------------------------------------------------------------------
if (!isDedicated) then {
	TCB_AIS_PATH = "plugins\ais_injury\";
	{[_x] execVM (TCB_AIS_PATH+"init_ais.sqf")} forEach (if (isMultiplayer) then {playableUnits} else {switchableUnits});		// execute for every playable unit
	
	//{[_x] execVM (TCB_AIS_PATH+"init_ais.sqf")} forEach (units group player);													// only own group - you cant help strange group members
	
	//{[_x] execVM (TCB_AIS_PATH+"init_ais.sqf")} forEach [p1,p2,p3,p4,p5];														// only some defined units
};

// Set global variables & functions
call compile preprocessFileLineNumbers "init\variables.sqf";
call compile preprocessFileLineNumbers "init\functions.sqf";

// Initialize Scripts
_null = execVM "funct\loot\loot.sqf";
[] execVM "plugins\SAF_Field_Repair\Field_Repair.sqf";
[] execVM "plugins\R3F_LOG\init.sqf";
//call compile preprocessFile "plugins\=BTC=_revive\=BTC=_revive_init.sqf";

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
call compile preprocessFileLineNumbers "init\initClient.sqf";

diag_log format["SWISS_SURVIVAL: Initialisation Complete", time];