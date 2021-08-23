/* -----------------------------------------------------------------------------

	Arma 3 - Face Check
    License: EUPLv1.2

	By: Eathox

----------------------------------------------------------------------------- */

/*
** This function implements a "grace period" in which a result is queued for printing
** but waits GRACE_PERIOD amount of seconds while checking FCH_resultTimeStampHashMap
** to see if its still the most recent result for the given _faceName.
** If its not the most recent result, it terminates it self and never prints.
** This is to prevent burst printing for the same face.
*/

#define GRACE_PERIOD 4
#define TIMEOUT (GRACE_PERIOD + 1)

#define START_TIME_OFFSET 0.1e-3

params ["_faceName", "_message"];

// Used for start timestamps
if (isNil "FCH_resultTimeStampHashMap") then {
    FCH_resultTimeStampHashMap = createHashMap;
};

private _startTime = CBA_missionTime;
private _timeStamp = FCH_resultTimeStampHashMap getOrDefault [_faceName, 0];

// Check previous timestamp and add START_TIME_OFFSET to prevent multiple results with exact same timestamp
if (_startTime <= _timeStamp) then {
    _startTime = _timeStamp + START_TIME_OFFSET;
};
FCH_resultTimeStampHashMap set [_faceName, _startTime];

// Check if its the most recent result and if the "grace period" has passed
private _condition = {
    params ["_faceName", "_message", "_startTime"];

    private _timeStamp = FCH_resultTimeStampHashMap get _faceName;
    _startTime == _timeStamp && (CBA_missionTime - _startTime) > GRACE_PERIOD
};

private _statement = {
    params ["_faceName", "_message", "_startTime"];

    [_message, localize "STR_FCH_Name", [true, true, true]] call CBA_fnc_debug;
};

// Queue printing of result
[
    _condition,
    _statement,
    [_faceName, _message, _startTime],
    TIMEOUT
] call CBA_fnc_waitUntilAndExecute;
