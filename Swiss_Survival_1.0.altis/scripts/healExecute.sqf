private ["_unit"];

_unit = _this select 0;

_unit playMove "AinvPknlMstpSlayWrflDnon_medic";
_unit setdammage (damage _unit - 0.3);