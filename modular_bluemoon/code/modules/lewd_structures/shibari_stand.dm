/obj/structure/chair/shibari_stand
	name = "shibari stand"
	desc = "A stand for buckling people with ropes."
	icon = 'modular_bluemoon/icons/obj/structures/shibari_stand.dmi'
	icon_state = "shibari_stand_black"
	max_integrity = 75
	layer = 4
	item_chair = null
	buildstacktype = null
	///Overlays for ropes
	var/static/mutable_appearance/shibari_rope_overlay
	var/static/mutable_appearance/shibari_rope_overlay_behind
	var/static/mutable_appearance/shibari_shadow_overlay = mutable_appearance('modular_bluemoon/icons/obj/structures/shibari_stand.dmi', "shibari_shadow", LOW_OBJ_LAYER)

	///obviously, this is for doing things to the currentmob
	var/mob/living/carbon/human/current_mob = null

	///The rope inside the stand, that's actually tying the person to it
	var/obj/item/restraints/bondage_rope/ropee = null

/*
/obj/structure/chair/shibari_stand/can_be_rotated(mob/user)
	return FALSE
*/
/obj/structure/chair/shibari_stand/Destroy()
	cut_overlay(shibari_shadow_overlay)
	cut_overlay(shibari_rope_overlay)
	cut_overlay(shibari_rope_overlay_behind)
	if(ropee)
		ropee.forceMove(get_turf(src))
	. = ..()
	if(current_mob)
		if(current_mob.handcuffed)
			current_mob.handcuffed.dropped(current_mob)
		current_mob.handcuffed = null
		current_mob.update_handcuffed()
	unbuckle_all_mobs(TRUE)

//Examine changes for this structure
/obj/structure/chair/shibari_stand/examine(mob/user)
	. = ..()
	if(!has_buckled_mobs() && can_buckle)
		. += span_notice("They need to be wearing <b>full-body shibari</b>, and you need to be <b>holding ropes</b>!")

// formerly NO_DECONSTRUCT
/obj/structure/chair/shibari_stand/wrench_act(mob/living/user, obj/item/weapon)
	return NONE

/obj/structure/chair/shibari_stand/user_unbuckle_mob(mob/living/buckled_mob, mob/living/user)
	var/mob/living/buckled = buckled_mob
	if(buckled)
		if(buckled != user)
			buckled.visible_message(span_notice("[user] starts unbuckling [buckled] from [src]."),\
				span_notice("[user] tries to unbuckle you from [src]."),\
				span_hear("You hear loose ropes."))
			buckled.visible_message(span_notice("[user] unbuckles [buckled] from [src]."),\
				span_notice("[user] unbuckles you from [src]."),\
				span_hear("You hear loose ropes."))
		else
			user.visible_message(span_notice("[user] starts unbuckling themselves from [src]."),\
				span_notice("[user] unbuckles themselves from [src]."),\
				span_hear("You hear loose ropes."))
		add_fingerprint(user)
		if(isliving(buckled.pulledby))
			var/mob/living/living_mob = buckled.pulledby
			living_mob.set_pull_offsets(buckled, living_mob.grab_state)
	unbuckle_mob(buckled_mob)
	return buckled

