switch (playerSide) do {
	case west: {
		_EE = _this select 3 select 0;
		if (_EE == "UN") then {
			_container = cursorObject;
			_texttodisplay = "UN HAVE PLACED AN EXPLOSIVE ON THE AIR DROP, 60 SECONDS TILL EXPLOSION";
			{
				[[1,2],_texttodisplay,false,[]] remoteExecCall ["life_fnc_broadcast",_x];
			} forEach [civilian,west,independent];
			_timer = 60; 
		    while {_timer > 0} do {
		        _timer = _timer - 1;
		        sleep 1;
		    };
		    waitUntil {_timer == 0};
		    [_container,true] remoteExec ["TON_fnc_ExplodeBox",2];
		};
	};
	case civilian: {
		_EE = _this select 1;
		if (_EE == "Civ") then {
			_container = _this select 0;
		    _timer = 60; 
		    while {_timer > 0} do {
		        hint format ["You have Acitvated a failsafe, %1 Seconds till Explosion!", _timer];
		        _timer = _timer - 1;
		        sleep 1;
		    };
		    waitUntil {_timer == 0};
		    [_container,false] remoteExec ["TON_fnc_ExplodeBox",2];
		};
	};
};