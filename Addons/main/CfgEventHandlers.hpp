/* -----------------------------------------------------------------------------

	Arma 3 - Face Check
    License: EUPLv1.2

	By: Eathox

----------------------------------------------------------------------------- */

#include "script_mod.hpp"

// Initialize CBA settings
class Extended_PreInit_EventHandlers {
    class FaceCheck {
        init = "call compile preprocessFileLineNumbers 'XEH_preInit.sqf'"; // WIP not working
    };
};
