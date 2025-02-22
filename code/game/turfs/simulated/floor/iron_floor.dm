/turf/open/floor/iron
	icon_state = "floor"
	floor_tile = /obj/item/stack/tile/plasteel
	broken_states = list("damaged1", "damaged2", "damaged3", "damaged4", "damaged5")
	burnt_states = list("floorscorched1", "floorscorched2")

/turf/open/floor/iron/rust_heretic_act()
	if(prob(70))
		new /obj/effect/temp_visual/glowing_rune(src)
	ChangeTurf(/turf/open/floor/plating/rust)

/turf/open/floor/iron/update_icon_state()			//sandstorm change - tile floofing
	if(broken || burnt)									//included - tile floofing
		return											//included - tile floofing
	icon_state = base_icon_state						//included - tile floofing

/turf/open/floor/iron/airless
	initial_gas_mix = AIRLESS_ATMOS
/turf/open/floor/iron/telecomms
	initial_gas_mix = TCOMMS_ATMOS


/turf/open/floor/iron/dark
	icon_state = "darkfull"
/turf/open/floor/iron/dark/airless
	initial_gas_mix = AIRLESS_ATMOS
/turf/open/floor/iron/dark/telecomms
	initial_gas_mix = TCOMMS_ATMOS
/turf/open/floor/iron/airless/dark
	icon_state = "darkfull"
/turf/open/floor/iron/dark/side
	icon_state = "dark"
/turf/open/floor/iron/dark/corner
	icon_state = "darkcorner"
/turf/open/floor/iron/checker
	icon_state = "checker"


/turf/open/floor/iron/white
	icon_state = "white"
/turf/open/floor/iron/white/side
	icon_state = "whitehall"
/turf/open/floor/iron/white/corner
	icon_state = "whitecorner"
/turf/open/floor/iron/airless/white
	icon_state = "white"
/turf/open/floor/iron/airless/white/side
	icon_state = "whitehall"
/turf/open/floor/iron/airless/white/corner
	icon_state = "whitecorner"
/turf/open/floor/iron/white/telecomms
	initial_gas_mix = TCOMMS_ATMOS

/turf/open/floor/iron/recharge_floor
	icon_state = "recharge_floor"

/turf/open/floor/iron/showroomfloor
	icon_state = "showroomfloor"


/turf/open/floor/iron/solarpanel
	icon_state = "solarpanel"

/turf/open/floor/iron/freezer
	icon_state = "freezerfloor"

/turf/open/floor/iron/grimy
	icon_state = "grimy"
	tiled_dirt = FALSE

/turf/open/floor/iron/cafeteria
	icon_state = "cafeteria"

/turf/open/floor/iron/cult
	icon_state = "cult"
	name = "engraved floor"

/turf/open/floor/iron/cult/narsie_act()
	return

/turf/open/floor/iron/stairs
	icon_state = "stairs"
	tiled_dirt = FALSE
/turf/open/floor/iron/stairs/left
	icon_state = "stairs-l"
/turf/open/floor/iron/stairs/medium
	icon_state = "stairs-m"
/turf/open/floor/iron/stairs/right
	icon_state = "stairs-r"
/turf/open/floor/iron/stairs/old
	icon_state = "stairs-old"


/turf/open/floor/iron/rockvault
	icon_state = "rockvault"
/turf/open/floor/iron/rockvault/alien
	icon_state = "alienvault"

/turf/open/floor/iron/elevatorshaft
	icon_state = "elevatorshaft"
