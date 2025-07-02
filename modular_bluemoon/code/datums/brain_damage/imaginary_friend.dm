/datum/brain_trauma/special/imaginary_friend/quirk
	var/obj/effect/mob_spawn/imaginary_friend/friend_inside_me

/datum/brain_trauma/special/imaginary_friend/quirk/on_gain()
	make_friend()

/datum/brain_trauma/special/imaginary_friend/quirk/on_life() // Не травму
	if(get_dist(owner, friend) > 9)
		friend.recall()

/datum/brain_trauma/special/imaginary_friend/quirk/on_death() // Не травму
	return

/datum/brain_trauma/special/imaginary_friend/quirk/reroll_friend()
	if(friend.client) //reconnected
		return
	friend_initialized = FALSE
	UnregisterSignal(friend, COMSIG_MOB_GHOSTIZE)
	QDEL_NULL(friend)
	make_friend()

/datum/brain_trauma/special/imaginary_friend/quirk/proc/real_reroll_friend()
	SIGNAL_HANDLER
	if(friend.client) //reconnected
		return
	friend_initialized = FALSE
	UnregisterSignal(friend, COMSIG_MOB_GHOSTIZE)
	QDEL_NULL(friend)
	make_friend()

/datum/brain_trauma/special/imaginary_friend/quirk/make_friend()
	friend = new(get_turf(owner), src)
	friend_inside_me = new(friend, src)

/datum/brain_trauma/special/imaginary_friend/quirk/get_ghost()
	return

/obj/effect/mob_spawn/imaginary_friend
	//job_description ставим при иницализации
	short_desc = "Вы воображаемый друг. Главное не косплейте одного рокера с протезом."
	flavour_text = "FRIEND INSIDE ME"
	important_info = "FRIEND INSIDE ME"
	show_flavour = TRUE
	banType = ROLE_PAI
	loadout_enabled = FALSE
	can_load_appearance = TRUE
	roundstart = FALSE
	category = "trauma" // BLUEMOON ADD - категоризация для отображения по спискам
	var/mob/camera/imaginary_friend/friend
	var/datum/brain_trauma/special/imaginary_friend/trauma
	var/mob/living/carbon/owner

/obj/effect/mob_spawn/imaginary_friend/Initialize(mapload, datum/brain_trauma/special/imaginary_friend/quirk/quirk)
	trauma = quirk
	owner = quirk.owner
	friend = quirk.friend
	job_description = "[owner.real_name] Imaginary Friend"
	. = ..()

/obj/effect/mob_spawn/imaginary_friend/attack_ghost(mob/user, latejoinercalling)
	if(!SSticker.HasRoundStarted() || !loc || !ghost_usable)
		return
	if(jobban_isbanned(user, banType))
		to_chat(user, "<span class='warning'>You are jobanned!</span>")
		return
	if(QDELETED(src) || QDELETED(user))
		return
//	if(isobserver(user))
//		var/mob/dead/observer/O = user
//		if(!O.can_reenter_round() && !skip_reentry_check)
//			return FALSE
	var/ghost_role = alert(latejoinercalling ? "Latejoin as [mob_name]? (This is a ghost role, and as such, it's very likely to be off-station.)" : "Become [mob_name]? (Warning, You can no longer be cloned!)",,"Да","Нет")
	if(ghost_role == "Нет" || !loc)
		return
	var/requested_char = FALSE
	if(can_load_appearance)
		switch(alert(user, "Желаете загрузить текущего своего выбранного персонажа?", "Play as your character!", "Yes", "No", "Actually nevermind"))
			if("Yes")
				requested_char = TRUE
			if("Actually nevermind")
				return
	if(QDELETED(src) || QDELETED(user))
		return
	if(latejoinercalling)
		var/mob/dead/new_player/NP = user
		if(istype(NP))
			NP.close_spawn_windows()
			NP.stop_sound_channel(CHANNEL_LOBBYMUSIC)
	log_game("[key_name(user)] становится [mob_name]!")
	trauma.friend_initialized = TRUE
	friend.setup_friend(user, requested_char)
	user.transfer_ckey(trauma.friend, FALSE)
	trauma.RegisterSignal(friend, COMSIG_MOB_GHOSTIZE, TYPE_PROC_REF(/datum/brain_trauma/special/imaginary_friend/quirk, real_reroll_friend))
	qdel(src)
	return TRUE

/mob/camera/imaginary_friend/setup_friend(mob/user, use_pref = FALSE)
	if(!use_pref || !user.client.prefs)
		return ..()
	real_name = user.client.prefs.real_name
	name = real_name
	human_image = get_flat_human_icon(null, pick(SSjob.occupations), user.client.prefs)
