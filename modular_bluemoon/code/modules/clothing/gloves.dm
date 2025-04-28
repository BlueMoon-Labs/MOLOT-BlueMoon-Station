/obj/item/clothing/gloves/cbrn/mopp
	icon = 'modular_bluemoon/icons/obj/clothing/gloves.dmi'
	mob_overlay_icon = 'modular_bluemoon/icons/mob/clothing/hands.dmi'
	icon_state = "mopp"
	item_state = "mopp"

/obj/item/clothing/gloves/cbrn/engineer
	icon = 'modular_bluemoon/icons/obj/clothing/gloves.dmi'
	mob_overlay_icon = 'modular_bluemoon/icons/mob/clothing/hands.dmi'
	icon_state = "cbrn_engi"
	item_state = "cbrn_engi"

//////////////////////////////////////////////////////////////////////
/obj/item/clothing/gloves/cbrn/medical
	name = "medical CBRN gloves"
	desc = "Chemical, Biological, Radiological and Nuclear. Thick black gloves design for working in hazardous environments and seems to have a thin layer of nitrile for better grasps."
	icon = 'modular_bluemoon/icons/obj/clothing/gloves.dmi'
	mob_overlay_icon = 'modular_bluemoon/icons/mob/clothing/hands.dmi'
	icon_state = "cbrn_med"
	item_state = "cbrn_med"
	var/carrytrait = TRAIT_QUICK_CARRY

/obj/item/clothing/gloves/cbrn/medical/equipped(mob/user, slot)
	..()
	if(slot == ITEM_SLOT_GLOVES)
		ADD_TRAIT(user, carrytrait, GLOVE_TRAIT)

/obj/item/clothing/gloves/cbrn/medical/dropped(mob/user)
	..()
	REMOVE_TRAIT(user, carrytrait, GLOVE_TRAIT)

// research nod
/datum/design/cbrn/cbrnglovesmed
	name = "Medical CBRN Gloves"
	desc = "A pair of medical CBRN gloves."
	id = "cbrn_glovesmed"
	build_type = PROTOLATHE
	materials = list(/datum/material/plastic = 400, /datum/material/uranium = 55, /datum/material/iron = 200)
	build_path = /obj/item/clothing/gloves/cbrn/medical
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL

//////////////////////////////////////////////////////////////////////
