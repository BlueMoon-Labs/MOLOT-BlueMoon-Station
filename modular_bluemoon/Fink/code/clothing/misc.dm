/obj/item/clothing/under/donator/bm/lotos_skirt
	name = "Lotos skirt"
	desc = "Black kitten`s black dress"
	icon = 'modular_bluemoon/Fink/icons/clothing/Lotos_Avi.dmi'
	mob_overlay_icon = 'modular_bluemoon/Fink/icons/clothing/Lotos_Avi.dmi'
	anthro_mob_worn_overlay = 'modular_bluemoon/Fink/icons/clothing/Lotos_Avi.dmi'
	mutantrace_variation = STYLE_DIGITIGRADE | STYLE_NO_ANTHRO_ICON
	armor = list(MELEE = 0, BULLET = 0, LASER = 0,ENERGY = 0, BOMB = 0, BIO = 0, RAD = 0, FIRE = 50, ACID = 50, WOUND = 0)
	always_reskinnable = TRUE
	icon_state = "Lotos"
	item_state = "Lotos"
	unique_reskin = list(
		"Casual" = list("icon_state" = "Lotos", "item_state" = "Lotos"),
		"Lit" = list("icon_state" = "Lotos-Rykav", "item_state" = "Lotos-Rykav"),
		"Strip" = list("icon_state" = "Lotos-Alt", "item_state" = "Lotos-Alt"),
	)
	fitted = FEMALE_UNIFORM_TOP
