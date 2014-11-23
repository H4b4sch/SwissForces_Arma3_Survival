_infantryBase = 0.2;
_vehicleBase = 0.2;
//_infantryBase = "PAR_AI_SKILL_INFANTRY" call BIS_fnc_getParamValue;
//_vehicleBase = "PAR_AI_SKILL_VEHICLES" call BIS_fnc_getParamValue;

// INFANTRY SKILL
_InfskillSet = [
_infantryBase,        // aimingAccuracy
_infantryBase + 0.2,        // aimingShake
_infantryBase,        // aimingSpeed
_infantryBase,         // spotDistance
_infantryBase,        // spotTime
_infantryBase,        // courage
_infantryBase,        // reloadSpeed
_infantryBase,        // commanding
_infantryBase        // general
];


// ARMOUR SKILL
_ArmSkillSet = [
_vehicleBase,        // aimingAccuracy
_vehicleBase + 0.2,        // aimingShake
_vehicleBase,        // aimingSpeed
_vehicleBase,         // spotDistance
_vehicleBase,        // spotTime
_vehicleBase,        // courage
_vehicleBase,        // reloadSpeed
_vehicleBase,        // commanding
_vehicleBase        // general
];


// LIGHT VEHICLE skill
_LigSkillSet = [
_vehicleBase,        // aimingAccuracy
_vehicleBase + 0.2,        // aimingShake
_vehicleBase,        // aimingSpeed
_vehicleBase,         // spotDistance
_vehicleBase,        // spotTime
_vehicleBase,        // courage
_vehicleBase,        // reloadSpeed
_vehicleBase,        // commanding
_vehicleBase        // general
];


// HELICOPTER SKILL
_AIRskillSet = [
_vehicleBase,        // aimingAccuracy
_vehicleBase + 0.2,        // aimingShake
_vehicleBase,        // aimingSpeed
_vehicleBase + 0.1,         // spotDistance
_vehicleBase + 0.2,        // spotTime
_vehicleBase,        // courage
_vehicleBase,        // reloadSpeed
_vehicleBase,        // commanding
_vehicleBase        // general
];


// STATIC SKILL
_STAskillSet = [
_vehicleBase,        // aimingAccuracy
_vehicleBase + 0.2,        // aimingShake
_vehicleBase,        // aimingSpeed
_vehicleBase,         // spotDistance
_vehicleBase,        // spotTime
_vehicleBase,        // courage
_vehicleBase,        // reloadSpeed
_vehicleBase,        // commanding
_vehicleBase        // general
];

server setvariable ["INFskill",_InfskillSet];
server setvariable ["ARMskill",_ArmSkillSet];
server setvariable ["LIGskill",_LigSkillSet];
server setvariable ["AIRskill",_AIRskillSet];
server setvariable ["STAskill",_STAskillSet];