/* -----------------------------------------------------------------------------

	Arma 3 - Face Check
    License: EUPLv1.2

	By: Eathox

----------------------------------------------------------------------------- */

params [
    ["_uid", "", [""]]
];

private _humanPlayers = call BIS_fnc_listPlayers;;
private _index = _humanPlayers findIf {getPlayerUID _x == _uid};

if (_index != -1) exitWith {_humanPlayers select _index};

objNull
