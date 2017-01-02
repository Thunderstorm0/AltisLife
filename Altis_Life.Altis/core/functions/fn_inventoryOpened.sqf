#include "..\..\script_macros.hpp"
/*
    File: fn_inventoryOpened.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    For the mean time it blocks the player from opening another persons backpack
*/
private ["_container","_unit","_list"];
if (count _this isEqualTo 1) exitWith {false};
_unit = _this select 0;
_container = _this select 1;

_isPack = FETCH_CONFIG2(getNumber,"CfgVehicles",typeOf _container,"isBackpack");
if (_isPack isEqualTo 1) exitWith {
    hint localize "STR_MISC_Backpack";
    true;
};

if ((typeOf _container) in ["Box_IND_Grenades_F","B_supplyCrate_F"]) exitWith {
    _house = nearestObject [player, "House"];
    if (!(_house in life_vehicles) && (_house getVariable ["locked",true])) exitWith {
        hint localize "STR_House_ContainerDeny";
        true;
    };
};

if (((typeOf _container) == "Box_IND_AmmoVeh_F") && _container getVariable ["AirPenis",true] && (playerSide) == independent) exitWith {
    true;
};

if (((typeOf _container) == "Box_IND_AmmoVeh_F") && _container getVariable ["AirPenis",true] && (playerSide) == west) exitWith {
    hintSilent "Scroll to Capture the Crate";
    true;
};

if (((typeOf _container) == "Box_IND_AmmoVeh_F") && _container getVariable ["AirPenis",true]) exitWith {
    [[1,2],"A PLAYER HAS TRIGGERED THE FAIL SAFE ON THE AIR DROP",true,[]] remoteExecCall ["life_fnc_broadcast",west];
    [[1,2],"A PLAYER HAS TRIGGERED THE FAIL SAFE ON THE AIR DROP",true,[]] remoteExecCall ["life_fnc_broadcast",civilian];
    [_container,"Civ"] execVM "core\functions\fn_Crate.sqf";
};

_list = ["LandVehicle","Ship","Air"];
if (KINDOF_ARRAY(_container,_list)) exitWith {
    if (!(_container in life_vehicles) && {locked _container isEqualTo 2}) exitWith {
        hint localize "STR_MISC_VehInventory";
        true;
    };
};

//Allow alive players who've been knocked out to be looted, just not the dead ones
if (_container isKindOf "Man" && !alive _container) exitWith {
    hint localize "STR_NOTF_NoLootingPerson";
    true;
};