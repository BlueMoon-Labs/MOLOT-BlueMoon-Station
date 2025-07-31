/obj/item/dildo
	lefthand_file = 'modular_bluemoon/Gardelin0/icons/items/onmob/lefthand.dmi'
	righthand_file = 'modular_bluemoon/Gardelin0/icons/items/onmob/righthand.dmi'
	item_state = "dildo"
	var/inside = FALSE

/obj/item/buttplug
	icon 		= 'modular_splurt/icons/obj/lewd_items/lewd_items.dmi'
	var/buttplug_size  = 1
	var/inside = FALSE

/obj/item/buttplug/small
	name		= "Small Buttplug"
	desc		= "Маленькая затычка для анального кольца. Обычно, она используется... для удовлетворения."
	icon_state  = "buttplug_metal_small"
	buttplug_size  = 1
	unique_reskin = list(
		"Basic Metal" = list(
			RESKIN_ICON_STATE = "buttplug_metal_small"
		),
		"Pink" = list(
			RESKIN_ICON_STATE = "buttplug_pink_small"
		),
		"Teal" = list(
			RESKIN_ICON_STATE = "buttplug_teal_small"
		),
		"Yellow" = list(
			RESKIN_ICON_STATE = "buttplug_yellow_small"
		),
		"Green" = list(
			RESKIN_ICON_STATE = "buttplug_green_small"
		),
	)

/obj/item/buttplug/med
	name		= "Medium Buttplug"
	desc		= "Средняя затычка для анального кольца. Обычно, она используется... для удовлетворения."
	icon_state  = "buttplug_metal_medium"
	buttplug_size  = 3
	unique_reskin = list(
		"Basic Metal" = list(
			RESKIN_ICON_STATE = "buttplug_metal_medium"
		),
		"Pink" = list(
			RESKIN_ICON_STATE = "buttplug_pink_medium"
		),
		"Teal" = list(
			RESKIN_ICON_STATE = "buttplug_teal_medium"
		),
		"Yellow" = list(
			RESKIN_ICON_STATE = "buttplug_yellow_medium"
		),
		"Green" = list(
			RESKIN_ICON_STATE = "buttplug_green_medium"
		),
	)

/obj/item/buttplug/big
	name		= "Big Buttplug"
	desc		= "Большая затычка для анального кольца. Обычно, она используется... для удовлетворения."
	icon_state  = "buttplug_metal_big"
	buttplug_size  = 4
	unique_reskin = list(
		"Basic Metal" = list(
			RESKIN_ICON_STATE = "buttplug_metal_big"
		),
		"Pink" = list(
			RESKIN_ICON_STATE = "buttplug_pink_big"
		),
		"Teal" = list(
			RESKIN_ICON_STATE = "buttplug_teal_big"
		),
		"Yellow" = list(
			RESKIN_ICON_STATE = "buttplug_yellow_big"
		),
		"Green" = list(
			RESKIN_ICON_STATE = "buttplug_green_big"
		),
	)

/obj/item/buttplug/ComponentInitialize()
	. = ..()
	var/list/procs_list = list(
		"before_inserting" = CALLBACK(src, PROC_REF(item_inserting)),
		"after_inserting" = CALLBACK(src, PROC_REF(item_inserted)),
		"after_removing" = CALLBACK(src, PROC_REF(item_removed)),
	)
	AddComponent(/datum/component/genital_equipment, list(ORGAN_SLOT_PENIS, ORGAN_SLOT_WOMB, ORGAN_SLOT_VAGINA, ORGAN_SLOT_BREASTS, ORGAN_SLOT_ANUS), procs_list)

