/obj/effect/decal/cleanable/fluidrip
	name = "fluid"
	density = 0
	layer = ABOVE_NORMAL_TURF_LAYER
	icon = 'modular_bluemoon/krashly/code/modules/sexfluids_limits/icons/drips.dmi'
	icon_state = "drip1"
	random_icon_states = list("drip1", "drip2", "drip3", "drip4", "drip5")

/obj/effect/decal/cleanable/fluidrip/replace_decal(obj/effect/decal/cleanable/fluidrip/C)
	. = ..()
	if(!. || QDELETED(src))
		return FALSE
	var/obj/effect/decal/cleanable/fluid/S = (locate(/obj/effect/decal/cleanable/fluid) in C.loc)
	if(S) // Merge ourselves into this puddle.
		reagents.trans_to(S, reagents.total_volume)
		S.transfer_blood_dna(blood_DNA)
		update_icon()
		return TRUE
	reagents.trans_to(C, reagents.total_volume)
	C.transfer_blood_dna(blood_DNA)
	if(C.reagents.total_volume >= 10) // Turn the drip into a puddle.
		S = new(C.loc)
		C.reagents.trans_to(S, C.reagents.total_volume)
		C.transfer_blood_dna(S.blood_DNA)
		S.update_icon()
		qdel(C)
	update_icon()

/obj/effect/decal/cleanable/fluidrip/update_icon()
	. = ..()
	add_atom_colour(mix_color_from_reagents(reagents.reagent_list), FIXED_COLOUR_PRIORITY)

///

/obj/effect/decal/cleanable/fluid
	name = "fluid"
	desc = null
	gender = PLURAL
	density = 0
	layer = ABOVE_NORMAL_TURF_LAYER
	icon = 'modular_bluemoon/krashly/code/modules/sexfluids_limits/icons/drips.dmi'
	icon_state = "pool"

/obj/effect/decal/cleanable/fluid/Initialize(mapload)
	. = ..()
	dir = GLOB.cardinals
	if(mapload)
		reagents.add_reagent(/datum/reagent/consumable/fluid, 10)
		add_blood_DNA(list("Non-human DNA" = "A+"))
	update_icon()

/obj/effect/decal/cleanable/fluid/replace_decal(obj/effect/decal/cleanable/fluid/S)
	if(reagents.total_volume > 0)
		reagents.trans_to(S.reagents, reagents.total_volume)
	if(blood_DNA)
		S.blood_DNA |= blood_DNA
		S.update_icon()
	return ..()

/obj/effect/decal/cleanable/fluid/update_icon()
	. = ..()
	if(QDELETED(src) || !reagents)
		return
	add_atom_colour(mix_color_from_reagents(reagents.reagent_list), FIXED_COLOUR_PRIORITY)

///

/datum/reagent/consumable/fluid
	name = "Fluid"
	description = "Fluid from some animal. Useless for anything but insemination, really."
	taste_description = "something salty"
	taste_mult = 2 //Not very overpowering flavor
	data = list("donor"=null,"viruses"=null,"donor_DNA"=null,"blood_type"=null,"resistances"=null,"trace_chem"=null,"mind"=null,"ckey"=null,"gender"=null,"real_name"=null)
	reagent_state = LIQUID
	color = "#FFFFFF" // rgb: 255, 255, 255
	can_synth = FALSE
	// you know i wouldn't
	// boiling_point = T0C + 100
	nutriment_factor = 0.5 * REAGENTS_METABOLISM
	var/decal_path = /obj/effect/decal/cleanable/fluid

/datum/reagent/consumable/fluid/reaction_turf(turf/location, reac_volume)
	..()
	if(!istype(location))
		return

	var/obj/effect/decal/cleanable/fluid/S = locate(/obj/effect/decal/cleanable/fluid) in location
	if(S)
		if(S.reagents.add_reagent(type, volume, data))
			S.update_icon()
			return

	var/obj/effect/decal/cleanable/fluidrip/drip = (locate(/obj/effect/decal/cleanable/fluidrip) in location) || new(location)
	if(drip.reagents.add_reagent(type, volume, data))
		drip.update_icon()
		if(drip.reagents.total_volume >= 10)
			S = new(location)
			drip.reagents.trans_to(S, drip.reagents.total_volume)
			S.update_icon()
			qdel(drip)
		return
