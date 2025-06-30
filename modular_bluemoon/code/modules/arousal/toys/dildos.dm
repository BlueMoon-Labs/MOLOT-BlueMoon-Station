/obj/item/dildo/proc/update_lust()
	switch(dildo_size)
		if(5)
			lust_amount = HIGH_LUST*4
		if(4)
			lust_amount = HIGH_LUST*2
		if(3)
			lust_amount = HIGH_LUST
		if(2)
			lust_amount = NORMAL_LUST
		if(1)
			lust_amount = LOW_LUST
		// if some add bigger dildo
		else
			lust_amount = max(HIGH_LUST*dildo_size,LOW_LUST)

// proc that ensures the target's reaction to the dildo according to the size
// to_chat_mode: 0 - to_chat if dildo_size >= 4, 1 - all to_chat, else not use to_chat
/obj/item/dildo/proc/target_reaction(mob/living/user, organ = NONE, to_chat_mode = 0, use_stun = TRUE, add_lust = TRUE, use_moan = TRUE, use_jitter = TRUE)
	var/message = ""
	var/moan = FALSE
	var/stun = 0
	var/jitter = 0
	switch(dildo_size)
		if(4)
			message = span_userdanger(pick("Огромный дилдо внутри терзает вас волнами экстаза!", "Вы чувствуете нестерпимое удовольствие от огромного дилдо глубоко внутри!"))
			jitter = 5
			stun = 6
			moan = TRUE
		if(3)
			message = to_chat(user, span_love(pick("Я чувствую большой дилдо внутри себя!", "Вас пронзает ощутимое удовольствие от большого дилдо глубоко внутри!")))
			jitter = 3
			stun = 3
			moan = TRUE
		if(2)
			message = span_love(pick("Я чувствую дилдо внутри себя.", "Приятное удовольствие от дилдо глубоко внутри, проходит сквозь меня."))
		if(1)
			message = span_love(pick("Я чувствую небольшой дилдо внутри себя.", "Легкое удовольствие от небольшого дилдо глубоко внутри, проходит сквозь меня."))
		// for 5 size and if some add bigger dildo
		else
			message = span_userdanger(pick("Гигантский дилдо внутри сводит вас с ума!", "Вы чувствуете мучительное удовольствие от гигантского дилдо глубоко внутри!"))
			jitter = 6
			stun = 10
			moan = TRUE

	if(to_chat_mode == 1 || (to_chat_mode == 0 && dildo_size >= 4))
		to_chat(user, message)
	if(use_jitter && jitter && (user.client?.prefs.cit_toggles & SEX_JITTER)) //By Gardelin0
		user.Jitter(jitter)
	if(use_moan && moan)
		user.emote("moan")
	if(use_stun && stun)
		user.Stun(stun)
	if(add_lust)
		user.handle_post_sex(lust_amount, null, user, organ)

/obj/item/dildo/Initialize(mapload)
	. = ..()
	update_lust()

/obj/item/dildo/customize(mob/living/user)
	if(!..())
		return FALSE
	update_lust()

