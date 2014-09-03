if (!isServer) exitWith {};

// Initialize Enemy Base Markers
call compile preprocessFileLineNumbers "scripts\EnemyBaseMarkersAltis.sqf";
 
private ["_distanceBetween", "_currentPos", "_index",
				 "_valid", "_pos", "_enemyBasePosition", "_marker", "_instanceNo",
				 "_baseTypes", "_baseTypesPercentage", "_numMarkersOfType", "_numTypeAtLeast",
				 "_randNum", "_maxPatrolling"];
				 
// GLOBAL: All used Bases
arr_usedBases = [];

// GLOBAL: Index for lootmarkers
var_lootMarkerIndex = 0;

// GLOBAL: Current Progress players made in this mission
var_PlayerProgress = 0;

// GLOBAL: Index of base Markers
var_baseMarkerIndex = 0;

// GLOBAL: Index of vehicle refit Markers
var_vehicleRefitMarkerIndex = 0;

_distanceBetween = 10;

// Array for each base type and how much bases of that type should be generated
_baseTypes = ["Airport", "Military", "City", "Houses", "Wildness", "SmallTown", "BigTown", "ANY"];
_numTypeAtLeast = [1, 1, 1, 2, 2, 1, 1, 122]; // Last number is count with any type
_numMarkersOfType = 0;

diag_log format ["-- BASETYPES START --"];
_instanceOf = 0;
{
	// While there arent enough bases of this type
	while {_numMarkersOfType < _numTypeAtLeast select _instanceOf} do {
		
		// Get Random Base & Pos
		_index = floor(random(count(arr_enemyBaseMarkers)));
		_currentPos = (arr_enemyBaseMarkers select _index) select 4;
		
		// If this Base was not already chosen
		if(!(_index in arr_usedBases)) then{
			
			// Check if its valid
			_valid = true;
			
			// Type (only if not last type in list)
			if(_instanceOf < 7) then {
				if(!(((arr_enemyBaseMarkers select _index) select 0) == (_baseTypes select _instanceOf))) then {
					_valid = false;
				};
		  };
		  
		  // Logging
		  //diag_log format ["%1, %2", ((arr_enemyBaseMarkers select _index) select 0), (_baseTypes select _instanceOf)];
			
			// Distance to other base
			{
				// Position of _x Base
				_pos = (_x select 4);
				
				if(_pos distance _currentPos < _distanceBetween) then{
					_valid = false;
				};
			} foreach arr_usedBases;
			
			// If valid it can be added
			if(_valid) then {
				arr_usedBases set [count arr_usedBases, (arr_enemyBaseMarkers select _index)];
				_numMarkersOfType = _numMarkersOfType + 1;
			};
		};
	};
	
	_instanceOf = _instanceOf + 1;
	_numMarkersOfType = 0;
	
} foreach _baseTypes;

// Create the actual markers
_instanceNo = 0;
_enemyBasePositions = [];
{
	private ["_index", "_pos", "_dir"];
	
	// Set Variables and add pos to array
	_pos = _x select 4;
	_enemyBasePositions set [_instanceNo, _pos];
	
	_marker = createMarker ["enemyBase" + str _instanceNo, _pos];
	_marker setMarkerShape "ELLIPSE";
	_marker setMarkerSize [_x select 2, _x select 3];
	_marker setMarkerColor "ColorRed";
	_marker setMarkerAlpha 1;

	_instanceNo = _instanceNo + 1;
	var_numBases = _instanceNo;
	
} foreach arr_usedBases;

// Set Defending enemies
EOS_Spawn = compile preprocessfilelinenumbers "eos\core\eos_launch.sqf";
Bastion_Spawn=compile preprocessfilelinenumbers "eos\core\b_launch.sqf";
null=[] execVM "eos\core\spawn_fnc.sqf";
onplayerConnected {[] execVM "eos\Functions\EOS_Markers.sqf";};

VictoryColor="colorGreen";	// Colour of marker after completion
hostileColor="colorRed";	// Default colour when enemies active
bastionColor="colorOrange";	// Colour for bastion marker
EOS_DAMAGE_MULTIPLIER=1;	// 1 is default
EOS_KILLCOUNTER=true;		// Counts killed units

