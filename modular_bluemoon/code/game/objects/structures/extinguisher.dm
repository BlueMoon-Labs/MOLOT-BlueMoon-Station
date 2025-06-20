/obj/structure/extinguisher_cabinet/Initialize(mapload, ndir, building)
	. = ..()
	if(!mapload)
		update_icon()
