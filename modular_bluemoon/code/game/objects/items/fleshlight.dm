GLOBAL_LIST_EMPTY(portalpanties)
GLOBAL_LIST_EMPTY(fleshlight_portallight)

/obj/item/clothing/underwear/briefs/panties/portalpanties
	body_parts_covered = NONE	// Коль что сами через настройки выставят для себя
	var/seamless = FALSE 		// Закрытие трусиков на латексный ключ
	var/free_use = FALSE 		// Общий доступ для использования
	var/last_free_use_change	// Последнее изменение общего доступа у трусиков
	interactable_in_strip_menu = TRUE

/mob/living/carbon/human
	var/fleshlight_nickname //Используется для анонимизации персонажа

// Использование эмоутов через фонарик
/obj/item/portallight/examine(mob/user)
	. = ..()
	. += "<span class='notice'>Возможен более точный <b>контроль ситуации</b>. (Ctrl+Click для кастомного эмоута)</span>"

/obj/item/portallight/CtrlClick(mob/user)
	. = ..()
	if(GLOB.say_disabled)	//This is dumb but it's here because heehoo copypaste, who the FUCK uses this to identify lag?
		to_chat(usr, "<span class='danger'>Speech is currently admin-disabled.</span>")
		return
	user.emote("fleshlight")

/obj/item/clothing/underwear/briefs/panties/portalpanties/examine(mob/user)
	. = ..()
	. += "<span class='notice'>Возможен более точный <b>контроль ситуации</b>. (Ctrl+Click для кастомного эмоута)</span>"

/obj/item/clothing/underwear/briefs/panties/portalpanties/CtrlClick(mob/user)
	. = ..()
	if(GLOB.say_disabled)	//This is dumb but it's here because heehoo copypaste, who the FUCK uses this to identify lag?
		to_chat(usr, "<span class='danger'>Speech is currently admin-disabled.</span>")
		return
	user.emote("fleshlight")

/datum/emote/sound/human/fleshlight
	key = "fleshlight"
	key_third_person = "fleshlight"
	message = null
	mob_type_blacklist_typecache = list(/mob/living/brain)

/datum/emote/sound/human/fleshlight/proc/check_invalid(mob/user, input)
	if(stop_bad_mime.Find(input, 1, 1))
		to_chat(user, "<span class='danger'>Invalid emote.</span>")
		return TRUE
	return FALSE

