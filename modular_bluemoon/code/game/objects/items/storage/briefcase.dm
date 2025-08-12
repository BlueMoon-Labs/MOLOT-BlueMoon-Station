/obj/item/storage/briefcase/lawyer/family/loadout //changed due to PopulateContents() containing other stuff
	name = "battered  briefcase"
	icon_state = "gbriefcase"
	lefthand_file = 'icons/mob/inhands/equipment/briefcase_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/briefcase_righthand.dmi'
	desc = "An old briefcase with a golden trim. It's clear they don't make them as good as they used to. Comes with an added belt clip!"
	slot_flags = ITEM_SLOT_BELT

/obj/item/storage/briefcase/lawyer/family/loadout/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_w_class = WEIGHT_CLASS_NORMAL
	STR.max_combined_w_class = 14

/obj/item/storage/briefcase/lawyer/family/loadout/PopulateContents()
	new /obj/item/pen/fountain(src)
	new /obj/item/paper_bin(src)
