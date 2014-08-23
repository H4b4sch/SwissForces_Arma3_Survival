waitUntil { isServer || !isNull player };

#ifndef execNow
#define execNow call compile preprocessfilelinenumbers
#endif

enableSaving [true,true];

private ["_startPosLocale"];

// Some Scripts
[] execVM "SAF_Field_Repair\Field_Repair.sqf";
_logistic = execVM "SAF_Logistics\Logistic_Init.sqf";
call compile preprocessFileLineNumbers "Scripts\startPos.sqf";

// Global Variables
if(isServer) then {
	_startPosLocale = [] call fnc_FindGoodPos;
};
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
_respos = getPos player;
_mrkr = createMarker ["respawn_west", _respos ];
_mrkr setMarkerShape "ICON";
_mrkr setMarkerType "mil_box";
_mrkr setMarkerColor "ColorBlue";
_mrkr setMarkerAlpha 1;

// Server Initialisation
execVM "serverinit.sqf";


diag_log format["Initialisation Completed", time];

[
	5*60, // seconds to delete dead bodies (0 means don't delete) 
	10*60, // seconds to delete dead vehicles (0 means don't delete)
	10*60, // seconds to delete dropped weapons (0 means don't delete)
	20*60, // seconds to deleted planted explosives (0 means don't delete)
	5*60 // seconds to delete dropped smokes/chemlights (0 means don't delete)
] execVM 'scripts\repetitive_cleanup.sqf';
//
//if (!isNull player) then { call compile preprocessFileLineNumbers "initClient.sqf"; }; 