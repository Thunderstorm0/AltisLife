/*
    File: fn_stripDown_target.sqf
    Author: Tobias 'Xetoxyc' Sittenauer

    Description: Strip the _target down
*/



_target = _this select 0;

if ((_target distance (getMarkerPos "PVP_Zone")) <= 75) then {

	_pweapons = weapons _target;
	_pmags = magazines _target;
	_puniform = uniform _target;
	_pvest = vest _target;
	_pbag = backpack _target;
	
	_box = createVehicle ["groundWeaponHolder", _target modelToWorld [0,0.8,0], [], 0.5, "CAN_COLLIDE"];
	_box setDir floor (random 360);

	{
		_box addWeaponCargoGlobal [_x, 1];
		_target removeWeapon _x;
	} forEach _pweapons;
	{
		_box addMagazineCargoGlobal [_x, 1];
		_target removeItem _x; 
	} forEach _pmags;
	
	_box addItemCargoGlobal [_puniform, 1];
	_target removeItem _puniform;

	_box addItemCargoGlobal [_pvest, 1];
	_target removeItem _pvest;
	
	_box addBackpackCargoGlobal  [_pbag,1];
	_target removeItem _pbag;

	_target reveal _box;
};
