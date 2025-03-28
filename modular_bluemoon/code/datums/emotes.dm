/datum/emote/sound/can_run_emote(mob/living/user, status_check, intentional)
	if(!emote_cooldown)
		user?.nextsoundemote = initial(user?.nextsoundemote)
	. = ..()
