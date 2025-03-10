/datum/chemical_reaction/saltwater
	name = "salt water"
	id = /datum/reagent/water/salt
	results = list(/datum/reagent/water/salt = 2)
	required_temp = 413.15
	required_reagents = list(
		/datum/reagent/water = 1,
		/datum/reagent/consumable/sodiumchloride = 1,
		)

/datum/chemical_reaction/worcestershire_sauce
	name = "Worcestershire Sauce"
	id = /datum/reagent/consumable/worcestershire
	results = list(/datum/reagent/consumable/worcestershire = 4)
	required_reagents = list(
		// /datum/reagent/consumable/onion_juice = 1, нету сока из чеснока ААААААААА!
		/datum/reagent/consumable/garlic = 1,
		/datum/reagent/consumable/vinegar = 1,
		/datum/reagent/consumable/bonito = 1,
		/datum/reagent/consumable/sugar = 1,
		)
