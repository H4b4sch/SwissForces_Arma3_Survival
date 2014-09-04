if (!isServer) exitWith {};

call compile preprocessFileLineNumbers  "scripts\lootVehicleArrays.sqf";
call compile preprocessFileLineNumbers  "scripts\lootEquipmentArrays.sqf";
call compile preprocessFileLineNumbers  "scripts\lootObjectArrays.sqf";

// SpawnLoot [[middlePoint], radius, [vehicleProbability]]
fnc_spawnLoot = compile preprocessFileLineNumbers "scripts\lootSpawn.sqf";
/*
	["_vehLight", "_vehLightCargo", "_vehLightArmed, "_vehHeavy", "_vehHeavyCargo", "_vehHeavyArmed",
	"_vehSupport", "_armorLight", "_armorHeavy", "_artillery",
	"_heliLight", "_heliLightArmed", "_heliAttack", "_heliCargo",
  "_planesAttack", "_dronesGround", "_dronesGroundArmed", "_dronesAir", "_dronesAirArmed"];
  
  [[arr_weaponTier0, arr_weaponTier1, arr_weaponTier2, arr_weaponTier3, arr_weaponTier4],
	 [arr_ammoTier0, arr_ammoTier1, arr_amooTier2, arr_ammoTier3, arr_ammoTier4],
	 [arr_objectTier0, arr_objectTier1, arr_objectTier2],
	 [arr_attachTier0, arr_attachTier1, arr_attachTier2],
	 [arr_vestTier0, arr_vestTier1],
	 [arr_ruckTier0, arr_ruckTier1],
	 [arr_clothesTier0, arr_clothesTier1, arr_clothesTier2]]
	 For this second paragraph: probabilities are per array in the array
	 means there can be created loot with weapons and ammo in it 
	 
	 [arr_objectBaseTier0, arr_objectBaseTier1, arr_objectBaseTier2, arr_objectBaseTier3, arr_objectBaseTier4]
  
  // The first probability needs to be 100, then it need to be lowered with each entry <> 0
  // If a random number from 0 to 100 is under the value, the type is chosen
  // Means if you have [100, 60, 40, 20]:
  																45: Entry 60
  																40: Entry 40
  																35: Entry 40
  																10: Entry 20
*/

private ["_index", "_type", "_lootedBases", "_markerName", "_pos", "_radius",
				 "_bonusBaseProgress", "_bonusBaseIndex", "_bonusRefitProgress", "_bonusRefitIndex"];
_lootedBases = [];
_bonusBaseProgress = [6,16,32,52,82,112,152,5000];
_bonusRefitProgress = [12,28,52,82,112,5000];
_bonusBaseIndex = 0;
_bonusRefitIndex = 0;

