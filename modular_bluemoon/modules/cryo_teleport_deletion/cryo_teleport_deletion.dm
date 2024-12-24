/*/obj/machinery/cryopod/tele/Initialize(mapload)
	if(!(SSticker.current_state == GAME_STATE_PLAYING) && is_station_level(src.z))
		new /obj/structure/frame/machine(src.loc)
		return qdel(src)
	..()*/
