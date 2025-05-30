/**
 * # Hyperstation 13 fleshlight
 *
 * Humbley request this doesnt get ported to other code bases, we strive to make things unique on our server and we dont have a lot of coders
 * but if you absolutely must. please give us some credit~ <3
 * made by quotefox and heavily modified by SandPoot
*/
/obj/item/fleshlight
	name 				= "Fleshlight"
	desc				= "Секс-игрушка, замаскированная под фонарик, используемая для стимуляции пениса в комплекте с меняющим цвет 'рукавом'."
	icon 				= 'modular_sand/icons/obj/fleshlight.dmi'
	icon_state 			= "fleshlight_base"
	item_state 			= "fleshlight"
	w_class				= WEIGHT_CLASS_SMALL
	var/style			= CUM_TARGET_VAGINA
	var/sleevecolor 	= "#ffcbd4" //pink
	custom_price 		= 8
	var/mutable_appearance/sleeve
	var/mutable_appearance/plushe
	var/plush_icon 		= NONE
	var/plush_iconstate = NONE
	var/inuse 			= 0

/obj/item/fleshlight/examine(mob/user)
	. = ..()
	. += "<span class='notice'>Альт-ЛКМ [name] для изменения.</span>"

/obj/item/fleshlight/update_appearance(updates)
	. = ..()
	cut_overlay(sleeve)
	sleeve = mutable_appearance(icon, style) // Inherits icon for if an admin wants to var edit it, thank me later.
	sleeve.color = sleevecolor
	add_overlay(sleeve)

/obj/item/fleshlight/AltClick(mob/user)
	. = ..()
	if(!istype(user) || !user.canUseTopic(src, BE_CLOSE, FALSE, NO_TK))
		return
	customize(user)
	return TRUE

/obj/item/fleshlight/proc/customize(mob/living/user)
	if(src && !user.incapacitated() && in_range(user,src))
		var/new_style = tgui_input_list(usr, "Изменить Стиль", "Изменить 'Фонарик'", list(CUM_TARGET_VAGINA, CUM_TARGET_ANUS))
		if(new_style)
			style = new_style
	update_appearance()
	if(src && !user.incapacitated() && in_range(user,src))
		var/new_color = input(user, "Изменить Цвет", "Изменить 'Фонарик'", sleevecolor) as color|null
		if(new_color)
			sleevecolor = new_color
	update_appearance()
	return TRUE

/obj/item/fleshlight/attack(mob/living/carbon/human/M, mob/living/carbon/human/user)
	var/possessive_verb = user.ru_ego()
	var/message = ""
	var/lust_amt = 0
	if(plush_icon != NONE)
		playsound(user, 'sound/items/squeaktoy.ogg', 30, 1)
	if(ishuman(M) && (M?.client?.prefs?.toggles & VERB_CONSENT))
		switch(user.zone_selected)
			if(BODY_ZONE_PRECISE_GROIN)
				if(M.has_penis() == HAS_EXPOSED_GENITAL || M.has_strapon() == HAS_EXPOSED_GENITAL)
					var/genital_name = (user == M) ? user.get_penetrating_genital_name() : M.get_penetrating_genital_name()
					message = (user == M) ? "использует <b>'[src]'</b> по прямому назначению и трахает, натягивая [possessive_verb] прямо на свой [genital_name]" : "использует <b>'[src]'</b> по прямому назначению и трахает, натягивая прямо на свой <b>[M]</b> [genital_name]"
					lust_amt = NORMAL_LUST
	if(message)
		user.visible_message(span_lewd("<b>[user]</b> [message]."))
		M.handle_post_sex(lust_amt, null, user, ORGAN_SLOT_PENIS) //SPLURT edit
		user.client?.plug13.send_emote(PLUG13_EMOTE_GROIN, min(lust_amt * 3, 100), PLUG13_DURATION_NORMAL)
		playlewdinteractionsound(loc, pick('modular_sand/sound/interactions/bang4.ogg',
							'modular_sand/sound/interactions/bang5.ogg',
							'modular_sand/sound/interactions/bang6.ogg'), 70, 1, -1)
		if(!HAS_TRAIT(user, TRAIT_LEWD_JOB))
			new /obj/effect/temp_visual/heart(user.loc)


	else if(user.a_intent == INTENT_HARM)
		return ..()

/obj/item/fleshlight/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/toy/plush) || istype(I, /obj/item/storage/daki))
		lefthand_file = I.lefthand_file
		righthand_file = I.righthand_file
		item_state = I.item_state
		plush_icon = I.icon
		plush_iconstate = I.icon_state
		qdel(I)
		to_chat(user, "<span class='notice'>Ты натягиваешь [I] поверх 'фонарика'.</span>")
		updateplushe()
	else
		. = ..()

/obj/item/fleshlight/proc/updateplushe()
	cut_overlay(plushe)
	plushe = mutable_appearance(plush_icon, plush_iconstate)
	plushe.pixel_y = 6
	plushe.pixel_x = -3
	plushe.layer = 33
	add_overlay(plushe)

/**
 * # Hyperstation 13 portal fleshlight
 * kinky!
*/

/obj/item/portallight
	name 				= "Портальный Фонарик"
	desc 				= "Серебряный Портальный Фонарик Love(TM), используемый для самостимуляции с технологией Блюспейс, которая позволяет любовникам заниматься сексом на расстоянии. Также работает как фаллоимитатор, если у вашего партнера есть соответствующие части тела."
	icon 				= 'modular_sand/icons/obj/fleshlight.dmi'
	icon_state 			= "unpaired"
	item_state 			= "fleshlight"
	w_class 			= WEIGHT_CLASS_SMALL
	var/partnercolor 	= "#ffcbd4"
	var/partnerbase 	= "normal"
	var/partnerorgan 	= "portal_vag"
	custom_price 		= 20
	var/mutable_appearance/sleeve
	var/mutable_appearance/organ
	var/mutable_appearance/plushe
	var/obj/item/clothing/underwear/briefs/panties/portalpanties/portalunderwear
	var/plush_icon 		= NONE
	var/plush_iconstate = NONE
	var/targetting      = CUM_TARGET_PENIS
	var/useable 		= FALSE
	var/list/available_panties = list()

/obj/item/portallight/attack_self(mob/user)
	. = ..()
	switch(targetting)
		if(CUM_TARGET_PENIS)
			targetting = CUM_TARGET_VAGINA
		if(CUM_TARGET_VAGINA)
			targetting = CUM_TARGET_ANUS
		if(CUM_TARGET_ANUS)
			targetting = CUM_TARGET_URETHRA
		if(CUM_TARGET_URETHRA)
			targetting = CUM_TARGET_PENIS
	to_chat(user, "<span class='notice'>Теперь вы нацелены на [targetting].</span>")

