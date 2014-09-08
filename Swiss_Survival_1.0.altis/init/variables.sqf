// Bases
arr_usedBases = []; 						 // All used bases
var_baseEstablished = false;		 // At least 1 base established
var_baseMarkerIndex = 0;				 // Index of Base Markers
var_vehicleRefitMarkerIndex = 0; // Index of vehicle refit markers

// Targets and Loot
var_lootMarkerIndex = 0;			// Index vor lootMarkers
arr_enemyBaseMarkers = [];		// Target List
call compile preprocessFileLineNumbers "funct\loot\lootVehicleArrays.sqf";		// LootList
call compile preprocessFileLineNumbers "funct\loot\lootEquipmentArrays.sqf";	// LootList
call compile preprocessFileLineNumbers "funct\loot\lootObjectArrays.sqf";			// LootList

// Player related
var_numPlayers = count units group player;	// Count of players
var_PlayerProgress = 0;											// Current Progress
var_playerIndex = 0;												// Only used in Client initialisation to set the index of each player

// Misc
var_eventHandlerIconIndex = 0;	// Index of 3d icons event handlers