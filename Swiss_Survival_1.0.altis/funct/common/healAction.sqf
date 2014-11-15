while{true} do{
	
	// Add Quick Heal Action
	if (damage player > 0.05 && _madeQuickHealAction <= 0 && (animationState player != "AinvPknlMstpSlayWrflDnon_medic")) then {
		_quickHealAction = player addAction ["Quick Heal", "_null = [player] execVM 'funct\common\healExecute.sqf'"];
		_madeQuickHealAction = 1;
	}; 
	
	// Remove Quick Heal Action
	if (damage player <= 0.05 && _madeQuickHealAction >= 1 or (animationState player == "AinvPknlMstpSlayWrflDnon_medic")) then {
		player removeAction _quickHealAction;
		_madeQuickHealAction = 0;
	};
	
	// Always remove AGM bleeding and pain
	_unit setVariable ["AGM_Pain", nil, true];
	_unit setVariable ["AGM_Bleeding", nil, true];

	sleep 0.5;
};