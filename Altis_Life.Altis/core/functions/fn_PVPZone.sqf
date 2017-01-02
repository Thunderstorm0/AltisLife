_EE = _this select 3 select 0;
_unit = _this select 1;

if (_EE == "Enter" && (alive _unit)) then {
	if ((_unit distance (getMarkerPos "PVP_Enter")) <= 5 && (alive _unit)) then {
		_spawnPoint = selectRandom ["1","2","3","4","5","6"];
		_postobemoved = getMarkerPos ("PVP_Spawn_" + _spawnPoint);
		_unit setPos _postobemoved;
	};
} else {
	 if (_EE == "Exit" && (alive _unit) && (_unit distance getMarkerPos "PVP_Exit_Marker") <= 5) then {
	 	if ((_unit distance (getMarkerPos "PVP_Exit_Marker")) <= 5 && (alive _unit)) then {
		 	if ((_unit distance (getMarkerPos "PVP_Zone")) <= 75 ) then {
		 		[[1,2],"A PLAYER IS ATTEMPTING TO EXIT THE PVP ZONE!",true,[]] remoteExecCall ["life_fnc_broadcast",civilian];
		 	};
		 	_timer = 30;
		 	hintSilent "STAY ONTOP OF THE MARKER OR ELSE YOU WILL NOT BE TELEPORTED!";
	 		while {_timer > 0 && ((_unit distance getMarkerPos "PVP_Exit_Marker") <= 5) && (alive _unit)} do {
	 			cutText  [([_timer, 1, 0, true] call CBA_fnc_formatNumber) + " Seconds Till You Exit the PVP Zone", "PLAIN",0.05];
	 			sleep 1;
	 			_timer = _timer - 1;
	 		};
	 		waitUntil {_timer == 0};
			_postobemoved = getMarkerPos ("PVP_Exit");
			_unit setPos _postobemoved;
		};
	};
};