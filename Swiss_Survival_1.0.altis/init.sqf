waitUntil { isServer || !isNull player };

#ifndef execNow
#define execNow call compile preprocessfilelinenumbers
#endif

enableSaving [true,true];

private ["_startPosLocale"];

// GLOBAL: All used Bases
arr_usedBases = [];

// Some Scripts
_null = execVM "scripts\loot.sqf";
[] execVM "SAF_Field_Repair\Field_Repair.sqf";
[] execVM "R3F_LOG\init.sqf";
call compile preprocessFileLineNumbers "Scripts\startPos.sqf";

// Global Variables
_startPosLocale = [] call fnc_FindGoodPos;
var_startPos = _startPosLocale;

// GLOBAL: At least one base established
var_baseEstablished = false;

// Loot Spawner
if (isServer) then {
	fn_getBuildingstospawnLoot = compile preProcessFileLineNumbers "LootSpawner\fn_LSgetBuildingstospawnLoot.sqf"; 
	LSdeleter = compile preProcessFileLineNumbers "LootSpawner\LSdeleter.sqf";
	execVM "LootSpawner\Lootspawner.sqf";
};

//Arma 3 Wounding System
if (!isDedicated) then {
	TCB_AIS_PATH = "ais_injury\";
	{[_x] call compile preprocessFile (TCB_AIS_PATH+"init_ais.sqf")} forEach (if (isMultiplayer) then {playableUnits} else {switchableUnits});
};

_mrkr = createMarker ["respawn_west", var_startPos ];
_mrkr setMarkerShape "ICON";
_mrkr setMarkerType "mil_box";
_mrkr setMarkerColor "ColorBlue";
_mrkr setMarkerAlpha 1;

// Load Functions
FNC_GETDIRTO = compileFinal preprocessFileLineNumbers "scripts\getDirTo.sqf";

// Server Initialisation
execVM "serverinit.sqf";

// Start the client initialisation
if (!isNull player) then { call compile preprocessFileLineNumbers "initClient.sqf"; }; 


diag_log format["Initialisation Completed", time];

// Start the repetive CleanUp
[
	5*60, // seconds to delete dead bodies (0 means don't delete) 
	10*60, // seconds to delete dead vehicles (0 means don't delete)
	10*60, // seconds to delete dropped weapons (0 means don't delete)
	20*60, // seconds to deleted planted explosives (0 means don't delete)
	5*60 // seconds to delete dropped smokes/chemlights (0 means don't delete)
] execVM 'scripts\repetitive_cleanup.sqf';