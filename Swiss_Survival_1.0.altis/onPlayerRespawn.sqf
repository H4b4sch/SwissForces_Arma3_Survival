private ["_unit"];

_unit = _this select 0;

if(!var_baseEstablished) then {
	sleep 5;
	_unit setPos var_startPos;
};

removeAllWeapons _unit;
removeAllItems _unit;
removeBackpack _unit;
removeGoggles _unit;
removeHeadgear _unit;
removeVest _unit;
removeUniform _unit;
removeAllAssignedItems _unit;

_unit addUniform "U_B_CombatUniform_mcam";
_unit addWeapon "hgun_P07_F";
_unit addMagazine "16Rnd_9x21_Mag";
_unit addMagazine "16Rnd_9x21_Mag";
_unit addMagazine "16Rnd_9x21_Mag";
_unit addMagazine "16Rnd_9x21_Mag";