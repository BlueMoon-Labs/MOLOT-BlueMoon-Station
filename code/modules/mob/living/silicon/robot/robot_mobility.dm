/mob/living/silicon/robot/update_mobility()
	var/newflags = NONE
	if(!stat)
		if(!resting)
			newflags |= (MOBILITY_STAND | MOBILITY_RESIST)
			if(!locked_down)
				newflags |= MOBILITY_MOVE
				newflags |= MOBILITY_PULL
		if(!locked_down)
			newflags |= MOBILITY_FLAGS_ANY_INTERACTION
	mobility_flags = newflags
	update_transform()
	update_action_buttons_icon()
	update_icons()
	return mobility_flags

// BLUEMOON ADD START - киборги не могут брать сверхтяжёлых персонажей на свой корпус
/mob/living/silicon/robot/pre_buckle_mob(mob/living/M)
	if(HAS_TRAIT(M, TRAIT_BLUEMOON_HEAVY_SUPER))
		usr.visible_message(span_warning("<b>[usr]</b> tried to put <b>[M]</b> on its sheel, but [M.p_they()] weight too much!."), \
							span_warning("You tried to put <b>[M]</b> on yourself, but your system reported about weight overload. Abort!"), target = M,
							target_message = span_notice("<b>[M]</b> tried to take you on [src]'s shell, but looks like you weight too much for them!"))
		return FALSE
	. = ..()
// BLUEMOON ADD END
