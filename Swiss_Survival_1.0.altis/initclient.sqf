// Client initialisation

// Disable fatigue for all players
player enableFatigue false;

// Compile Key Handlers
call compile preprocessFile "scripts\keyHandlers.sqf";

// Add healing script
_null = [] execVM "scripts\healAction.sqf";