/*
	Removes all objects from a units inventory. After that adds
	a pistol with 4 magazines and a map.
	Executed when a player dies in BTC-Respawn, for example if the time
	to aid him runs out or he manually respawns.
*/

// The first argument is always the player who respawns
private ["_unit"];

// Select the player
_unit = _this select 0;
	
// Remove everything
removeAllWeapons _unit;
removeAllItems _unit;
removeBackpack _unit;
removeGoggles _unit;
removeHeadgear _unit;
removeVest _unit;
removeUniform _unit;
removeAllAssignedItems _unit;

// Add uniform, a pistol and a map
_unit addUniform "U_B_CombatUniform_mcam";
_unit addWeapon "hgun_P07_F";
_unit addMagazine "16Rnd_9x21_Mag";
_unit addMagazine "16Rnd_9x21_Mag";
_unit addMagazine "16Rnd_9x21_Mag";
_unit addMagazine "16Rnd_9x21_Mag";
_unit addWeapon "ItemMap";

// Disable fatigue
_unit enableFatigue false;
