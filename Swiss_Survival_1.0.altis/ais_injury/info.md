# Information

This is a wounding system based on AIS_injury.

To install it, add the following in the desciption.ext:
```
respawn = 3;
respawndelay = 10;

class RscTitles {
	#include "ais_injury\dialogs\rscTitlesAIS.hpp"
};
class CfgFunctions {
	#include "ais_injury\cfgFunctionsAIS.hpp"
};
```

And add the following in the init.sqf file:
```
//Arma 3 Wounding System
if (!isDedicated) then {
	TCB_AIS_PATH = "ais_injury\";
	{[_x] call compile preprocessFile (TCB_AIS_PATH+"init_ais.sqf")} forEach (if (isMultiplayer) then {playableUnits} else {switchableUnits});
};
_respos = getPos player;
_mrkr = createMarker ["respawn_west", _respos ];
createMarker ["respawn_east", _respos ];
createMarker ["respawn_guerrila", _respos ];
createMarker ["respawn_civilian", _respos ];
_mrkr setMarkerShape "ICON";
_mrkr setMarkerType "mil_box";
_mrkr setMarkerColor "ColorBlue";
_mrkr setMarkerAlpha 1;
```