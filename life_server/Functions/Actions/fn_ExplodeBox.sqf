_box = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_UN = [_this,1,false,[false]] call BIS_fnc_param;

diag_log format ["_UN: %1", _UN];

_expl1 = "DemoCharge_Remote_Ammo" createVehicle position _box;
_expl1 attachTo [_box];
_expl1 setDamage 1;
DeleteVehicle _box;

if (_UN) then {
	diag_log format ["STARTING CAPTURED UN CODE"];
	[] spawn TON_fnc_CapturedUN;
};
BoxThunder = 0;