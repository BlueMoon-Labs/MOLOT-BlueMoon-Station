/*
IMPORTED FROM VORESTATION
LORE:
Gaslamps are a phoron-based life form endemic to the world of Virgo-3B. They are
a sort of fungal organism with physical ties to Diona and Vox, deriving energy
for movement from a gentle combustion-like reaction in their bodies using
atmospheric phoron, carefully filtered trace oxygen, and captured meat products.
Over-exposure to oxygen causes their insides to burn too hot and eventually
kills them.

TODO: Make them light up and heat the air when exposed to oxygen.
*/

/mob/living/simple_animal/gaslamp
	name = "gaslamp"
	desc = "Some sort of floaty alien with a warm glow. This creature is endemic to Virgo-3B."

	icon_state = "gaslamp"
	icon_living = "gaslamp"
	icon_dead = "gaslamp_dead"
	icon = 'modular_bluemoon/shenya/icons/gaslamp.dmi'

	maxHealth = 100
	health = 100
	//movement_cooldown = 4

	//say_list_type = /datum/say_list/gaslamp
	//ai_holder_type = /datum/ai_holder/simple_mob/gaslamp

	//speed = 2 not sure what this is, guessing animation, but it conflicts with new system.

	melee_damage_lower = 15 // Because fuck anyone who hurts this sweet, innocent creature.
	melee_damage_upper = 15
	//attacktext = list("thrashed")

	response_help_simple = "brushes"	// If clicked on help intent
	response_disarm_simple = "pushes" // If clicked on disarm intent
	response_harm_simple   = "swats"	// If clicked on harm intent

	minbodytemp = 0
	maxbodytemp = 350

/mob/living/simple_animal/gaslamp/update_mobility()
	. = ..()
	if(client && stat != DEAD)
		if(!CHECK_MOBILITY(src, MOBILITY_STAND))
			icon_state = "[icon_living]_rest"
		else
			icon_state = "[icon_living]"
	regenerate_icons()
