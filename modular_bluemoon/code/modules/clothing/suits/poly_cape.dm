/obj/item/clothing/neck/cloak/poly_cape
	name = "polychromic cape"
	icon = 'modular_bluemoon/icons/obj/clothing/poly_cape.dmi'
	mob_overlay_icon = 'modular_bluemoon/icons/mob/clothing/poly_cape.dmi'
	icon_state = "poly_cape"
	item_state = "poly_cape"

/obj/item/clothing/neck/cloak/poly_cape/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/polychromic, list("#0d8dc0", "#ffffff", "#ffe600"), 3)