/obj/item/portallight/examine(mob/user)
	. = ..()
	if(!portalunderwear)
		. += "<span class='notice'>Устройство не сопряжено. Для сопряжения проведите устройством по паре трусиков портала.</span>"
	else
		. += "<span class='notice'>Устройство сопряжено и ожидает использования по прямому назначению.</span>"
	if(available_panties.len)
		. += "Alt-Click to choose panties."

/obj/item/portallight/update_appearance(updates)
	. = ..()
	updatesleeve()
	updateplushe()

/obj/item/portallight/attack(mob/living/carbon/human/M, mob/living/carbon/human/user)
	if(portalunderwear == null)
		return
	var/user_message = ""
	var/target_message = ""
	var/user_lust_amt = NONE
	var/target_lust_amt = NONE
	var/target
	var/mob/living/carbon/human/portal_target = ishuman(portalunderwear.loc) && (portalunderwear.current_equipped_slot & (ITEM_SLOT_UNDERWEAR | ITEM_SLOT_MASK)) ? portalunderwear.loc : null

	// Fluid tranfser inside partner. Also if it is FALSE, it nullifies "orifice" variable in handle_post_sex() to make it work properly, since "cum_inside" variable actually doesn't work correctly today.
	var/p_to_f = FALSE	//from panties to fleshlight
	var/f_to_p = FALSE	//from fleshlight to panties

	// This list is structured as [M's longname, M's shortname, wearer's longname, wearer's shortname]
	var/penis_names = list()
	if(plush_icon != NONE)
		playsound(user, 'sound/items/squeaktoy.ogg', 30, 1)
	for(var/mob/living/carbon/human/person in list(M, portal_target))
		if(person.has_penis())
			var/obj/item/organ/genital/penis/person_penis = person.getorganslot(ORGAN_SLOT_PENIS)
			LAZYADD(penis_names, "[round(person_penis.length * (person ? get_size(person) : 1), 0.25)]-см [lowertext(person_penis.shape)]")
			LAZYADD(penis_names, "penis")
		else if(person.has_strapon())
			var/obj/item/clothing/underwear/briefs/strapon/person_strapon = person.get_strapon()
			LAZYADD(penis_names, "[GLOB.dildo_size_names[person_strapon.dildo_size]] [person_strapon.dildo_shape]")
			LAZYADD(penis_names, "strapon")
		else
			LAZYADD(penis_names, "none")
			LAZYADD(penis_names, "none")

	if(ishuman(M) && (M?.client?.prefs?.toggles & VERB_CONSENT) && useable) // I promise all those checks are worth it!
		switch(user.zone_selected)
			if(BODY_ZONE_PRECISE_GROIN)
				switch(targetting)
					if(CUM_TARGET_PENIS)
						if(M.has_penis() == HAS_EXPOSED_GENITAL || M.has_strapon() == HAS_EXPOSED_GENITAL)
							switch(portalunderwear.targetting)
								if(CUM_TARGET_PENIS)
									user_message = (user == M) ? "трётся о [penis_names[3]], используя [name]" : "использует <b>'[src]'</b> по прямому назначению и стимулирует член кого-то на другой стороне усилиями члена <b>[M]</b>, таким образом заставляя потираться о [penis_names[3]] [name]"
									target_message = "трётся о твой член"
									target = CUM_TARGET_PENIS
									user_lust_amt = NORMAL_LUST
									target_lust_amt = NORMAL_LUST
								if(CUM_TARGET_VAGINA)
									user_message = (user == M) ? "использует <b>'[src]'</b> по прямому назначению и трахает киску кого-то на другой стороне своим членом" : "использует <b>'[src]'</b> по прямому назначению и трахает <b>[M]</b> прямо в киску"
									target_message = "трахает твою киску с помощью [penis_names[1]] [penis_names[2]]"
									target = CUM_TARGET_PENIS
									user_lust_amt = NORMAL_LUST
									target_lust_amt = NORMAL_LUST
									f_to_p = TRUE
								if(CUM_TARGET_ANUS)
									user_message = (user == M) ? "использует <b>'[src]'</b> по прямому назначению и трахает анальное кольцо кого-то на другой стороне своим членом" : "использует <b>'[src]'</b> по прямому назначению и трахает <b>[M]</b> прямо в анал"
									target_message = "трахает твой анал с помощью [penis_names[1]] [penis_names[2]]"
									target = CUM_TARGET_PENIS
									user_lust_amt = NORMAL_LUST
									target_lust_amt = NORMAL_LUST
									f_to_p = TRUE
								if(CUM_TARGET_MOUTH)
									user_message = (user == M) ? "использует <b>'[src]'</b> по прямому назначению и трахает ротик кого-то на другой стороне своим членом" : "использует <b>'[src]'</b> по прямому назначению и трахает <b>[M]</b> прямо в ротик"
									target_message = "трахает твой ротик с помощью [penis_names[1]] [penis_names[2]]"
									target = CUM_TARGET_PENIS
									user_lust_amt = NORMAL_LUST
									target_lust_amt = LOW_LUST
									f_to_p = TRUE
								if(CUM_TARGET_URETHRA)
									user_message = (user == M) ? "использует <b>'[src]'</b> по прямому назначению и трахает уретру кого-то на другой стороне своим членом" : "использует <b>'[src]'</b> по прямому назначению и заставляет <b>[M]</b> поцеловаться своим слюнявым ротиком с уретрой на другой стороне, таким образом причмокивая в процессе"
									target_message = "трахает твою уретру с помощью [penis_names[1]] [penis_names[2]]"
									target = CUM_TARGET_PENIS
									user_lust_amt = NORMAL_LUST
									target_lust_amt = LOW_LUST
						else
							to_chat(user, "<span class='warning'>Пенис закрыт или его нет!</span>")
					if(CUM_TARGET_VAGINA)
						if(M.has_vagina() == HAS_EXPOSED_GENITAL)
							switch(portalunderwear.targetting)
								if(CUM_TARGET_PENIS)
									user_message = (user == M) ? "стимулирует [penis_names[3]] через [name]" : "трахает <b>[M]</b> при помощи [penis_names[3]] [name]"
									target_message = "трахает твой [penis_names[4]] с помощью своей киски"
									target = CUM_TARGET_VAGINA
									user_lust_amt = NORMAL_LUST
									target_lust_amt = NORMAL_LUST
									p_to_f = TRUE
								if(CUM_TARGET_VAGINA)
									user_message = (user == M) ? "потирает [M.ru_ego()] киску прямо о <b>'[src]'</b>, таким образом стимулирая киску на другой стороне" : "использует <b>'[src]'</b> по прямому назначению и стимулирует киску кого-то на другой стороне киской <b>[M]</b>"
									target_message = "потирает свою киску прямо о твою собственную"
									target = CUM_TARGET_VAGINA
									user_lust_amt = NORMAL_LUST
									target_lust_amt = NORMAL_LUST
								if(CUM_TARGET_ANUS)
									user_message = (user == M) ? "потирает [M.ru_ego()] киску прямо о <b>'[src]'</b>, таким образом стимулирая анус на другой стороне" : "использует <b>'[src]'</b> по прямому назначению и стимулирует анус кого-то на другой стороне киской <b>[M]</b>"
									target_message = "потирает свою киску прямо о твой анус"
									target = CUM_TARGET_VAGINA
									user_lust_amt = LOW_LUST
									target_lust_amt = LOW_LUST
								if(CUM_TARGET_MOUTH)
									user_message = (user == M) ? "потирает [M.ru_ego()] ротик прямо о <b>'[src]'</b>, таким образом целуя ротик на другой стороне" : "использует <b>'[src]'</b> по прямому назначению и заставляет <b>[M]</b> поцеловаться своим слюнявым ротиком с киской на другой стороне, таким образом причмокивая в процессе"
									target_message = "потирает свою киску прямо о твой ротик"
									target = CUM_TARGET_VAGINA
									user_lust_amt = NORMAL_LUST
									target_lust_amt = LOW_LUST
									f_to_p = TRUE
								/* // i don't know how this would work
								if(CUM_TARGET_URETHRA)
									user_message = (user == M) ? "fucking urethra" : "force someone to fuck urethra"
									target_message = "urethra fucked by pussy"
									target = CUM_TARGET_VAGINA
									user_lust_amt = NORMAL_LUST
									target_lust_amt = LOW_LUST
								*/
						else
							to_chat(user, "<span class='warning'>Влагалище закрыто или его нет!</span>")
					if(CUM_TARGET_ANUS)
						if(M.has_anus() == HAS_EXPOSED_GENITAL)
							switch(portalunderwear.targetting)
								if(CUM_TARGET_PENIS)
									user_message = (user == M) ? "использует свой сокрытый в <b>'[src]'</b> [penis_names[3]] [name] по прямому назначению и трахает себя в анальное колечко" : "трахает <b>[M]</b> анально при помощи [penis_names[3]] [name]"
									target_message = "нещадно трахает твой [penis_names[4]] своим анусом"
									target = CUM_TARGET_ANUS
									user_lust_amt = NORMAL_LUST
									target_lust_amt = NORMAL_LUST
									p_to_f = TRUE
								if(CUM_TARGET_VAGINA)
									user_message = (user == M) ? "потирает [M.ru_ego()] анус прямо о <b>'[src]'</b>, таким образом стимулирая киску кого-то на другой стороне" : "использует <b>'[src]'</b> по прямому назначению и стимулирует анус кого-то на другой стороне киской <b>[M]</b>"
									target_message = "потирает свой анус прямо о твою киску"
									target = CUM_TARGET_ANUS
									user_lust_amt = LOW_LUST
									target_lust_amt = LOW_LUST
								if(CUM_TARGET_ANUS)
									user_message = (user == M) ? "потирает [M.ru_ego()] анус прямо о <b>'[src]'</b>, таким образом стимулирая анус кого-то на другой стороне" : "использует <b>'[src]'</b> по прямому назначению и стимулирует анус кого-то на другой стороне анусом <b>[M]</b>"
									target_message = "потирает свой анус прямо о твой собственный"
									target = CUM_TARGET_ANUS
									user_lust_amt = LOW_LUST
									target_lust_amt = LOW_LUST
								if(CUM_TARGET_MOUTH)
									user_message = (user == M) ? "потирает [M.ru_ego()] анус прямо о <b>'[src]'</b>, таким образом стимулирая губки кого-то на другой стороне" : "использует <b>'[src]'</b> по прямому назначению и заставляет <b>[M]</b> поцеловаться своим слюнявым ротиком с анусом на другой стороне, таким образом причмокивая в процессе"
									target_message = "потирает свой анус прямо о твой ротик"
									target = CUM_TARGET_ANUS
									user_lust_amt = NORMAL_LUST
									target_lust_amt = LOW_LUST
						else
							to_chat(user, "<span class='warning'>Анус закрыт или отсутствует!</span>")
					if(CUM_TARGET_URETHRA)
						if(M.has_penis() == HAS_EXPOSED_GENITAL || M.has_strapon() == HAS_EXPOSED_GENITAL)
							switch(portalunderwear.targetting)
								if(CUM_TARGET_PENIS)
									user_message = (user == M) ? "трахает твою уретру своим членом" : "трахает чужую уретру своим членом"
									target_message = "трахает член прямо в уретру"
									target = CUM_TARGET_URETHRA
									user_lust_amt = NORMAL_LUST
									target_lust_amt = NORMAL_LUST
						else
							to_chat(user, "<span class='warning'>Уретра закрыта или отсутствует!</span>")
			if(BODY_ZONE_PRECISE_MOUTH)
				if((M.has_mouth() && !M.is_mouth_covered()))
					switch(portalunderwear.targetting)
						if(CUM_TARGET_PENIS)
							user_message = (user == M) ? "присасывается к [penis_names[3]] [name]" : "использует <b>'[src]'</b> по прямому назначению и стимулирует член кого-то на другой стороне усилиями ротика <b>[M]</b>, таким образом заставляя посасывать [penis_names[3]] [name]"
							target_message = "отсасывает твой [penis_names[4]]"
							target = CUM_TARGET_MOUTH
							user_lust_amt = LOW_LUST
							target_lust_amt = NORMAL_LUST
							p_to_f = TRUE
						if(CUM_TARGET_VAGINA)
							user_message = (user == M) ? "использует <b>'[src]'</b> по прямому назначению и стимулирует киску кого-то на другой стороне своим ротиком" : "использует <b>'[src]'</b> по прямому назначению и стимулирует влагалище кого-то на другой стороне слюнявым ротиком <b>[M]</b>"
							target_message = "потирает твою киску"
							target = CUM_TARGET_MOUTH
							user_lust_amt = LOW_LUST
							target_lust_amt = NORMAL_LUST
							p_to_f = TRUE
						if(CUM_TARGET_ANUS)
							user_message = (user == M) ? "использует <b>'[src]'</b> по прямому назначению и стимулирует анус кого-то на другой стороне своим ротиком" : "использует <b>'[src]'</b> по прямому назначению и стимулирует анус кого-то на другой стороне слюнявым ротиком <b>[M]</b>"
							target_message = "потирает твой анус"
							target = CUM_TARGET_MOUTH
							user_lust_amt = LOW_LUST
							target_lust_amt = NORMAL_LUST
						if(CUM_TARGET_MOUTH)
							user_message = (user == M) ? "использует <b>'[src]'</b> по прямому назначению и стимулирует кого-то на другой стороне, целуя чей-то ротик" : "использует <b>'[src]'</b> по прямому назначению и заставляет <b>[M]</b> поцеловаться с кем-то на другой стороне своим слюнявым ротиком, таким образом причмокивая в процессе"
							target_message = "целует твой ротик"
							target = CUM_TARGET_MOUTH
							user_lust_amt = LOW_LUST
							target_lust_amt = LOW_LUST
						/* // i don't know how this would work
						if(CUM_TARGET_URETHRA)
							user_message = (user == M) ? "fucking urethra" : "force someone to fuck urethra"
							target_message = "urethra fucked by твой ротик"
							target = CUM_TARGET_MOUTH
							user_lust_amt = NORMAL_LUST
							target_lust_amt = LOW_LUST
						*/
				else
					to_chat(user, "<span class='warning'>Рот закрыт или его нет!</span>")
			if(BODY_ZONE_R_ARM, BODY_ZONE_L_ARM)
				if(M.has_hand(REQUIRE_ANY))
					var/can_interact = FALSE
					if(user.zone_selected == BODY_ZONE_R_ARM)
						for(var/obj/item/bodypart/r_arm/R in M.bodyparts)
							can_interact = TRUE
					else
						for(var/obj/item/bodypart/l_arm/L in M.bodyparts)
							can_interact = TRUE
					if(can_interact)
						switch(portalunderwear.targetting)
							if(CUM_TARGET_PENIS)
								user_message = (user == M) ? "надрачивает [penis_names[3]] [name]" : "использует <b>[M]</b> по прямому назначению и надрачивает [penis_names[3]] [name]"
								target_message = "надрачивает твой пенис"
								target = CUM_TARGET_HAND
								user_lust_amt = NONE
								target_lust_amt = NORMAL_LUST
							if(CUM_TARGET_VAGINA)
								user_message = (user == M) ? "использует <b>'[src]'</b> по прямому назначению, мастурбируя киску на другой стороне своими пальчиками" : "использует <b>'[src]'</b> по прямому назначению и стимулирует влагалище кого-то на другой стороне усилиями шаловливых пальчиков <b>[M]</b>"
								target_message = "мастурбирует твою киску"
								target = CUM_TARGET_HAND
								user_lust_amt = NONE
								target_lust_amt = NORMAL_LUST
							if(CUM_TARGET_ANUS)
								user_message = (user == M) ? "использует <b>'[src]'</b> по прямому назначению, мастурбируя анус на другой стороне своими пальчиками" : "использует <b>'[src]'</b> по прямому назначению и стимулирует попку кого-то на другой стороне усилиями шаловливых пальчиков <b>[M]</b>"
								target_message = "мастурбирует твой анус"
								target = CUM_TARGET_HAND
								user_lust_amt = NONE
								target_lust_amt = NORMAL_LUST
							if(CUM_TARGET_MOUTH)
								user_message = (user == M) ? "использует <b>'[src]'</b> по прямому назначению и стимулирует чей-то ротик на другой стороне своими пальчиками" : "использует <b>'[src]'</b> по прямому назначению и стимулирует ротик кого-то на другой стороне усилиями шаловливых пальчиков <b>[M]</b>"
								target_message = "вводит свои пальчики в твой ротик"
								target = CUM_TARGET_HAND
								user_lust_amt = NONE
								target_lust_amt = LOW_LUST
							/* // i don't know how this would work
							if(CUM_TARGET_URETHRA)
								user_message = (user == M) ? "fucking urethra" : "force someone to fuck urethra"
								target_message = "urethra fucked by hand"
								target = CUM_TARGET_HAND
								user_lust_amt = NORMAL_LUST
								target_lust_amt = LOW_LUST
							*/
					else
						to_chat(user, "<span class='warning'>Здесь нет [user.zone_selected == BODY_ZONE_R_ARM ? "правой" : "левой"] руки!</span>")
			if(BODY_ZONE_R_LEG, BODY_ZONE_L_LEG)
				if(M.has_feet(REQUIRE_ANY))
					var/can_interact = FALSE
					if(user.zone_selected == BODY_ZONE_R_LEG)
						for(var/obj/item/bodypart/r_leg/R in M.bodyparts)
							can_interact = TRUE
					else
						for(var/obj/item/bodypart/l_leg/L in M.bodyparts)
							can_interact = TRUE
					if(can_interact)
						switch(portalunderwear.targetting)
							if(CUM_TARGET_PENIS)
								user_message = (user == M) ? "потирается своим [penis_names[3]] [name] прямо о [M.ru_ego()] ножку" : "потирается своим [penis_names[3]] [name] прямо о <b>[M]</b> ножку"
								target_message = "потирает твой [penis_names[4]] с помощью своей ножки"
								target = CUM_TARGET_FEET
								user_lust_amt = NONE
								target_lust_amt = NORMAL_LUST
							if(CUM_TARGET_VAGINA)
								user_message = (user == M) ? "использует <b>'[src]'</b> по прямому назначению, стимулируя влагалище на другой стороне [M.ru_ego()] ножками" : "использует <b>'[src]'</b> по прямому назначению и стимулирует влагалище кого-то на другой стороне усилиями шаловливых пальцев ног <b>[M]</b>"
								target_message = "потирает твою киску с помощью своих ножек"
								target = CUM_TARGET_FEET
								user_lust_amt = NONE
								target_lust_amt = NORMAL_LUST
							if(CUM_TARGET_ANUS)
								user_message = (user == M) ? "использует <b>'[src]'</b> по прямому назначению, стимулируя анус на другой стороне [M.ru_ego()] ножками" : "использует <b>'[src]'</b> по прямому назначению и стимулирует анус кого-то на другой стороне усилиями шаловливых пальцев ног <b>[M]</b>"
								target_message = "потирает твой анус с помощью своих ножек"
								target = CUM_TARGET_FEET
								user_lust_amt = NONE
								target_lust_amt = NORMAL_LUST
							if(CUM_TARGET_MOUTH)
								user_message = (user == M) ? "использует <b>'[src]'</b> по прямому назначению, стимулируя ротик на другой стороне [M.ru_ego()] ножками" : "использует <b>'[src]'</b> по прямому назначению и стимулирует ротик кого-то на другой стороне усилиями шаловливых пальцев ног <b>[M]</b>"
								target_message = "вводит пальцы своих ножек прямо в твой ротик"
								target = CUM_TARGET_FEET
								user_lust_amt = NONE
								target_lust_amt = LOW_LUST
							/* // i don't know how this would work
							if(CUM_TARGET_URETHRA)
								user_message = (user == M) ? "fucking urethra" : "force someone to fuck urethra"
								target_message = "urethra fucked by feet"
								target = CUM_TARGET_FEET
								user_lust_amt = NORMAL_LUST
								target_lust_amt = LOW_LUST
							*/
					else
						to_chat(user, "<span class='warning'>Здесь нет [user.zone_selected == BODY_ZONE_R_LEG ? "правой" : "левой"] ножки!</span>")
	if(!useable)
		to_chat(user, "<span class='notice'>Похоже, что устройство вышло из строя или на стороне партнёра что-то не так.</span>")
	if(user_message)
		if(portal_target && (portal_target?.client?.prefs.toggles & VERB_CONSENT || !portal_target.ckey))
			user.visible_message("<span class='lewd'>[user] [user_message].</span>")
			if(M.can_penetrating_genital_cum() && M.handle_post_sex(user_lust_amt, f_to_p ? portalunderwear.targetting : null, portal_target, target, f_to_p, TRUE))
				switch(target)
					if(CUM_TARGET_PENIS)
						switch(portalunderwear.targetting)
							if(CUM_TARGET_PENIS)
								to_chat(portal_target, "<span class='userlove'>Вы ощущаете, как [penis_names[2]] максимально сильным образом прижимается и... кончает!</span>")
							if(CUM_TARGET_VAGINA, CUM_TARGET_ANUS, CUM_TARGET_MOUTH)
								to_chat(portal_target, "<span class='userlove'>Вы ощущаете, как [penis_names[2]] углубляется прямо в [portalunderwear.targetting] и... кончает!</span>")
							if(CUM_TARGET_URETHRA)
								to_chat(portal_target, "<span class='userlove'>[penis_names[2]] кончает прямо в уретру!</span>")
					if(CUM_TARGET_VAGINA)
						switch(portalunderwear.targetting)
							if(CUM_TARGET_PENIS, CUM_TARGET_VAGINA, CUM_TARGET_ANUS, CUM_TARGET_MOUTH)
								to_chat(portal_target, "<span class='userlove'>Вы ощущаете, как влагалище сквиртит прямо на твой [portalunderwear.targetting]!</span>")
					if(CUM_TARGET_ANUS)
						switch(portalunderwear.targetting)
							if(CUM_TARGET_PENIS)
								to_chat(portal_target, "<span class='userlove'>Вы ощущаете, как анус сжимается вокруг вашего [penis_names[4]]!</span>")
							if(CUM_TARGET_VAGINA, CUM_TARGET_ANUS)
								to_chat(portal_target, "<span class='userlove'>Вы ощущаете и наблюдаете, как анус сжимается в оргазме!</span>")
							if(CUM_TARGET_MOUTH)
								to_chat(portal_target, "<span class='userlove'>Вы ощущаете и наблюдаете, как анус сжимается в оргазме ввиду вашего решения воспользоваться язычком по прямому назначению!</span>")
					if(CUM_TARGET_URETHRA)
						switch(portalunderwear.targetting)
							if(CUM_TARGET_PENIS)
								to_chat(portal_target, "<span class='userlove'>Вы ощущаете и наблюдаете, как из уретры вырывается семя прямо на [penis_names[4]]</span>")
					if(CUM_TARGET_MOUTH)
						switch(portalunderwear.targetting)
							if(CUM_TARGET_PENIS, CUM_TARGET_VAGINA, CUM_TARGET_ANUS)
								to_chat(portal_target, "<span class='userlove'>Вы ощущаете, как язык все более пылко ласкает твой [portalunderwear.targetting], пока он внезапно не напряжется и не замрет, а затем, наконец, расслабится. Человек на другой стороне должен закончить.</span>")
							if(CUM_TARGET_MOUTH)
								to_chat(portal_target, "<span class='userlove'>Вы ощущаете, как пара губ еще глубже прижимается к вашим, затем, наконец, расслабляется. Кто-то с другой стороны, должно быть, закончил.</span>")
					// /* I don't think cumming while using these is even possible. If anyone feels otherwise, feel free to write some */
					// if(CUM_TARGET_HAND)
					// if(CUM_TARGET_FEET)
			switch(user.zone_selected)
				if(BODY_ZONE_PRECISE_GROIN)
					playlewdinteractionsound(loc, pick('modular_sand/sound/interactions/bang4.ogg',
														'modular_sand/sound/interactions/bang5.ogg',
														'modular_sand/sound/interactions/bang6.ogg'), 70, 1, -1)
				if(BODY_ZONE_PRECISE_MOUTH, BODY_ZONE_R_ARM, BODY_ZONE_L_ARM, BODY_ZONE_R_LEG, BODY_ZONE_L_LEG)
					playlewdinteractionsound(loc, 'modular_sand/sound/interactions/champ_fingering.ogg', 50, 1, -1)

			to_chat(portal_target, "<span class='lewd'>Кто-то использует сопряжённый <b>'[name]'</b>, этот кто-то [target_message].</span>")
			if(portal_target.handle_post_sex(target_lust_amt, p_to_f ? target : null, M, portalunderwear.targetting, p_to_f, TRUE))

				switch(portalunderwear.targetting)
					if(CUM_TARGET_VAGINA)
						switch(target)
							if(CUM_TARGET_PENIS, CUM_TARGET_ANUS, CUM_TARGET_MOUTH)
								to_chat(M, "<span class='userlove'>Вы ощущаете, как [portalunderwear.targetting] сквиртит прямо на ваш [target]!</span>")
							if(CUM_TARGET_VAGINA)
								to_chat(M, "<span class='userlove'>Вы ощущаете, как [portalunderwear.targetting] сквиртит прямо на вашу киску!</span>")
							if(CUM_TARGET_HAND)
								to_chat(M, "<span class='userlove'>Вы ощущаете, как [portalunderwear.targetting] сквиртит прямо на вашу ручку!</span>")
							if(CUM_TARGET_FEET)
								to_chat(M, "<span class='userlove'>Вы ощущаете, как [portalunderwear.targetting] сквиртит прямо на вашу ножку!</span>")
					if(CUM_TARGET_ANUS)
						switch(target)
							if(CUM_TARGET_PENIS)
								to_chat(M, "<span class='userlove'>Вы ощущаете, как анус сжимается вокруг вашего [target]!</span>")
							if(CUM_TARGET_VAGINA, CUM_TARGET_ANUS)
								to_chat(M, "<span class='userlove'>Вы ощущаете и наблюдаете, как анус сжимается в оргазме и потирает [target]!</span>")
							if(CUM_TARGET_MOUTH)
								to_chat(M, "<span class='userlove'>Вы ощущаете и наблюдаете, как анус сжимается в оргазме!</span>")
							if(CUM_TARGET_HAND)
								to_chat(M, "<span class='userlove'>Вы ощущаете, как анус сжимается вокруг вашей ручки!</span>")
							if(CUM_TARGET_FEET)
								to_chat(M, "<span class='userlove'>Вы ощущаете, как анус сжимается вокруг вашей ножки!</span>")
					if(CUM_TARGET_PENIS)
						switch(target)
							if(CUM_TARGET_PENIS)
								to_chat(M, "<span class='userlove'>Вы ощущаете, как [pick(list("член", "пенис", "хрен"))] дергается несколько раз, прежде чем кончить прямо на твой [pick(list("член", "пенис", "хрен"))]!</span>")
							if(CUM_TARGET_HAND)
								to_chat(M, "<span class='userlove'>Вы ощущаете, как [pick(list("член", "пенис", "хрен"))] дергается несколько раз, прежде чем кончить прямо на твои пальцы!</span>")
							if(CUM_TARGET_VAGINA, CUM_TARGET_ANUS, CUM_TARGET_MOUTH)
								to_chat(M, "<span class='userlove'>Вы ощущаете, как [pick(list("член", "пенис", "хрен"))] дергается несколько раз, прежде чем кончить прямо на твою дырочку!</span>")
							if(CUM_TARGET_FEET)
								to_chat(M, "<span class='userlove'>Вы ощущаете, как [pick(list("член", "пенис", "хрен"))] дергается несколько раз, прежде чем кончить прямо на твою ножку!</span>")
							if(CUM_TARGET_URETHRA)
								to_chat(M, "<span class='userlove'>Вы ощущаете, как кто-то кончает в твою уретру!</span>")
					if(CUM_TARGET_MOUTH)
						switch(target)
							if(CUM_TARGET_PENIS)
								to_chat(M, "<span class='userlove'>Вы ощущаете, как губы дрожат, обхватывая твой пенис!</span>")
							if(CUM_TARGET_VAGINA, CUM_TARGET_ANUS)
								to_chat(M, "<span class='userlove'>Вы ощущаете, как язык дрожит, облизывая твою дырочку!</span>")
							if(CUM_TARGET_MOUTH)
								to_chat(M, "<span class='userlove'>Вы ощущаете, как губы дрожат при их взаимодействии с твоими!</span>")
							if(CUM_TARGET_HAND)
								to_chat(M, "<span class='userlove'>Вы ощущаете, как губы дрожат, обхватывая твою ручку!</span>")
							if(CUM_TARGET_FEET)
								to_chat(M, "<span class='userlove'>Вы ощущаете, как губы дрожат, обхватывая твою ножку!</span>")
					if(CUM_TARGET_URETHRA)
						switch(target)
							if(CUM_TARGET_PENIS)
								to_chat(M, "<span class='userlove'>Из уретры вырывается семя прямо на ваш член!</span>")
			if(portal_target.client?.prefs.cit_toggles & SEX_JITTER) //By Gardelin0
				portal_target.do_jitter_animation() //make your partner shake too!
		else
			user.visible_message("<span class='warning'><b>'[src]'</b> подает звуковой сигнал и не позволяет <b>[M]</b> войти.</span>")
	else if(user.a_intent == INTENT_HARM)
		return ..()

