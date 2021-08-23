/* -----------------------------------------------------------------------------

	Arma 3 - Face Check
    License: EUPLv1.2

	By: Eathox

----------------------------------------------------------------------------- */

#include "script_mod.hpp"

class CfgSettings {
    class CBA {
        class Versioning {
            class FCH {
                class Dependencies {
                    // Face Check will hard exit if this is missing
                    CBA[] = {"cba_main", REQUIRED_CBA_VERSION, "true"};
                };
            };
        };
    };
};
