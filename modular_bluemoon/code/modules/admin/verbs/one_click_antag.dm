/datum/admins/proc/makeBloodsucker()
	var/datum/game_mode/bloodsucker/temp = new

	if(CONFIG_GET(flag/protect_roles_from_antagonist))
		temp.restricted_jobs += temp.protected_jobs

	if(CONFIG_GET(flag/protect_assistant_from_antagonist))
		temp.restricted_jobs += "Assistant"

	var/list/mob/living/carbon/human/candidates = list()
	var/mob/living/carbon/human/H = null

	for(var/mob/living/carbon/human/applicant in GLOB.player_list)
		if(isReadytoRumble(applicant, ROLE_BLOODSUCKER))
			if(temp.age_check(applicant.client))
				if(!(applicant.job in temp.restricted_jobs))
					candidates += applicant
		if(applicant.mob_weight > MOB_WEIGHT_HEAVY) // никаких сверхтяжёлых кровососов
			candidates -= applicant
		else if(HAS_TRAIT(applicant, TRAIT_ROBOTIC_ORGANISM)) // никаких роботов-вампиров из далекого космоса
			candidates -= applicant

	if(candidates.len)
		H = pick(candidates)
		H.mind.add_antag_datum(ANTAG_DATUM_BLOODSUCKER)
		H.mind.special_role = ROLE_BLOODSUCKER
		return 1
	return 0
