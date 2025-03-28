//ifak base nahui
/obj/item/storage/ifak
	name = "\improper Security First-Aid Kit"
	desc = "Individual first-aid trauma kit, containing essential life-saving remedy. Designated to soldiers and security officers."
	icon_state = "ifak"
	item_state = "firstaid"
	lefthand_file = 'icons/mob/inhands/equipment/medical_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/medical_righthand.dmi'
	throw_speed = 3
	throw_range = 7
	w_class = WEIGHT_CLASS_SMALL
	var/empty = FALSE
	custom_price = PRICE_ABOVE_NORMAL
	custom_premium_price = PRICE_EXPENSIVE

/obj/item/storage/ifak/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_w_class = WEIGHT_CLASS_SMALL
	STR.max_items = 6
	STR.allow_quick_gather = TRUE
	STR.click_gather = TRUE
	STR.can_hold = typecacheof(list(/obj/item/stack/medical/gauze, /obj/item/reagent_containers/pill/patch/silver_sulf, /obj/item/reagent_containers/pill/patch/styptic, /obj/item/reagent_containers/pill/salbutamol, /obj/item/reagent_containers/pill/charcoal, /obj/item/reagent_containers/hypospray/medipen))

/obj/item/storage/ifak/PopulateContents()
	if(empty)
		return
	new /obj/item/stack/medical/gauze(src)
	new /obj/item/reagent_containers/pill/patch/silver_sulf(src)
	new /obj/item/reagent_containers/pill/patch/styptic(src)
	new /obj/item/reagent_containers/pill/salbutamol(src)
	new /obj/item/reagent_containers/pill/charcoal(src)
	new /obj/item/reagent_containers/hypospray/medipen/ekit(src)
