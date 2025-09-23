/*
 * HEAVY ROLLER BED
 */

/obj/structure/bed/roller
	var/can_move_superheavy_characters = FALSE // При TRUE позволяет укладывать на каталку сверхтяжелых персонажей

/obj/structure/bed/roller/heavy
	name = "heavy roller bed"
	icon = 'modular_bluemoon/icons/obj/heavy_rollerbed.dmi'
	foldabletype = /obj/item/roller/heavy
	pixel_x = -16
	can_move_superheavy_characters = TRUE

/obj/structure/bed/roller/heavy/post_buckle_mob(mob/living/M)
	density = TRUE
	icon_state = "up"
	M.pixel_y = initial(M.pixel_y)
	M.pixel_x = initial(M.pixel_x)+16
	M.lying = 270

/obj/item/roller/heavy
	name = "heavy roller bed"
	desc = "A collapsed roller bed that can be carried around. Can be used to move heavy spacemens and spacevulfs."
	icon = 'modular_bluemoon/icons/obj/heavy_rollerbed.dmi'
	rollertype = /obj/structure/bed/roller/heavy
	w_class = WEIGHT_CLASS_HUGE

/obj/item/roller/heavy/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/two_handed, require_twohands = TRUE)


/*
 * STASIS ROLLER BED
 */

/obj/structure/bed/roller/stasis
	name = "stasis roller bed"
	icon = 'modular_bluemoon/icons/obj/rollerbed.dmi'
	foldabletype = /obj/item/roller/stasis
	var/obj/item/stock_parts/cell/cell

/obj/structure/bed/roller/stasis/Initialize(mapload)
	. = ..()
	START_PROCESSING(SSobj, src)

/obj/structure/bed/roller/stasis/Destroy()
	. = ..()
	STOP_PROCESSING(SSobj, src)

/obj/structure/bed/roller/stasis/examine(mob/user)
	. = ..()
	if(cell)
		. += span_notice("Cell charge: [round(cell.percent())]%")
		. += span_notice("Alt-click to remove the cell.")
	else
		. += span_warning("No cell installed.")

/obj/structure/bed/roller/stasis/AltClick(mob/user)
	. = ..()
	if(user && Adjacent(user) && user.can_hold_items())
		user.put_in_hands(cell)
		cell = null
	update_appearance()

/obj/structure/bed/roller/stasis/attackby(obj/item/W, mob/user, params)
	if(!iscarbon(user))
		return
	if(!cell && istype(W, /obj/item/stock_parts/cell))
		cell = W
		W.forceMove(src)
		return
	. = ..()

/obj/structure/bed/roller/stasis/after_fold_roller(mob/user, obj/item/roller/stasis/I)
	if(cell && I)
		I.cell = cell
		cell.forceMove(I)
		cell = null
	return ..()

/obj/item/roller/stasis
	name = "stasis roller bed"
	desc = "A collapsed roller bed with a stasis function that can be carried around."
	icon = 'modular_bluemoon/icons/obj/rollerbed.dmi'
	rollertype = /obj/structure/bed/roller/stasis
	var/obj/item/stock_parts/cell/cell

/obj/item/roller/stasis/examine(mob/user)
	. = ..()
	if(cell)
		. += span_notice("Cell charge: [round(cell.percent())]%")
		. += span_notice("Alt-click to remove the cell.")
	else
		. += span_warning("No cell installed.")

/obj/item/roller/stasis/attackby(obj/item/I, mob/living/user, params)
	. = ..()
	if(!iscarbon(user))
		return
	if(!cell && istype(I, /obj/item/stock_parts/cell))
		cell = I
		I.forceMove(src)
		return
	. = ..()

/obj/item/roller/stasis/AltClick(mob/user)
	. = ..()
	if(user && Adjacent(user) && user.can_hold_items())
		user.put_in_hands(cell)
		cell = null

/obj/item/roller/stasis/after_deploy_roller(mob/user, obj/structure/bed/roller/stasis/R)
	if(cell && R)
		R.cell = cell
		cell.forceMove(R)
		cell = null
	return ..()
