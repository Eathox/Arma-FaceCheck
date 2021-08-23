/* -----------------------------------------------------------------------------

	Arma 3 - Face Check
    License: EUPLv1.2

	By: Eathox

----------------------------------------------------------------------------- */

#define TIMEOUT 60

// Get player unit
private _condition = {
    params ["_uid"];

    !isNull (_uid call FCH_fnc_findAndGetPlayer)
};

// Check face against other players
private _statement = {
    params ["_uid"];

    private _player = _uid call FCH_fnc_findAndGetPlayer;
    private _faceName = _player call FCH_fnc_getAbsoluteFaceName;

    if (_faceName in ["Custom Face", ""]) exitWith {};

    private _humanPlayers = call BIS_fnc_listPlayers;
    private _playersWithSameFace = _humanPlayers select {
        (_x call FCH_fnc_getAbsoluteFaceName) == _faceName
    };

    if (count _playersWithSameFace <= 1) exitWith {};

    _playersWithSameFace = _playersWithSameFace apply {name _x};
    private _message = format ["Face '%1' in use by: %2", _faceName, _playersWithSameFace joinString ", "];
    [_faceName, _message] call FCH_fnc_printResults;
};

private _timeoutCode = {
    params ["_uid"];

    ["Timed out (%1): Can't find player unit of '%2'", TIMEOUT, _uid] call BIS_fnc_error;
};

// Wait until server knows about the new player
[
    _condition,
    _statement,
    _this,
    TIMEOUT,
    _timeoutCode
] call CBA_fnc_waitUntilAndExecute;
