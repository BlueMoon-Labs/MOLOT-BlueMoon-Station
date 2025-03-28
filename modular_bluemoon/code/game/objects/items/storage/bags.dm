// -----------------------------
//        Egg bag
// -----------------------------
// vypolneniye platnoy predlozhki
// ERP item

/obj/item/storage/bag/egg
	name = "Egg bag"
	desc = "This is a bag for eggs, and obviously not chicken ones..."
	icon = 'modular_bluemoon/icons/obj/objects.dmi'
	icon_state = "eggbag"
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/storage/bag/egg/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_w_class = WEIGHT_CLASS_NORMAL
	STR.max_combined_w_class = 30
	STR.max_items = 10
	STR.display_numerical_stacking = TRUE
	STR.can_hold = typecacheof(list(/obj/item/oviposition_egg))
