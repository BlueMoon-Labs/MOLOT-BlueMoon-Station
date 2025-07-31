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

/obj/item/reagent_containers/food/drinks/soda_cans/synthdrink
	name = "Positronic Oil"
	desc = "I guess they used to sell gasoline in cans. Nothing changed."
	icon_state = "synthanolcan"
	list_reagents = list(/datum/reagent/consumable/synthdrink = 40)

/obj/item/reagent_containers/food/drinks/drinkingglass/wooden
	name = "wooden cup"
	desc = "This cup whispers tales of drunken battles and feasts."
	icon = 'modular_bluemoon/icons/obj/drinks.dmi'
	// lefthand_file = 'modular_bluemoon/icons/mob/inhands/misc/food_lefthand.dmi'
	// righthand_file = 'modular_bluemoon/icons/mob/inhands/misc/food_righthand.dmi'
	icon_state = "wooden"
	w_class = WEIGHT_CLASS_SMALL
	max_integrity = 200
	resistance_flags = FLAMMABLE
	spillable = TRUE
	isGlass = FALSE
	custom_price = PRICE_PRETTY_CHEAP
	custom_materials = list(/datum/material/wood = 1000)
	drop_sound = 'modular_bluemoon/sound/items/wooden_drop.ogg'
	var/flipped = FALSE
	/**
	 * This var is used for random separate item placement on the tabe when picking up flipped cup.
	 * During Initialize() it will become 2D 9x2 array: 9 is 9 positions, 2 is pixelshift x|y -> ((x1,y1), (x2,y2), ..., (x9, y9))
	 *
	 * X | X | X
	 * ---------
	 * X | X | X
	 * ---------
	 * X | X | X
	 *
	 * So the item will be placed on the random X = (xn,yn) spot on the table.
	 * The center = (0,0), upper left corner = (-8,8), down right corner = (8,-8)
	 */
	var/list/table_pixel_positions[9]

/obj/item/reagent_containers/food/drinks/drinkingglass/wooden/Initialize(mapload)
	. = ..()
	var/counter = 1
	for(var/i in list(-8, 0, 8))
		for(var/j in list(-8, 0, 8))
			table_pixel_positions[counter] = list(i, j)
			counter++

/obj/item/reagent_containers/food/drinks/drinkingglass/wooden/examine(mob/user)
	. = ..()
	if(flipped)
		if(locate(/obj/item/dice) in src)
			. += span_notice("[span_bold("Ctrl+Shitf+Click")] to look at the dice results.")
	else
		if(user.TurfAdjacent(get_turf(src)))
			for(var/obj/item/I in src)
				. += "You can see [span_bold("[I]")] inside."
			. += span_notice("Drag and drop [src] to take items out.")
		else
			. += "You can't see if there are any items inside [src] from this distance."

/obj/item/reagent_containers/food/drinks/drinkingglass/wooden/CtrlShiftClick(mob/user)
	if(!(locate(/obj/item/dice) in src))
		return ..()
	if(!iscarbon(user) || (is_blind(user)) || !user.TurfAdjacent(get_turf(src)))
		return
	visible_message("[user] is lifting [src] to peek dice results.")
	if(do_after(user, 2 SECONDS, src))
		for(var/obj/item/dice/D in src)
			to_chat(user, "[D] is landed on [span_bold("[D.result]")].")

/obj/item/reagent_containers/food/drinks/drinkingglass/wooden/on_reagent_change(changetype)
	gulp_size = max(round(reagents.total_volume / 5), 5)
	cut_overlays()
	if(reagents.reagent_list.len)
		var/datum/reagent/R = reagents.get_master_reagent()
		if(!renamedByPlayer)
			name = R.glass_name
			desc = R.glass_desc
		var/mutable_appearance/reagent_overlay = mutable_appearance(icon, "woodenfilling")
		reagent_overlay.color = mix_color_from_reagents(reagents.reagent_list)
		add_overlay(reagent_overlay)
	else
		renamedByPlayer = FALSE //so new drinks can rename the glass
		name = initial(name)
		desc = initial(desc)

/obj/item/reagent_containers/food/drinks/drinkingglass/wooden/attack_self(mob/user)
	if(locate(/obj/item/dice) in src)
		visible_message("[user] intensely shakes [src] and dices within it make loud cracking noises.",\
						blind_message = "You hear loud \"wooden\" cracking noises.")
		playsound(src, pick('modular_bluemoon/sound/items/dice_in_cup_1.ogg', 'modular_bluemoon/sound/items/dice_in_cup_2.ogg'), 50, vary = FALSE)
		for(var/obj/item/dice/D in src)
			D.diceroll(user, TRUE)
	else
		return ..()

/obj/item/reagent_containers/food/drinks/drinkingglass/wooden/attackby(obj/item/I, mob/user, params)
	. = ..()
	if((I.w_class <= WEIGHT_CLASS_TINY) && isnull(I.reagents) && (length(contents) < 5)) // sorry, but no room for d100
		I.forceMove(src)
		to_chat(user, "You place [I] into [src].")
		if(length(reagents.reagent_list))
			reagents.reaction(I, TOUCH)

/obj/item/reagent_containers/food/drinks/drinkingglass/wooden/MouseDrop(atom/over, atom/src_location, atom/over_location, src_control, over_control, params)
	. = ..()
	if(!flipped && (isturf(over) || istype(over, /obj/structure/table)))
		var/turf/T = get_turf(over)
		for(var/obj/item/I in src)
			I.forceMove(T)

/obj/item/reagent_containers/food/drinks/drinkingglass/wooden/dropped(mob/user, silent)
	. = ..()
	if((locate(/obj/item) in src) && (locate(/obj/structure/table) in get_turf(loc)) && !length(reagents.reagent_list))
		// var/matrix/M = matrix(transform)
		// M.Turn(180)
		// transform = M
		flipped = TRUE
		icon_state += "_flipped"
		reagents.reagents_holder_flags &= ~(OPENCONTAINER)

/obj/item/reagent_containers/food/drinks/drinkingglass/wooden/on_attack_hand(mob/user, act_intent, unarmed_attack_flags)
	if(flipped)
		flipped = FALSE
		icon_state = initial(icon_state)
		reagents.reagents_holder_flags |= OPENCONTAINER
		var/turf/T = get_turf(src)
		var/list/tpp = LAZYCOPY(table_pixel_positions) // this way we won't overwrite our array
		for(var/obj/item/I in src)
			I.forceMove(T)
			var/item_pixel_positions = pick_n_take(tpp)
			I.pixel_x += item_pixel_positions[1]
			I.pixel_y += item_pixel_positions[2]
	. = ..()
