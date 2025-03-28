/datum/action/changeling/sting/crocin
	name = "Crocin Sting"
	desc = "We silently sting our victim with a crocin. Costs 10 chemicals."
	helptext = "Does not provide a warning to the victim, though they will likely realize they are suddenly aroused."
	button_icon_state = "sting_crocin"
	sting_icon = "sting_crocin"
	chemical_cost = 10
	dna_cost = 2
	loudness = 1
	gamemode_restriction_type = ANTAG_EXTENDED

/datum/action/changeling/sting/crocin/sting_action(mob/user, mob/target)
	log_combat(user, target, "stung", "crocin sting")
	if(target.reagents)
		target.reagents.add_reagent(/datum/reagent/drug/aphrodisiac, 5)
	return TRUE

/datum/action/changeling/sting/hexacrocin
	name = "Hexarocin Sting"
	desc = "We silently sting our victim with a hexacrocin. Costs 10 chemicals."
	helptext = "Does not provide a warning to the victim, though they will likely realize they are suddenly burning with lust."
	button_icon_state = "sting_hexacrocin"
	sting_icon = "sting_hexacrocin"
	chemical_cost = 10
	dna_cost = 2
	loudness = 1
	gamemode_restriction_type = ANTAG_EXTENDED

/datum/action/changeling/sting/hexacrocin/sting_action(mob/user, mob/target)
	log_combat(user, target, "stung", "hexacrocin sting")
	if(target.reagents)
		target.reagents.add_reagent(/datum/reagent/drug/aphrodisiacplus, 5)
	return TRUE

/datum/action/changeling/sting/panty_dropper
	name = "Panty Dropper Sting"
	desc = "We silently sting our victim with a panty dropper. Costs 10 chemicals."
	helptext = "Does not provide a warning to the victim, though they will likely realize they are suddenly naked and aroused."
	button_icon_state = "sting_panty_dropper"
	sting_icon = "sting_panty_dropper"
	chemical_cost = 10
	dna_cost = 2
	loudness = 1
	gamemode_restriction_type = ANTAG_EXTENDED

/datum/action/changeling/sting/panty_dropper/sting_action(mob/user, mob/target)
	log_combat(user, target, "stung", "panty dropper sting")
	if(target.reagents)
		target.reagents.add_reagent(/datum/reagent/consumable/ethanol/panty_dropper, 5)
	return TRUE