/obj/item/portallight/proc/updatesleeve()
	//get their looks and vagina colour!
	cut_overlays()

	var/mob/living/carbon/human/H = null
	if(portalunderwear && ishuman(portalunderwear.loc))
		H = portalunderwear.loc
	else
		useable = FALSE
		return
	var/obj/item/organ/genital/G

	if(portalunderwear.targetting == CUM_TARGET_VAGINA)
		G = H.getorganslot(ORGAN_SLOT_VAGINA)
		if(!G)
			useable = FALSE
			return
	else if(portalunderwear.targetting == CUM_TARGET_PENIS || portalunderwear.targetting == CUM_TARGET_URETHRA)
		G = H.getorganslot(ORGAN_SLOT_PENIS)
		if(!G)
			useable = FALSE
			return
	if(H) //if the portal panties are on someone.
		if(!(portalunderwear.current_equipped_slot & (ITEM_SLOT_UNDERWEAR | ITEM_SLOT_MASK)))
			useable = FALSE
			return

		if(portalunderwear.targetting == CUM_TARGET_VAGINA || portalunderwear.targetting == CUM_TARGET_ANUS || portalunderwear.targetting == CUM_TARGET_MOUTH)
			sleeve = mutable_appearance('modular_sand/icons/obj/fleshlight.dmi', "portal_sleeve_normal")
			if(islizard(H)) // lizard nerd
				sleeve = mutable_appearance('modular_sand/icons/obj/fleshlight.dmi', "portal_sleeve_lizard")

			if(isslimeperson(H)) // slime nerd
				sleeve = mutable_appearance('modular_sand/icons/obj/fleshlight.dmi', "portal_sleeve_slime")

			if(H.dna.species.name == "Avian") // bird nerd (obviously bad hyper code)
				sleeve = mutable_appearance('modular_sand/icons/obj/fleshlight.dmi', "portal_sleeve_avian")

			sleeve.color = "#[H.dna.features["mcolor"]]"
			add_overlay(sleeve)
		else if(portalunderwear.targetting == CUM_TARGET_URETHRA)
			sleeve = mutable_appearance('modular_sand/icons/obj/fleshlight.dmi', "portal_sleeve_normal")
			sleeve.color = G.color
			add_overlay(sleeve)

		switch(portalunderwear.targetting)
			if(CUM_TARGET_VAGINA)
				organ = mutable_appearance('modular_sand/icons/obj/fleshlight.dmi', "portal_vag")
				organ.color = G.color
			if(CUM_TARGET_ANUS)
				organ = mutable_appearance('modular_sand/icons/obj/fleshlight.dmi', "portal_anus")
				organ.color = "#[H.dna.features["mcolor"]]"
			if(CUM_TARGET_PENIS)
				organ = mutable_appearance('modular_sand/icons/obj/dildo.dmi', "penis") // Credit goes to @Moltov#6925 (296074425562955777) from the Hyperstation 13 discord for the sprite work
				switch(H.dna.features["cock_shape"])
					if("human")
						organ = mutable_appearance('modular_sand/icons/obj/dildo.dmi', "penis")
					if("thick")
						organ = mutable_appearance('modular_sand/icons/obj/dildo.dmi', "humanthick")
					if("knotted", "barbknot")
						organ = mutable_appearance('modular_sand/icons/obj/dildo.dmi', "knotted")
					if("flared")
						organ = mutable_appearance('modular_sand/icons/obj/dildo.dmi', "flared")
					if("tapered")
						organ = mutable_appearance('modular_sand/icons/obj/dildo.dmi', "tapered")
					if("tentacle")
						organ = mutable_appearance('modular_sand/icons/obj/dildo.dmi', "tentacle")
					if("hemi", "hemiknot")
						organ = mutable_appearance('modular_sand/icons/obj/dildo.dmi', "hemi")
				organ.color = G.color
				organ.color = G.color
			if(CUM_TARGET_MOUTH)
				add_overlay(mutable_appearance('modular_sand/icons/obj/fleshlight.dmi', "portal_mouth"))
				organ = mutable_appearance('modular_sand/icons/obj/fleshlight.dmi', "portal_mouth_lips") // TODO: find someone to replace shitty programmer art при помощи good shit
				organ.color = H.lip_style == "lipstick" ? H.lip_color : "#[H.dna.features["mcolor"]]"
			if(CUM_TARGET_URETHRA)
				organ = mutable_appearance('modular_sand/icons/obj/fleshlight.dmi', "portal_anus") // i refuse to even attempt spriting this, have a placeholder
				organ.color = G.color

		if (portalunderwear.targetting == CUM_TARGET_PENIS)
			name = replacetext(name, "Фонарик", "Дилдо")
		else
			name = replacetext(name, "Дилдо", "Фонарик")

		useable = TRUE
		add_overlay(organ)
	else
		useable = FALSE

