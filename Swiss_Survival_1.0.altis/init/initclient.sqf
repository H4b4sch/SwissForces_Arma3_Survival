// Client initialisation
waitUntil {!isNull player};

// Add healing script
_null = [] execVM "funct\common\healAction.sqf";

// Disable FUCKING fatigue
_null = [] execVM "funct\common\disableFatigue.sqf";

// Set variable for player name
player setVariable ["unitName", "p" + str var_playerIndex, true];
var_playerIndex = var_playerIndex + 1;

// After init remove units gear and reset to startpos
_null = [player] execVM "funct\common\gearStart.sqf";
player setPos var_startPos;