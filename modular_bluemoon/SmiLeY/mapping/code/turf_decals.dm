/obj/effect/turf_decal/bluemoon_decals
	icon = 'icons/turf/decals.dmi'
	icon_state = "bad_coder"

/obj/effect/decal/fakelattice/passthru	//Why the hell did TG make it dense anyways
	density = FALSE

///SYNDICATE EMBLEM///
//Bottom
/obj/effect/turf_decal/bluemoon_decals/syndicate/bottom/left
	icon_state = "1,1"

/obj/effect/turf_decal/bluemoon_decals/syndicate/bottom/middle
	icon_state = "1,2"

/obj/effect/turf_decal/bluemoon_decals/syndicate/bottom/right
	icon_state = "1,3"
//Middle
/obj/effect/turf_decal/bluemoon_decals/syndicate/middle/left
	icon_state = "2,1"

/obj/effect/turf_decal/bluemoon_decals/syndicate/middle/middle
	icon_state = "2,2"

/obj/effect/turf_decal/bluemoon_decals/syndicate/middle/right
	icon_state = "2,3"
//Top
/obj/effect/turf_decal/bluemoon_decals/syndicate/top/left
	icon_state = "3,1"

/obj/effect/turf_decal/bluemoon_decals/syndicate/top/middle
	icon_state = "3,2"

/obj/effect/turf_decal/bluemoon_decals/syndicate/top/right
	icon_state = "3,3"

///ENCLAVE EMBLEM///
/obj/effect/turf_decal/bluemoon_decals/enclave
	layer = TURF_PLATING_DECAL_LAYER
	alpha = 110
	color = "#A46106"
//Bottom
/obj/effect/turf_decal/bluemoon_decals/enclave/bottom/left
	icon_state = "e1,1"

/obj/effect/turf_decal/bluemoon_decals/enclave/bottom/middle
	icon_state = "e1,2"

/obj/effect/turf_decal/bluemoon_decals/enclave/bottom/right
	icon_state = "e1,3"
//Middle
/obj/effect/turf_decal/bluemoon_decals/enclave/middle/left
	icon_state = "e2,1"

/obj/effect/turf_decal/bluemoon_decals/enclave/middle/middle
	icon_state = "e2,2"

/obj/effect/turf_decal/bluemoon_decals/enclave/middle/right
	icon_state = "e2,3"
//Top
/obj/effect/turf_decal/bluemoon_decals/enclave/top/left
	icon_state = "e3,1"

/obj/effect/turf_decal/bluemoon_decals/enclave/top/middle
	icon_state = "e3,2"

/obj/effect/turf_decal/bluemoon_decals/enclave/top/right
	icon_state = "e3,3"

//SOLGOV//
/obj/effect/turf_decal/solgov/all
	icon_state = "top-left-all"

/obj/effect/turf_decal/solgov/all/top
	icon_state = "top-center-all"

/obj/effect/turf_decal/solgov/all/top_right
	icon_state = "top-right-all"

/obj/effect/turf_decal/solgov/all/center_left
	icon_state = "center-left-all"

/obj/effect/turf_decal/solgov/all/center
	icon_state = "center-all"

/obj/effect/turf_decal/solgov/all/center_right
	icon_state = "center-right-all"

/obj/effect/turf_decal/solgov/all/bottom_left
	icon_state = "bottom-left-all"

/obj/effect/turf_decal/solgov/all/bottom_center
	icon_state = "bottom-center-all"

/obj/effect/turf_decal/solgov/all/bottom_right
	icon_state = "bottom-right-all"

///Departments///
/obj/effect/turf_decal/bluemoon_decals/departments/bridge
	icon_state = "bridge"

///DS-2 Sign///
/obj/effect/turf_decal/bluemoon_decals/ds2/left
	icon_state = "ds1"

/obj/effect/turf_decal/bluemoon_decals/ds2/middle
	icon_state = "ds2"

