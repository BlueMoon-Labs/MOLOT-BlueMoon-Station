//Space Ruin Parents

/area/ruin/space
	has_gravity = FALSE
	area_flags = UNIQUE_AREA

/area/ruin/space/has_grav
	has_gravity = STANDARD_GRAVITY
	ambientsounds = AWAY_MISSION

/area/ruin/space/has_grav/powered
	requires_power = FALSE

/area/ruin/fakespace
	icon_state = "space"
	requires_power = TRUE
	always_unpowered = TRUE
	dynamic_lighting = DYNAMIC_LIGHTING_DISABLED
	has_gravity = FALSE
	power_light = FALSE
	power_equip = FALSE
	power_environ = FALSE
	outdoors = TRUE
	ambientsounds = SPACE

/////////////

/area/ruin/space/way_home
	name = "\improper Salvation"
	icon_state = "away"
	always_unpowered = FALSE

// Ruins of "onehalf" ship

/area/ruin/space/has_grav/onehalf/hallway
	name = "Hallway"
	icon_state = "hallC"

/area/ruin/space/has_grav/onehalf/drone_bay
	name = "Mining Drone Bay"
	icon_state = "engine"

/area/ruin/space/has_grav/onehalf/dorms_med
	name = "Crew Quarters"
	icon_state = "Sleep"

/area/ruin/space/has_grav/onehalf/bridge
	name = "Bridge"
	icon_state = "bridge"



/area/ruin/space/has_grav/powered/dinner_for_two
	name = "Dinner for Two"

/area/ruin/space/has_grav/powered/cat_man
	name = "Kitty Den"

/area/ruin/space/has_grav/powered/authorship
	name = "Authorship"

/area/ruin/space/has_grav/powered/aesthetic
	name = "Aesthetic"
	ambientsounds = list('sound/ambience/ambivapor1.ogg')


//Ruin of Hotel

/area/ruin/space/has_grav/bluemoon/hotel
	name = "Hotel"

/area/ruin/space/has_grav/bluemoon/hotel/guestroom
	name = "Hotel Guest Room"
	icon_state = "Sleep"

/area/ruin/space/has_grav/bluemoon/hotel/guestroom/room_1
	name = "Hotel Guest Room 1"

/area/ruin/space/has_grav/bluemoon/hotel/guestroom/room_2
	name = "Hotel Guest Room 2"

/area/ruin/space/has_grav/bluemoon/hotel/guestroom/room_3
	name = "Hotel Guest Room 3"

/area/ruin/space/has_grav/bluemoon/hotel/guestroom/room_4
	name = "Hotel Guest Room 4"

/area/ruin/space/has_grav/bluemoon/hotel/guestroom/room_5
	name = "Hotel Guest Room 5"

/area/ruin/space/has_grav/bluemoon/hotel/guestroom/room_6
	name = "Hotel Guest Room 6"

/area/ruin/space/has_grav/bluemoon/hotel/security
	name = "Hotel Security Post"
	icon_state = "security"

/area/ruin/space/has_grav/bluemoon/hotel/pool
	name = "Hotel Pool Room"
	icon_state = "fitness"

/area/ruin/space/has_grav/bluemoon/hotel/bar
	name = "Hotel Bar"
	icon_state = "cafeteria"

/area/ruin/space/has_grav/bluemoon/hotel/power
	name = "Hotel Power Room"
	icon_state = "engine_smes"

/area/ruin/space/has_grav/bluemoon/hotel/custodial
	name = "Hotel Custodial Closet"
	icon_state = "janitor"

/area/ruin/space/has_grav/bluemoon/hotel/shuttle
	name = "Hotel Shuttle"
	icon_state = "shuttle"
	requires_power = FALSE

/area/ruin/space/has_grav/bluemoon/hotel/dock
	name = "Hotel Shuttle Dock"
	icon_state = "start"

