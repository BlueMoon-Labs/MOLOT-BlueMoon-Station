/obj/item/pda/send_message(mob/living/user, list/obj/item/pda/targets, everyone)
	// Check for D4C craving
	if(HAS_TRAIT(user, TRAIT_DUMB_CUM_CRAVE))
		// Warn user, then return
		to_chat(user, span_love("You can't focus on anything but cum right now!"))
		return

	// Return normally
	. = ..()

/obj/item/pda/receive_message(datum/signal/subspace/pda/signal)
	// Define user
	var/mob/living/carbon/human/pda_user = loc

	// Check if user is valid
	if(istype(pda_user))
		// Check for D4C craving
		if(HAS_TRAIT(pda_user, TRAIT_DUMB_CUM_CRAVE))
			// Set message data
			tnote += "<i><b>&larr; From <a href='byond://?src=[REF(src)];choice=Message;target=[REF(signal.source)]'>[signal.data["name"]]</a> ([signal.data["job"]]):</b></i> <a href='byond://?src=[REF(src)];choice=toggle_block;target=[signal.data["name"]]'>(BLOCK/UNBLOCK)</a><br>[signal.format_message()]<br>"
			if (!silent)	//отправитель думает, что его намеренно игнорят, а получатель думает, что полковнику никто не пишет...
				playsound(src, 'sound/machines/twobeep.ogg', 50, 1)
				audible_message("[icon2html(src, hearers(src))] *[ttone]*", null, 3)
			new_alert = TRUE
			update_icon()
			// Return with no other effects
			return

	// Return normally
	. = ..()
