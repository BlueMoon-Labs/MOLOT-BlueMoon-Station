// Boiled Noodles
/datum/crafting_recipe/food/boilednoodles
	name = "cooked noodles"
	reqs = list(
		/datum/reagent/water/salt = 10,
		/datum/reagent/consumable/sodiumchloride = 2,
		/obj/item/reagent_containers/glass/bowl = 1,
		/obj/item/reagent_containers/food/snacks/spaghetti/rawnoodles = 1,
	)
	result = /obj/item/reagent_containers/food/snacks/spaghetti/boilednoodles
	subcategory = CAT_SPAGHETTI

// Pho
/datum/crafting_recipe/food/pho
	name = "Pho"
	reqs = list(
		/obj/item/reagent_containers/glass/bowl = 1,
		/obj/item/reagent_containers/food/snacks/spaghetti/boilednoodles = 1,
		/obj/item/reagent_containers/food/snacks/meat/cutlet = 1,
		/obj/item/reagent_containers/food/snacks/grown/onion = 1,
		/obj/item/reagent_containers/food/snacks/grown/cabbage = 1,
	)
	result = /obj/item/reagent_containers/food/snacks/spaghetti/pho
	subcategory = CAT_SPAGHETTI

/datum/crafting_recipe/food/pad_thai
	name = "Pad thai"
	reqs = list(
		/obj/item/reagent_containers/glass/bowl = 1,
		/obj/item/reagent_containers/food/snacks/boiledspaghetti = 1,
		/obj/item/reagent_containers/food/snacks/tofu = 1,
		/obj/item/reagent_containers/food/snacks/grown/onion = 1,
		/obj/item/reagent_containers/food/snacks/grown/peanut = 1,
		/obj/item/reagent_containers/food/snacks/grown/citrus/lime = 1,
	)
	result = /obj/item/reagent_containers/food/snacks/spaghetti/pad_thai
	subcategory = CAT_SPAGHETTI

/datum/crafting_recipe/food/nikujaga
	name = "Nikujaga"
	reqs = list(
		/obj/item/reagent_containers/glass/bowl = 1,
		/obj/item/reagent_containers/food/snacks/boiledspaghetti = 1,
		/obj/item/reagent_containers/food/snacks/meat/cutlet = 2,
		/obj/item/reagent_containers/food/snacks/grown/potato = 1,
		/obj/item/reagent_containers/food/snacks/grown/carrot = 1,
		/obj/item/reagent_containers/food/snacks/grown/peas = 1,
	)
	result = /obj/item/reagent_containers/food/snacks/spaghetti/nikujaga
	subcategory = CAT_SPAGHETTI

/datum/crafting_recipe/food/kitsune_udon
	name = "Kitsune udon"
	reqs = list(
		/datum/reagent/consumable/soysauce = 5,
		/datum/reagent/consumable/sugar = 5,
		/obj/item/reagent_containers/glass/bowl = 1,
		/obj/item/reagent_containers/food/snacks/boiledspaghetti = 1,
		/obj/item/reagent_containers/food/snacks/tofu = 2,
		/obj/item/reagent_containers/food/snacks/grown/onion = 1,
	)
	result = /obj/item/reagent_containers/food/snacks/spaghetti/kitsune_udon
	subcategory = CAT_SPAGHETTI

/datum/crafting_recipe/food/kitakata_ramen
	name = "Kitakata ramen"
	reqs = list(
		/obj/item/reagent_containers/glass/bowl = 1,
		/obj/item/reagent_containers/food/snacks/boiledspaghetti = 1,
		/obj/item/reagent_containers/food/snacks/meat/cutlet = 2,
		/obj/item/reagent_containers/food/snacks/grown/onion = 1,
		/obj/item/reagent_containers/food/snacks/grown/mushroom/chanterelle = 1,
		/obj/item/reagent_containers/food/snacks/grown/garlic = 1,
	)
	result = /obj/item/reagent_containers/food/snacks/spaghetti/kitakata_ramen
	subcategory = CAT_SPAGHETTI