/area/ruin/space/has_grav/bluemoon/hotel/workroom
	name = "Hotel Staff Room"
	icon_state = "crew_quarters"


//Ruin of Space Diner

/area/ruin/space/diner
	name = "Space Diner"
	area_flags = UNIQUE_AREA

/area/ruin/space/diner/interior
	name = "Space Diner"
	icon_state = "maintbar"
	has_gravity = STANDARD_GRAVITY

/area/ruin/space/diner/solars
	name = "Space Diner Solar Array"
	icon_state = "yellow"
	requires_power = FALSE
	dynamic_lighting = DYNAMIC_LIGHTING_IFSTARLIGHT
	flags_1 = NONE
	ambientsounds = ENGINEERING

//Ruin of "Skelter" ship

/area/ruin/space/has_grav/skelter
	name = "The Skelter"
	icon_state = "red"

/area/ruin/space/has_grav/skelter/admin
	name = "Administration"
	icon_state = "bridge"

/area/ruin/space/has_grav/skelter/comms
	name = "Communications"
	icon_state = "tcomsatcomp"

/area/ruin/space/has_grav/skelter/sec
	name = "Security Office"
	icon_state = "security"

/area/ruin/space/has_grav/skelter/cafe
	name = "Cafeteria"
	icon_state = "cafeteria"

/area/ruin/space/has_grav/skelter/crew
	name = "Crew Quarters"
	icon_state = "crew_quarters"

/area/ruin/space/has_grav/skelter/med
	name = "Med Bay"
	icon_state = "medbay3"

/area/ruin/space/has_grav/skelter/engine
	name = "Reactor"
	icon_state = "engine"

/area/ruin/space/has_grav/skelter/engine/upper
	name = "Port Engine"

/area/ruin/space/has_grav/skelter/engine/lower
	name = "Starboard Engine"

/area/ruin/space/has_grav/skelter/engine/powerstorage
	name = "Electrical"
	icon_state = "engine_smes"

/area/ruin/space/has_grav/skelter/oxy
	name = "02"
	icon_state = "atmos"

/area/ruin/space/has_grav/skelter/nav
	name = "Navigation"
	icon_state = "start"

/area/ruin/space/has_grav/skelter/forehall
	name = "Forward Hallway"
	icon_state = "hallF"

/area/ruin/space/has_grav/skelter/afthall
	name = "Aft Hallway"
	icon_state = "hallA"

/area/ruin/space/has_grav/skelter/storage
	name = "Storage"
	icon_state = "storage"

/area/ruin/space/has_grav/skelter/shields
	name = "Shields"
	icon_state = "green"

//Ruin of Derelict Oupost

/area/ruin/space/has_grav/derelictoutpost
	name = "Derelict Outpost"
	icon_state = "green"

/area/ruin/space/has_grav/derelictoutpost/cargostorage
	name = "Derelict Outpost Cargo Storage"
	icon_state = "storage"

/area/ruin/space/has_grav/derelictoutpost/cargobay
	name = "Derelict Outpost Cargo Bay"
	icon_state = "quartstorage"

/area/ruin/space/has_grav/derelictoutpost/powerstorage
	name = "Derelict Outpost Power Storage"
	icon_state = "engine_smes"

/area/ruin/space/has_grav/derelictoutpost/dockedship
	name = "Derelict Outpost Docked Ship"
	icon_state = "red"


//Ruin of Space Bar

/area/ruin/space/has_grav/powered/spacebar
	name = "Space Bar"
	icon_state = "bar"

//Ruin of turretedoutpost

/area/ruin/space/has_grav/turretedoutpost
	name = "Turreted Outpost"
	icon_state = "red"


//Ruin of old teleporter

/area/ruin/space/oldteleporter
	name = "Old Teleporter"
	icon_state = "teleporter"


//Ruin of mech transport

/area/ruin/space/has_grav/powered/mechtransport
	name = "Mech Transport"
	icon_state = "green"


