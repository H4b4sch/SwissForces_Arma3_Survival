private ["_vehicleList", "_object", "_type", "_timeFactor", "_magazines"];

_vehicleList = _this select 0;
_timeFactor = 5;

{
	_object = _vehicleList select _forEachIndex;
	_type = typeOf _object;
		
		// Repairing
		_object vehicleChat format ["Repairing %1", _type];
		sleep _timeFactor;
		_object setDamage 0;	
		
		// Refueling
		_object vehicleChat format ["Refueling %1", _type];
		sleep _timeFactor;
		while {fuel _object < 0.99} do {
			_object setFuel 1;
			sleep 0.01;
		};
			
		// Rearming
		_object vehicleChat format ["Rearming %1", _type];
		sleep _timeFactor;
		_magazines = getArray(configFile >> "CfgVehicles" >> _type >> "magazines");
		
		// Magazines
		if (count _magazines > 0) then {
			_removed = [];
			{
				if (!(_x in _removed)) then {
					_object removeMagazines _x;
					_removed = _removed + [_x];
				};
			} forEach _magazines;
			{
			  _object addMagazine _x;
			} forEach _magazines;
		};
		
		// Turrets
		_count = count (configFile >> "CfgVehicles" >> _type >> "Turrets");
	
		if (_count > 0) then {
			for "_i" from 0 to (_count - 1) do {
				scopeName "xx_reload2_xx";
				_config = (configFile >> "CfgVehicles" >> _type >> "Turrets") select _i;
				_magazines = getArray(_config >> "magazines");
				_removed = [];
				{
					if (!(_x in _removed)) then {
						_object removeMagazines _x;
						_removed = _removed + [_x];
					};
				} forEach _magazines;
				{
					_object addMagazine _x;
				} forEach _magazines;
				_count_other = count (_config >> "Turrets");
				if (_count_other > 0) then {
					for "_i" from 0 to (_count_other - 1) do {
						_config2 = (_config >> "Turrets") select _i;
						_magazines = getArray(_config2 >> "magazines");
						_removed = [];
						{
							if (!(_x in _removed)) then {
								_object removeMagazines _x;
								_removed = _removed + [_x];
							};
						} forEach _magazines;
						{
							_object addMagazine _x;
						} forEach _magazines;
					};
				};
			};
		};
		_object setVehicleAmmo 1;	// Reload turrets / drivers magazine
	
} forEach _vehicleList;

_object vehicleChat format ["%1 is ready", _type];