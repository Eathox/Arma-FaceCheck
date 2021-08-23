/* -----------------------------------------------------------------------------

	Arma 3 - Face Check
    License: EUPLv1.2

	By: Eathox

----------------------------------------------------------------------------- */

// Only run in multiplayer on the server
if (!isMultiplayer || !isServer) exitWith {};

addMissionEventHandler ["PlayerConnected", {
    params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];

    // Ignore dedicated server Player
    if (_name == "__SERVER__") exitWith {};

    _uid call FCH_fnc_checkFace;
}];

// WIP: New method once 2.06 comes out
// addMissionEventHandler ["OnUserSelectedPlayer", {
// 	params ["_networkId", "_playerObject"];
// 	_playerObject addEventHandler ["Local", {
// 		_player removeEventHandler ["Local", _thisEventHandler];
// 		params ["_player"];

//         _player call FCH_fnc_checkFace;
// 	}];
// }];