/obj/item/buttplug/proc/item_inserting(datum/source, obj/item/organ/genital/G, mob/living/user)
	. = TRUE
	if(!(G.owner.client?.prefs?.erppref == "Yes"))
		to_chat(user, span_warning("They don't want you to do that!"))
		return FALSE

	if(!(CHECK_BITFIELD(G.genital_flags, GENITAL_CAN_STUFF)))
		to_chat(user, span_warning("This genital can't be stuffed!"))
		return FALSE

	if(locate(src.type) in G.contents)
		if(user == G.owner)
			to_chat(user, span_notice("You already have a buttplug inside your [G]!"))
		else
			to_chat(user, span_notice("\The <b>[G.owner]</b>'s [G] already has a buttplug inside!"))
		return FALSE

	if(user == G.owner)
		G.owner.visible_message(span_warning("\The <b>[user]</b> is trying to insert buttplug inside themselves!"),\
			span_warning("You try to insert buttplug inside yourself!"))
	else
		G.owner.visible_message(span_warning("\The <b>[user]</b> is trying to insert buttplug inside \the <b>[G.owner]</b>!"),\
			span_warning("\The <b>[user]</b> is trying to insert buttplug inside you!"))

	if(!do_mob(user, G.owner, 5 SECONDS))
		return FALSE

	to_chat(G.owner, span_userlove("[G] чувствует что-то крупное внутри!"))
	G.owner.handle_post_sex(NORMAL_LUST*3, null, G.owner)
	G.owner.plug13_genital_emote(G, NORMAL_LUST*2)
	G.owner.Jitter(2)
	playsound(G.owner, 'modular_sand/sound/lewd/champ_fingering.ogg', 50, 1, -1)

/obj/item/buttplug/proc/item_inserted(datum/source, obj/item/organ/genital/G, mob/user)
	. = TRUE
	to_chat(user, span_userlove("You attach [src] to <b>\The [G.owner]</b>'s [G]."))
	playsound(G.owner, 'modular_sand/sound/lewd/champ_fingering.ogg', 50, 1, -1)
	inside = TRUE
	stuffed_movement(G.owner)

/obj/item/buttplug/proc/item_removed(datum/source, obj/item/organ/genital/G, mob/user)
	. = TRUE
	to_chat(user, span_userlove("You retrieve [src] from <b>\The [G.owner]</b>'s [G]."))
	playsound(G.owner, 'modular_sand/sound/lewd/champ_fingering.ogg', 50, 1, -1)
	inside = FALSE

/obj/item/dildo/ComponentInitialize()
	. = ..()
	var/list/procs_list = list(
		"before_inserting" = CALLBACK(src, PROC_REF(item_inserting)),
		"after_inserting" = CALLBACK(src, PROC_REF(item_inserted)),
		"after_removing" = CALLBACK(src, PROC_REF(item_removed)),
	)
	AddComponent(/datum/component/genital_equipment, list(ORGAN_SLOT_PENIS, ORGAN_SLOT_WOMB, ORGAN_SLOT_VAGINA, ORGAN_SLOT_BREASTS, ORGAN_SLOT_ANUS), procs_list)

/obj/item/dildo/proc/item_inserting(datum/source, obj/item/organ/genital/G, mob/living/user)
	. = TRUE
	if(!(G.owner.client?.prefs?.erppref == "Yes"))
		to_chat(user, span_warning("They don't want you to do that!"))
		return FALSE

	if(!(CHECK_BITFIELD(G.genital_flags, GENITAL_CAN_STUFF)))
		to_chat(user, span_warning("This genital can't be stuffed!"))
		return FALSE

	if(locate(src.type) in G.contents)
		if(user == G.owner)
			to_chat(user, span_notice("You already have a dildo inside your [G]!"))
		else
			to_chat(user, span_notice("\The <b>[G.owner]</b>'s [G] already has a dildo inside!"))
		return FALSE

	if(user == G.owner)
		G.owner.visible_message(span_warning("\The <b>[user]</b> is trying to insert dildo inside themselves!"),\
			span_warning("You try to insert dildo inside yourself!"))
	else
		G.owner.visible_message(span_warning("\The <b>[user]</b> is trying to insert dildo inside \the <b>[G.owner]</b>!"),\
			span_warning("\The <b>[user]</b> is trying to insert dildo inside you!"))

	if(!do_mob(user, G.owner, 5 SECONDS))
		return FALSE

	target_reaction(G.owner, null, 1)
	G.owner.plug13_genital_emote(G, lust_amount)
	playsound(G.owner, 'modular_sand/sound/lewd/champ_fingering.ogg', 50, 1, -1)

