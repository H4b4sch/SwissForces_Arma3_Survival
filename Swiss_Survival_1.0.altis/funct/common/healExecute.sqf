private ["_unit"];

_unit = _this select 0;

// Moves:
// Heal self while sitting   AinvPknlMstpSlayWrflDnon_medic
// Heal self while prone     AinvPpneMstpSlayWrflDnon_medic
_unit playMove "AinvPknlMstpSlayWrflDnon_medic";
sleep 3;
_unit setdammage (damage _unit - 0.3);