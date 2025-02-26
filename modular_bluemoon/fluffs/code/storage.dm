/obj/item/storage/box/donator/bm/case_ds
	name = "Dmitry Strelnikov military case"
	desc = "A military supply box."
	icon = 'modular_bluemoon/fluffs/icons/obj/storage.dmi'
	icon_state = "case_ds"
	var/box_state = "case_ds"
	var/opened = FALSE
	item_state = "ds-case"
	lefthand_file = 'modular_bluemoon/fluffs/icons/mob/inhands/storage_lefthand.dmi'
	righthand_file = 'modular_bluemoon/fluffs/icons/mob/inhands/storage_righthand.dmi'
	drop_sound = 'modular_bluemoon/fluffs/sound/case_drop.ogg'
	pickup_sound =  'modular_bluemoon/fluffs/sound/case_pickup.ogg'
	foldable = FALSE
	illustration = null

/obj/item/storage/box/donator/bm/case_ds/PopulateContents()
	. = ..()
	new /obj/item/clothing/under/syndicate/camo(src)
	new /obj/item/clothing/accessory/medal/delta(src)
	new /obj/item/clothing/mask/bandana/skull(src)
	new /obj/item/lighter/donator/bm/militaryzippo(src)
	new /obj/item/storage/fancy/cigarettes/cigars/cohiba(src)

/obj/item/storage/box/donator/bm/case_ds/update_icon()
	. = ..()
	if(opened)
		icon_state = "[box_state]-open"
	else
		icon_state = box_state

/obj/item/storage/box/donator/bm/case_ds/AltClick(mob/user)
	. = ..()
	opened = !opened
	update_icon()

/obj/item/storage/box/donator/bm/case_ds/attack_self(mob/user)
	. = ..()
	opened = !opened
	update_icon()

/obj/item/storage/backpack/martian
	name = "Martian Backpack"
	desc = "Некий Марсианский Артефакт, использующийся в качестве рюкзака. Ткань ощущается довольно прочной. Это точно можно использовать в качестве оружия!"
	icon_state = "martian-backpack"
	item_state = "backpack"
	icon = 'modular_bluemoon/fluffs/icons/obj/clothing/accessories.dmi'
	mob_overlay_icon = 'modular_bluemoon/fluffs/icons/mob/clothing/accessories.dmi'
	force = 5

/obj/item/storage/backpack/satchel/cheese
	name = "Cheese Backpack"
	desc = "Некий Мышиный Артефакт, использующийся в качестве рюкзака. Ткань ощущается довольно прочной. Это точно можно использовать в качестве оружия!"
	icon_state = "cheese-satchel"
	item_state = "satchel"
	icon = 'modular_bluemoon/fluffs/icons/obj/clothing/accessories.dmi'
	mob_overlay_icon = 'modular_bluemoon/fluffs/icons/mob/clothing/accessories.dmi'
	force = 5

/obj/item/storage/box/donator/bm/wh_kit
	name = "A box of Unholy Armor"
	desc = "This is a box imbued with the demonic influence of the Dark Gods, containing armor modkit inside"
	icon_state = "box"

/obj/item/storage/box/donator/bm/wh_kit/PopulateContents()
	new /obj/item/modkit/whhelmet_kit(src)
	new /obj/item/modkit/wharmor_kit(src)
