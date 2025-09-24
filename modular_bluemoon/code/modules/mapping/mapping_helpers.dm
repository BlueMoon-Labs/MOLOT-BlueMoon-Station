/obj/effect/mapping_helpers/airlock/autoname
	name = "airlock autoname helper"
	icon_state = "airlock_autoname"

/obj/effect/mapping_helpers/airlock/autoname/payload(obj/machinery/door/airlock/airlock)
	if(airlock.autoname)
		log_mapping("[src] at [AREACOORD(src)] tried to autoname the [airlock] but it's already autonamed!")
	else
		airlock.autoname = TRUE