/obj/item/portallight/attackby(obj/item/I, mob/user)  //перезарядка работает как у резака. Можно изменять, сколько требуется плазмы для полного заряда
	if(istype(I, /obj/item/toy/plush)) // Это делал Рен, но я переделал в лучшую сторону. По хорошему это всё должно лежать в модулях БМа, а не тут.
		var/obj/item/toy/plush/plush = I
		if(plush.can_you_fuck_plush)
			place_toy(I, user)

	if(istype(I, /obj/item/storage/daki))
		place_toy(I, user)

	return . = ..()

/obj/item/portallight/proc/place_toy(obj/item/I, mob/user)
	lefthand_file = I.lefthand_file
	righthand_file = I.righthand_file
	item_state = I.item_state
	plush_icon = I.icon
	plush_iconstate = I.icon_state
	qdel(I)
	to_chat(user, "<span class='notice'>Ты натягиваешь [I] поверх портального фонарика.</span>")
	updateplushe()

/obj/item/portallight/proc/updateplushe()
	cut_overlay(plushe)
	plushe = mutable_appearance(plush_icon, plush_iconstate)
	plushe.pixel_y = 6
	plushe.pixel_x = -3
	plushe.layer = 33
	add_overlay(plushe)

/obj/item/portallight/Destroy()
	if(available_panties.len)
		for(var/obj/item/clothing/underwear/briefs/panties/portalpanties/temp in available_panties)
			temp.portallight -= src
	if(portalunderwear)
		portalunderwear.portallight -= src
		if(isliving(portalunderwear.loc))
			portalunderwear.audible_message("[icon2html(portalunderwear, hearers(portalunderwear))] *beep* *beep* *beep*")
			playsound(portalunderwear, 'sound/machines/triple_beep.ogg', ASSEMBLY_BEEP_VOLUME, TRUE)
			to_chat(portalunderwear.loc, "<span class='notice'>The panties beep as the link to the <b>'[src]'</b> is lost.</span>")
	. = ..()

