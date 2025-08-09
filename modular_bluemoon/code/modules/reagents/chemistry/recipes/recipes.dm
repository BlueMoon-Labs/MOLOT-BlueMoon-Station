/datum/chemical_reaction/sodiumchloride2
	id = "sodiumchloride2"
	results = list(/datum/reagent/consumable/sodiumchloride = 1)
	required_reagents = list(/datum/reagent/ash = 1, /datum/reagent/consumable/ethanol/beer = 1)
	required_temp = 373.15
	mob_react = FALSE

/datum/chemical_reaction/ethanol
	id = "ethanol"
	results = list(/datum/reagent/consumable/ethanol = 1)
	required_reagents = list(/datum/reagent/consumable/ethanol/vodka = 2)
	required_temp = 473.15
	mob_react = FALSE

/datum/chemical_reaction/synthcum
	id = "organicprecursor0451" //We don't want to have organicprecursor somewhere in the future so 0451 postfix will prevent any shittery with splurt merge
	results = list(/datum/reagent/consumable/organicprecursor = 1)
	required_reagents = list(/datum/reagent/consumable/sodiumchloride = 1, /datum/reagent/consumable/eggyolk = 1)
	required_temp = 375
	mob_react = FALSE

/datum/chemical_reaction/cum
	id = "cumcreation" //it is.
	results = list(/datum/reagent/consumable/semen = 2) //you did it.
	required_reagents = list(/datum/reagent/drug/aphrodisiacplus = 2, /datum/reagent/consumable/organicprecursor = 1)
	required_temp = 400
	mob_react = FALSE

/datum/chemical_reaction/femcum
	id = "femcumcreation" //it is.
	results = list(/datum/reagent/consumable/semen/femcum = 2) //you did it.
	required_reagents = list(/datum/reagent/drug/aphrodisiac = 2, /datum/reagent/consumable/organicprecursor = 1)
	required_temp = 400
	mob_react = FALSE

/datum/chemical_reaction/spermatex
	name = "Spermatex"
	id = /datum/reagent/medicine/spermatex
	results = list(/datum/reagent/medicine/spermatex = 2)
	required_reagents = list(/datum/reagent/medicine/charcoal = 1, /datum/reagent/ammonia  = 1)
	required_temp = 380

/datum/chemical_reaction/xenochimericprecursor
	id = "xenochimericprecursor" 
	results = list(/datum/reagent/consumable/organicprecursor/xenochimeric = 1)
	required_reagents = list(/datum/reagent/aslimetoxin = 1, /datum/reagent/toxin/mutagen = 1, /datum/reagent/consumable/organicprecursor = 1) //This unlocks capabilities to print stuff, so good luck.
	required_temp = 500
	mob_react = FALSE
