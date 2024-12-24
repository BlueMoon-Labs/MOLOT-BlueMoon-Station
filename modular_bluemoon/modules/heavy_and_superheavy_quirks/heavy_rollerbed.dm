/*
 * ROLLER BED
 */

/obj/structure/bed/roller
	var/can_move_superheavy_characters = FALSE // При TRUE позволяет укладывать на каталку сверхтяжелых персонажей

/obj/structure/bed/roller/heavy
	name = "heavy roller bed"
	icon = 'modular_bluemoon/modules/heavy_and_superheavy_quirks/heavy_rollerbed.dmi'
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
	icon = 'modular_bluemoon/modules/heavy_and_superheavy_quirks/heavy_rollerbed.dmi'
	w_class = WEIGHT_CLASS_HUGE

/obj/item/roller/heavy/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/two_handed, require_twohands = TRUE)

/obj/item/roller/heavy/deploy_roller(mob/user, atom/location)
	var/obj/structure/bed/roller/heavy/R = new /obj/structure/bed/roller/heavy(location)
	R.add_fingerprint(user)
	qdel(src)

/*
 * RESEARCH
 */

/datum/design/roller_heavy
	name = "heavy roller bed"
	desc = "A collapsed roller bed that can be carried around. Can be used to move heavy spacemens and spacevulfs."
	id = "heavy_roller_bed"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 8000)
	build_path = /obj/item/roller/heavy
	category = list("Medical Designs")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL|DEPARTMENTAL_FLAG_SECURITY

/datum/techweb_node/base/New()
	var/extra_designs = list(
		"heavy_roller_bed"
	)
	LAZYADD(design_ids, extra_designs)
	. = ..()
