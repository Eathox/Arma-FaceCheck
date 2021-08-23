/* -----------------------------------------------------------------------------

	Arma 3 - Face Check
    License: EUPLv1.2

	By: Eathox

----------------------------------------------------------------------------- */

#include "script_mod.hpp"

class CfgPatches {
    class FaceCheck {
        name = "$STR_FCH_Name";
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"cba_main"};
        author = "$STR_FCH_Main_Author";
        authors[] = {};
        url = "$STR_FCH_Main_URL";
        version = VERSION;
    };
};

#include "CfgMods.hpp"
#include "CfgSettings.hpp"
#include "CfgFunctions.hpp"
