_id = 0;
_madeAction = 0;

while{true} do{
	if (damage player > 0.1 && _madeAction <= 0) then {
		_id = player addAction ["Quick Heal", "_null = [player] execVM 'funct\common\healExecute.sqf'"];
		_madeAction = 1;
	}; 
	
	if (damage player <= 0.1 && _madeAction >= 1) then {
		player removeAction _id;
		_madeAction = 0;
	};
	
	sleep 1;
};