mob/living/proc/ghost_cafe_traits(switch_on = FALSE, additional_area)
	if(switch_on)
		AddElement(/datum/element/ghost_role_eligibility, free_ghosting = TRUE)
		AddElement(/datum/element/dusts_on_catatonia)
		var/list/Not_dust_area = list(/area/centcom/holding/exterior,  /area/hilbertshotel)
		if(additional_area)
			Not_dust_area += additional_area
		AddElement(/datum/element/dusts_on_leaving_area, Not_dust_area)

		ADD_TRAIT(src, TRAIT_SIXTHSENSE, GHOSTROLE_TRAIT)
		ADD_TRAIT(src, TRAIT_EXEMPT_HEALTH_EVENTS, GHOSTROLE_TRAIT)
		ADD_TRAIT(src, TRAIT_NO_MIDROUND_ANTAG, GHOSTROLE_TRAIT) //The mob can't be made into a random antag, they are still eligible for ghost roles popups.

		var/datum/action/toggle_dead_chat_mob/D = new(src)
		D.Grant(src)
		var/datum/action/disguise/disguise_action = new(src)
		disguise_action.Grant(src)

	else
		RemoveElement(/datum/element/ghost_role_eligibility, free_ghosting = TRUE)
		RemoveElement(/datum/element/dusts_on_catatonia)
		var/datum/antagonist/ghost_role/ghost_cafe/GC = mind?.has_antag_datum(/datum/antagonist/ghost_role/ghost_cafe)
		if(GC)
			RemoveElement(/datum/element/dusts_on_leaving_area, list(/area/centcom/holding/exterior,  /area/hilbertshotel, GC.adittonal_allowed_area))
		else
			RemoveElement(/datum/element/dusts_on_leaving_area, list(/area/centcom/holding/exterior,  /area/hilbertshotel))

		REMOVE_TRAIT(src, TRAIT_SIXTHSENSE, GHOSTROLE_TRAIT)
		REMOVE_TRAIT(src, TRAIT_EXEMPT_HEALTH_EVENTS, GHOSTROLE_TRAIT)
		REMOVE_TRAIT(src, TRAIT_NO_MIDROUND_ANTAG, GHOSTROLE_TRAIT)

		var/datum/action/toggle_dead_chat_mob/D = locate(/datum/action/toggle_dead_chat_mob) in actions
		if(D)
			D.Remove(src)
		var/datum/action/disguise/disguise_action = locate(/datum/action/disguise) in actions
		if(disguise_action)
			if(disguise_action.currently_disguised)
				remove_alt_appearance("ghost_cafe_disguise")
			disguise_action.Remove(src)
