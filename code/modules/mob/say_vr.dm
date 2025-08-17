//////////////////////////////////////////////////////
////////////////////SUBTLE COMMAND////////////////////
//////////////////////////////////////////////////////

/mob/proc/get_top_level_mob()
	if(ismob(src.loc) && src.loc != src)
		var/mob/M = src.loc
		return M.get_top_level_mob()
	return src

/proc/get_top_level_mob(mob/S)
	if(ismob(S.loc) && S.loc != S)
		var/mob/M = S.loc
		return M.get_top_level_mob()
	return S

///////////////// EMOTE CODE
// Maybe making this as an emote is less messy?
// It was - ktccd
/datum/emote/sound/human/subtle
	key = "subtle"
	key_third_person = "subtle"
	message = null
	mob_type_blacklist_typecache = list(/mob/living/brain)

/datum/emote/sound/human/subtle/proc/check_invalid(mob/user, input)
	if(stop_bad_mime.Find(input, 1, 1))
		to_chat(user, "<span class='danger'>Invalid emote.</span>")
		return TRUE
	return FALSE

/datum/emote/sound/human/subtle/run_emote(mob/user, params, type_override = null)
	if(jobban_isbanned(user, "emote"))
		to_chat(user, "You cannot send subtle emotes (banned).")
		return FALSE
	else if(user.client && user.client.prefs.muted & MUTE_IC)
		to_chat(user, "You cannot send IC messages (muted).")
		return FALSE
	else if(!params)
		var/subtle_emote = stripped_multiline_input_or_reflect(user, "Choose an emote to display.", "Subtle", null, MAX_MESSAGE_LEN)
		if(subtle_emote && !check_invalid(user, subtle_emote))
			message = subtle_emote
		else
			return FALSE
	else
		message = params
		if(type_override)
			emote_type = type_override
	. = TRUE
	if(!can_run_emote(user))
		return FALSE

	user.log_message(message, LOG_EMOTE)
	message = "<span class='emote'><b>[user]</b> <i>[user.say_emphasis(message)]</i></span>"

	for(var/mob/M in GLOB.dead_mob_list)
		if(!M.client || isnewplayer(M))
			continue
		var/T = get_turf(src)
		if(M.stat == DEAD && M.client && (M.client.prefs.chat_toggles & CHAT_GHOSTSIGHT) && !(M in viewers(T, null)) && (user.client)) //SKYRAT CHANGE - only user controlled mobs show their emotes to all-seeing ghosts, to reduce chat spam
			M.show_message(message)

	user.visible_message(message = message, self_message = message, vision_distance = 1, omni = TRUE)

///////////////// SUBTLE 2: NO GHOST BOOGALOO

/datum/emote/sound/human/subtler
	key = "subtler"
	key_third_person = "subtler"
	message = null
	mob_type_blacklist_typecache = list(/mob/living/brain)

/datum/emote/sound/human/subtler/proc/check_invalid(mob/user, input)
	if(stop_bad_mime.Find(input, 1, 1))
		to_chat(user, "<span class='danger'>Invalid emote.</span>")
		return TRUE
	return FALSE

/datum/emote/sound/human/subtler/run_emote(mob/user, params, type_override = null)
	if(jobban_isbanned(user, "emote"))
		to_chat(user, "You cannot send subtle emotes (banned).")
		return FALSE
	else if(user.client && user.client.prefs.muted & MUTE_IC)
		to_chat(user, "You cannot send IC messages (muted).")
		return FALSE
	else if(!params)
		var/subtle_emote = stripped_multiline_input_or_reflect(user, "Choose an emote to display.", "Subtler" , null, MAX_MESSAGE_LEN)
		if(subtle_emote && !check_invalid(user, subtle_emote))
			message = subtle_emote
		else
			return FALSE
	else
		message = params
		if(type_override)
			emote_type = type_override
	. = TRUE
	if(!can_run_emote(user))
		return FALSE

	user.log_message(message, LOG_SUBTLER)
	message = "<span class='emote'><b>[user]</b> <i>[user.say_emphasis(message)]</i></span>"

	var/list/ignored_mobs_list = LAZYCOPY(GLOB.dead_mob_list)
	for(var/mob/living/simple_animal/qareen/Q in range(1, user))
		if(Q != user && !Q.revealed)
			LAZYADD(ignored_mobs_list, Q)

	user.visible_message(message = message, self_message = message, vision_distance = 1, ignored_mobs = ignored_mobs_list, omni = TRUE)

