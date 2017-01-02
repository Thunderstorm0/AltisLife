_playerCount = {isPlayer _x} count playableUnits;
_CopAss = playersNumber west;;

_GivingTree = ((1000*_playerCount)/_CopAss);
//diag_log format ["Amount to be Added: %1",_GivingTree];
//diag_log format ["Players Active: %1",_playerCount];
//diag_log format ["Cops Active: %1",_CopAss];


[_GivingTree, true, "Penis", "Penis"] remoteExecCall ["life_fnc_captureReward",west];