/**
 * # Hyperstation 13 portal underwear
 * Wear it, cannot be worn if not pointing to the bits you have.
*/
/obj/item/clothing/underwear/briefs/panties/portalpanties
	name = "Портальные Трусики"
	desc = "Пара портальных трусов Silver Love(TM) с технологией Блсюпейс позволяют любовникам заниматься сексом на расстоянии. Перед использованием необходимо использовать в паре с портальным фонариком. Может также использоваться как маска."
	icon = 'modular_sand/icons/obj/fleshlight.dmi'
	icon_state = "portalpanties"
	item_state = "fleshlight"
	w_class = WEIGHT_CLASS_SMALL
	var/list/portallight = list()
	var/targetting = CUM_TARGET_VAGINA
	equip_delay_self = 2 SECONDS
	equip_delay_other = 5 SECONDS

/obj/item/clothing/underwear/briefs/panties/portalpanties/attack_self(mob/user)
	. = ..()
	switch(targetting)
		if(CUM_TARGET_VAGINA)
			targetting = CUM_TARGET_ANUS
		if(CUM_TARGET_ANUS)
			targetting = CUM_TARGET_PENIS
		if(CUM_TARGET_PENIS)
			targetting = CUM_TARGET_URETHRA
		if(CUM_TARGET_URETHRA)
			targetting = CUM_TARGET_MOUTH
		if(CUM_TARGET_MOUTH)
			targetting = CUM_TARGET_VAGINA

	slot_flags         = targetting == CUM_TARGET_MOUTH ? ITEM_SLOT_MASK  : ITEM_SLOT_UNDERWEAR
	flags_cover        = targetting == CUM_TARGET_MOUTH ? MASKCOVERSMOUTH : NONE
	visor_flags_cover  = targetting == CUM_TARGET_MOUTH ? MASKCOVERSMOUTH : NONE

	if (targetting == CUM_TARGET_MOUTH)
		name = replacetext(name, "Трусики", "Маска")
		name = replacetext(name, "Портальные", "Портальная")
	else
		name = replacetext(name, "Маска", "Трусики")
		name = replacetext(name, "Портальная", "Портальные")

	to_chat(user, "<span class='notice'>Теперь при надевании портал будет обращен к вашему [targetting].</span>")
	update_portal()

