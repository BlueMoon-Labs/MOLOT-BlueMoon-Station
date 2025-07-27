/datum/crafting_recipe/pedalgen
	name = "Pedal Generator"
	result = /obj/structure/chair/pedalgen
	reqs = list(
		/obj/item/stack/cable_coil = 5,
		/obj/item/stack/rods = 1,
		/obj/item/stack/sheet/metal = 10,
	)
	tools = list(TOOL_SCREWDRIVER, TOOL_WIRECUTTER)
	subcategory = CAT_MISCELLANEOUS
	category = CAT_MISCELLANEOUS

/datum/crafting_recipe/wooden_cup
	name = "Wooden cup"
	result = /obj/item/reagent_containers/food/drinks/drinkingglass/wooden
	reqs = list(/obj/item/stack/sheet/mineral/wood = 1)
	subcategory = CAT_MISCELLANEOUS
	category = CAT_MISCELLANEOUS
