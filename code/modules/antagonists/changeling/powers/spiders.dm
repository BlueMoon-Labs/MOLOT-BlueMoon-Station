/datum/action/changeling/spiders
	name = "Spread Infestation"
	desc = "Our form divides, creating arachnids which will grow into deadly beasts. Costs 45 chemicals."
	helptext = "The spiders are thoughtless creatures, and may attack their creators when fully grown. Requires at least 3 DNA gained through Absorb (regardless of current amount), and not through DNA sting. This ability is very loud, and will guarantee that our blood will react violently to heat."
	button_icon_state = "spread_infestation"
	chemical_cost = 45
	dna_cost = 1
	loudness = 4
	req_absorbs = 3
	gamemode_restriction_type = ANTAG_DYNAMIC

//Makes some spiderlings. Good for setting traps and causing general trouble.
/datum/action/changeling/spiders/sting_action(mob/user)
	..()
	spawn_atom_to_turf(/obj/structure/spider/spiderling/hunter, user, 2, FALSE)
	return TRUE
