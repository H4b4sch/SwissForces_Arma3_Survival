KeyHandler_BuildMenu = {
	private ["_alt", "_control", "_key", "_shift"];
	_key = _this select 1;
	_shift = _this select 2;
	_control = _this select 3;
	_alt = _this select 4;
	
	switch (true) do {
		case (_key in actionKeys "User1"): {
			_rotate = switch (true) do { case (_shift): {45}; case (_control): {5};	default {1} };
			VAR_BUILD_MANROTATE = VAR_BUILD_MANROTATE + _rotate;
		};
		case (_key in actionKeys "User2"): {
			_rotate = switch (true) do { case (_shift): {45}; case (_control): {5};	default {1} };
			VAR_BUILD_MANROTATE = VAR_BUILD_MANROTATE - _rotate;
		};
		case (_key in actionKeys "User3"): {
			VAR_BUILD_MANROTATE = 0;
		};
	};
};