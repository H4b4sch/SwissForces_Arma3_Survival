// Initialize EOS and set enemy markers
EOS_Spawn = compile preprocessfilelinenumbers "plugins\eos\core\eos_launch.sqf";
Bastion_Spawn=compile preprocessfilelinenumbers "plugins\eos\core\b_launch.sqf";
null=[] execVM "plugins\eos\core\spawn_fnc.sqf";
onplayerConnected {[] execVM "plugins\eos\Functions\EOS_Markers.sqf";};

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
	_lessPlayerBonus = 0;
	
  // HOUSE DEFENDING UNITS
  // _numHouses is the number of units that should be created
  // and NOT the actual amount of houses inside the marker
  _numHouses = _x select 1;
  
  if(var_numPlayers >= 1) then {_numHouses = ceil(_numHouses * 0.75)};		// 1 / 2 Player  --> 3/4 of entered units (rounded up)
  if(var_numPlayers >= 3) then {_numHouses = ceil(_numHouses * 1)};				// 3 / 4 Players --> 4/4 of entered units (rounded up)
  if(var_numPlayers >= 5) then {_numHouses = ceil(_numHouses * 1.25)};		// 5 / 6 Players --> 5/4 of entered units (rounded up)
  _offset = round(random(_numHouses / 2));	// Random Number from 0 to NumHouses/2
  
  // Get number from 0.0 to 1.0 and round it up or down
  // Gives a 50% chance for either 0 or 1
  _invertOffset = round(random(1));
  if(_invertOffset >= 1) then {
  	_housePatrols = _numHouses - _offset; // Num Houses - Offset
  } else {
  	_housePatrols = _numHouses + _offset; // Num Houses + Offset
  };
  
  // PATROLLING INFANTRY SQUADS
  // Marker size is calculated as following: ((Vertical Marker Radiant) + (Horizontal Marker Radiant)) / 2
  // This gives the mean of both radiants
  _markerSize = ((_x select 2) + (_x select 3)) / 2;
  _maxSize = 350;	// For the biggest marker, both radiants are 350. This gives also a mean of 350.
  
  // The number of patrolling squads reaches from 1 to 10
  // The biggest marker (according to _maxSize) contains 10 squads
  // Math: The size of the marker dividended by the maximum size gives a number between 0.000... and 1.0
  //			 This is the relative size of the marker. So for a few examples (the values are rounded):
  //		 	 Biggest Marker				  [350/350]: 350 / 350 = 1.00   1.00 * 10 = 10.0		-> 10 Squads
  //			 Random Marker with 100 [100/100]: 100 / 350 = 0.28   0.28 * 10 =  2.8    ->  3 Squads
  //			 Smallest Marker			  [ 40/ 40]:  40 / 350 = 0.11   0.11 * 10 =  1.1		->  1 Squad
  // 			 Average Military Base  [180/140]: 160 / 350 = 0.45	  0.45 * 10 =  4.5		->  5 Squads
  //			 Average Airfield				[160/160]: 160 / 350 = 0.45	  0.45 * 10 =  4.5		->  5 Squads
  _patrollingInfantry = 0;
  _patrollingInfantry = round((_markerSize / _maxSize) * 12);
  
  // PATROLLING MOTORIZED INFANTRY
  // The motorized infantry is, like the patrolling, determinded by the marker size
  // IMPORTANT: The motorized infantry can be changed by the marker types (look below)
  // The variables _markerSize and _maxSize are set 17 and 16 lines above
  
  // The number of motorized infantry reaches from 0 to 3
  // The math is exactly the same as for the patrolling infantry
  // So for the same examples as for the patrolling infantry:
  //		 	 Biggest Marker				  [350/350]: 350 / 350 = 1.00   1.00 * 3 = 3.0		-> 3 Vehicles
  //			 Random Marker with 100 [100/100]: 100 / 350 = 0.28   0.28 * 3 = 0.8    -> 1 Vehicle
  //			 Smallest Marker			  [ 40/ 40]:  40 / 350 = 0.11   0.11 * 3 = 0.3		-> 0 Vehicles
  // 			 Average Military Base  [180/140]: 160 / 350 = 0.45	  0.45 * 3 = 1.3		-> 1 Vehicle
  //			 Average Airfield				[160/160]: 160 / 350 = 0.45	  0.45 * 3 = 1.3		-> 1 Vehicle
  _patrollingMotorized = 0;
  _patrollingMotorized = round((_markerSize / _maxSize) * 3);
  
  // NUMBER OF ENEMIES ACCORDING TO DIFFERENT MARKER TYPES
  // CONTAINS ARMOR, HELICOPTERS, STATIC AND MOTORIZED INFANTRY
  switch(_x select 0) do {
  	
  	// AIRPORT
  	case "Airport": {
  		
  		// There is at least 1 heavy armor
  		// The addition of a second armor has a chance according to the number of players
  		// 1 Player = 33%, 2 Players = 50%, 3 Players = 60%, 6 Players = 75%
  		_patrollingArmor = 1;  		
  		if(random((var_numPlayers + 2)) > 2.0) then { 					
  			_patrollingArmor = _patrollingArmor + 1;;
  		};
  		
  		// There is at least 1 helicopter
  		// and a 50% chance for another helicopter
  		_patrollingHelicopters = 1;
  		if(round(random(1)) == 1) then {
  			_patrollingHelicopters = _patrollingHelicopters + 1;
  		};
  		
  		// There is at least one static (AA, AT or MG)
  		// Also statics as much as half the players (rounded up) are added
  		// This means 1/2 Players = +1    3/4 players = +2    5/6 players = +3
  		_static = 1;
  		_static = _static + (ceil(var_numPlayers / 2));
  		
  		// Add 1 motorized infantry (usually there should already be 1)
  		_patrollingMotorized = _patrollingMotorized + 1;
  	};
  	
  	// CITY like Kavalla or Pyrgos
  	case "City": {
  		
  		// Depending on the number of players there are more or less armor 
  		// Players: 1 / 2 = 1, 3 / 4 = 2, 5 / 6 = 3		
  		// 2 Armors are additionally added
  		_patrollingArmor = ceil(var_numPlayers / 2);	
  		_patrollingArmor = _patrollingArmor + 2;
  		
  		// There are always 4 static weapons
  		_static = 4;
  		
  		// Add 1 motorized infantry (usually there should already be 2 or 3)
  		_patrollingMotorized = _patrollingMotorized + 1;
  		
  		// Add 2 Patrolling Infantry Squads
  		
  	};
  	
  	// BIGTOWN is pretty rare and borderline between smaller towns and cities
  	case "BigTown": {
  		
  		// Depending on the number of players, there can be a heavy armor
  		// 1 Player = 66%, 2 players = 75%, 3 Players = 80%, 6 Players = 87.5%
  		_patrollingArmor = 0;
  		if(random((var_numPlayers + 2)) > 1.0) then { 
  			_patrollingArmor = _patrollingArmor + 1;
  		};
  		
  		// There is at least one static
  		// Also statics as much as half the players (rounded up) are added
  		// This means 1/2 Players = +1    3/4 players = +2    5/6 players = +3
  		_static = 1;
  		_static = ceil(var_numPlayers / 2);
  		
  		// The motorized infantry should be 1 or 2 and isnt changed
  	};
  	
  	// MILITARY are all military bases
  	case "Military": {
  		
  		// Depending on the number of players there are more or less armor 
  		// Players: 1 / 2 = 1, 3 / 4 = 2, 5 / 6 = 3		
  		// Also 1 is added to that number
  		_patrollingArmor = ceil(var_numPlayers / 2);	
  		_patrollingArmor = _patrollingArmor + 1;
  		
  		// Allways 6 statics
  		_static = 6;
  		
  		// Military bases are rather small, thus only having 0 or 1 motorized infantry
  		// Another one is added here
  		_patrollingMotorized = _patrollingMotorized + 1;
  	};
  	
  	// SMALLTOWN are the areas with more than a few houses (around > 5)
  	case "SmallTown": {
  		
  		// There are no heavy armor
  		_patrollingArmor = 0;
  		
  		// There are random 1 or 2 statics
  		_static = ceil(random(2));
  		
  		// The chance for motorized infantry is depending on the number of players
  		// 1 Player = 0%, 2 Players = 25%, 3 Players = 40%, 6 Players = 62.5%
  		if(random((var_numPlayers + 2)) > 3.0) then {
  			_patrollingMotorized = 1;
  		}else{
  			_patrollingMotorized = 0;
  		};
  	};
  	
  	// DEFAULT goes for HOUSES and WILDNESS which have few or no houses
  	default {
  		
  		// There are no heavy armor
  		_patrollingArmor = 0;
  		
  		// Random 0 to 1 Static
  		_static = round(random(1));
  		
  		// There are no motorized infantry here
  		_patrollingMotorized = 0;
  	};
  };

  // Logging
  /*diag_log format ["Type: %1, Size: %2, Houses: %3, HousePatrol: %4, Patrols: %5, Vehicles: %6, Armored: %7, Static: %8, Flying: %9",
  									_x select 0, _markerSize, _x select 1,
  									_housePatrols, _patrollingInfantry, _patrollingMotorized,
  									_patrollingArmor, _static, _patrollingHelicopters];*/
  
	_null = [["enemyBase" + str _instanceNo],[_housePatrols,1],[_patrollingInfantry,1],[_patrollingMotorized,2],[_patrollingArmor],[_static],[_patrollingHelicopters,0],[0,0,750,EAST,TRUE]] call EOS_Spawn;
	//_null = [["enemyBase" + str _instanceNo],[0,1],[0,1],[0,2],[0],[0],[0,0],[0,0,350,EAST,TRUE]] call EOS_Spawn;
	_instanceNo = _instanceNo + 1;
} foreach arr_usedBases;