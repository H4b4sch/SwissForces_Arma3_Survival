/*
	Used to do an advanced start, already able
	to build a base and with one time loot spawn
*/

// Make Progress
var_PlayerProgress = var_PlayerProgress + 4;

// Get start position
_pos = var_StartPos;

// Spawn some loot
[[_pos],150,[100,75,0,20,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]]] call fnc_spawnLoot;					    // Spawn unarmed vehicle
[[_pos],150,[0,100,45,35,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]]] call fnc_spawnLoot;					      // Spawn unarmed or armed light vehicle, 75%
[[_pos],150,[0,75,45,35,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]]] call fnc_spawnLoot;					      // Spawn unarmed or armed light vehicle, 75%
        
//                     Weapons          Ammo         Objects     Attachs    Vest   Ruck   Clothes
[[_pos],150,[0,0],[[0,100,80,20,0],[100,60,10,0,0],[100, 20, 0],[66, 20, 0],[0,33],[20,5],[50,5]]] call fnc_spawnLoot;											// Spawn Box with Equipment
//                     Weapons          Ammo         Objects   Attachs   Vest  Ruck   Clothes
[[_pos],150,[0,0],[[0,100,60,10,0],[100,80,25,10,0],[50, 10, 0],[25, 5, 0],[50,0],[15,0],[33,0]]] call fnc_spawnLoot;												// Spawn Box with Equipment
[[_pos],150,[0,0],[[0,80,50,10,0],[100,75,25,0,0],[50, 10, 0],[25, 5, 0],[0,0],[0,0],[0,0]]] call fnc_spawnLoot;													// Spawn Box with Equipment
// Objects
[[_pos],150,[0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],[0,100,40,15,0]] call fnc_spawnLoot;															  // Defending Object
[[_pos],150,[0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],[100,80,25,5,0]] call fnc_spawnLoot;															  // Defending Object
[[_pos],150,[0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],[100,50,10,0,0]] call fnc_spawnLoot;															  // Defending Object
[[_pos],150,[0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],[100,50,10,0,0]] call fnc_spawnLoot;															  // Defending Object
[[_pos],150,[0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],[100,50,10,0,0]] call fnc_spawnLoot;															  // Defending Object
[[_pos],150,[0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],[100,50,10,0,0]] call fnc_spawnLoot;															  // Defending Object
[[_pos],150,[0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],[100,50,10,0,0]] call fnc_spawnLoot;															  // Defending Object
[[_pos],150,[0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],[100,50,10,0,0]] call fnc_spawnLoot;															  // Defending Object
[[_pos],150,[0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],[100,50,10,0,0]] call fnc_spawnLoot;