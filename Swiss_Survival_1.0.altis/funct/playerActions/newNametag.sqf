/*
	Can be called to create a new Nametag on all clients
	To use it, the cursor of the player who executes the script needs to be pointed
	at an object. Valid Objects are all contents of cfgVehicles, like Ammoboxes,
	Buildings or Vehicles. The nametag will move with an vehicle or if an ammobox
	is dragged.

	Arguments:
		1 [String]: Icon Text
		
	The nametag is implemented through a 3D Icon, which needs to be drawn each frame.
	Icons are drawn locale on every machine. Because of this the Script is executed
	through the function BIS_fnc_MP.
*/

_object = cursorTarget;
_text = _this select 0;

// If the target was valid
if(!isNull _object && !(_text == "")) then {
	
	// If the action-id attached to the object is nil or undefined
	// Which absolutely means that no nametag is attached to the object
	if(isNil {_object getVariable "toRemove"}) then {
		
		// Count up the index of the event handlers and broadcast it to clients
		var_eventHandlerIconIndex = var_eventHandlerIconIndex + 1;
		publicVariable "var_eventHandlerIconIndex";
		
		// Execute Function on each client (icons are locale)
		[[[_object, _text], "funct\common\createNametag.sqf"], "BIS_fnc_execVM", true] call BIS_fnc_MP;
		
		// Set Variable attached to object to hold the index of the eventhandler
		_object setVariable ["eventHandlerIndex", var_eventHandlerIconIndex];

		// Add Action to target to remove nametag
		/* Comments are not allowed inside addAction, so:
				First paragraph: Select object and get id of the action from the attached variable
				Second				 : Remove the eventhandler with the given id (also attached to the object)
				Third					 : Remove the action with the id and reset the variable attached to the object
		*/
		_id = _object addAction ["Remove Nametag", "
			
			_obj = _this select 3;
			_removeId = _obj getVariable 'toRemove';
			_eventIndex = (_obj getVariable 'eventHandlerIndex');
			
			[[[_eventIndex], 'funct\common\removeNametag.sqf'], 'BIS_fnc_execVM', true] call BIS_fnc_MP;
			
			_obj removeAction _removeId;
			_obj setVariable ['toRemove', nil];
		", _object];
		
		// After Action Creation attach the id of the action to the object
		_object setVariable ["toRemove", _id];
	};
};