// Array for each target type and how much bases of that type should be generated
_baseTypes = ["Airport", "Military", "City", "Houses", "Wildness", "SmallTown", "BigTown", "ANY"];
_numTypeAtLeast = [1, 1, 1, 2, 2, 1, 1, 122]; 			// Last number is count with any type
_numMarkersOfType = 0;															// Placeholder
_distanceBetween = 10;															// min Distance between the markers

diag_log format ["SWISS_SURVIVAL: Target Generation Started -------------------------------------------"];
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