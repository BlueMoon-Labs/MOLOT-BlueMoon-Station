/obj/machinery/power/dynamo
	/**
	 * Initially it was clear 10-20kW. But this won't compete with PACMAN with 10-40kW on T1 parts and 40-160kW on T4 parts.
	 * Also pedals require constant human/monkey stamina for it to work.
	 * So for this thing to be viable, it must be cheap and widely available equivalent of PACMAN.
	 */
	var/power_produced = 10000
	var/raw_power = 0
	var/obj/structure/chair/pedalgen/Pedals = null
	invisibility = 70
	circuit = /obj/item/circuitboard/machine/pedalgen

/obj/machinery/power/dynamo/process()
	Pedals.update_icon()
	if (raw_power>0)
		if (raw_power>10)
			raw_power -= 3
			add_avail(power_produced * 2)
		else
			raw_power --
			add_avail(power_produced)
	if(Pedals.has_buckled_mobs() && ismonkey(Pedals.buckled_mobs[1]) && !Pedals.buckled_mobs[1].client)
		Pedals.pedal(Pedals.buckled_mobs[1])

/obj/machinery/power/dynamo/RefreshParts()
	var/parts_mult = 0
	for(var/obj/item/stock_parts/S in component_parts)
		parts_mult += S.rating
	power_produced = round(initial(power_produced) * parts_mult)

// /obj/machinery/power/dynamo/deconstruct(disassembled) //stock parts shold be dropped on destruction. perhaps it shall be done later.
// 	. = ..()

/obj/machinery/power/dynamo/proc/Rotated()
	raw_power += 2

/obj/structure/chair/pedalgen
	name = "Pedal Generator"
	desc = "Push it to the limit! Generate power from raw human force! Or just let a monkey handle it."
	icon = 'modular_bluemoon/icons/obj/pedalgen.dmi'
	icon_state = "pedalgen"
	anchored = TRUE
	density = FALSE
	item_chair = null
	buildstacktype = null
	buildstackamount = 0
	custom_materials = list(/datum/material/iron=20000)
	var/obj/machinery/power/dynamo/Generator = null
	var/next_pedal = 0
	// var/pedal_left_leg = FALSE

/obj/structure/chair/pedalgen/Initialize(mapload)
	. = ..()
	handle_rotation()
	Generator = new /obj/machinery/power/dynamo(src)
	Generator.Pedals = src
	if(anchored)
		Generator.loc = loc
		Generator.connect_to_network()

/obj/structure/chair/pedalgen/Destroy()
	qdel(Generator)
	return..()

/obj/structure/chair/pedalgen/examine(mob/user)
	. = ..()
	. += "Due to weird and fragile design features you can't disassemble it without crushing its inner parts. Also you can't upgrade it from the distance."
	. += span_notice("[src] is <b>[anchored ? "" : "not "]</b>anchored.")
	if(!Generator.powernet)
		. += span_danger("[src] is not connected to any power network.")
	. += span_notice("Use movement keys or click on [src] to start generating power.")
	if(Generator.raw_power > 0)
		. += "It has [Generator.raw_power] raw power stored and it generates [Generator.raw_power > 10 ? "[2*Generator.power_produced/1000]" : "[Generator.power_produced/1000]"]k energy!"
	else
		. += "Generator stands still. Someone need to pedal that thing."

/obj/structure/chair/pedalgen/update_icon_state()
	switch(Generator.raw_power)
		if(0)
			icon_state = initial(icon_state)
		if(1 to 10)
			icon_state = initial(icon_state)+"_low"
		if(11 to INFINITY)
			icon_state = initial(icon_state)+"_high"

/obj/structure/chair/pedalgen/attackby(obj/item/W, mob/user)
	if(istype(W, /obj/item/storage/part_replacer))
		Generator.exchange_parts(user, W)
	else if(default_unfasten_wrench(user,W))
		user.DelayNextAction(CLICK_CD_MELEE)
		if(anchored)
			Generator.loc = src.loc
			Generator.connect_to_network()
		else
			Generator.disconnect_from_network()
			Generator.loc = null
	else if((istype(W, /obj/item/assembly/shock_kit))) // from /obj/structure/chair. we dont want that.
		return
	else
		return ..()

/obj/structure/chair/pedalgen/attack_hand(mob/user)
	pedal(user)
	return FALSE

