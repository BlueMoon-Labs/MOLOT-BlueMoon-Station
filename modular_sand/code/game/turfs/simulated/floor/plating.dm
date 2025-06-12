/turf/open/floor/plating
	var/unfastened = FALSE

/turf/open/floor/plating/examine(mob/user)
	. = ..()
	if(islist(baseturfs) && !((/turf/baseturf_bottom in baseturfs) || (locate(/turf/open/space) in baseturfs)))
		. += span_notice("\The [src] cannot be removed from the floor.")
	else if(!islist(baseturfs) && !(baseturfs == /turf/baseturf_bottom || istype(baseturfs, /turf/open/space)))
		. += span_notice("\The [src] cannot be removed from the floor.")
	else if(unfastened)
		. += span_notice("\The [src] could be <b>welded</b> off the floor.")
		. += span_warning("The screws on [src] appear loose.")
	else
		. += span_notice("The screws on [src] could be loosened with <b>a screwdriver</b>.")

/turf/open/floor/plating/screwdriver_act(mob/living/user, obj/item/I)
	if(type == /turf/open/floor/plating)
		if(islist(baseturfs))
			if(!((/turf/baseturf_bottom in baseturfs) || (locate(/turf/open/space) in baseturfs)))
				to_chat(user, span_warning("You cannot remove this plating."))
				balloon_alert(user, "can't remove!")
				return
		else if(!(baseturfs == /turf/baseturf_bottom || istype(baseturfs, /turf/open/space)))
			to_chat(user, span_warning("You cannot remove this plating."))
			balloon_alert(user, "can't remove!")
			return
		to_chat(user, span_notice("You start [unfastened ? "fastening" : "unfastening"] [src]."))
		balloon_alert(user, "[unfastened ? "fastening" : "unfastening"]")
		if(!I.use_tool(src, user, 20, volume = 80))
			return
		to_chat(user, span_notice("You [unfastened ? "fasten" : "unfasten"] [src]."))
		balloon_alert(user, "[unfastened ? "fastened" : "unfastened"]")
		unfastened = !unfastened


/turf/open/floor/plating/welder_act(mob/living/user, obj/item/I)
	. = ..()
	if(type == /turf/open/floor/plating && unfastened)
		if(islist(baseturfs))
			if(!((/turf/baseturf_bottom in baseturfs) || (locate(/turf/open/space) in baseturfs)))
				return
		else if(!(baseturfs == /turf/baseturf_bottom || istype(baseturfs, /turf/open/space)))
			return
		to_chat(user, span_warning("You start removing [src], exposing space after you're done!"))
		balloon_alert(user, "removing")
		if(!I.use_tool(src, user, 50, volume = 160)) //extra loud to let people know something's going down
			return
		new /obj/item/stack/tile/plasteel(get_turf(src))
		ReplaceWithLattice()
		to_chat(user, span_notice("You remove [src]."))
		balloon_alert(user, "removed")
