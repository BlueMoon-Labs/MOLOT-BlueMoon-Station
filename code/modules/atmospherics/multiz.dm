/// This is an atmospherics pipe which can relay air up/down a deck.
/obj/machinery/atmospherics/pipe/simple/multiz
	name = "multi deck pipe adapter"
	desc = "An adapter which allows pipes to connect to other pipenets on different decks."
	icon = 'icons/obj/multiz.dmi'
	icon_state = "adapter-2"

	dir = SOUTH
	initialize_directions = SOUTH

	layer = HIGH_OBJ_LAYER
	device_type = TRINARY
	pipe_state = "multiz"

	///Our central icon
	var/mutable_appearance/center = null
	///The pipe icon
	var/mutable_appearance/pipe = null
	///Reference to the node
	var/obj/machinery/atmospherics/front_node = null

/obj/machinery/atmospherics/pipe/simple/multiz/New()
	icon_state = ""
	center = mutable_appearance(icon, "adapter_center", layer = HIGH_OBJ_LAYER)
	pipe = mutable_appearance(icon, "pipe-[piping_layer]")
	return ..()

/obj/machinery/atmospherics/pipe/simple/multiz/proc/set_init_directions()
	initialize_directions = dir

/obj/machinery/atmospherics/pipe/simple/multiz/update_overlays()
	. = ..()
	pipe.color = front_node ? front_node.pipe_color : rgb(255, 255, 255)
	pipe.icon_state = "pipe-[piping_layer]"
	. += pipe
	center.pixel_x = PIPING_LAYER_P_X * (piping_layer - PIPING_LAYER_DEFAULT)
	. += center

// /obj/machinery/atmospherics/pipe/simple/multiz/update_icon()
// 	. = ..()
// 	cut_overlays() //This adds the overlay showing it's a multiz pipe. This should go above turfs and such
// 	var/image/multiz_overlay_node = new(src) //If we have a firing state, light em up!
// 	multiz_overlay_node.icon = 'icons/obj/atmos.dmi'
// 	multiz_overlay_node.icon_state = "multiz_pipe"
// 	multiz_overlay_node.layer = HIGH_OBJ_LAYER
// 	add_overlay(multiz_overlay_node)

///Attempts to locate a multiz pipe that's above us, if it finds one it merges us into its pipenet
/obj/machinery/atmospherics/pipe/simple/multiz/pipeline_expansion()
	icon = 'icons/obj/atmos.dmi' //Just to refresh.
	var/turf/T = get_turf(src)
	var/obj/machinery/atmospherics/pipe/simple/multiz/above = locate(/obj/machinery/atmospherics/pipe/simple/multiz) in(SSmapping.get_turf_above(T))
	var/obj/machinery/atmospherics/pipe/simple/multiz/below = locate(/obj/machinery/atmospherics/pipe/simple/multiz) in(SSmapping.get_turf_below(T))
	if(below)
		below.pipeline_expansion() //If we've got one below us, force it to add us on facebook
	if(above)
		nodes += above
		above.nodes += src //Two way travel :)
	return ..()