//Ruin of gas the lizard

/area/ruin/space/has_grav/gasthelizard
	name = "Gas the lizard"


//Ruin of Deep Storage

/area/ruin/space/has_grav/deepstorage
	name = "Deep Storage"
	icon_state = "storage"

/area/ruin/space/has_grav/deepstorage/airlock
	name = "Deep Storage Airlock"
	icon_state = "quart"

/area/ruin/space/has_grav/deepstorage/power
	name = "Deep Storage Power and Atmospherics Room"
	icon_state = "engi_storage"

/area/ruin/space/has_grav/deepstorage/hydroponics
	name = "Deep Storage Hydroponics"
	icon_state = "garden"

/area/ruin/space/has_grav/deepstorage/armory
	name = "Deep Storage Secure Storage"
	icon_state = "armory"

/area/ruin/space/has_grav/deepstorage/storage
	name = "Deep Storage Storage"
	icon_state = "storage_wing"

/area/ruin/space/has_grav/deepstorage/dorm
	name = "Deep Storage Dormitory"
	icon_state = "crew_quarters"

/area/ruin/space/has_grav/deepstorage/kitchen
	name = "Deep Storage Kitchen"
	icon_state = "kitchen"

/area/ruin/space/has_grav/deepstorage/crusher
	name = "Deep Storage Recycler"
	icon_state = "storage"


//Ruin of Abandoned Zoo

/area/ruin/space/has_grav/abandonedzoo
	name = "Abandoned Zoo"
	icon_state = "green"


//Ruin of ancient Space Station

/area/ruin/space/has_grav/ancientstation
	name = "Charlie Station Main Corridor"
	icon_state = "green"

/area/ruin/space/has_grav/ancientstation/powered
	name = "Powered Tile"
	icon_state = "teleporter"
	requires_power = FALSE

/area/ruin/space/has_grav/ancientstation/space
	name = "Exposed To Space"
	icon_state = "teleporter"
	has_gravity = FALSE

/area/ruin/space/has_grav/ancientstation/atmo
	name = "Beta Station Atmospherics"
	icon_state = "red"
	// ambience_index = AMBIENCE_ENGI
	ambientsounds = ENGINEERING
	has_gravity = TRUE

/area/ruin/space/has_grav/ancientstation/betanorth
	name = "Beta Station North Corridor"
	icon_state = "blue"

/area/ruin/space/has_grav/ancientstation/solar
	name = "Station Solar Array"
	icon_state = "panelsAP"

/area/ruin/space/has_grav/ancientstation/betacorridor
	name = "Beta Station Main Corridor"
	icon_state = "bluenew"

/area/ruin/space/has_grav/ancientstation/engi
	name = "Charlie Station Engineering"
	icon_state = "engine"
	// ambience_index = AMBIENCE_ENGI
	ambientsounds = ENGINEERING

/area/ruin/space/has_grav/ancientstation/comm
	name = "Charlie Station Command"
	icon_state = "captain"

/area/ruin/space/has_grav/ancientstation/hydroponics
	name = "Charlie Station Hydroponics"
	icon_state = "garden"

/area/ruin/space/has_grav/ancientstation/kitchen
	name = "Charlie Station Kitchen"
	icon_state = "kitchen"

/area/ruin/space/has_grav/ancientstation/sec
	name = "Charlie Station Security"
	icon_state = "red"

/area/ruin/space/has_grav/ancientstation/deltacorridor
	name = "Delta Station Main Corridor"
	icon_state = "green"

/area/ruin/space/has_grav/ancientstation/proto
	name = "Delta Station Prototype Lab"
	icon_state = "toxlab"

/area/ruin/space/has_grav/ancientstation/rnd
	name = "Delta Station Research and Development"
	icon_state = "toxlab"

/area/ruin/space/has_grav/ancientstation/hivebot
	name = "Hivebot Mothership"
	icon_state = "teleporter"

