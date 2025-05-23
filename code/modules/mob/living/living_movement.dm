/mob/living/Moved()
	. = ..()
	update_turf_movespeed(loc)
	update_pixel_shifting(TRUE)

/mob/living/setDir(newdir, ismousemovement)
	. = ..()
	if(ismousemovement)
		update_pixel_shifting()
	SEND_SIGNAL(src, COMSIG_ATOM_DIR_AFTER_CHANGE, dir, newdir)

/mob/living/proc/update_pixel_shifting(moved = FALSE)
	if(combat_flags & COMBAT_FLAG_ACTIVE_BLOCKING)
		animate(src, pixel_x = get_standard_pixel_x_offset(), pixel_y = get_standard_pixel_y_offset(), time = 2.5, flags = ANIMATION_END_NOW)
	else if(moved)
		if(is_shifted)
			is_shifted = FALSE
			pixel_x = get_standard_pixel_x_offset(lying)
			pixel_y = get_standard_pixel_y_offset(lying)
		if(is_tilted)
			transform = transform.Turn(-is_tilted)
			is_tilted = 0

/mob/living/proc/update_density()
	density = !lying && !HAS_TRAIT(src, TRAIT_LIVING_NO_DENSITY)

/mob/living/CanAllowThrough(atom/movable/mover, turf/target)
	. = ..()
	if(.)
		return
	if(mover.throwing)
		return (!density || lying)
	if(buckled == mover)
		return TRUE
	if(!ismob(mover))
		if(mover.throwing?.thrower == src)
			return TRUE
	if(ismob(mover))
		if(mover in buckled_mobs)
			return TRUE
		if(HAS_TRAIT(mover, TRAIT_BEING_CARRIED))
			return TRUE	//We're being carried and our carrier managed to pass, ergo, let us pass aswell.
	var/mob/living/L = mover		//typecast first, check isliving and only check this if living using short circuit
	if(isliving(L) && lying && L.lying)		//if we're both lying down and aren't already being thrown/shipped around, don't pass
		return FALSE
	return (isliving(mover)? L.can_move_under_living(src) : !mover.density)

/mob/living/toggle_move_intent()
	. = ..()
	update_move_intent_slowdown()

/mob/living/update_config_movespeed()
	update_move_intent_slowdown()
	sprint_buffer_max = CONFIG_GET(number/movedelay/sprint_buffer_max)
	sprint_buffer_regen_ds = CONFIG_GET(number/movedelay/sprint_buffer_regen_per_ds)
	sprint_stamina_cost = CONFIG_GET(number/movedelay/sprint_stamina_cost)
	return ..()

/// whether or not we can slide under another living mob. defaults to if we're not dense. CanPass should check "overriding circumstances" like buckled mobs/having PASSMOB flag, etc.
/mob/living/proc/can_move_under_living(mob/living/other)
	return !density

/mob/living/proc/update_move_intent_slowdown()
	add_movespeed_modifier((m_intent == MOVE_INTENT_WALK)? /datum/movespeed_modifier/config_walk_run/walk : /datum/movespeed_modifier/config_walk_run/run)

/mob/living/proc/update_turf_movespeed(turf/open/T)
	if(isopenturf(T))
		add_or_update_variable_movespeed_modifier(/datum/movespeed_modifier/turf_slowdown, multiplicative_slowdown = T.slowdown)
	else
		remove_movespeed_modifier(/datum/movespeed_modifier/turf_slowdown)

