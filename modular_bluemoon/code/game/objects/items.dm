/obj/item
	var/interactable_in_strip_menu = FALSE

/**
 * This proc is called when mob (stripper) opens other's mob invetory menu (owner), then selects a worn item to be unequipped,
 * but instead of beginning unequipping selected item, stripper tries to use his in hand item on seleted item.
 * Only certain items can be interacted with while being worn by owner: set "interactable_in_strip_menu" flag.
 * Proc returns TRUE if held item can and will be used on worn item (attackby()).
 */
/obj/item/proc/use_item_on_strippable(mob/stripper, mob/owner, obj/item/held_item)
	. = TRUE
	if(!istype(held_item))
		return FALSE
	if(!interactable_in_strip_menu)
		// to_chat(stripper, span_warning("Selected item can not be interacted by in hand items while being worn."))
		return FALSE
	owner.visible_message(
			span_warning("[stripper] is using [held_item] on [owner]'s [name]."),
			span_userdanger("[stripper] is using [held_item] on your [name]."),
		)
	attackby(held_item, owner) //WARNING! We pretend wearer is using item to prevent errors. We adjust this proc to already existing mechanics.
