/*
Квас. Просто квас.
*/

// Kvass bottle
/obj/item/reagent_containers/food/drinks/kvass
	name = "kvass bottle"
	desc = "A bottle of natural space kvass made of barley and rye malt. Ideal for quenching thirst and making space okroshka."
	icon = 'modular_bluemoon/icons/obj/drinks.dmi'
	lefthand_file = 'modular_bluemoon/icons/mob/inhands/misc/food_lefthand.dmi'
	righthand_file = 'modular_bluemoon/icons/mob/inhands/misc/food_righthand.dmi'
	icon_state = "kvassbottle"
	foodtype = GRAIN | SUGAR | ALCOHOL
	spillable = FALSE
	isGlass = FALSE
	custom_price = PRICE_PRETTY_CHEAP
	list_reagents = list(/datum/reagent/consumable/kvass = 30)
	custom_materials = list(/datum/material/plastic = 200)