/area/ruin/space/has_grav/ancientstation/deltaai
	name = "Delta Station AI Core"
	icon_state = "ai"
	ambientsounds = list('sound/ambience/ambimalf.ogg', 'sound/ambience/ambitech.ogg', 'sound/ambience/ambitech2.ogg', 'sound/ambience/ambiatmos.ogg', 'sound/ambience/ambiatmos2.ogg')

/area/ruin/space/has_grav/ancientstation/mining
	name = "Beta Station Mining Equipment"
	icon_state = "mining"

/area/ruin/space/has_grav/ancientstation/medbay
	name = "Beta Station Medbay"
	icon_state = "medbay"

/area/ruin/space/has_grav/ancientstation/betastorage
	name = "Beta Station Storage"
	icon_state = "storage"

/area/solars/ancientstation
	name = "Charlie Station Solar Array"
	icon_state = "panelsP"

//DERELICT

/area/ruin/space/derelict
	name = "Derelict Station"
	icon_state = "storage"

/area/ruin/space/derelict/hallway/primary
	name = "Derelict Primary Hallway"
	icon_state = "hallP"

/area/ruin/space/derelict/hallway/secondary
	name = "Derelict Secondary Hallway"
	icon_state = "hallS"

/area/ruin/space/derelict/hallway/primary/port
	name = "Derelict Port Hallway"
	icon_state = "hallFP"

/area/ruin/space/derelict/arrival
	name = "Derelict Arrival Centre"
	icon_state = "yellow"

/area/ruin/space/derelict/storage/equipment
	name = "Derelict Equipment Storage"

/area/ruin/space/derelict/storage/storage_access
	name = "Derelict Storage Access"

/area/ruin/space/derelict/storage/engine_storage
	name = "Derelict Engine Storage"
	icon_state = "green"

/area/ruin/space/derelict/bridge
	name = "Derelict Control Room"
	icon_state = "bridge"

/area/ruin/space/derelict/secret
	name = "Derelict Secret Room"
	icon_state = "library"

/area/ruin/space/derelict/bridge/access
	name = "Derelict Control Room Access"
	icon_state = "auxstorage"

/area/ruin/space/derelict/bridge/ai_upload
	name = "Derelict Computer Core"
	icon_state = "ai"

/area/ruin/space/derelict/solar_control
	name = "Derelict Solar Control"
	icon_state = "engine"

/area/ruin/space/derelict/se_solar
	name = "South East Solars"
	icon_state = "engine"

/area/ruin/space/derelict/crew_quarters
	name = "Derelict Crew Quarters"
	icon_state = "fitness"

/area/ruin/space/derelict/medical
	name = "Derelict Medbay"
	icon_state = "medbay"

/area/ruin/space/derelict/medical/morgue
	name = "Derelict Morgue"
	icon_state = "morgue"

/area/ruin/space/derelict/medical/chapel
	name = "Derelict Chapel"
	icon_state = "chapel"

/area/ruin/space/derelict/teleporter
	name = "Derelict Teleporter"
	icon_state = "teleporter"

/area/ruin/space/derelict/eva
	name = "Derelict EVA Storage"
	icon_state = "eva"

/area/ruin/space/derelict/ship
	name = "Abandoned Ship"
	icon_state = "yellow"

/area/ruin/space/solars/derelict_starboard
	name = "Derelict Starboard Solar Array"
	icon_state = "panelsS"

/area/ruin/space/solars/derelict_aft
	name = "Derelict Aft Solar Array"
	icon_state = "yellow"

/area/ruin/space/derelict/singularity_engine
	name = "Derelict Singularity Engine"
	icon_state = "engine"

/area/ruin/space/derelict/gravity_generator
	name = "Derelict Gravity Generator Room"
	icon_state = "red"

/area/ruin/space/derelict/atmospherics
	name = "Derelict Atmospherics"
	icon_state = "red"

