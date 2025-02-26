/obj/machinery/autolathe/makeshift
	icon = 'modular_bluemoon/icons/obj/makeshift_autolathe.dmi'
	name = "makeshift autolathe"
	desc = "It produces items using metal and glass."
	icon_state = "autolathe"
	density = TRUE
	use_power = NO_POWER_USE
	idle_power_usage = 0
	active_power_usage = 0
	circuit = /obj/item/circuitboard/machine/autolathe_makeshift
	layer = BELOW_OBJ_LAYER

	categories = list(
							"Tools",
							"Electronics",
							"Construction",
							"T-Comm",
							"Security",
							"Machinery",
							"Medical",
							"Misc",
							"Imported",
							"mining"
							)

/obj/machinery/autolathe/makeshift/Initialize(mapload)
	. = ..()
	if(stored_research)
		QDEL_NULL(stored_research)
	stored_research = new /datum/techweb/specialized/autounlocking/autolathe/makeshift

/datum/design/makeshiftlathe
	build_type = MAKESHIFTLATHE

/datum/design/makeshiftlathe/drill
	name = "mining drill"
	id = "mining drill"
	build_type = MAKESHIFTLATHE
	materials = list(/datum/material/iron = 1000)
	build_path = /obj/item/pickaxe/drill
	category = list("initial","mining")

/datum/design/makeshiftlathe/ore_bag
	name = "mining satchel"
	id = "mining satchel"
	build_type = MAKESHIFTLATHE
	materials = list(/datum/material/iron = 1000)
	build_path = /obj/item/storage/bag/ore
	category = list("initial","mining")

/datum/design/makeshiftlathe/glowstick
	name = "glowstick"
	id = "glowstick"
	build_type = MAKESHIFTLATHE
	materials = list(/datum/material/glass = 150)
	build_path = /obj/item/flashlight/glowstick
	category = list("initial","mining")

/datum/design/makeshiftlathe/mining_scanner
	name = "mining scanner"
	id = "mining scanner"
	build_type = MAKESHIFTLATHE
	materials = list(/datum/material/glass = 150)
	build_path = /obj/item/t_scanner/adv_mining_scanner/lesser
	category = list("initial","mining")
