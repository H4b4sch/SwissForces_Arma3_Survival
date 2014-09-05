fnc_healExecute = {
	private ["_unit"];

	_unit = _this select 0;
	
	_unit playMove "AinvPknlMstpSlayWrflDnon_medic";
	_unit setdammage (damage _unit - 0.3);
};


_id = 0;
_madeAction = 0;

while{true} do{
	if (damage player > 0.1 && _madeAction <= 0) then {
		_id = player addAction ["Quick Heal", "_null = [player] execVM fnc_healExecute"];
		_madeAction = 1;
	}; 
	
	if (damage player <= 0.1 && _madeAction >= 1) then {
		player removeAction _id;
		_madeAction = 0;
	};
	
	sleep 1;
};