/area/ruin/space/derelict/assembly_line
	name = "Assembly Line"
	icon_state = "ass_line"
	power_equip = FALSE
	power_light = FALSE
	power_environ = FALSE

//Port Tarkon

/area/ruin/space/has_grav/bluemoon/port_tarkon
	name = "P-T Cryo-Storage"
	always_unpowered = FALSE
	ambientsounds = HIGHSEC

/area/ruin/space/has_grav/bluemoon/port_tarkon/afthall
	name = "P-T Aft Hallway"

/area/ruin/space/has_grav/bluemoon/port_tarkon/forehall
	name = "P-T Fore Hallway"

/area/ruin/space/has_grav/bluemoon/port_tarkon/starboardhall
	name = "P-T Starboard Hallway"

/area/ruin/space/has_grav/bluemoon/port_tarkon/porthall
	name = "P-T Port Hallway"

/area/ruin/space/has_grav/bluemoon/port_tarkon/trauma
	name = "P-T Trauma Center"
	icon_state = "medbay1"

/area/ruin/space/has_grav/bluemoon/port_tarkon/developement
	name = "P-T Developement Center"
	icon_state = "research"

/area/ruin/space/has_grav/bluemoon/port_tarkon/comms
	name = "P-T Communication Center"
	icon_state = "captain"

/area/ruin/space/has_grav/bluemoon/port_tarkon/power1
	name = "P-T Solar Control"
	icon_state = "engine"

/area/ruin/space/has_grav/bluemoon/port_tarkon/centerhall
	name = "P-T Central Hallway"
	icon_state = "hallC"

/area/ruin/space/has_grav/bluemoon/port_tarkon/secoff
	name = "P-T Security Office"
	icon_state = "security"

/area/ruin/space/has_grav/bluemoon/port_tarkon/atmos
	name = "P-T Atmospheric Center"
	icon_state = "engine"

/area/ruin/space/has_grav/bluemoon/port_tarkon/kitchen
	name = "P-T Kitchen"
	icon_state = "cafeteria"

/area/ruin/space/has_grav/bluemoon/port_tarkon/garden
	name = "P-T Garden"
	icon_state = "garden"

/area/ruin/space/has_grav/bluemoon/port_tarkon/cargo
	name = "P-T Cargo Center"
	icon_state = "cargo"

/area/ruin/space/has_grav/bluemoon/port_tarkon/mining
	name = "P-T Mining Office"
	icon_state = "cargo"

/area/ruin/space/has_grav/bluemoon/port_tarkon/storage
	name = "P-T Warehouse"
	icon_state = "cargo"

/area/ruin/space/has_grav/bluemoon/port_tarkon/toolstorage
	name = "P-T Tool Storage"
	icon_state = "tool_storage"

/area/ruin/space/has_grav/bluemoon/port_tarkon/observ
	name = "P-T Observatory"
	icon_state = "crew_quarters"

/area/ruin/space/has_grav/bluemoon/port_tarkon/dorms
	name = "P-T Dorms"
	icon_state = "crew_quarters"

/area/solars/tarkon
	name = "\improper P-T Solar Array"
	icon_state = "solarsS"
	has_gravity = STANDARD_GRAVITY

//Deep Space 2.
///DS-2 'Blessed', Forward Operating Base
/area/ruin/space/has_grav/bluemoon/deepspacetwo
	name = "DS-2" //If DS-1 is so great...
	icon = 'icons/area/areas_centcom.dmi'
	icon_state = "syndie-ship"

//Cargo
/area/ruin/space/has_grav/bluemoon/deepspacetwo/cargo
	name = "DS-2 'Blessed' | Warehouse"

/area/ruin/space/has_grav/bluemoon/deepspacetwo/cargo/hangar
	name = "DS-2 'Blessed' | Hangar"

