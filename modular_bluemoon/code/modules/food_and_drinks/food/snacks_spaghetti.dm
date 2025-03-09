/obj/item/reagent_containers/food/snacks/spaghetti/boilednoodles
	name = "cooked noodles"
	desc = "Cooked fresh to order."
	icon = 'modular_bluemoon/icons/obj/food/food_ingredients.dmi'
	icon_state = "cooked_noodles"
	trash = /obj/item/reagent_containers/glass/bowl
	list_reagents = list(
		/datum/reagent/consumable/nutriment = 3
	)
	tastes = list("rice" = 1)
	foodtype = GRAIN

/obj/item/reagent_containers/food/snacks/spaghetti/pho
	name = "pho"
	desc = "A Vietnamese dish made of noodles, vegetables, herbs, and meat. Makes for a very popular street food."
	icon = 'modular_bluemoon/icons/obj/food/soupsalad.dmi'
	icon_state = "pho"
	trash = /obj/item/reagent_containers/glass/bowl
	list_reagents = list(
		/datum/reagent/consumable/nutriment = 12,
		/datum/reagent/consumable/nutriment/vitamin = 8,
		/datum/reagent/consumable/nutriment/protein = 8
	)
	tastes = list("noodles" = 5, "meat" = 4, "cabbage" = 3, "onion" = 2, "herbs" = 2)
	foodtype = GRAIN | VEGETABLES | MEAT

/obj/item/reagent_containers/food/snacks/spaghetti/pad_thai
	name = "pad thai"
	desc = "A stir-fried noodle dish popular in Thailand made of peanuts, tofu, lime, and onions."
	icon = 'modular_bluemoon/icons/obj/food/soupsalad.dmi'
	icon_state = "pad_thai"
	trash = /obj/item/reagent_containers/glass/bowl
	list_reagents = list(
		/datum/reagent/consumable/nutriment = 15,
		/datum/reagent/consumable/nutriment/vitamin = 10,
		/datum/reagent/consumable/nutriment/protein = 4,
	)
	tastes = list("noodles" = 5, "fried tofu" = 4, "lime" = 2, "peanut" = 3, "onion" = 2)
	foodtype = GRAIN | VEGETABLES | NUTS | FRUIT

/obj/item/reagent_containers/food/snacks/spaghetti/nikujaga
	name = "nikujaga"
	desc = "A delightful Japanese stew of noodles, onions, potatoes, and meat with mixed vegetables."
	icon = 'modular_bluemoon/icons/obj/food/soupsalad.dmi'
	icon_state = "nikujaga"
	trash = /obj/item/reagent_containers/glass/bowl
	list_reagents = list(
		/datum/reagent/consumable/nutriment = 16,
		/datum/reagent/consumable/nutriment/vitamin = 12,
		/datum/reagent/consumable/nutriment/protein = 8
	)
	tastes = list("noodles" = 5, "meat" = 4, "potato" = 3, "onion" = 2, "mixed veggies" = 2)
	foodtype = GRAIN | VEGETABLES | MEAT

/obj/item/reagent_containers/food/snacks/spaghetti/kitsune_udon
	name = "kitsune udon"
	desc = "A vegetarian udon made of fried tofu and onions, made sweet and savory with sugar and soy sauce. The name comes from an old folktale about a fox enjoying fried tofu."
	icon = 'modular_bluemoon/icons/obj/food/soupsalad.dmi'
	icon_state = "kitsune_udon"
	trash = /obj/item/reagent_containers/glass/bowl
	list_reagents = list(
		/datum/reagent/consumable/nutriment = 12,
		/datum/reagent/consumable/nutriment/vitamin = 10,
		/datum/reagent/consumable/nutriment/protein = 4
	)
	tastes = list("noodles" = 5, "tofu" = 4, "sugar" = 3, "soy sauce" = 2)
	foodtype = GRAIN | VEGETABLES

/obj/item/reagent_containers/food/snacks/spaghetti/kitakata_ramen
	name = "kitakata ramen"
	desc = "A hearty ramen composed of meat, mushrooms, onion, and garlic. Often given to the sick to comfort them"
	icon = 'modular_bluemoon/icons/obj/food/soupsalad.dmi'
	icon_state = "kitakata_ramen"
	trash = /obj/item/reagent_containers/glass/bowl
	list_reagents = list(
		/datum/reagent/consumable/nutriment = 15,
		/datum/reagent/consumable/nutriment/vitamin = 6,
		/datum/reagent/consumable/nutriment/protein = 8
	)
	tastes = list("noodles" = 5, "meat" = 4, "mushrooms" = 3, "onion" = 2)
	foodtype = GRAIN | MEAT | VEGETABLES