/obj/item/dildo/proc/item_inserted(datum/source, obj/item/organ/genital/G, mob/user)
	. = TRUE
	to_chat(user, span_userlove("You attach [src] to <b>\The [G.owner]</b>'s [G]."))
	playsound(G.owner, 'modular_sand/sound/lewd/champ_fingering.ogg', 50, 1, -1)
	inside = TRUE
	stuffed_movement(G.owner)

/obj/item/dildo/proc/item_removed(datum/source, obj/item/organ/genital/G, mob/user)
	. = TRUE
	to_chat(user, span_userlove("You retrieve [src] from <b>\The [G.owner]</b>'s [G]."))
	playsound(G.owner, 'modular_sand/sound/lewd/champ_fingering.ogg', 50, 1, -1)
	inside = FALSE

/obj/item/dildo/MouseDrop_T(mob/living/M, mob/living/user)
	var/message = ""
	var/lust_amt = 0
	if(ishuman(M) && (M?.client?.prefs?.toggles & VERB_CONSENT))
		switch(user.zone_selected)
			if(BODY_ZONE_PRECISE_GROIN)
				switch(hole)
					if(CUM_TARGET_VAGINA)
						if(M.has_vagina(REQUIRE_EXPOSED))
							message = (user == M) ? pick("распологается над '\the [src]' и начинает пихать это прямо в свою киску.", "запихивает '\the [src]' в свою киску", "постанывает и садится на '\the [src]' киской.",  "скачет на '\the [src]' киской!") : pick("насаживает <b>[M]</b> киской на '\the [src]'", "надавливает на плечи <b>[M]</b>, заставляя скакать киской на '\the [src]!'")
							lust_amt = NORMAL_LUST
					if(CUM_TARGET_ANUS)
						if(M.has_anus(REQUIRE_EXPOSED))
							message = (user == M) ? pick("распологается над '\the [src]' и начинает пихать это прямо в свою попку.","запихивает '\the [src]' прямо в свою собственную попку.", "постанывает и садится на '\the [src]' попой.",  "скачет на '\the [src]' попой!") : pick("насаживает <b>[M]</b> попой на '\the [src]'", "надавливает на плечи <b>[M]</b>, заставляя скакать попой на '\the [src]!'")
							lust_amt = NORMAL_LUST
			if(BODY_ZONE_PRECISE_MOUTH)
				if(M.has_mouth() && !M.is_mouth_covered())
					message = (user == M) ? pick("распологается над '\the [src]' и начинает пихать это прямо в свой ротик.", "запихивает '\the [src]' прямо в свой собственный ротик.", "втыкает '\the [src]' прямо в свой ротик.", "заглатывает '\the [src]' целиком!") : pick("насаживает <b>[M]</b> ротиком на '\the [src]'", "надавливает на затылок <b>[M]</b>, заставляя заглатывать '\the [src]!'")
	if(message)
		user.visible_message("<span class='lewd'><b>[user]</b> [message].</span>")
		M.handle_post_sex(lust_amt, null, user)

		switch(user.zone_selected)
			if(BODY_ZONE_PRECISE_GROIN)
				switch (hole)
					if (CUM_TARGET_VAGINA)
						user.client?.plug13.send_emote(PLUG13_EMOTE_VAGINA, min(lust_amt * 3, 100), PLUG13_DURATION_NORMAL)
					if (CUM_TARGET_ANUS)
						user.client?.plug13.send_emote(PLUG13_EMOTE_ANUS, min(lust_amt * 3, 100), PLUG13_DURATION_NORMAL)
			if (BODY_ZONE_PRECISE_MOUTH)
				user.client?.plug13.send_emote(PLUG13_EMOTE_MOUTH, 35, PLUG13_DURATION_NORMAL)

		playsound(loc, pick('modular_sand/sound/interactions/bang4.ogg',
							'modular_sand/sound/interactions/bang5.ogg',
							'modular_sand/sound/interactions/bang6.ogg'), 70, 1, -1)