//Bridge
/area/ruin/space/has_grav/bluemoon/deepspacetwo/bridge
	name = "DS-2 'Blessed' | Bridge"
	icon_state = "syndie-control"

/area/ruin/space/has_grav/bluemoon/deepspacetwo/bridge/cl
	name = "DS-2 'Blessed' | Corporate Liaison's Office"
	sound_environment = SOUND_AREA_WOODFLOOR

/area/ruin/space/has_grav/bluemoon/deepspacetwo/bridge/admiral
	name = "DS-2 'Blessed' | Station Admiral's Office"
	sound_environment = SOUND_AREA_WOODFLOOR

/area/ruin/space/has_grav/bluemoon/deepspacetwo/bridge/vault
	name = "DS-2 'Blessed' | Vault"

/area/ruin/space/has_grav/bluemoon/deepspacetwo/bridge/eva
	name = "DS-2 'Blessed' | E.V.A."

//Security
/area/ruin/space/has_grav/bluemoon/deepspacetwo/security
	name = "DS-2 'Blessed' | Security"
	ambientsounds = HIGHSEC
/area/ruin/space/has_grav/bluemoon/deepspacetwo/security/armory
	name = "DS-2 'Blessed' | Armory"

/area/ruin/space/has_grav/bluemoon/deepspacetwo/security/lawyer
	name = "DS-2 'Blessed' | Interrogation Office"

/area/ruin/space/has_grav/bluemoon/deepspacetwo/security/prison
	name = "DS-2 'Blessed' | Long-Term Brig"

//Service
/area/ruin/space/has_grav/bluemoon/deepspacetwo/service
	name = "DS-2 'Blessed' | Service Wing"

/area/ruin/space/has_grav/bluemoon/deepspacetwo/service/diner
	name = "DS-2 'Blessed' | Diner"

/area/ruin/space/has_grav/bluemoon/deepspacetwo/service/dorms
	name = "DS-2 'Blessed' | Dormitories"

/area/ruin/space/has_grav/bluemoon/deepspacetwo/service/dorms/fitness
	name = "DS-2 'Blessed' | Fitness Room"

/area/ruin/space/has_grav/bluemoon/deepspacetwo/service/lounge
	name = "DS-2 'Blessed' | Lounge"

/area/ruin/space/has_grav/bluemoon/deepspacetwo/service/hydroponics
	name = "DS-2 'Blessed' | Hydroponics"

//Hallways
/area/ruin/space/has_grav/bluemoon/deepspacetwo/halls
	name = "DS-2 'Blessed' | Central Halls"

//Engineering
/area/ruin/space/has_grav/bluemoon/deepspacetwo/engineering
	name = "DS-2 'Blessed' | Engineering"

//Research
/area/ruin/space/has_grav/bluemoon/deepspacetwo/research
	name = "DS-2 'Blessed' | Research"

//Medbay
/area/ruin/space/has_grav/bluemoon/deepspacetwo/medbay
	name = "DS-2 'Blessed' | Medical Bay"

/area/ruin/space/has_grav/bluemoon/deepspacetwo/medbay/chem
	name = "DS-2 'Blessed' | Chemistry"

/area/ruin/space/has_grav/shuttle8532engineering
	name = "Shuttle 8532 Engine Room"

/area/ruin/space/has_grav/shuttle8532researchbay
	name = "Shuttle 8532 Research Bay"

/area/ruin/space/has_grav/shuttle8532cargohall
	name = "Shuttle 8532 Cargo Hall"

/area/ruin/space/has_grav/shuttle8532crewquarters
	name = "Shuttle 8532 Crew Quarters"

/area/ruin/space/has_grav/shuttle8532bridge
	name = "Shuttle 8532 Bridge"

/area/ruin/space/has_grav/vaulttango
	name = "ARBORLINK Vault Tango"

/area/ruin/space/has_grav/waypoint
	name = "Abandoned Station"

