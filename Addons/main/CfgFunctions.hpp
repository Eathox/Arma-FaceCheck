/* -----------------------------------------------------------------------------

	Arma 3 - Face Check
    License: EUPLv1.2

	By: Eathox

----------------------------------------------------------------------------- */

#include "script_mod.hpp"

class CfgFunctions {
    class FCH {
        class Main {
            file="main\functions";

            class init {postInit = 1}; // Initialize eventHandlers

            class checkFace {};
            class getFaceName {};
            class printResults {};
            class findAndGetPlayer {};
            class getAbsoluteFaceName {};
        };
    };
};
