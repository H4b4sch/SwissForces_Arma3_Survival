//====================================================================
//Information  /
//------------/
// This is the Lifting Script which was taken from the BTC Logistics
// Script. It's edited and optimised for personal use.
//
//====================================================================
waitUntil {!isNull player};
waitUntil {player == player};

BTC_cargo      = ObjNull;
BTC_lift_check =
{
	private ["_rel_pos"];
	if (!(vehicle player isKindOf "Helicopter") || BTC_lifted == 1) exitWith {false};
	_array = [vehicle player] call BTC_get_liftable_array;
	_chopper  = vehicle player;
	_can_lift = false;
	_cargo_array = nearestObjects [_chopper, _array, 50];
	if (count _cargo_array > 0) then {if (driver (_cargo_array select 0) == player) then {_cargo_array set [0,0];_cargo_array = _cargo_array - [0];};};
	if (count _cargo_array > 0) then {BTC_cargo = _cargo_array select 0;} else {BTC_cargo = objNull;_can_lift = false;};
	if (({BTC_cargo isKindOf _x} count _array) > 0 && speed BTC_cargo < 2) then {_can_lift = true;} else {_can_lift = false;};
	if (_can_lift && ((BTC_cargo isKindOf "Air" && getdammage BTC_cargo != 1) || (format ["%1", BTC_cargo getVariable "BTC_cannot_lift"] == "1"))) then {_can_lift = false;};
	if (!isNull BTC_cargo && _can_lift) then
	{
		_cargo_pos = getPosATL BTC_cargo;
		_rel_pos   = _chopper worldToModel _cargo_pos;
		BTC_cargo_x   = _rel_pos select 0;
		BTC_cargo_y   = _rel_pos select 1;
		BTC_cargo_z   = _rel_pos select 2;
	};
	if (((abs BTC_cargo_z) < BTC_lift_max_h) && ((abs BTC_cargo_z) > BTC_lift_min_h) && ((abs BTC_cargo_x) < BTC_lift_radius) && ((abs BTC_cargo_y) < BTC_lift_radius)) then
	{_can_lift = true;} else {_can_lift = false;};
	_can_lift
};
BTC_attach_cargo =
{
	private ["_cargo"];
	_chopper = vehicle player;
	_array = [vehicle player] call BTC_get_liftable_array;
	_cargo_array = nearestObjects [_chopper, _array, 50];
	if (count _cargo_array > 0 && driver (_cargo_array select 0) == player) then {_cargo_array set [0,0];_cargo_array = _cargo_array - [0];};
	if (count _cargo_array > 0) then {_cargo = _cargo_array select 0;} else {_cargo = objNull;};
	if (isNull _cargo) exitWith {};
	BTC_lifted    = 1;
	_cargo_pos    = getPosATL _cargo;
	_rel_pos      = _chopper worldToModel _cargo_pos;
	_height       = (_rel_pos select 2) + 2.5;
	_cargo attachTo [_chopper, [0,0,_height]];
	_name_cargo  = getText (configFile >> "cfgVehicles" >> typeof _cargo >> "displayName");
	_chopper vehicleChat format ["%1 lifted", _name_cargo];
	BTC_cargo_lifted = _cargo;
};
BTC_detach_cargo =
{
	detach BTC_cargo_lifted;
	_name_cargo  = getText (configFile >> "cfgVehicles" >> typeof BTC_cargo_lifted >> "displayName");
	vehicle player vehicleChat format ["%1 dropped", _name_cargo];
	if (BTC_cargo_lifted isKindOf "Strategic") then {_obj_fall = [BTC_cargo_lifted] spawn BTC_l_Obj_Fall;} else
	{
		_vel = velocity (vehicle player);
		BTC_cargo_lifted setVelocity _vel;
	};
	BTC_cargo_lifted = ObjNull;
	BTC_lifted = 0;
};
BTC_l_camera =
{
	if (BTC_l_pip_cond) then
	{
		BTC_l_pip_cond = false;
		[] call BIS_fnc_liveFeedTerminate;
	}
	else
	{
		BTC_l_pip_cond = true;
		BTC_l_feed_target = "Land_HelipadEmpty_F" createVehicle (position player);
		[] spawn {while {BTC_l_pip_cond} do {BTC_l_feed_target setpos [getPos (vehicle player) select 0,(getPos (vehicle player) select 1) + 1,0];sleep 0.1;};deleteVehicle BTC_l_feed_target;};
		[player, player, player] call BIS_fnc_liveFeed;
		waitUntil {!(isNil "BIS_liveFeed")};
		hintSilent "";
		BIS_liveFeed attachTo [vehicle player,[0, - 1, -3]];
		BTC_l_feed_target call BIS_fnc_liveFeedSetTarget;
		WaitUntil {sleep 1; (!(vehicle player isKindOf "Helicopter") || !Alive player)};
		if (BTC_l_pip_cond) then {BTC_l_pip_cond = false;[] call BIS_fnc_liveFeedTerminate;};
	};
};
[] spawn
{
	if (BTC_def_pip == 1) then {player addAction ["<t color='#A4EF75'> Camera On\Off </t>",BTC_dir_action, [[],BTC_l_camera], -9, false, false, "", "typeOf (vehicle player) in BTC_l_def_veh_pip"];};
	player addAction ["<t color='#A4EF75'> Lift </t>",BTC_dir_action, [[],BTC_attach_cargo], 9, true, false, "", "[] call BTC_lift_check"];
	player addAction ["<t color='#A4EF75'> Release </t>",BTC_dir_action, [[],BTC_detach_cargo], -9, true, false, "", "BTC_lifted == 1"];
	player addEventHandler ["Respawn",
	{
		[] spawn
		{
			WaitUntil {sleep 1; Alive player};
			BTC_l_pip_cond = false;
			BTC_cargo    = ObjNull;
			BTC_lifted   = 0;
			if (BTC_def_pip == 1) then {player addAction ["<t color='#A4EF75'>Camera On\Off</t>",BTC_dir_action, [[],BTC_l_camera], -9, false, false, "", "typeOf (vehicle player) in BTC_l_def_veh_pip"];};
			player addAction ["<t color='#A4EF75'> Lift </t>",BTC_dir_action, [[],BTC_attach_cargo], 9, true, false, "", "[] call BTC_lift_check"];
			player addAction ["<t color='#A4EF75'> Release </t>",BTC_dir_action, [[],BTC_detach_cargo], -9, true, false, "", "BTC_lifted == 1"];
		};
	}];
};