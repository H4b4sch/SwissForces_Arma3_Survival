// Spawns the loot on a free space around the given Pos
// Arguments [[middlePoint(2)], radius, [vehicleProbability(19)]]
fnc_spawnLoot = {
	private 	["_probArray", "_pos", "_radius", "_index", "_randNum", "_vehicleArray",
						 "_vehicle", "_spawnPos", "_vehicleCount", "_categoryArray",
						 "_indexObjects", "_objectArray", "_objectCount", "_object", "_ammobox",
						 "_equipmentArraysIndex", "_doSpawnAmmobox", "_wObjectArray", "_wObject",
						 "_wObjectCount", "_veh", "_magazineArray", "_magazineItem", "_objectSpawnCount"];
						 
	_pos = [];
	_pos = (_this select 0);
	_radius = (_this select 1);
	_radius = _radius + 40;
	_spawnPos = [];
	_marker = "";
	
	_probArray = [];
	/*
		["_vehLight_prob", "_vehLightCargo_prob", "_vehLightArmed_prob", "_vehHeavy_prob", "_vehHeavyCargo_prob", "_vehHeavyArmed_prob",
	  "_vehSupport_prob", "_armorLight_prob", "_armorHeavy_prob", "_artillery_prob",
	  "_heliLight_prob", "_heliLightArmed_prob", "_heliAttack_prob", "_heliCargo_prob",
	  "_planesAttack_prob", "_dronesGround_prob", "_dronesGroundArmed_prob", "_dronesAir_prob", "_dronesAirArmed"];
	  
	  [arr_weaponTier0, arr_weaponTier1, arr_weaponTier2, arr_weaponTier3, arr_weaponTier4,
		arr_ammoTier0, arr_ammoTier1, arr_ammoTier2, arr_ammoTier3, arr_ammoTier4,
		arr_objectTier0, arr_objectTier1, arr_objectTier2,
		arr_attachTier0, arr_attachTier1, arr_attachTier2,
		arr_vestTier0, arr_vestTier1,
		arr_ruckTier0, arr_ruckTier1,
		arr_clothesTier0, arr_clothesTier1, arr_clothesTier2]
		
		[arr_objectBaseTier0, arr_objectBaseTier1, arr_objectBaseTier2, arr_objectBaseTier3, arr_objectBaseTier4]
	  
	  // The first probability needs to be 100, then it need to be lowered with each entry <> 0
	  // If a random number from 0 to 100 is under the value, the type is chosen
	  // Means if you have [100, 60, 40, 20]:
	  																45: Entry 60
	  																40: Entry 60
	  																35: Entry 40
	  																10: Entry 20
	*/
	
	// VEHICLES ------------------------------------------------------------------------------------
	// Fill Probability Array for Vehicles
	_index = 0;
	while {_index < count (_this select 2)} do {
		_probArray set [_index, ((_this select 2) select _index)];
		_index = _index + 1;
	};
	
	// Create random number and get what should be spawned
	_index = -1;
	_randNum = round(random(100));
	{
		if(_randNum < _x) then {
			_index = _forEachIndex;
		};
	} forEach _probArray;
	
	// If there is something to spawn
	if(_index >= 0) then {
		// Get actual vehicle classname array
		_vehicleArray = [];
		_vehicleArray = (arr_spawnVehicle select _index);
		
		// Get random item from that array
		_vehicleCount = count _vehicleArray;
		_vehicleCount = _vehicleCount - 1;
		_randNum = round(random(_vehicleCount));
		_vehicle = (_vehicleArray select (_randNum));
		
		// Get free spawn pos
		//_spawnPos = [_pos,0,100,0,0,20,0] call BIS_fnc_findSafePos;
		_spawnPos = (_pos select 0) findEmptyPosition [15, _radius, _vehicle];
		if(count _spawnPos == 0) then {
			_spawnPos = (_pos select 0) findEmptyPosition [15, 1000, _vehicle];
		};
		
		// Set marker on given pos
		_marker = createMarker ["Loot" + str var_lootMarkerIndex, _spawnPos];
		_marker setMarkerText "Vehicle";
		_marker setMarkerType "mil_dot";
		_marker setMarkerAlpha 1;
		var_lootMarkerIndex = var_lootMarkerIndex + 1;
		
		// Create vehicle on pos
		_veh = _vehicle createVehicle (_spawnPos);
		clearWeaponCargoGlobal _veh;
		clearMagazineCargoGlobal _veh;
		clearBackpackCargoGlobal _veh;
		clearItemCargoGlobal _veh;
	};
	// END VEHICLES --------------------------------------------------------------------------------
	
	
	// EQUIPMENT -----------------------------------------------------------------------------------
	_marker = "";
	// Do this for each category (Weapons, Ammo, Rucks, ...)
	_indexObjects = [];
	diag_log format ["CATEGORY ARRAY: %1", _this select 3];
	for "_i" from 0 to count(_this select 3) step 1 do {
		
		// Fill Probability Array
		_index = 0;
		_probArray = [];
		while {_index < count((_this select 3) select _i)} do {
			_probArray set [_index, (((_this select 3) select _i) select _index)];
			_index = _index + 1;
		};
		
		// Create random number and get what should be spawned
		_index = -1;
		_randNum = round(random(100));
		{
			if(_randNum <= _x) then {
				_index = _forEachIndex,
			};
		} forEach _probArray;
		
		_indexObjects = _indexObjects + [_index];
		diag_log format ["Added to indexObjects: %1", _index];
	};
	
	_doSpawnAmmobox = 0;
	for "_i" from 0 to count(_indexObjects) step 1 do {
		if(!((_indexObjects select _i) == -1)) then {
			_doSpawnAmmobox = 1;
		};
	};
	
	if(_doSpawnAmmobox == 1) then{
		// Place the Ammobox
		// Get free spawn pos
		_spawnPos = (_pos select 0) findEmptyPosition [15, _radius];
		if(count _spawnPos == 0) then {
			_spawnPos = (_pos select 0) findEmptyPosition [15, 1000];
		};
		
		// Make Ammobox
		_ammobox = createVehicle ["Box_NATO_Wps_F", _spawnPos, [], 0, "NONE"];
		clearWeaponCargoGlobal _ammobox;
		clearMagazineCargoGlobal _ammobox;		
		
		// Fill the Ammobox
		_equipmentArraysIndex = 0;
		for "_i" from 0 to count(_indexObjects) step 1 do {
				if((_indexObjects select _i) >= 0) then {
					
					
					// Get actual object classname array
					_objectArray = [];
					_magazineArray = [];
					_objectArray = ((arr_spawnEquipmentArrays select _equipmentArraysIndex) select (_indexObjects select _i));
	
					
					// Get random item from that array
					_objectCount = count _objectArray;
					_objectCount = _objectCount - 1;
					_randNum = round(random(_objectCount));
					_object = (_objectArray select (_randNum));
					
					// Also spawn magazines when weapons is spawned
					if(_equipmentArraysIndex == 0) then {
						_magazineArray = ((arr_spawnEquipmentArrays select 1) select (_indexObjects select _i));
						_magazineItem = (_magazineArray select (_randNum));
					};
					
					switch (_i) do {
						case 0:	{// Weapons
							
							// Set num of weapons spawned
							_objectSpawnCount = 0;
							_objectSpawnCount = round(random(3)); // 0 to 2
							_objectSpawnCount = _objectSpawnCount + 1; // Add 1 --> 1 to 3
							
							_ammobox addWeaponCargoGlobal [_object, _objectSpawnCount];
							
							// Set num of magazines spawned
							_objectSpawnCount = 0;
							_objectSpawnCount = round(random(4)); // 0 to 4
							_objectSpawnCount = _objectSpawnCount + 2; // Add 2 --> 2 to 6
							
							_ammobox addMagazineCargoGlobal [_magazineItem, _objectSpawnCount];
						};
						case 1:	{// Ammo
							// Set num of magazines spawned
							_objectSpawnCount = 0;
							_objectSpawnCount = round(random(4)); // 0 to 4
							_objectSpawnCount = _objectSpawnCount + 6; // Add 6 --> 6 to 10
							
							_ammobox addMagazineCargoGlobal [_object, _objectSpawnCount];
						};
						case 5: {// Backpacks						
							_ammobox addBackpackCargoGlobal [_object, 1];
						};
						default {
							// Set num of magazines spawned
							_objectSpawnCount = 0;
							_objectSpawnCount = round(random(4)); // 0 to 4
							_objectSpawnCount = _objectSpawnCount + 6; // Add 6 --> 6 to 10
							
							_ammobox addItemCargoGlobal [_object, _objectSpawnCount];
						};
					};
			};
			
			_equipmentArraysIndex = _equipmentArraysIndex + 1;
		};
		
		// Set marker on given pos
		_marker = createMarker ["Loot" + str var_lootMarkerIndex, _spawnPos];
		_marker setMarkerText "Equip";
		_marker setMarkerType "mil_dot";
		_marker setMarkerAlpha 1;
		var_lootMarkerIndex = var_lootMarkerIndex + 1;
		
		// Disable Damage for the ammobox
		_ammobox allowDamage false;
		
		// Create vehicle on pos
		//diag_log format ["SpawnPos: %1", _spawnPos];
		//_ammobox setPosATL _spawnPos;//[(_spawnPos select 0),(_spawnPos select 1),(10)];
	};
	
	// END EQUIPMENT -------------------------------------------------------------------------------
	
	// WORLD OBJECTS -------------------------------------------------------------------------------
	_marker = "";
	// Fill Probability Array for Objects
	_index = 0;
	while {_index < count (_this select 4)} do {
		_probArray set [_index, ((_this select 4) select _index)];
		_index = _index + 1;
	};
	
	// Create random number and get what should be spawned
	_index = -1;
	_randNum = round(random(100));
	{
		if(_randNum < _x) then {
			_index = _forEachIndex;
		};
	} forEach _probArray;
	
	// If there is something to spawn
	if(_index >= 0) then {
		// Get actual classname array
		_wObjectArray = [];
		_wObjectArray = (arr_spawnWorldObjects select _index);
		
		// Get random item from that array
		_wObjectCount = count _wObjectArray;
		_wObjectCount = _wObjectCount - 1;
		_randNum = round(random(_wObjectCount));
		_wObject = (_wObjectArray select (_randNum));
		
		// Get free spawn pos
		//_spawnPos = [_pos,0,100,0,0,20,0] call BIS_fnc_findSafePos;
		_spawnPos = (_pos select 0) findEmptyPosition [15, _radius];
		if(count _spawnPos == 0) then {
			_spawnPos = (_pos select 0) findEmptyPosition [15, 1000];
		};
		
		// Set marker on given pos
		_marker = createMarker ["Loot" + str var_lootMarkerIndex, _spawnPos];
		_marker setMarkerText "Object";
		_marker setMarkerType "mil_dot";                   
		_marker setMarkerAlpha 1;                
		var_lootMarkerIndex = var_lootMarkerIndex + 1;          
		
		// Create vehicle on pos
		_obj = createVehicle [_wObject, _spawnPos, [], 0, "CAN_COLLIDE"];
		//_null = _wObject createVehicle (_spawnPos);
	};
	// END WORLD OBJECTS ---------------------------------------------------------------------------
}