// Client initialisation

// Disable fatigue for the player (reduntant to initserver.sqf, just to be sure)
player enableFatigue false;

// Add healing script
_null = [] execVM "funct\common\healAction.sqf";