/*
	Deletes a 3D Icon used as a nametag
	This function needs to be executed on every machine on which the nametag
	was visible. Usually its called in funct\playerActions\newNametag.sqf
  and executed on every client.
  Eventhandlers are identified through unique names, which are set in
  funct\common\createNametag.sqf. A name always consists of
  "id_PLAYERNAME_INDEX". Playername is the name of the client on which
  the nametag is displayed and index is an incrementing number. A nametag
  of one object has the same index on all clients.This means the first nametag
  exists as "id_p1_0", "id_p2_0", "id_p3_0" and so on
  
  Arguments:
  	0 [Number]: Index of the nametag
*/

_id = _this select 0;
_description = str(player);

["id_"+ _description + "_" + str _id, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;