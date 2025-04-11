// Armory redcode safe

//Proc for opening safe via certain condition, using station code in our case.
/obj/structure/safe/proc/code_opening()
	SIGNAL_HANDLER
	return

/obj/structure/safe/floor/syndi
	name = "plastitanium floor safe"
	desc = "This looks like a hell of plastitanium chunk of armored safe, with a dial and syndicate insignia on it."
	icon = 'modular_bluemoon/icons/obj/structures.dmi'
	icon_state = "floorsafe_syndi"
	number_of_tumblers = 4

/obj/structure/safe/floor/syndi/armory
	name = "Armory Floor Safe"
	number_of_tumblers = 12
	maxspace = 30

/obj/structure/safe/floor/syndi/armory/Initialize(mapload)
	. = ..()
	RegisterSignal(SSsecurity_level, COMSIG_SECURITY_LEVEL_CHANGED, PROC_REF(code_opening))

/obj/structure/safe/floor/syndi/armory/code_opening()
	if(GLOB.security_level >= SEC_LEVEL_RED || GLOB.security_level >= SEC_LEVEL_LAMBDA)
		playsound(src, 'modular_bluemoon/sound/effects/opening-gears.ogg', 200, ignore_walls = TRUE)
		visible_message("<span class='warning'>You hear a loud sound of something heavy opening...</span>")
		locked = 0
		open = 1
		current_tumbler_index = 7
		update_icon()

/obj/structure/safe/floor/syndi/armory/Destroy()
	. = ..()
	UnregisterSignal(SSsecurity_level, COMSIG_SECURITY_LEVEL_CHANGED)

