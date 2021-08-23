/* -----------------------------------------------------------------------------

	Arma 3 - Face Check
    License: EUPLv1.2

	By: Eathox

----------------------------------------------------------------------------- */

params [
    ["_unit", objNull, [objNull]]
];

private _faceConfig = configFile >> "CfgFaces" >> "MAN_A3" >> face _unit;
if (_faceConfig == configNull) exitWith {
    ["Unable to find unit '%1' face", _unit] call BIS_fnc_error;
    ""
};

getText (_faceConfig >> "displayname")