/mob/living/proc/update_pull_movespeed()
	// BLUEMOON ADD START
	var/modified = FALSE
	if(pulling && isliving(pulling))
		var/mob/living/L = pulling

		if(L.mob_weight > MOB_WEIGHT_HEAVY && src.mob_weight < MOB_WEIGHT_HEAVY_SUPER) // Сверхтяжёлых персонажей очень сложно тянуть
			if(src.mob_weight < MOB_WEIGHT_HEAVY)
				add_or_update_variable_movespeed_modifier(/datum/movespeed_modifier/heavy_mob_drag, multiplicative_slowdown = PULL_HEAVY_SUPER_SLOWDOWN)
			else
				add_or_update_variable_movespeed_modifier(/datum/movespeed_modifier/heavy_mob_drag, multiplicative_slowdown = PULL_HEAVY_SLOWDOWN)
			modified = TRUE

		if(L.mob_weight > MOB_WEIGHT_NORMAL && src.mob_weight < MOB_WEIGHT_HEAVY) // Тяжёлых персонажей сложнее тянуть, но не для тяжёлых или свертяжёлых
			add_or_update_variable_movespeed_modifier(/datum/movespeed_modifier/heavy_mob_drag, multiplicative_slowdown = PULL_HEAVY_SLOWDOWN)
			modified = TRUE

		if(drag_slowdown && L.lying && !L.buckled && grab_state < GRAB_AGGRESSIVE)
			add_or_update_variable_movespeed_modifier(/datum/movespeed_modifier/bulky_drag, multiplicative_slowdown = PULL_PRONE_SLOWDOWN)
			return

		// PULL_SLOWDOWN
		else if(drag_slowdown && !modified)
			add_or_update_variable_movespeed_modifier(/datum/movespeed_modifier/pull_slowdown, multiplicative_slowdown = PULL_SLOWDOWN)
			modified = TRUE

	if(modified)
		return
	remove_movespeed_modifier(/datum/movespeed_modifier/pull_slowdown)
	remove_movespeed_modifier(/datum/movespeed_modifier/bulky_drag)
	remove_movespeed_modifier(/datum/movespeed_modifier/heavy_mob_drag)
	// BLUEMOON ADD END

/mob/living/canZMove(dir, turf/target)
	return can_zTravel(target, dir) && (movement_type & FLYING)

/mob/living/Move(atom/newloc, direct)
	if (buckled && buckled.loc != newloc) //not updating position
		if (!buckled.anchored)
			return buckled.Move(newloc, direct)
		else
			return FALSE

	var/old_direction = dir
	var/turf/T = loc

	if(pulling)
		update_pull_movespeed()

	. = ..()

	if(pulledby && moving_diagonally != FIRST_DIAG_STEP && get_dist(src, pulledby) > 1 && (pulledby != moving_from_pull))//separated from our puller and not in the middle of a diagonal move.
		pulledby.stop_pulling()
	else
		if(isliving(pulledby))
			var/mob/living/L = pulledby
			L.set_pull_offsets(src, pulledby.grab_state)

	if(active_storage && !(CanReach(active_storage.parent,view_only = TRUE)))
		active_storage.close(src)

	if(lying && !buckled && prob(getBruteLoss()*200/maxHealth))
		makeTrail(newloc, T, old_direction)

/mob/living/Move_Pulled(atom/A)
	. = ..()
	if(!. || !isliving(A))
		return
	var/mob/living/L = A
	set_pull_offsets(L, grab_state)

/mob/living/forceMove(atom/destination)
	stop_pulling()
	if(buckled)
		buckled.unbuckle_mob(src, force = TRUE)
	if(has_buckled_mobs())
		unbuckle_all_mobs(force = TRUE)
	. = ..()
	if(.)
		if(client)
			reset_perspective()
		update_mobility() //if the mob was asleep inside a container and then got forceMoved out we need to make them fall.

/mob/living/proc/update_z(new_z) // 1+ to register, null to unregister
	if(isnull(new_z) && audiovisual_redirect)
		return
	if (registered_z != new_z)
		if (registered_z)
			SSmobs.clients_by_zlevel[registered_z] -= src
		if (client || audiovisual_redirect)
			if (new_z)
				SSmobs.clients_by_zlevel[new_z] += src
				for (var/I in length(SSidlenpcpool.idle_mobs_by_zlevel[new_z]) to 1 step -1) //Backwards loop because we're removing (guarantees optimal rather than worst-case performance), it's fine to use .len here but doesn't compile on 511
					var/mob/living/simple_animal/SA = SSidlenpcpool.idle_mobs_by_zlevel[new_z][I]
					if (SA)
						SA.toggle_ai(AI_ON) // Guarantees responsiveness for when appearing right next to mobs
					else
						SSidlenpcpool.idle_mobs_by_zlevel[new_z] -= SA

			registered_z = new_z
		else
			registered_z = null

/mob/living/onTransitZ(old_z,new_z)
	..()
	update_z(new_z)

/mob/living/canface()
	if(!CHECK_MOBILITY(src, MOBILITY_MOVE))
		return FALSE
	return ..()
