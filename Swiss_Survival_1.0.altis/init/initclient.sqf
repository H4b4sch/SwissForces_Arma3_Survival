// Client initialisation
waitUntil {!isNull player};

// Add healing script
_null = [] execVM "funct\common\healAction.sqf";

// Disable FUCKING fatigue
_null = [] execVM "funct\common\disableFatigue.sqf";

// If this is the Alpha Squad Leader (player 1)
if ((str player) == "p1") then {
	
	// Add Communication entry to create nametags
	_sitrep = [p1,"nametags"] call BIS_fnc_addCommMenuItem;
	
	// Workaround
	/*player addAction ["Nametag", {createDialog 'nametag_custom'}];
	player addAction ["Build Base", {_null = ['Land_i_House_Small_03_V1_F', getpos player] execVM 'funct\playerActions\PlacingBuilding.sqf'}];
	player addAction ["Land Refit", {_null = ['Land_i_Garage_V1_F', getpos player] execVM 'funct\playerActions\PlacingBuilding.sqf'}];
	player addAction ["Air Refit", {_null = ['Land_HelipadCivil_F', getpos player] execVM 'funct\playerActions\PlacingBuilding.sqf'}];*/
};

// Set variable for player name
player setVariable ["unitName", "p" + str var_playerIndex, true];
var_playerIndex = var_playerIndex + 1;

// After init remove units gear and reset to startpos
_null = [player] execVM "funct\common\gearStart.sqf";
player setPos var_startPos;