/datum/emote/sound/human/fleshlight/run_emote(mob/user, params, type_override = null)
	if(jobban_isbanned(user, "emote"))
		to_chat(user, "You cannot send subtle emotes (banned).")
		return FALSE
	else if(user.client && user.client.prefs.muted & MUTE_IC)
		to_chat(user, "You cannot send IC messages (muted).")
		return FALSE
	var/mob/living/carbon/human/H_user = user

	var/list/select = list()
	for(var/obj/item/I in H_user.held_items + H_user.r_store + H_user.l_store)
		if(istype(I, /obj/item/portallight))
			select |= I
	if(H_user.wear_mask && istype(H_user.wear_mask, /obj/item/clothing/underwear/briefs/panties/portalpanties))
		select |= H_user.wear_mask
	if(H_user.w_underwear && istype(H_user.w_underwear, /obj/item/clothing/underwear/briefs/panties/portalpanties))
		select |= H_user.w_underwear

	var/choosen_flesh
	if(!select)
		return FALSE
	else if(select.len == 1)
		choosen_flesh = select[1]
	else
		choosen_flesh = tgui_input_list(user, "Choose what to use:", "Fleshlight preference", select)
		if(!choosen_flesh)
			return FALSE

	var/list/show_to = list()
	if(!H_user.fleshlight_nickname)
		var/new_fleshlight_nickname = stripped_input(user, "Задайте своё прозвище, его можно задать только 1 раз (Если не выбрать, будет задано случайное):", "Character Preference", null, MAX_NAME_LEN)
		if(new_fleshlight_nickname)
			new_fleshlight_nickname = reject_bad_name(new_fleshlight_nickname, allow_numbers = TRUE)
			if(new_fleshlight_nickname)
				H_user.fleshlight_nickname = new_fleshlight_nickname
	if(!H_user.fleshlight_nickname)
		H_user.fleshlight_nickname = pick("Aqua", "Azure", "Black", "Blue", "Coral", "Crimson","Cyan", "Red", "Violet", "Gray",\
								"White", "Yellow", "Indigo", "Ivory", "Lime", "Orchid", "Olive", "Silver", "Teal", "Turquoise")
		H_user.fleshlight_nickname += " " + pick("Adara", "Aeon", "Aerilon", "Agora", "Berea", "Cascor", "Cogito", "Eadu", "Eldar", "Farrfin",\
								"Gaia", "Glacia", "Gorta", "Gree", "Hala", "Heian", "Hillys", "Ingo", "Ivax", "Nix")

	if(istype(choosen_flesh, /obj/item/portallight))
		var/obj/item/portallight/PF = choosen_flesh
		if(PF.portalunderwear && ishuman(PF.portalunderwear.loc))
			var/mob/living/carbon/human/H = PF.portalunderwear.loc
			if(H.w_underwear == PF.portalunderwear || H.wear_mask == PF.portalunderwear)
				show_to |= H

	else if(istype(choosen_flesh, /obj/item/clothing/underwear/briefs/panties/portalpanties))
		var/obj/item/clothing/underwear/briefs/panties/portalpanties/PP = choosen_flesh
		for(var/obj/item/I in PP.portallight)
			if(ishuman(I.loc))
				var/mob/living/carbon/human/H = I.loc
				show_to |= H

	if(!show_to.len)
		to_chat(user, "There are no one on other side.")
		return FALSE

	else if(!params)
		var/subtle_emote = stripped_multiline_input_or_reflect(user, "Choose an emote to display.", "[choosen_flesh]" , null, MAX_MESSAGE_LEN)
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

	user.log_message("[message] (FLESHLIGH)", LOG_SUBTLER)
	message = "<span class='emote'><b>[H_user.fleshlight_nickname]</b> <i>[user.say_emphasis(message)]</i></span>"

	for(var/mob/living/L in range(user, 1))
		show_to |= L

	for(var/i in show_to)
		var/mob/M = i
		M.show_message(message)

// Закрытие трусиков на латексные ключ
/obj/item/clothing/underwear/briefs/panties/portalpanties/attack_hand(mob/user)
	if(!ishuman(user))
		return ..()
	if(seamless && (user.get_item_by_slot(ITEM_SLOT_UNDERWEAR) == src || user.get_item_by_slot(ITEM_SLOT_MASK) == src))
		to_chat(user, span_purple(pick("You pull your panties as you search for some sort of escape.",
									"You can't find any leverage to remove these panties!",
									"Your pointless clawing seems to only make things more skin tight")))
		return
	return ..()

/obj/item/clothing/underwear/briefs/panties/portalpanties/MouseDrop(atom/over_object)
	return FALSE // Грубоватый запрет снять вещь перетягиванием в руки (да без учётов других возможных штук с этим, УВЫ)

/obj/item/clothing/underwear/briefs/panties/portalpanties/attackby(obj/item/K, mob/user, params)
	if(istype(K, /obj/item/key/latex))
		seamless = !seamless
		to_chat(user, span_warning("The panties suddenly [seamless ? "tighten" : "loosen"]!"))
		if(HAS_TRAIT(src, TRAIT_NODROP))
			REMOVE_TRAIT(src, TRAIT_NODROP, CLOTHING_TRAIT)
		else if(current_equipped_slot == ITEM_SLOT_UNDERWEAR || current_equipped_slot == ITEM_SLOT_MASK)
			ADD_TRAIT(src, TRAIT_NODROP, CLOTHING_TRAIT)
	return ..()

/obj/item/clothing/underwear/briefs/panties/portalpanties/equipped(mob/user, slot)
	. = ..()
	if(seamless)
		if(slot == ITEM_SLOT_UNDERWEAR || slot == ITEM_SLOT_MASK)
			ADD_TRAIT(src, TRAIT_NODROP, CLOTHING_TRAIT)

