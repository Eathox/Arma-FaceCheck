/* -----------------------------------------------------------------------------

	Arma 3 - Face Check
    License: EUPLv1.2

	By: Eathox

----------------------------------------------------------------------------- */

params [
    ["_unit", objNull, [objNull]]
];

private _faceName = _unit call FCH_fnc_getFaceName;
if (_faceName == "") exitWith {""};

// Remove camo from display name, eg "Kirby (Arid)" -> "Kirby"
private _splitFaceName = _faceName splitString " ";
private _lenSplitFaceName = count _splitFaceName;

private _lastString = _splitFaceName select (_lenSplitFaceName - 1);
private _lenLastString = count _lastString;
if (_lastString find "(" == 0 && _lastString find ")" == (_lenLastString - 1)) then {
    _splitFaceName = _splitFaceName select [0, (_lenSplitFaceName - 1)];
};

_splitFaceName joinString " ";
