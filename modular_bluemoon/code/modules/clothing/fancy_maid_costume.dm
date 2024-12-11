/obj/item/clothing/under/costume/fancy_maid
	name = "fancy maid costume"
	desc = "Maid in China."
	icon = 'modular_bluemoon/icons/obj/clothing/fancy_maid_costume.dmi'
	mob_overlay_icon = 'modular_bluemoon/icons/mob/clothing/fancy_maid_costume_worn.dmi'
	icon_state = "fancy_maid_costume"
	item_state = "fancy_maid_costume"
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = FALSE
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON

/obj/item/clothing/under/costume/fancy_maid/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/polychromic, list("#333333", "#edf9ff"), 2)

/obj/item/clothing/gloves/fancy_maid_arm_covers
	name = "fancy maid arm covers"
	desc = "Colourable maid gloves!"
	icon = 'modular_bluemoon/icons/obj/clothing/fancy_maid_costume.dmi'
	mob_overlay_icon = 'modular_bluemoon/icons/mob/clothing/fancy_maid_costume_worn.dmi'
	icon_state = "fancy_maid_arm_covers"
	item_state = "fancy_maid_arm_covers"
	w_class = WEIGHT_CLASS_SMALL

/obj/item/clothing/gloves/fancy_maid_arm_covers/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/polychromic, list("#333333", "#edf9ff"), 2)

/obj/item/clothing/neck/fancy_maid_neck_cover
	name = "fancy maid neck cover"
	desc = "A neckpiece for a maid costume, it smells faintly of disappointment."
	icon = 'modular_bluemoon/icons/obj/clothing/fancy_maid_costume.dmi'
	mob_overlay_icon = 'modular_bluemoon/icons/mob/clothing/fancy_maid_costume_worn.dmi'
	icon_state = "fancy_maid_neck_cover"
	item_state = "fancy_maid_neck_cover"
	w_class = WEIGHT_CLASS_SMALL

/obj/item/clothing/neck/fancy_maid_neck_cover/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/polychromic, list("#333333", "#edf9ff"), 2)

/obj/item/clothing/head/fancy_maid_headband
	name = "fancy maid headband"
	desc = "Just like from one of those Chinese cartoons!"
	icon = 'modular_bluemoon/icons/obj/clothing/fancy_maid_costume.dmi'
	mob_overlay_icon = 'modular_bluemoon/icons/mob/clothing/fancy_maid_costume_worn.dmi'
	icon_state = "fancy_maid_headband"
	item_state = "fancy_maid_headband"
	w_class = WEIGHT_CLASS_SMALL

/obj/item/clothing/head/fancy_maid_headband/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/polychromic, list("#edf9ff"), 1)

//Время подумать о пиздинге "Garmentbag" с парадизов
/obj/item/storage/box/fancy_maid_kit
	name = "fancy maid kit"
	desc = "Contains a full kit of the fancy maid costume."
	icon_state = "box"

/obj/item/storage/box/fancy_maid_kit/PopulateContents()
	new /obj/item/clothing/under/costume/fancy_maid(src)
	new /obj/item/clothing/gloves/fancy_maid_arm_covers(src)
	new /obj/item/clothing/neck/fancy_maid_neck_cover(src)
	new /obj/item/clothing/head/fancy_maid_headband(src)

/datum/gear/backpack/fancy_maid_kit
	name = "fancy maid kit"
	path = /obj/item/storage/box/fancy_maid_kit

/* BLUEMOON EDIT - CODE OVERRIDDEN IN 'modular_bluemoon\phoenix404\modules\vending\autodrobe.dm'
/obj/machinery/vending/autodrobe/Initialize(mapload)
	products += list(/obj/item/storage/box/fancy_maid_kit = 3)
	. = ..() */
