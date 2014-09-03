private ["_unit"];

// Select the unit
_unit = _this select 0;
_unit = _unit select 0;
hint format["%1",_unit];

// Remove everything
removeAllWeapons _unit;
removeAllItems _unit;
removeBackpack _unit;
removeGoggles _unit;
removeHeadgear _unit;
removeVest _unit;
removeAllAssignedItems _unit;