/obj/item/clothing/underwear/briefs/panties/portalpanties/examine(mob/user)
	. = ..()
	if(!portallight.len)
		. += "<span class='notice'>Устройство не сопряжено, для сопряжения проведите фонариком по этой паре портальных трусиков (TM) или переведите устройство в <b>публичный режим</b> и ожидайте. </span>"
	else
		. += "<span class='notice'>Устройство сопряжено и ожидает использования по прямому назначению. Количество сопряженных устройств: <b>[portallight.len]</b>.</span>"
	. += "<span class='notice'>Публичный доступ к устройству <b>[free_use ? "включен" : "отключен"]</b>. (Alt+Click для смены режима)</span>"

/obj/item/clothing/underwear/briefs/panties/portalpanties/attackby(obj/item/I, mob/living/user) //pairing
	if(istype(I, /obj/item/portallight))
		var/obj/item/portallight/P = I
		if(!(P in portallight))
			portallight += P //pair the fleshlight
			P.available_panties += src
			P.portalunderwear = src
			P.icon_state = "paired"
			update_portal()
			playsound(src, 'sound/machines/ping.ogg', 50, FALSE)
			to_chat(user, "<span class='notice'>[P] был успешно связан.</span>")
		else
			portallight -= P
			P.available_panties -= src
			if(P.portalunderwear == src || !P.available_panties.len)
				P.portalunderwear = null
				P.updatesleeve()
				P.updateplushe()
				P.icon_state = "unpaired"
			to_chat(user, "<span class='notice'>[P] был успешно отвязан.</span>")
	else
		..() //just allows people to hit it with other objects, if they so wished.

