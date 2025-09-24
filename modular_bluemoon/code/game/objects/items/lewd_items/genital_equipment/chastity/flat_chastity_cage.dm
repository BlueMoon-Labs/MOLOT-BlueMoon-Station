/obj/item/genital_equipment/chastity_cage/flat
	name = "flat chastity cage"
	desc = "Completely flat metal chastity cage for a pathetic little clitty."
	icon = 'modular_bluemoon/icons/obj/lewd_items/flat_chastity.dmi'
	icon_state = "flat_cage"
	worn_icon_state = "flat_cage"
	break_time = 40 SECONDS
	resizeable = FALSE

/obj/item/genital_equipment/chastity_cage/flat/Initialize(mapload, obj/item/key/chastity_key/newkey = null)
	. = ..()
	color = null

/obj/item/genital_equipment/chastity_cage/flat/item_inserting(datum/source, obj/item/organ/genital/G, mob/user)
	var/obj/item/organ/genital/penis/P = G
	if(G.owner?.dna?.features["cock_taur"] || round(P.length * (P.owner ? get_size(P.owner) : 1), 0.25) >= 15)
		to_chat(user, span_warning("This penis is too big for such a little cage."))
		return FALSE
	. = ..()

/obj/item/storage/box/chastity_cage/flat
	name = "flat chastity box"

/obj/item/storage/box/chastity_cage/flat/PopulateContents()
	var/newkey = new /obj/item/key/chastity_key(src)
	new /obj/item/genital_equipment/chastity_cage/flat(src, newkey)