/obj/effect/turf_decal/bluemoon_decals/ds2/right
	icon_state = "ds3"

///Misc///
/obj/effect/turf_decal/bluemoon_decals/misc/handicapped
	icon_state = "handicapped"

//Re-textures based off the survival pods, without the orange stripe. Now you can re-color them to paint your spaceships!
//(Do faded tones - DONT USE NEON BRIGHT COLORS, I /WILL/ CRY, and your ship will look like literal crap)
//Also make sure you properly var-edit everything hnngh

/turf/closed/wall/mineral/titanium/spaceship
	icon = 'modular_bluemoon/SmiLeY/mapping/icons/shipwalls.dmi'
	icon_state = "ship_walls-0"
	base_icon_state = "ship_walls"
	sheet_type = /obj/item/stack/sheet/spaceship

/obj/item/stack/sheet/spaceship
	name = "spaceship plating"
	desc = "A metal sheet made out of a titanium alloy, rivited for use in spaceship walls."
	icon = 'modular_bluemoon/SmiLeY/mapping/icons/shipstacks.dmi'
	icon_state = "sheet-spaceship"
	item_state = "sheet-plastitaniumglass"
	singular_name = "spaceship plate"
	sheettype = "spaceship"
	merge_type = /obj/item/stack/sheet/spaceship
	walltype = /turf/closed/wall/mineral/titanium/spaceship

/obj/item/stack/sheet/spaceshipglass
	name = "spaceship window plates"
	desc = "A glass sheet made out of a titanium-silicate alloy, rivited for use in spaceship window frames."
	icon = 'modular_bluemoon/SmiLeY/mapping/icons/shipstacks.dmi'
	icon_state = "sheet-spaceshipglass"
	item_state = "sheet-plastitaniumglass"
	singular_name = "spaceship window plate"
	merge_type = /obj/item/stack/sheet/spaceshipglass

GLOBAL_LIST_INIT(spaceshipglass_recipes, list(
	new/datum/stack_recipe("spaceship window", /obj/structure/window/shuttle/spaceship/unanchored, 2, time = 4 SECONDS, window_checks = TRUE), \
	))

/obj/item/stack/sheet/spaceshipglass/get_main_recipes()
	. = ..()
	. += GLOB.spaceshipglass_recipes

/turf/closed/wall/mineral/titanium/spaceship/nodiagonal
	icon_state = "map-shuttle_nd"

/turf/closed/wall/mineral/titanium/spaceship/nosmooth
	icon_state = "ship_walls-0"
	smoothing_flags = NONE

/turf/closed/wall/mineral/titanium/spaceship/overspace
	icon_state = "map-overspace"
	fixed_underlay = list("space" = TRUE)

/turf/closed/wall/mineral/titanium/spaceship/interior/copyTurf(turf/T)
	if(T.type != type)
		T.ChangeTurf(type)
		if(underlays.len)
			T.underlays = underlays
	if(T.icon_state != icon_state)
		T.icon_state = icon_state
	if(T.icon != icon)
		T.icon = icon
	if(color)
		T.atom_colours = atom_colours.Copy()
		T.update_atom_colour()
	if(T.dir != dir)
		T.setDir(dir)
	T.transform = transform
	return T

/turf/closed/wall/mineral/titanium/spaceship/copyTurf(turf/T)
	. = ..()
	T.transform = transform

/obj/structure/window/shuttle/spaceship
	name = "spaceship window"
	desc = "A pressure-resistant spaceship window."
	icon = 'modular_bluemoon/SmiLeY/mapping/icons/shipwindows.dmi'
	icon_state = "pod_window-0"
	base_icon_state = "pod_window"
	glass_type = /obj/item/stack/sheet/spaceshipglass

/obj/structure/window/shuttle/spaceship/tinted
	opacity = TRUE

/obj/structure/window/shuttle/spaceship/unanchored
	anchored = FALSE