/obj/item/clothing/underwear/briefs/panties/portalpanties/mob_can_equip(M, equipper, slot, disable_warning, bypass_equip_delay_self)
	if(!..())
		return FALSE
	if(ishuman(M))
		var/mob/living/carbon/human/human = M
		switch(targetting)
			if(CUM_TARGET_VAGINA)
				if(!human.has_vagina() == HAS_EXPOSED_GENITAL)
					to_chat(human, span_warning("Влагалище закрыто или отсутствует!"))
					return FALSE
			if(CUM_TARGET_ANUS)
				if(!human.has_anus() == HAS_EXPOSED_GENITAL)
					to_chat(human, span_warning("Анус закрыт или отсутствует!"))
					return FALSE
			if(CUM_TARGET_PENIS)
				if(!human.has_penis() == HAS_EXPOSED_GENITAL && !human.has_strapon() == HAS_EXPOSED_GENITAL)
					to_chat(human, "<span class='warning'>Пенис закрыт или отсутствует!</span>")
					return FALSE
			if(CUM_TARGET_URETHRA)
				if(!human.has_penis() == HAS_EXPOSED_GENITAL && !human.has_strapon() == HAS_EXPOSED_GENITAL)
					to_chat(human, "<span class='warning'>Уретра закрыта или отсутствует!</span>")
					return FALSE
			if(CUM_TARGET_MOUTH)
				if(!human.has_mouth() || human.is_mouth_covered())
					to_chat(human, "<span class='warning'>Рот закрыт или отсутствует!</span>")
					return FALSE
	return TRUE