while{true} do {
	_index = 0;
	
	// Go through each base that exists
	while{_index < count arr_usedBases} do {
		
		// Get MarkerName
		_markerName = "enemyBase"+str _index;
		
		// If the color is green and this base was not looted before
		if((getMarkerColor _markerName) == "ColorGreen") then {
			if(!(_index in _lootedBases)) then {
				
				// get properties & add to looted bases
				_type = ((arr_usedBases select _index) select 0);
				_radius = ((arr_usedBases select _index) select 2);
				_radius = _radius / 2;
				_pos = ((arr_usedBases select _index) select 4);
				_lootedBases = _lootedBases + [_index];
				
				// Now Loot that shit
				switch(_type) do {
  				case "Airport": {
  					// Make Progress
  					var_PlayerProgress = var_PlayerProgress + 8;
  					// Vehicles
  					[[_pos],500,[0,0,0,0,0,0,0,0,0,0,100,60,20,15,0,0,0,0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],[0,0]] call fnc_spawnLoot;						// Spawn a Helicopter
  					[[_pos],500,[0,100,95,85,75,55,50,40,35,25,0,0,0,0,0,23,0,18,8],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],[0,0]] call fnc_spawnLoot;		// Spawn a vehicle
  					[[_pos],500,[0,0,0,0,0,0,0,0,0,0,0,66,60,50,45,0,0,0,0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],[0,0]] call fnc_spawnLoot;					// Spawn a plane or additional helicopter with 66% chance
  					//                    Weapons           Ammo          Objects      Attachs     Vest Rck Clothes
  					[[_pos],500,[0,0],[[0,100,95,25,0],[0,100,80,30,15],[100, 80, 10],[80, 30, 0],[0,0],[0,0],[0,0]],[0,0]] call fnc_spawnLoot;								// Spawn Box with Equipment
  					//                      Weapons           Ammo       Objects Attachs  Vest    Rck   Clothes
  					[[_pos],500,[0,0],[[0,100,75,20,0],[100,80,50,20,0],[50,15,0],[0,0],[75,25],[25,5],[60,40]],[0,0]] call fnc_spawnLoot;																					// Spawn Box with Clothes
  					// Objects
  					[[_pos],500,[0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],[100,90,40,15,0]] call fnc_spawnLoot;															// Defending Object
  					[[_pos],500,[0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],[100,75,30,5,0]] call fnc_spawnLoot;																// Defending Object
  					[[_pos],500,[0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],[100,50,10,0,0]] call fnc_spawnLoot;																// Defending Object
  					[[_pos],500,[0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],[100,50,10,0,0]] call fnc_spawnLoot;																// Defending Object
  					[[_pos],500,[0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],[100,50,10,0,0]] call fnc_spawnLoot;																// Defending Object
  					[[_pos],500,[0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],[100,50,10,0,0]] call fnc_spawnLoot;																// Defending Object
  				};
  				case "Military": {
  					// Make Progress
  					var_PlayerProgress = var_PlayerProgress + 6;
  					[[_pos],500,[0,0,0,100,0,80,0,50,20,5,0,0,0,0,0,0,0,0,0,0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]]] call fnc_spawnLoot;					    // Spawn heavy or armored vehicle
  					[[_pos],500,[0,75,0,0,65,0,20,0,0,0,0,0,0,0,0,0,0,0,0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]]] call fnc_spawnLoot;								  // Spawn support / cargo vehicle with 75% chance
  					[[_pos],500,[0,0,0,0,0,0,0,0,0,0,30,2,0,0,0,0,0,0,0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]]] call fnc_spawnLoot;								    // Spawn light heli with 30% chance
  					[[_pos],500,[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,80,50,40,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]]] call fnc_spawnLoot;								  // Spawn drone with 80% chance
  					//                     Weapons          Ammo         Objects      Attachs    Vest    Ruck   Clothes
  					[[_pos],500,[0,0],[[0,0,100,50,5],[0,0,100,80,30],[0, 80, 50],[0, 100, 25],[100,50],[50,20],[0,50]]] call fnc_spawnLoot;								  // Spawn Box with Equipment
  					//                     Weapons          Ammo         Objects     Attachs    Vest  Ruck   Clothes
  					[[_pos],500,[0,0],[[0,100,80,20,5],[0,100,60,25,10],[0, 50, 10],[0, 50, 5],[20,5],[50,0],[50,0]]] call fnc_spawnLoot;											// Spawn Box with Equipment
  					// Objects
  					[[_pos],500,[0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],[0,100,80,50,25]] call fnc_spawnLoot;															// Defending Object
  					[[_pos],500,[0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],[0,100,80,50,10]] call fnc_spawnLoot;															// Defending Object
  					[[_pos],500,[0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],[0,100,50,25,5]] call fnc_spawnLoot;																// Defending Object
  					[[_pos],500,[0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],[100,80,50,20,5]] call fnc_spawnLoot;															// Defending Object
  					[[_pos],500,[0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],[100,75,25,10,0]] call fnc_spawnLoot;															// Defending Object
  				};
  				case "City": {
  					// Make Progress
  					var_PlayerProgress = var_PlayerProgress + 10;
  					[[_pos],500,[0,0,100,90,70,55,55,40,5,0,0,0,0,0,0,0,0,0,0,0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]]] call fnc_spawnLoot;					  // Spawn heavy or armored vehicle
  					[[_pos],500,[100,90,0,40,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]]] call fnc_spawnLoot;					    // Spawn unarmed vehicle
  					[[_pos],500,[0,100,0,0,80,0,60,0,0,0,0,0,0,0,0,0,0,0,0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]]] call fnc_spawnLoot;								// Spawn support / cargo vehicle
  					[[_pos],500,[0,0,0,0,0,0,0,0,0,0,50,0,0,0,0,0,0,0,0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]]] call fnc_spawnLoot;								    // Spawn unarmed light heli with 50% chance
  					//                     Weapons          Ammo         Objects      Attachs     Vest   Ruck   Clothes
  					[[_pos],500,[0,0],[[0,100,90,10,0],[100,90,50,10,0],[0, 100, 40],[100, 45, 5],[0,95],[80,10],[80,40]]] call fnc_spawnLoot;									// Spawn Box with Equipment
  					//                     Weapons          Ammo         Objects     Attachs     Vest    Ruck  Clothes
  					[[_pos],500,[0,0],[[0,100,75,25,0],[100,90,40,10,5],[100, 50, 0],[80, 20, 0],[100,0],[50,0],[100,0]]] call fnc_spawnLoot;									// Spawn Box with Equipment
  					//                                 Weapons          Ammo       Objects      Attachs    Vest   Ruck  Clothes
  					[[_pos],500,[0,0],[[0,50,0,0,0],[100,60,20,0,0],[100, 50, 10],[50, 10, 0],[25,0],[25,0],[60,10]]] call fnc_spawnLoot;											// Spawn Box with Equipment
  					// Objects
  					[[_pos],500,[0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],[0,100,80,50,10]] call fnc_spawnLoot;															// Defending Object
  					[[_pos],500,[0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],[0,100,60,30,5]] call fnc_spawnLoot;															  // Defending Object
  					[[_pos],500,[0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],[100,80,25,10,0]] call fnc_spawnLoot;															// Defending Object
  					[[_pos],500,[0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],[100,80,25,10,0]] call fnc_spawnLoot;															// Defending Object
  					[[_pos],500,[0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],[100,80,25,10,0]] call fnc_spawnLoot;															// Defending Object
  					[[_pos],500,[0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],[100,80,25,10,0]] call fnc_spawnLoot;															// Defending Object
  					[[_pos],500,[0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],[100,80,25,10,0]] call fnc_spawnLoot;															// Defending Object
  					[[_pos],500,[0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],[100,80,25,10,0]] call fnc_spawnLoot;															// Defending Object
  					[[_pos],500,[0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],[100,80,25,10,0]] call fnc_spawnLoot;															// Defending Object
  					[[_pos],500,[0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],[100,80,25,10,0]] call fnc_spawnLoot;															// Defending Object
  					[[_pos],500,[0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],[100,80,25,10,0]] call fnc_spawnLoot;															// Defending Object
  					[[_pos],500,[0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],[100,80,25,10,0]] call fnc_spawnLoot;															// Defending Object
  					[[_pos],500,[0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],[100,80,25,10,0]] call fnc_spawnLoot;															// Defending Object
  					[[_pos],500,[0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],[100,80,25,10,0]] call fnc_spawnLoot;															// Defending Object
  				};
  				case "BigTown": {
  					// Make Progress
  					var_PlayerProgress = var_PlayerProgress + 6;
  					[[_pos],500,[100,90,0,25,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]]] call fnc_spawnLoot;					    // Spawn unarmed vehicle
  					[[_pos],500,[0,100,70,40,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]]] call fnc_spawnLoot;					    // Spawn unarmed or armed light vehicle
  					[[_pos],500,[0,0,0,0,0,0,0,0,0,0,25,0,0,0,0,0,0,0,0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]]] call fnc_spawnLoot;								    // Spawn unarmed light heli with 25% chance
  					//                      Weapons          Ammo         Objects      Attachs     Vest   Ruck   Clothes
  					[[_pos],500,[0,0],[[0,100,85,10,0],[100,80,40,10,0],[100, 50, 0],[100, 35, 0],[0,65],[50,0],[80,20]]] call fnc_spawnLoot;									// Spawn Box with Equipment
  					//                      Weapons          Ammo         Objects   Attachs   Vest   Ruck   Clothes
  					[[_pos],500,[0,0],[[100,80,60,10,0],[100,60,20,0,0],[66, 10, 0],[25, 5, 0],[90,0],[25,0],[80,20]]] call fnc_spawnLoot;												// Spawn Box with Equipment
  					//                      Weapons        Ammo        Objects    Attachs   Vest  Rck  Clothes
  					[[_pos],500,[0,0],[[0,80,20,0,0],[80,40,10,0,0],[100, 0, 0],[20, 5, 0],[0,0],[0,0],[0,0]]] call fnc_spawnLoot;														// Spawn Box with Equipment
  					// Objects
  					[[_pos],500,[0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],[0,100,60,30,5]] call fnc_spawnLoot;															  // Defending Object
  					[[_pos],500,[0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],[100,80,25,10,0]] call fnc_spawnLoot;															// Defending Object
  					[[_pos],500,[0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],[100,80,25,10,0]] call fnc_spawnLoot;															// Defending Object
  					[[_pos],500,[0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],[100,80,25,10,0]] call fnc_spawnLoot;															// Defending Object
  					[[_pos],500,[0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],[100,80,25,10,0]] call fnc_spawnLoot;															// Defending Object
  					[[_pos],500,[0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],[100,80,25,10,0]] call fnc_spawnLoot;															// Defending Object
  					[[_pos],500,[0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],[100,80,25,10,0]] call fnc_spawnLoot;															// Defending Object
  				};
  				case "SmallTown": {
  					// Make Progress
  					var_PlayerProgress = var_PlayerProgress + 4;
  					[[_pos],500,[100,75,0,20,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]]] call fnc_spawnLoot;					    // Spawn unarmed vehicle
  					[[_pos],500,[0,75,45,35,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]]] call fnc_spawnLoot;					      // Spawn unarmed or armed light vehicle, 75%
  					[[_pos],500,[0,0,0,0,0,0,0,0,0,0,5,0,0,0,0,0,0,0,0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]]] call fnc_spawnLoot;								    // Spawn unarmed light heli with 5% chance
  					//                     Weapons          Ammo         Objects     Attachs    Vest   Ruck   Clothes
  					[[_pos],500,[0,0],[[0,100,80,20,0],[100,60,10,0,0],[100, 20, 0],[66, 20, 0],[0,33],[20,5],[50,5]]] call fnc_spawnLoot;											// Spawn Box with Equipment
  					//                     Weapons          Ammo         Objects   Attachs   Vest  Ruck   Clothes
  					[[_pos],500,[0,0],[[0,90,60,10,0],[100,80,25,10,0],[50, 10, 0],[25, 5, 0],[50,0],[15,0],[33,0]]] call fnc_spawnLoot;													// Spawn Box with Equipment
  					[[_pos],500,[0,0],[[0,90,60,10,0],[100,75,25,0,0],[50, 10, 0],[25, 5, 0],[50,0],[15,0],[33,0]]] call fnc_spawnLoot;													// Spawn Box with Equipment
  					// Objects
  					[[_pos],500,[0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],[0,100,40,15,0]] call fnc_spawnLoot;															  // Defending Object
  					[[_pos],500,[0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],[100,80,25,5,0]] call fnc_spawnLoot;															  // Defending Object
  					[[_pos],500,[0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],[100,50,10,0,0]] call fnc_spawnLoot;															  // Defending Object
  					[[_pos],500,[0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],[100,50,10,0,0]] call fnc_spawnLoot;															  // Defending Object
  					[[_pos],500,[0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],[100,50,10,0,0]] call fnc_spawnLoot;															  // Defending Object
  					[[_pos],500,[0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],[100,50,10,0,0]] call fnc_spawnLoot;															  // Defending Object
  					[[_pos],500,[0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],[100,50,10,0,0]] call fnc_spawnLoot;															  // Defending Object
  				};
  				case "Houses": {
  					// Make Progress
  					var_PlayerProgress = var_PlayerProgress + 2;
  					[[_pos],500,[100,66,0,15,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]]] call fnc_spawnLoot;					    // Spawn unarmed vehicle
  					//                     Weapons          Ammo         Objects     Attachs   Vest   Rck  Clothes
  					[[_pos],500,[0,0],[[100,85,20,0,0],[100,85,20,0,0],[100, 25, 0],[20, 5, 0],[10,0],[5,0],[20,0]]] call fnc_spawnLoot;												// Spawn Box with Equipment
  					//                     Weapons        Ammo       Objects     Attachs   Vest   Ruck  Clothes
  					[[_pos],500,[0,0],[[100,80,25,0,0],[100,80,25,0,0],[50, 10, 0],[10, 0, 0],[10,0],[10,0],[20,0]]] call fnc_spawnLoot;													// Spawn Box with Equipment
  					// Objects
  					[[_pos],500,[0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],[100,75,30,5,0]] call fnc_spawnLoot;															  // Defending Object
  					[[_pos],500,[0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],[100,50,10,0,0]] call fnc_spawnLoot;															  // Defending Object
  					[[_pos],500,[0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],[100,50,10,0,0]] call fnc_spawnLoot;															  // Defending Object
  					[[_pos],500,[0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],[100,50,10,0,0]] call fnc_spawnLoot;															  // Defending Object
  					[[_pos],500,[0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],[100,50,10,0,0]] call fnc_spawnLoot;															  // Defending Object
  				};
  				case "Wildness": {
  					// Make Progress
  					var_PlayerProgress = var_PlayerProgress + 1;
  					//                    Weapons         Ammo       Objects     Attachs   Vest   Rck  Clothes
  					[[_pos],500,[0,0],[[75,20,5,0,0],[100,50,10,0,0],[80, 15, 0],[10, 0, 0],[0,0],[5,0],[25,0]]] call fnc_spawnLoot;												  // Spawn Box with Equipment
  					//                    Weapons         Ammo      Objects      Attachs   Vest   Ruck  Clothes
  					[[_pos],500,[0,0],[[25,10,0,0,0],[100,45,5,0,0],[100, 10, 0],[5, 0, 0],[0,0],[5,0],[25,0]]] call fnc_spawnLoot;													// Spawn Box with Equipment
  					// Objects
  					[[_pos],500,[0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],[100,50,0,0,0]] call fnc_spawnLoot;															  // Defending Object
  					[[_pos],500,[0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],[100,25,0,0,0]] call fnc_spawnLoot;															  // Defending Object
  					[[_pos],500,[0,0],[[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]],[100,25,0,0,0]] call fnc_spawnLoot;															  // Defending Object
  				};
  			};
			};
		};
		
		// Count up Index
		_index = _index + 1;
		
		// Debugging
		//hint format ["Progress: %1", var_PlayerProgress];
		
		// Check if we should let the player create a new base
		// Array: 6,16,32,52,82,112,152,5000
		if(var_PlayerProgress >= (_bonusBaseProgress select _bonusBaseIndex)) then {
			_sitrep = [p1,"establish_base"] call BIS_fnc_addCommMenuItem;
			_bonusBaseIndex = _bonusBaseIndex + 1;
		};
		
		// Check if we should let the player create a vehicle pad
		// Array: 12,28,52,82,112,5000
		if(var_PlayerProgress >= (_bonusRefitProgress select _bonusRefitIndex)) then {
			_sitrep = [p1,"establish_vehicle_refit"] call BIS_fnc_addCommMenuItem;
			_bonusRefitIndex = _bonusRefitIndex + 1;
		};
	};
	
	sleep 1;
};