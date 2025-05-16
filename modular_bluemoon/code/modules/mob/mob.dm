/mob
	var/creation_time = 0

/mob/Initialize()
	. = ..()
	creation_time = world.time
