/// Module is compatible with Security Cyborg models
#define BORG_MODULE_SECURITY 		(1<<0)
/// Module is compatible with Miner Cyborg models
#define BORG_MODULE_MINER			(1<<1)
/// Module is compatible with Janitor Cyborg models
#define BORG_MODULE_JANITOR			(1<<2)
/// Module is compatible with Medical Cyborg models
#define BORG_MODULE_MEDICAL			(1<<3)
/// Module is compatible with Engineering Cyborg models
#define BORG_MODULE_ENGINEERING		(1<<4)

/// Module is compatible with Ripley Exosuit models
#define EXOSUIT_MODULE_RIPLEY		(1<<0)
/// Module is compatible with Odyseeus Exosuit models
#define EXOSUIT_MODULE_ODYSSEUS		(1<<1)
/// Module is compatible with Clarke Exosuit models. Rebranded to firefighter because tg nerfed it to this.
#define EXOSUIT_MODULE_FIREFIGHTER	(1<<2)
// #define EXOSUIT_MODULE_CLARKE		(1<<2)
/// Module is compatible with Gygax Exosuit models
#define EXOSUIT_MODULE_GYGAX		(1<<3)
/// Module is compatible with Durand Exosuit models
#define EXOSUIT_MODULE_DURAND		(1<<4)
/// Module is compatible with H.O.N.K Exosuit models
#define EXOSUIT_MODULE_HONK			(1<<5)
/// Module is compatible with Phazon Exosuit models
#define EXOSUIT_MODULE_PHAZON		(1<<6)
/// Module is compatable with N models
#define EXOSUIT_MODULE_GYGAX_MED	(1<<7)
/// Module is compatible with Savannah Exosuit models - SPLURT ADDITION
#define EXOSUIT_MODULE_SAVANNAH 	(1<<8)

/// Module is compatible with "Working" Exosuit models - Ripley and Clarke
#define EXOSUIT_MODULE_WORKING		EXOSUIT_MODULE_RIPLEY | EXOSUIT_MODULE_FIREFIGHTER // | EXOSUIT_MODULE_CLARKE
/// Module is compatible with "Combat" Exosuit models - Gygax, H.O.N.K, Durand and Phazon
#define EXOSUIT_MODULE_COMBAT		EXOSUIT_MODULE_GYGAX | EXOSUIT_MODULE_HONK | EXOSUIT_MODULE_DURAND | EXOSUIT_MODULE_PHAZON | EXOSUIT_MODULE_SAVANNAH
/// Module is compatible with "Medical" Exosuit modelsm - Odysseus
#define EXOSUIT_MODULE_MEDICAL		EXOSUIT_MODULE_ODYSSEUS | EXOSUIT_MODULE_GYGAX_MED

// BLUEMOON ADD START MOD modules & exosuit modules sub-categories

/// Module is from general MODsuit node
#define MOD_MODULE_GENERAL 					(1<<0)
/// Module is from engineering MODsuit node
#define MOD_MODULE_ENGINEERING				(1<<1)
/// Module is from medical MODsuit node
#define MOD_MODULE_SECURITY					(1<<2)
/// Module is from service MODsuit node
#define MOD_MODULE_MEDICAL					(1<<3)
/// Module is from SCIENCE MODsuit node
#define MOD_MODULE_SCIENCE					(1<<4)
/// Module is from supply MODsuit node
#define MOD_MODULE_SUPPLY					(1<<5)
/// Module is from HUD-visor MODsuit node
#define MOD_MODULE_VISOR					(1<<6)

/// Module is exosuit ballistic weapon
#define EXISUIT_WEAPON_MODULE_BALLISTIC		(1<<0)
/// Module is exosuit ballistic weapon
#define EXISUIT_WEAPON_MODULE_ENERGY		(1<<1)
/// Module is exosuit launcher or missile weapon
#define EXISUIT_WEAPON_MODULE_AOE			(1<<2)
/// Module is exosuit department modules
#define EXISUIT_MODULE_NONWEAPON			(1<<3)

/// MOD part is construction type
#define MOD_CONSTRUCTION					(1<<0)
/// MOD part is a plating
#define MOD_PLATING							(1<<1)

// BLUEMOON ADD END
