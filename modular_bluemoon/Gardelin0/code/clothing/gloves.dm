/obj/item/clothing/gloves/poly_evening
	name = "polychromic evening gloves"
	desc = "Thin, pretty polychromic gloves intended for use in regal feminine attire."
	icon = 'modular_bluemoon/Gardelin0/icons/clothing/object/gloves.dmi'
	mob_overlay_icon = 'modular_bluemoon/Gardelin0/icons/clothing/worn/hands.dmi'
	icon_state = "poly_evening"
	item_state = "poly_evening"
	transfer_prints = TRUE
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	heat_protection = HANDS
	max_heat_protection_temperature = COAT_MAX_TEMP_PROTECT
	strip_mod = 0.9

/obj/item/clothing/gloves/poly_evening/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/polychromic, list("#FEFEFE"), 1)

/obj/item/clothing/gloves/transparent
	name = "transparent bracers"
	desc = "A pair of transparent bracers, they look fancy."
	icon = 'modular_bluemoon/Gardelin0/icons/clothing/object/gloves.dmi'
	mob_overlay_icon = 'modular_bluemoon/Gardelin0/icons/clothing/worn/hands.dmi'
	icon_state = "transparent_bracers"
	item_state = "transparent_bracers"
	transfer_prints = TRUE
