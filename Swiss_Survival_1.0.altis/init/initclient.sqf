// Client initialisation
waitUntil {!isNull player};

// Add healing script
_null = [] execVM "funct\common\healAction.sqf";

// Disable FUCKING fatigue
_null = [] execVM "funct\common\disableFatigue.sqf";