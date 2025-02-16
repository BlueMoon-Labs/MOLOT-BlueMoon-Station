/*
 * ROLLER BED
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
	w_class = WEIGHT_CLASS_HUGE

/obj/item/roller/heavy/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/two_handed, require_twohands = TRUE)

/obj/item/roller/heavy/deploy_roller(mob/user, atom/location)
	var/obj/structure/bed/roller/heavy/R = new /obj/structure/bed/roller/heavy(location)
	R.add_fingerprint(user)
	qdel(src)
