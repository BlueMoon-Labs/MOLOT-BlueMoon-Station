/*
Квас. Просто квас.
*/

// Kvass bottle
/obj/item/reagent_containers/food/drinks/kvass
	name = "kvass bottle"
	desc = "A bottle of natural space kvass made of barley and rye malt. Ideal for quenching thirst and making space okroshka."
	icon = 'modular_bluemoon/flixsim/icons/kvass/drink.dmi'
	lefthand_file = 'modular_bluemoon/flixsim/icons/kvass/drink_inhand_left.dmi'
	righthand_file = 'modular_bluemoon/flixsim/icons/kvass/drink_inhand_right.dmi'
	icon_state = "kvassbottle"
	foodtype = GRAIN | SUGAR | ALCOHOL
	spillable = FALSE
	isGlass = FALSE
	custom_price = PRICE_PRETTY_CHEAP
	list_reagents = list(/datum/reagent/consumable/kvass = 30)
	custom_materials = list(/datum/material/plastic = 200)

// Kvass barrel
/obj/structure/reagent_dispensers/kvass_barrel
	name = "kvass barrel"
	desc = "A yellow-green barrel full of kvass."
	icon = 'modular_bluemoon/flixsim/icons/kvass/drink.dmi'
	icon_state = "kvassbarrel"
	reagent_id = /datum/reagent/consumable/kvass

