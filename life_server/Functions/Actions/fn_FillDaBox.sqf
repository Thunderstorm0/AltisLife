BoxThunder = 0;
_BOX_DEBUG = true;

while {true} do {
	if (_BOX_DEBUG) then {
		diag_log "Crate Spawn Start";
	};
	
	sleep 30;
	BoxThunder = 1;
	

	_PWeapons = [
		["UK3CB_BAF_L110A2","UK3CB_BAF_100Rnd"],
		["UK3CB_BAF_L128A1","UK3CB_BAF_L128A1_Slugs"],
		["UK3CB_BAF_L115A3_Ghillie","UK3CB_BAF_L115A3_Mag"],
		["UK3CB_BAF_L7A2","UK3CB_BAF_L115A3_Mag"]
	];




	_spawns = ["airDrop1","airDrop2","airDrop3","airDrop4","airDrop5","airDrop6","airDrop7","airDrop8","airDrop9","airDrop10"] call BIS_fnc_selectRandom;
	_purple = [128,0,128];

	_markerNew = getMarkerPos _spawns;


	//MARKERS
	_markername1 = "airDropZone";
	_markername2 = "airDropName";

	_marker = createMarker [_markername1, _markerNew];
	_marker setMarkerShape "ELLIPSE";
	_marker setMarkerSize [200, 200];
	_marker setMarkerBrush "SOLID";
	_marker setMarkerColor "ColorPink";

	_marker2 = createMarker [_markername2, _markerNew];
	_marker2 setMarkerColor "ColorBlack";
	_marker2 setMarkerType "mil_warning";
	_marker2 setMarkerShape "ICON";
	_marker2 setMarkerSize [1,1];
	_marker2 setMarkerText "RARE LOOT: Air drop!";

	//Debug
	[[1,2],"STR_ISTR_airDrop_Civ",true,[]] remoteExecCall ["life_fnc_broadcast",civilian];
	[[1,2],"STR_ISTR_airDrop_Cop",true,[]] remoteExecCall ["life_fnc_broadcast",west];



	_smoke = "SmokeShellRed" createVehicle getMarkerPos _spawns;
	_attachPos = [0, 0, 0.5];




	//_Boom = [] call BIS_fnc_selectRandom; // Add Grenades in this Array
	_BoxPos = _markerNew;
	_box = createVehicle ["Box_IND_AmmoVeh_F", _BoxPos, [], 0.5, "CAN_COLLIDE"];
	_smoke attachTo[_box, _attachPos];
	_box setVariable ["AirPenis",true,true];
	_tempC = 0;

	{
		_Choice = selectRandom _PWeapons;
		_PW = (_Choice) select 0;
		_PWA = (_Choice) select 1;
		if (_BOX_DEBUG) then {
			SystemChat format ["Weapon :%1",_PW];
			SystemChat format ["Ammo :%1",_PWA];
		};

		_box addWeaponCargoGlobal [_PW, 1];
		_box addMagazineCargoGlobal [_PWA, 3];
		//_box addMagazineCargoGlobal [_Boom, 1];
		_tempC = _tempC + 1;

	} count ["Big","Penis"];
	waitUntil {BoxThunder == 0};	
};