///////////////// SUBTLE 3: DARE DICE

/datum/emote/sound/human/subtler_table
	key = "subtler_table"
	key_third_person = "subtler_table"
	message = null
	mob_type_blacklist_typecache = list(/mob/living/brain)

/datum/emote/sound/human/subtler_table/proc/check_invalid(mob/user, input)
	if(stop_bad_mime.Find(input, 1, 1))
		to_chat(user, "<span class='danger'>Invalid emote.</span>")
		return TRUE
	return FALSE

/datum/emote/sound/human/subtler_table/run_emote(mob/user, params, type_override = null)
	if(!locate(/obj/structure/table) in range(user, 1))
		to_chat(user, "There are no tables around you.")
		return FALSE
	if(jobban_isbanned(user, "emote"))
		to_chat(user, "You cannot send subtle emotes (banned).")
		return FALSE
	else if(user.client && user.client.prefs.muted & MUTE_IC)
		to_chat(user, "You cannot send IC messages (muted).")
		return FALSE
	else if(!params)
		var/subtle_emote = stripped_multiline_input_or_reflect(user, "Choose an emote to display.", "Subtler" , null, MAX_MESSAGE_LEN)
		if(subtle_emote && !check_invalid(user, subtle_emote))
			message = subtle_emote
		else
			return FALSE
	else
		message = params
		if(type_override)
			emote_type = type_override
	. = TRUE
	if(!can_run_emote(user))
		return FALSE

	user.log_message("[message] (TABLE-WRAPPING)", LOG_SUBTLER)
	message = "<span class='emote'><b>[user]</b> <i>[user.say_emphasis(message)]</i></span>"

	var/list/show_to = list()
	var/list/processed = list()
	for(var/obj/structure/table/T in range(user, 1))
		if(processed[T])
			continue
		for(var/obj/structure/table/T2 in T.connected_floodfill(25))
			processed[T2] = TRUE
			for(var/mob/living/L in range(T2, 1))
				if(istype(L, /mob/living/simple_animal/qareen))
					var/mob/living/simple_animal/qareen/Q = L
					if(!Q.revealed)
						continue
				show_to |= L

	for(var/i in show_to)
		var/mob/M = i
		M.show_message(message)

///////////////// VERB CODE
/mob/living/verb/subtle()
	set name = "Subtle"
	set category = "Say"
	if(GLOB.say_disabled)	//This is here to try to identify lag problems
		to_chat(usr, "<span class='danger'>Speech is currently admin-disabled.</span>")
		return
	usr.emote("subtle")

///////////////// VERB CODE 2
/mob/living/verb/subtler()
	set name = "Subtler Anti-Ghost"
	set category = "Say"
	if(GLOB.say_disabled)	//This is here to try to identify lag problems
		to_chat(usr, "<span class='danger'>Speech is currently admin-disabled.</span>")
		return
	usr.emote("subtler")

///////////////// VERB CODE 3
/mob/living/verb/subtler_table()
	set name = "Subtler Around Table"
	set category = "Say"
	if(GLOB.say_disabled)	//This is dumb but it's here because heehoo copypaste, who the FUCK uses this to identify lag?
		to_chat(usr, "<span class='danger'>Speech is currently admin-disabled.</span>")
		return
	usr.emote("subtler_table")
