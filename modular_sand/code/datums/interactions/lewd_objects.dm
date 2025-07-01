//Dildo changes.
/obj/item/dildo
	var/hole = CUM_TARGET_VAGINA
	var/lust_amount = NORMAL_LUST //BLUEMOON ADD

/obj/item/dildo/attack(mob/living/carbon/human/M, mob/living/carbon/human/user)
	var/message = ""
	//var/lust_amt = 0 //BLUEMOON EDIT commented
	var/organ //SPLURT edit

	if(!user.canUseTopic(user, BE_CLOSE, FALSE, FALSE, FALSE)) //BLUEMOON EDIT
		return
	user.DelayNextAction(CLICK_CD_RANGE)

	if(ishuman(M) && (M?.client?.prefs?.toggles & VERB_CONSENT))
		switch(user.zone_selected)
			if(BODY_ZONE_PRECISE_GROIN)
				switch(hole)
					if(CUM_TARGET_VAGINA)
						if(M.has_vagina(REQUIRE_EXPOSED))
							message = (user == M) ? pick("крепко обхватывает '\the [src]' и начинает пихать это прямо в свою киску.", "запихивает '\the [src]' в свою киску", "постанывает и садится на '\the [src]'.") : pick("трахает <b>[M]</b> прямо в киску с помощью '\the [src]'", "засовывает '\the [src]' прямо в киску <b>[M]</b>.")
							//lust_amt = NORMAL_LUST //BLUEMOON EDIT commented
							organ = CUM_TARGET_VAGINA //SPLURT edit
					if(CUM_TARGET_ANUS)
						if(M.has_anus(REQUIRE_EXPOSED))
							message = (user == M) ? pick("крепко обхватывает '\the [src]' и начинает пихать это прямо в свою попку.","запихивает '\the [src]' прямо в свою собственную попку.", "постанывает и садится на '\the [src]'.") : pick("трахает <b>[M]</b> прямо в попку '\the [src]'", "активно суёт '\the [src]' прямо в попку <b>[M]</b>.")
							//lust_amt = NORMAL_LUST //BLUEMOON EDIT commented
							organ = CUM_TARGET_ANUS //SPLURT edit
			if(BODY_ZONE_PRECISE_MOUTH)
				if(M.has_mouth() && !M.is_mouth_covered())
					message = (user == M) ? pick("крепко обхватывает '\the [src]' и начинает пихать это прямо в свой ротик.", "запихивает '\the [src]' прямо в свой собственный ротик.", "втыкает '\the [src]' прямо в свой ротик.") : pick("трахает <b>[M]</b> прямо в ротик при помощи '\the [src]'", "активно суёт '\the [src]' прямо в ротик <b>[M]</b>.")
					organ = CUM_TARGET_MOUTH //BLUEMOON ADD
	if(message)
		user.visible_message(span_lewd("<b>[user]</b> [message]."))
		//BLUEMOON ADD START
		var/where_cum = (user.zone_selected == BODY_ZONE_PRECISE_GROIN) ? CUM_TARGET_HAND : null
		target_reaction(M, user, 1, organ, where_cum, (user != M && user.a_intent == INTENT_HARM))
		//BLUEMOON ADD END
		//M.handle_post_sex(lust_amt, null, user, organ) //SPLURT edit  //BLUEMOON EDIT commented

		switch(user.zone_selected)
			if(BODY_ZONE_PRECISE_GROIN)
				switch (hole)
					if (CUM_TARGET_VAGINA)
						user.client?.plug13.send_emote(PLUG13_EMOTE_VAGINA, min(lust_amount * 3, 100), PLUG13_DURATION_NORMAL) //BLUEMOON EDIT lust_amt -> lust_amount
					if (CUM_TARGET_ANUS)
						user.client?.plug13.send_emote(PLUG13_EMOTE_ANUS, min(lust_amount * 3, 100), PLUG13_DURATION_NORMAL) //BLUEMOON EDIT lust_amt -> lust_amount
			if (BODY_ZONE_PRECISE_MOUTH)
				user.client?.plug13.send_emote(PLUG13_EMOTE_MOUTH, 35, PLUG13_DURATION_NORMAL)

		playsound(loc, pick('modular_sand/sound/interactions/bang4.ogg',
							'modular_sand/sound/interactions/bang5.ogg',
							'modular_sand/sound/interactions/bang6.ogg'), 70, 1, -1)
		if(!HAS_TRAIT(M, TRAIT_LEWD_JOB))
			new /obj/effect/temp_visual/heart(M.loc)


	else if(user.a_intent == INTENT_HARM)
		return ..()

/obj/item/dildo/attack_self(mob/living/carbon/human/user as mob)
	hole = hole == CUM_TARGET_VAGINA ? CUM_TARGET_ANUS : CUM_TARGET_VAGINA
	to_chat(user, "<span class='notice'>Я целюсь в... [hole].</span>")

//begin redds code
/obj/item/dildo/cyborg
	name = "F.I.S.T.R. Machine"
	desc = "Fully Integrated Sexual Tension Relief Machine"
//end redds code

/obj/item/pneumatic_cannon/dildo
	color = "#FFC0CB"
	name = "pneumatic cannon"
	desc = "A pneumatic cannon with a picture of a bus printed on the side that resembles an A-shape."
	automatic = TRUE
	selfcharge = TRUE
	gasPerThrow = 0
	checktank = FALSE
	fire_mode = PCANNON_FIFO
	throw_amount = 1
	maxWeightClass = 60
	var/static/list/dildo_typecache = typecacheof(/obj/item/dildo)
	charge_type = /obj/item/dildo

/obj/item/pneumatic_cannon/dildo/Initialize(mapload)
	. = ..()
	allowed_typecache = dildo_typecache
