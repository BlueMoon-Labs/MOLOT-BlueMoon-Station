GLOBAL_DATUM_INIT(inteqcrew_deathrattle_group, /datum/deathrattle_group, new)

/obj/item/implant/deathrattle/inteqcrew
	name = "Inteqs ship crew deathrattle implant"
	desc = "Hope no one else dies, prepare for when they do"

/obj/item/implant/deathrattle/inteqcrew/implant(mob/living/target, mob/user, silent = FALSE, force = FALSE)
	. = ..()
	group = GLOB.inteqcrew_deathrattle_group
	group.register(src)
