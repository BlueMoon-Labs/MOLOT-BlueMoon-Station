// Kvass itself
/datum/reagent/consumable/kvass
	name = "Kvass"
	description = "A traditional russian beer made from fermenting rye or barley and having a dark color and sour taste."
	color = "#522510"
	nutriment_factor = 1 * REAGENTS_METABOLISM
	taste_description = "bittersweet yeast"
	glass_icon = 'modular_bluemoon/flixsim/icons/kvass/drink.dmi'
	glass_icon_state = "kvassglass"
	glass_name = "glass of kvass"
	glass_desc = "A cooling mug of kvass."
	hydration = 3

/datum/reagent/consumable/kvass/on_mob_add(mob/living/carbon/M)
	. = ..()
	if(HAS_TRAIT(M, TRAIT_RUSSIAN))
		SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "fav_food", /datum/mood_event/quality_fantastic)
		to_chat(M, "<span class='notice'>Этот квас просто великолепен!</span>")

/datum/reagent/consumable/kvass/on_mob_life(mob/living/carbon/M)
	. = ..()
	M.drowsyness = max(0, M.drowsyness - 5)
	M.adjust_bodytemperature(-5 * TEMPERATURE_DAMAGE_COEFFICIENT, BODYTEMP_NORMAL)

/datum/reagent/consumable/kvass/on_hydroponics_apply(obj/item/seeds/myseed, datum/reagents/chems, obj/machinery/hydroponics/mytray, mob/user)
	. = ..()
	if(chems.has_reagent(src, 1))
		mytray.adjustHealth(-round(chems.get_reagent_amount(src.type) * 0.05))
		mytray.adjustWater(round(chems.get_reagent_amount(src.type) * 0.7))

// Kvass crafting
/datum/chemical_reaction/kvass
	name = "Kvass"
	id = /datum/reagent/consumable/kvass
	results = list(/datum/reagent/consumable/kvass = 3)
	required_reagents = list(/datum/reagent/consumable/ethanol/beer = 1, /datum/reagent/consumable/sugar = 1, /datum/reagent/consumable/flour = 1)

