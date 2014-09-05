private ["_unit"];

// Select the unit
_unit = _this select 0;
_unit = _unit select 0;

// Remove everything except uniform
removeAllWeapons _unit;
removeAllItems _unit;
removeBackpack _unit;
removeGoggles _unit;
removeHeadgear _unit;
removeVest _unit;
removeAllAssignedItems _unit;