/obj/structure/chair/pedalgen/proc/pedal(mob/user)
	if(!has_buckled_mobs())
		return FALSE
	if(buckled_mobs[1].buckled != src)
		return FALSE
	if(buckled_mobs[1] != user)
		buckled_mobs[1].visible_message(\
			"<span class='notice'>[buckled_mobs[1].name] was unbuckled by [user.name]!</span>",\
			"You were unbuckled from [src] by [user.name].",\
			"You hear metal clanking")
		unbuckle_mob(buckled_mobs[1])
		add_fingerprint(user)
		return FALSE
	var/mob/living/carbon/C = buckled_mobs[1]
	if(!istype(C))
		return FALSE
	if(next_pedal >= world.time)
		return FALSE
	// if(!C.has_legs())
	// 	return FALSE
	if(/*C.IsImmobilized() || C.IsParalyzed() || */!CHECK_MOBILITY(C, MOBILITY_MOVE))
		return FALSE
	if(C.stat >= SOFT_CRIT)
		return FALSE
	if(ismonkey(C))
		if(!C.handcuffed)
			unbuckle_mob(C)
			visible_message(span_warning("[C] escaped from [src]!"))
			return FALSE
	next_pedal = world.time + 4
	playsound(src, 'sound/items/ratchet.ogg', 10)
	Generator.Rotated()
	C.doSprintLossTiles(4)
	if(C.nutrition <= NUTRITION_LEVEL_STARVING || C.thirst <= THIRST_LEVEL_PARCHED)
		if(ismonkey(C))
			C.visible_message(span_warning("[C] loses it's conscious due to extreme fatigue."))
			C.Unconscious(30 SECONDS)
		else
			to_chat(user, "You are too exausted to pedal that thing. You should eat and drink something.")
			C.DefaultCombatKnockdown(300)
	// var/mob/living/carbon/human/pedaler = buckled_mobs[1]
	// if(ishuman(pedaler))
	// 	var/leg = pedal_left_leg ? BODY_ZONE_L_LEG : BODY_ZONE_R_LEG
	// 	var/obj/item/organ/external/BP = pedaler.get_bodypart(leg)
	// 	if(BP)
	// 		var/pain_amount = BP.adjust_pumped(1)
	// 		pedaler.apply_effect(pain_amount, AGONY, 0)
	// 		SEND_SIGNAL(pedaler, COMSIG_ADD_MOOD_EVENT, "swole", /datum/mood_event/swole, pain_amount)
	// 		pedaler.update_body()
	//adjust nutriments greatly since we are not chilling here, we are breaking a sweat.
	if(!HAS_TRAIT(src, TRAIT_NOHUNGER))
		C.adjust_nutrition(-10*HUNGER_FACTOR)
	if(!HAS_TRAIT(src, TRAIT_NOTHIRST))
		C.adjust_thirst(-10*THIRST_FACTOR)
	// pedal_left_leg = !pedal_left_leg
	// if(buckled_mobs[1].halloss > 80)
	// 	to_chat(user, "You pushed yourself too hard.")
	// 	// buckled_mobs[1].apply_effect(24,AGONY,0)
	// 	unbuckle_mob(buckled_mobs[1])
	return TRUE

/obj/structure/chair/pedalgen/relaymove(mob/user, direction)
	pedal(user)

/obj/structure/chair/pedalgen/handle_layer()
	if(has_buckled_mobs() && dir == SOUTH)
		layer = ABOVE_MOB_LAYER
	else
		layer = OBJ_LAYER
	if(has_buckled_mobs())
		var/mob/living/M = buckled_mobs[1]
		M.setDir(dir)
		var/new_pixel_x = 0
		var/new_pixel_y = 0
		switch(dir)
			if(SOUTH)
				new_pixel_x = 0
				new_pixel_y = 7
			if(WEST)
				new_pixel_x = 13
				new_pixel_y = 7
			if(NORTH)
				new_pixel_x = 0
				new_pixel_y = 4
			if(EAST)
				new_pixel_x = -13
				new_pixel_y = 7
		M.pixel_x = new_pixel_x
		M.pixel_y = new_pixel_y

/obj/structure/chair/pedalgen/post_unbuckle_mob(mob/living/M)
	. = ..()
	M.pixel_x = M.get_standard_pixel_x_offset(M.lying)
	M.pixel_y = M.get_standard_pixel_y_offset(M.lying)

/obj/structure/chair/pedalgen/Move(NewLoc, Dir = 0, step_x = 0, step_y = 0)
	. = ..()
	if(has_buckled_mobs() && !moving_diagonally)
		if(buckled_mobs[1].buckled == src)
			buckled_mobs[1].loc = loc
			handle_layer()

/obj/structure/chair/pedalgen/verb/release()
	set name = "Release Pedalgen"
	set category = "Object"
	set src in view(1)
	if(!iscarbon(usr))
		return
	if(!has_buckled_mobs())
		return
	if(usr.restrained())
		to_chat(usr, "You can't do it until you restrained")
		return
	unbuckle_mob(buckled_mobs[1])