/area/ruin/space/has_grav/powered/toy_store
	name = "Toy Store"

/area/ruin/space/has_grav/powered/prison_shuttle
	name = "Prison Shuttle"

/area/ruin/space/has_grav/powered/posterpandamonium
	name = "Strange Shuttle"

//DJSTATION

/area/ruin/space/djstation
	name = "Ruskie DJ Station"
	icon_state = "DJ"
	has_gravity = STANDARD_GRAVITY

/area/ruin/space/djstation/solars
	name = "DJ Station Solars"
	icon_state = "DJ"
	has_gravity = STANDARD_GRAVITY

//ABANDONED TELEPORTER

/area/ruin/space/abandoned_tele
	name = "Abandoned Teleporter"
	icon_state = "teleporter"
	ambientsounds = list('sound/ambience/ambimalf.ogg', 'sound/ambience/signal.ogg')

//OLD AI SAT

/area/ruin/space/old_ai_sat/ai
	name = "AI Chamber"
	icon_state = "ai"
	ambientsounds = list('sound/ambience/ambimalf.ogg')

/area/ruin/space/old_ai_sat/main
	name = "Wreck"
	icon_state = "storage"

/area/ruin/space/old_ai_sat/engineering
	name = "Power Room"
	icon_state = "engine"

/area/ruin/space/old_ai_sat/bridge
	name = "Bridge"
	icon_state = "bridge"


//ABANDONED BOX WHITESHIP

/area/ruin/space/has_grav/whiteship/box

	name = "Abandoned Ship"
	icon_state = "red"


//SYNDICATE LISTENING POST STATION

/area/ruin/space/has_grav/bluemoon/listeningstation
	name = "Listening Post"
	icon_state = "yellow"

/area/ruin/space/has_grav/powered/ancient_shuttle
	name = "Ancient Shuttle"
	icon_state = "yellow"

// Abductor Replication Lab
/area/ruin/space/has_grav/powered/advancedlab
	name = "Abductor Replication Lab"
	icon_state = "yellow"

//HELL'S FACTORY OPERATING FACILITY
// /area/ruin/space/has_grav/hellfactory
// 	name = "Hell Factory"
// 	icon_state = "yellow"

// /area/ruin/space/has_grav/hellfactoryoffice
// 	name = "Hell Factory Office"
// 	icon_state = "red"
// 	area_flags = VALID_TERRITORY | BLOBS_ALLOWED | UNIQUE_AREA | NOTELEPORT

//SYNDICATE DERELICT STATION

/area/ruin/space/has_grav/syndiederelict
	name = "Syndicate Derelict Station"
	icon_state = "red"

/area/ruin/space/has_grav/syndiederelict/engineering
	name = "Syndicate Derelict Engineering"
	icon_state = "construction"

/area/ruin/space/has_grav/syndiederelict/solars
	name = "Syndicate Derelict Solar Array"
	icon_state = "yellow"
	requires_power = FALSE
	dynamic_lighting = DYNAMIC_LIGHTING_IFSTARLIGHT

/area/ruin/space/has_grav/syndiederelict/hydroponics
	name = "Syndicate Derelict Hydroponics"
	icon_state = "hydro"

/area/ruin/space/has_grav/syndiederelict/kitchen
	name = "Syndicate Derelict Kitchen"
	icon_state = "kitchen"

/area/ruin/space/has_grav/syndiederelict/hallway
	name = "Syndicate Derelict Hallway"
	icon_state = "red"

/area/ruin/space/has_grav/syndiederelict/research
	name = "Syndicate Derelict Research Wing"
	icon_state = "toxlab"

/area/ruin/space/has_grav/syndiederelict/medbay
	name = "Syndicate Derelict Medical Bay"
	icon_state = "medbay"

/area/ruin/space/has_grav/syndiederelict/virology
	name = "Syndicate Derelict Virology"
	icon_state = "virology"
