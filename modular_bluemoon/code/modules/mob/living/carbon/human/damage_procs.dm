/mob/living/carbon/human/adjustOxyLoss(amount, updating_health, forced)
	. = ..()
	if(!.)
		return
	if(!has_dna())
		return
	if(HAS_TRAIT(src, TRAIT_CHOKE_SLUT))
		if(amount <= 0)
			return
		if(stat >= DEAD)
			return
		if(HAS_TRAIT(src, TRAIT_NOBREATH))
			return
		if(stat == CONSCIOUS)
			// Oxy damage is not impressive, usually doesn't even exceeds 5. By default we need 300 lust to cum, futhermore lust constantly decreases.
			// So we add fat multiplier to make it noticeable.
			handle_post_sex(amount*5)
		else // proc/handle_post_sex() won't work here if mob is not CONSCIOUS
			add_lust(amount*5)
			if(get_lust() >= get_climax_threshold()) // BLUEMOON EDIT
				mob_climax(forced_climax=TRUE, cause="choke_slut")
