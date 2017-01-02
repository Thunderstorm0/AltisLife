#include "..\..\script_macros.hpp"
/*
    File: fn_wantedGrab.sqf
    Author: ColinM

    Description:
    Prepare the array to query the crimes.
*/
if (isServer) exitWith {};

_HowMuch = [_this,0,0,[0]] call BIS_fnc_param;
_AreYouSure = [_this,1,false,[false]] call BIS_fnc_param;
_KeyPass = [_this,2,"",[""]] call BIS_fnc_param;
_KeyAns = [_this,3,"",[""]] call BIS_fnc_param;

if (_KeyPass != _KeyAns) exitWith {hintSilent "SCREW OFF FUCKER"};
if (_HowMuch == 0) exitWith {diag_log "ERROR NO MONEY PASSED"};
if (!(_AreYouSure)) exitWith {diag_log "ERROR: FALSE!"};


//diag_log format ["MONEY ADDED CLIENT: %1",_HowMuch];

if (_AreYouSure) then {
	hintSilent format ["YOU HAVE BEEN REWARD %1, FOR DESTROYING THE SUPPLY DROP", _HowMuch];
	BANK = BANK + _HowMuch;
};


 