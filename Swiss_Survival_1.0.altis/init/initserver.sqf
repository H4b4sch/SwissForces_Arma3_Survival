if (!isServer) exitWith {};

// Initialize Enemy Base Markers
call compile preprocessFileLineNumbers "init\EnemyBaseMarkersAltis.sqf";

// Execute the Lootspawner
fn_getBuildingstospawnLoot = compile preProcessFileLineNumbers "plugins\LootSpawner\fn_LSgetBuildingstospawnLoot.sqf"; 
LSdeleter = compile preProcessFileLineNumbers "plugins\LootSpawner\LSdeleter.sqf";
execVM "plugins\LootSpawner\Lootspawner.sqf";

// Generate targets
call compile preprocessFileLineNumbers "init\common\generateTargets.sqf";

// Prepare enemies in targets
call compile preprocessFileLineNumbers "init\common\prepareEnemies.sqf";

// Disable Fatigue for all players
{ _x enableFatigue false; } forEach (units group player);

// Start the repetive CleanUp
[
	5*60, // seconds to delete dead bodies (0 means don't delete) 
	0, // seconds to delete dead vehicles (0 means don't delete)
	10*60, // seconds to delete dropped weapons (0 means don't delete)
	20*60, // seconds to deleted planted explosives (0 means don't delete)
	5*60 // seconds to delete dropped smokes/chemlights (0 means don't delete)
] execVM 'funct\common\repetitive_cleanup.sqf';