/*
	(Re-)names a base. The naming affects respawning with BTC-Revive and the
	marker on the map.It is exectued similiar to the nametag-system. The action
	to rename hangs onthe base, so the cursortarget should be the base building.
	
	Arguments:
		[1] String: Base-Name
*/

_object = cursorTarget;
_text = _this select 0;
_index = -1;

// If the target was valid
if(!isNull _object && !(_text == "")) then {
	
	// Get the index
	_index = _object getVariable "baseIndex";
	
	// If index is good
	if(_index >= 0) then {
		
		// Set String in respawn list and broadcast new list
		BTC_CUSTOM_respawn_points_str set [_index, _text];
		publicVariable "BTC_CUSTOM_respawn_points_str";
		
		// Change marker text
		_mkr = _object getVariable "baseMarker";
		_mkr setMarkerText _text;
	};
};