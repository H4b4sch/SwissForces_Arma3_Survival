fnc_FindGoodPos = {
	private ["_i", "_startPos", "_isOk", "_result", "_roadSegments", "_dummyObject", "_randomNumber"];
    
    // Choose a random and flat position (for-loop and markers are for test on new maps).
    for [{_i = 0},  {_i < 1}, {_i = _i + 1}] do {
        _isOk = false;
        while {!_isOk} do {
			_randomNumber = random 100;
            if (_randomNumber > 90) then {
                _startPos = + [8200 + random 6000, 6200 + random 4800]; // Most difficult place
            }
            else {
                if (_randomNumber > 50) then {
                    _startPos = + [3000 + random 10000, 10000 + random 14000]; // Difficult place
                }
                else {
                    if (_randomNumber > 25) then {
                    _startPos = + [15000 + random 10000, 4000 + random 11000]; // Difficult place
					}
					else {
						_startPos = + [13000 + random 16000, 14000 + random 11000]; // Easiest place
					};
                };
            };
            
            _result = _startPos isFlatEmpty [0, 0, 0.25, 1, 0, false, objNull];
            _roadSegments = _startPos nearRoads 30;
						_buildings = _startPos nearObjects 30;
            
            if ((count _result > 0) && (count _roadSegments == 0) && (!surfaceIsWater _startPos) && (count _buildings == 0)) then {
                _dummyObject = "Land_Can_Rusty_F" createVehicleLocal _startPos;
                
                if (((nearestBuilding _dummyObject) distance _startPos) > 50) then {
                    _isOk = true;
                };
                
                deleteVehicle _dummyObject;
            };
        };
    };
    
    _startPos
};