/obj/item/clothing/underwear/briefs/panties/portalpanties/equipped(mob/user, slot)
	. = ..()
	switch(slot)
		if(ITEM_SLOT_UNDERWEAR, ITEM_SLOT_MASK)
			RegisterSignal(user, COMSIG_PARENT_QDELETING, PROC_REF(drop_out))
			if(!portallight.len)
				audible_message("[icon2html(src, hearers(src))] *beep* *beep* *beep*")
				playsound(src, 'sound/machines/triple_beep.ogg', ASSEMBLY_BEEP_VOLUME, TRUE)
				to_chat(user, "<span class='notice'>Трусики не связаны с Портальным Фонариком.</span>")
			else
				update_portal()
		else
			update_portal()
			UnregisterSignal(user, COMSIG_PARENT_QDELETING)

// already processed in /equipped()
// /obj/item/clothing/underwear/briefs/panties/portalpanties/dropped(mob/user)
// 	UnregisterSignal(user, COMSIG_PARENT_QDELETING)
// 	. = ..()
// 	update_portal()

/obj/item/clothing/underwear/briefs/panties/portalpanties/Destroy()
	if(portallight.len)
		moveToNullspace() // loc cannot be human so let's destroy ourselves out of anything
		for(var/obj/item/portallight/temp in portallight)
			temp.portalunderwear = null
			temp.available_panties -= src
			temp.updatesleeve()
			temp.icon_state = "unpaired"
	. = ..()

/obj/item/clothing/underwear/briefs/panties/portalpanties/proc/drop_out()
	var/mob/living/carbon/human/deleted
	if(ishuman(loc))
		deleted = loc
	forceMove(get_turf(loc))
	dropped(deleted) // Act like we've been dropped
	plane = initial(plane)
	layer = initial(layer)
	update_portal()

/obj/item/clothing/underwear/briefs/panties/portalpanties/proc/update_portal()
	if(portallight.len)
		for(var/obj/item/portallight/P in portallight)
			if(P.portalunderwear == src)
				if(targetting == CUM_TARGET_PENIS)
					P.icon = 'modular_sand/icons/obj/dildo.dmi'
				else
					P.icon = 'modular_sand/icons/obj/fleshlight.dmi'
				P.updatesleeve()

/obj/item/storage/box/portallight
	name =  "Portal Fleshlight and Underwear"
	icon = 'modular_sand/icons/obj/fleshlight.dmi'
	desc = "Маленькая серебряная шкатулка с тиснением Silver Love Co."
	icon_state = "box"
	custom_price = 15
	illustration = null

// portal fleshlight box
/obj/item/storage/box/portallight/PopulateContents()
	new /obj/item/portallight/(src)
	new /obj/item/clothing/underwear/briefs/panties/portalpanties/(src)
	new /obj/item/paper/fluff/portallight(src)

/obj/item/paper/fluff/portallight
	name = "Инструкция по Использованию Портального Фонарика"
	default_raw_text = "Благодарим вас за покупку Портального Фонарика Silver Love Portal!<BR>\
	Для использования просто зарегистрируйте ваш новый Портальный Фонарик при помощи предоставленного нижнего белья, чтобы соединить их вместе, после чего попросите своего любовника надеть белье.<BR>\
	Повеселитесь, любовники,<BR>\
	<BR>\
	Wilhelmina Steiner."