/obj/structure/chair/shibari_stand/user_buckle_mob(mob/living/buckled, mob/user, check_loc = TRUE)

	if((!buckled.client?.prefs?.erppref == "Yes"))
		to_chat(user, span_danger("Looks like [buckled] doesn't want you to do that."))
		return FALSE

	add_fingerprint(user)

	if(!ishuman(buckled))
		return FALSE

	var/mob/living/carbon/human/hooman = buckled
	if(!istype(user.get_active_held_item(), /obj/item/restraints/bondage_rope))
		to_chat(user, span_warning("You'll need to be holding shibari ropes to tie them to the stand!!"))
		return FALSE

	if(buckled != user)
		buckled.visible_message(span_warning("[user] starts tying [buckled] to \the [src]!"),\
			span_userdanger("[user] starts tying you to \the [src]!"),\
			span_hear("You hear ropes being tightened."))
		if(!do_after(user, 10 SECONDS, buckled))
			return FALSE

		if(!istype(user.get_active_held_item(), /obj/item/restraints/bondage_rope))
			to_chat(user, span_warning("You'll need to be holding shibari ropes to tie them to the stand!"))
			return FALSE

		if(buckle_mob(buckled, check_loc = check_loc))
			var/obj/item/restraints/bondage_rope/rope = user.get_active_held_item()
			rope.use(1)
			add_overlay(shibari_shadow_overlay)
			add_rope_overlays(rope, hooman?.dna?.species?.mutant_bodyparts["taur"])
			buckled.visible_message(span_warning("[user] tied [buckled] to \the [src]!"),\
				span_userdanger("[user] tied you to \the [src]!"),\
				span_hear("You hear ropes being completely tightened."))
			return TRUE
		else
			return FALSE
	else
		to_chat(user, span_warning("You cannot buckle yourself to this stand, there is no way that level of self-bondage exists!"))
		return FALSE

/obj/structure/chair/shibari_stand/proc/add_rope_overlays(color, taur)
	cut_overlay(shibari_rope_overlay)
	cut_overlay(shibari_rope_overlay_behind)
	shibari_rope_overlay = mutable_appearance('modular_bluemoon/icons/obj/structures/shibari_stand.dmi', "ropes_above[taur ? "_snek" : ""]", ABOVE_MOB_LAYER)
	shibari_rope_overlay_behind = mutable_appearance('modular_bluemoon/icons/obj/structures/shibari_stand.dmi', "ropes_behind", BELOW_MOB_LAYER)
	add_overlay(shibari_rope_overlay)
	add_overlay(shibari_rope_overlay_behind)

/obj/structure/chair/shibari_stand/post_buckle_mob(mob/living/buckled)
	buckled.pixel_y = buckled.base_pixel_y + 4
	buckled.pixel_x = buckled.base_pixel_x
	buckled.layer = BELOW_MOB_LAYER

	if(LAZYLEN(buckled_mobs))
		if(ishuman(buckled_mobs[1]))
			current_mob = buckled_mobs[1]

	if(current_mob)
		if(current_mob.handcuffed)
			current_mob.handcuffed.forceMove(loc)
			current_mob.handcuffed.dropped(current_mob)
			current_mob.handcuffed = null
			current_mob.update_handcuffed()

		var/obj/item/restraints/handcuffs/stand/cuffs = new(current_mob)
		current_mob.handcuffed = cuffs
		cuffs.parent_chair = WEAKREF(src)
		if(HAS_TRAIT(current_mob, TRAIT_BONDAGED))
			current_mob.handcuffed.breakouttime = 4 MINUTES
		current_mob.update_handcuffed()

//Restore the position of the mob after unbuckling.
/obj/structure/chair/shibari_stand/post_unbuckle_mob(mob/living/buckled)
	buckled.pixel_x = buckled.base_pixel_x + buckled.body_position_pixel_x_offset
	buckled.pixel_y = buckled.base_pixel_y + buckled.body_position_pixel_y_offset - 4
	buckled.layer = initial(buckled.layer)

	cut_overlay(shibari_shadow_overlay)
	cut_overlay(shibari_rope_overlay)
	cut_overlay(shibari_rope_overlay_behind)

	if(current_mob)
		if(current_mob.handcuffed)
			current_mob.handcuffed.dropped(current_mob)
		current_mob.handcuffed = null
		current_mob.update_handcuffed()

	if(ropee)
		ropee.forceMove(get_turf(src))
	current_mob = null

//Disassembling shibari stand
/obj/structure/chair/shibari_stand/CtrlShiftClick(mob/user)
	to_chat(user, span_notice("You begin unfastening the frame of \the [src]..."))
	if(!do_after(user, 8 SECONDS, src))
		to_chat(user, span_warning("You fail to disassemble \the [src]."))
		return FALSE

	deconstruct(TRUE)
	to_chat(user, span_notice("You disassemble [src]."))
	unbuckle_all_mobs()
	qdel(src)
	return TRUE