_instanceNo = 0;
{
	// Set Number of defending units
	private ["_index", "_offset", "_invertOffset", "_housePatrols", "_markerSize", "_patrollingInfantry",
					 "_patrollingMotorized", "_maxSize", "_patrollingArmor", "_randNum", "_patrollingHelicopters",
					 "_static"];
	
	// Reset variables
	_housePatrols = 0;
	_patrollingInfantry = 0;
	_patrollingMotorized = 0;
	_patrollingArmor = 0;
	_patrollingHelicopters = 0;
	_static = 0;
	
  // House Defending
  _offset = round(random((_x select 1) / 2));	// Random Number from 0 to NumHouses/2
  _invertOffset = round(random(1)); // Get number from 0.0 to 1.0 and round it up or down
  if(_invertOffset >= 1) then {
  	_housePatrols = (_x select 1) - _offset; // Num Houses - Offset
  } else {
  	_housePatrols = (_x select 1) + _offset; // Num Houses + Offset
  };
  
  // Patrolling Infantry
  _maxPatrolling = var_PlayerProgress / 2;							// The maximal patrolling infantry is depended on the progress / 2
  if(_maxPatrolling >= 12) then {_maxPatrolling = 12};	// If it's over 12 set down to 12
  if(_maxPatrolling <= 4) then {_maxPatrolling = 4};    // If it's under 4 set to 4
  
  _markerSize = (_x select 2) * (_x select 3);
  _patrollingInfantry = 0;
  _maxSize = 129600;
  _patrollingInfantry = 1 + (round((_markerSize / _maxSize) * _maxPatrolling)); // Relative to biggest marker, biggest marker = _maxPatrolling, smallest = 0, also +1 added
  
  if(_x select 1 >= 8 && _patrollingInfantry >= 6) then {	// If numhouses >= 8 then it is a city
  	// Reduces patrolling by amount of houses
  	_patrollingInfantry = _patrollingInfantry - round((_x select 1) / 30 * 10);
  };
  
  // Motorized Infantry (no heavy armor)
  // Progress needs to be at least by 6
  if(var_PlayerProgress >= 6) then {
	  _markerSize = (_x select 2) * (_x select 3);
	  _patrollingMotorized = 0;
	  _maxSize = 129600;
	  _offset = round((_markerSize / _maxSize) * 3);	// Offset goes from 0 to 3 relative to the biggest base (maxSize)
	  _patrollingMotorized = _patrollingMotorized + _offset;
	};
  
  // Armored Vehicles & Helicopters & Static Vehicles    
  switch(_x select 0) do {
  	case "Airport": {
  		_patrollingArmor = 0;
  		if(random(3) > 1.0) then { 									// 66% Chance to spawn 1 Armored
  			_patrollingArmor = 1;
  		};
  		
  		_patrollingHelicopters = round(random(1));							// 0 or 1 helicopter
  		_patrollingHelicopters = _patrollingHelicopters + 1;		// Add 1 helicopter
  		
  		_static = 3;																						// 3 Static Weapons
  	};
  	case "City": {
  		_patrollingArmor = round(random(2));				// Random 0 to 2
  		_patrollingArmor = _patrollingArmor + 1;  	// Add 1 (for atleast 1)
  		
  		_patrollingHelicopters = round(random(1));												// 0 or 1 helicopter
  		_patrollingHelicopters = _patrollingHelicopters + 1;							// add 1 helicopter
  		
  		_static = 4;																	// 4 Static Weapons													
  	};
  	case "BigTown": {
  		if(random(3) > 1.0) then { 										// 66% Chance to spawn 1 armor
  			_patrollingArmor = 1;
  		};
  		
  		if(random(2) > 1.0) then { 										// 50% Chance to spawn 1 helicopter
  			_patrollingHelicopters = 1;
  		};
  		
  		_static = 3;																  // 3 Static Weapons
  	};
  	case "Military": {
  		_patrollingArmor = round(random(1));					// Random 0 to 1
  		_patrollingArmor = _patrollingArmor + 1;  		// Add 1 (for atleast 1)
  		
  		if(random(3) > 1.0) then { 										// 66% Chance to spawn 1 helicopter
  			_patrollingHelicopters = 1;
  		};
  		
  		_static = 5;															  	// 5 Static
  	};
  	default {
  		_patrollingArmor = 0;
  		_randNum = round(random(100));								
  		if(var_PlayerProgress > 12) then {					  // Only if at least 10 progress
	  		if(_randNum < var_PlayerProgress) then{			// With progress% chance
	  			_patrollingArmor = 1;
	  		};
  		};
  		
  		_patrollingHelicopters = 0;									
  		if(var_PlayerProgress > 16) then {					  // Only if at least 16 progress
	  		if(_randNum < 10) then{											// With 10% chance
	  			_patrollingHelicopters = 1;
	  		};
  		};
  		
  		_static = round(random(2));										// Random 0 to 2 Static
  	};
  };

  // Logging
  /*diag_log format ["Type: %1, Size: %2, Houses: %3, HousePatrol: %4, Patrols: %5, Vehicles: %6, Armored: %7, Static: %8, Flying: %9",
  									_x select 0, _markerSize, _x select 1,
  									_housePatrols, _patrollingInfantry, _patrollingMotorized,
  									_patrollingArmor, _static, _patrollingHelicopters];*/
  
	_null = [["enemyBase" + str _instanceNo],[_housePatrols,1],[_patrollingInfantry,1],[_patrollingMotorized,2],[_patrollingArmor],[_static],[_patrollingHelicopters,0],[0,0,1000,EAST,TRUE]] call EOS_Spawn;
	//_null = [["enemyBase" + str _instanceNo],[0,1],[0,1],[0,2],[0],[0],[0,0],[0,0,350,EAST,TRUE]] call EOS_Spawn;
	_instanceNo = _instanceNo + 1;
} foreach arr_usedBases;

{ _x enableFatigue false; } forEach (units group player);

_null = execVM "scripts\loot.sqf";