// Приватный режим с переключением на AltClick
/obj/item/clothing/underwear/briefs/panties/portalpanties/verb/free_use()
	set name = "Switch Privacy"
	set category = "Object"
	set src in usr

	if(!iscarbon(usr))
		return FALSE

	if(usr.get_item_by_slot(ITEM_SLOT_UNDERWEAR) == src)
		to_chat(usr, span_purple("You must take them off first!"))
		return FALSE

	if(last_free_use_change + 30 SECONDS >= world.time)
		to_chat(usr, span_warning("You need wait a bit before change public use for [src]!"))
		return FALSE

	free_use = !free_use
	last_free_use_change = world.time
	if(free_use)
		to_chat(usr, "[src] are now public!")
		for(var/obj/item/portallight/P in GLOB.fleshlight_portallight)
			P.audible_message("[icon2html(P, hearers(P))] *beep* *beep* *beep* - New public device is found!", hearing_distance = 2)
			playsound(P, 'sound/machines/triple_beep.ogg', ASSEMBLY_BEEP_VOLUME, TRUE)
			P.available_panties += src
	else
		to_chat(usr, "[src] are no longer public. All connected devices have been disconnected.")
		LAZYCLEARLIST(portallight)
		for(var/obj/item/portallight/P in GLOB.fleshlight_portallight)
			P.available_panties -= src
			if(P.portalunderwear == src)
				P.portalunderwear = null
				P.updatesleeve()
				P.icon_state = "unpaired"

/obj/item/clothing/underwear/briefs/panties/portalpanties/AltClick(mob/user)
	. = ..()
	if(do_mob(user, src, 2 SECONDS))
		free_use()

// Да, можно сделать красивее, но текущая имплиментация работает, so go on
/obj/item/portallight/New()
	..()
	GLOB.fleshlight_portallight += src
	for(var/obj/item/clothing/underwear/briefs/panties/portalpanties/P in GLOB.portalpanties)
		if(P.free_use)
			available_panties += P

/obj/item/portallight/Destroy()
	..()
	GLOB.fleshlight_portallight -= src

/obj/item/clothing/underwear/briefs/panties/portalpanties/New()
	..()
	GLOB.portalpanties += src

/obj/item/clothing/underwear/briefs/panties/portalpanties/Destroy()
	..()
	GLOB.portalpanties -= src

// Переименование трусиков
/obj/item/clothing/underwear/briefs/panties/portalpanties/verb/rename()
	set name = "Rename panties"
	set category = "Object"
	set src in usr
	if(iscarbon(usr) && usr.get_item_by_slot(ITEM_SLOT_UNDERWEAR) == src)
		to_chat(span_purple("You must take them off first!"))
		return

	var/input = input("How do you wish to name it?") as text
	if(input)
		name = input

// Маскировка трусиков под маску и трусики
/obj/item/clothing/underwear/briefs/panties/portalpanties/Initialize(mapload)
	. = ..()
	var/datum/action/item_action/chameleon/change/chameleon_panties = new(src)
	chameleon_panties.chameleon_type = /obj/item/clothing/underwear/briefs
	chameleon_panties.chameleon_name = "Panties"
	chameleon_panties.initialize_disguises()
	var/datum/action/item_action/chameleon/change/chameleon_mask = new(src)
	chameleon_mask.chameleon_type = /obj/item/clothing/mask
	chameleon_mask.chameleon_name = "Mask"
	chameleon_mask.initialize_disguises()

// многие ко многим ©ICE-IS-NICE
/obj/item/portallight/AltClick(mob/user)
	. = ..()
	var/obj/item/clothing/underwear/briefs/panties/portalpanties/to_connect
	if(available_panties.len)
		to_connect = tgui_input_list(user, "Choose...", "Available panties", available_panties, null)
	if(!to_connect)
		return FALSE

	if(to_connect == portalunderwear)
		to_chat(usr, "Conntection terminated!")
		portalunderwear = null
		to_connect.portallight -= src //upair the fleshlight
		to_connect.update_portal()
		icon_state = "unpaired"
		update_appearance()
		playsound(src, 'sound/machines/buzz-sigh.ogg', 50, FALSE)
		return FALSE
	if(!to_connect.free_use)
		to_chat(usr, "They have public mode turned off!")
		return FALSE
	portalunderwear = to_connect //pair the panties on the fleshlight.
	to_connect.update_portal()
	to_connect.portallight += src //pair the fleshlight
	icon_state = "paired"
	update_appearance()
	playsound(src, 'sound/machines/ping.ogg', 50, FALSE)
