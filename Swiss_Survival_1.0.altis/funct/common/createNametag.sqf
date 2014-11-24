/*
	Creates a 3D Icon which is used as a nametag
	This function needs to be executed on every machine on which the nametag
	should be visible. Usually its called in funct\playerActions\newNametag.sqf
  and executed on every client.
  Eventhandlers are identified through unique names, which are used in
  funct\common\removeNametag.sqf. A name always consists of
  "id_PLAYERNAME_INDEX". Playername is the name of the client on which
  the nametag is displayed and index is an incrementing number. A nametag
  of one object has the same index on all clients.This means the first nametag
  exists as "id_p1_0", "id_p2_0", "id_p3_0" and so on
  
  Arguments:
  	0 [Object]: Object which gets the nametag
  	1 [String]: Text
*/

_object = _this select 0;
_text = _this select 1;
_description = str (player);

// Add event handler for each frame
["id_"+ _description + "_" + str var_eventHandlerIconIndex, "onEachFrame", {
	
	// If the locale player is within 10 meters
	if((_this select 0 distance player) <= 10) then {
		
		// Draw icon on desired position with desired text
		drawIcon3D ["", [1,0,0,1], position (_this select 0), 0, 0, 0, _this select 1, 1, 0.05, "PuristaMedium"];
	};
}, [_object, _text]] call BIS_fnc_addStackedEventHandler;