/obj/item/tvcamera
	name = "press camera drone"
	desc = "A Ward-Takahashi EyeBuddy livestreaming press camera drone. Weapon of choice for war correspondents and reality show cameramen. It does not appear to have any internal memory storage."
	icon = 'modular_bluemoon/icons/obj/items_and_weapons.dmi'
	mob_overlay_icon = 'modular_bluemoon/icons/mob/clothing/belt.dmi'
	lefthand_file = 'modular_bluemoon/icons/mob/inhands/items/items_lefthand.dmi'
	righthand_file = 'modular_bluemoon/icons/mob/inhands/items/items_righthand.dmi'
	icon_state = "camcorder"
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BELT
	var/on = 0

/obj/item/tvcamera/attack_self(mob/user)
	on = !on
	if(on)
		icon_state = "camcorder_on"
		to_chat(user, "[src] on!.")
	if(!on)
		to_chat(user, "[src] off.")
		icon_state = "camcorder"
	update_icon()
	playsound(src.loc, 'sound/weapons/magin.ogg', 50, 1)
