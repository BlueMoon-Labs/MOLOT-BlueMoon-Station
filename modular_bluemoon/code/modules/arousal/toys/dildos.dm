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
/obj/item/dildo/proc/target_reaction(mob/living/target, mob/living/user = null, to_chat_mode = 0, what_cum = null, where_cum = null, use_stun = TRUE, add_lust = TRUE, use_moan = TRUE, use_jitter = TRUE)
	var/message = ""
	var/moan = FALSE
	var/stun = 0
	var/jitter = 0
	var/lust_to_target = lust_amount
	if(isnull(user))
		user = target
	switch(dildo_size)
		if(4)
			if(what_cum == CUM_TARGET_MOUTH || what_cum == CUM_TARGET_THROAT)
				message = span_userdanger(pick("Я чувствую, как дилдо заполняет мой рот до предела!","Моя глотка пульсирует, обхватывая огромный дилдо!"))
			else
				message = span_userdanger(pick("Огромный дилдо внутри терзает вас волнами экстаза!", "Вы чувствуете нестерпимое удовольствие от огромного дилдо глубоко внутри!"))
			jitter = 5
			stun = 6
			moan = TRUE
		if(3)
			if(what_cum == CUM_TARGET_MOUTH || what_cum == CUM_TARGET_THROAT)
				message = span_love(pick("Большой дилдо входит в рот, вызывая возбуждение.","Податливое горло натужно принимает большой дилдо."))
			else
				message = span_love(pick("Я чувствую большой дилдо внутри себя!", "Вас пронзает ощутимое удовольствие от большого дилдо глубоко внутри!"))
			jitter = 3
			stun = 3
			moan = TRUE
		if(2)
			if(what_cum == CUM_TARGET_MOUTH || what_cum == CUM_TARGET_THROAT)
				message = span_love(pick("Я чувствую, как дилдо толкает в самое основание языка.","Каждый раз, когда дилдо входит в рот, накатывает волна возбуждения."))
			else
				message = span_love(pick("Я чувствую дилдо внутри себя.", "Приятное удовольствие от дилдо глубоко внутри, проходит сквозь меня."))
		if(1)
			if(what_cum == CUM_TARGET_MOUTH || what_cum == CUM_TARGET_THROAT)
				message = span_love(pick("Небольшой дилдо удобно ложится на язык, вызывая щекочущее возбуждение.","Я ощущаю, как маленький дилдо мягко упирается в заднюю стенку глотки."))
			else
				message = span_love(pick("Я чувствую небольшой дилдо внутри себя.", "Легкое удовольствие от небольшого дилдо глубоко внутри, проходит сквозь меня."))
		// for 5 size and if some add bigger dildo
		else
			if(what_cum == CUM_TARGET_MOUTH || what_cum == CUM_TARGET_THROAT)
				message = span_userdanger(pick("Я задыхаюсь от гигантского дилдо, но удовольствие лишь нарастает!", "Я чувствую, как гигантский дилдо давит на горло изнутри, почти перекрывая воздух!"))
			else
				message = span_userdanger(pick("Гигантский дилдо внутри сводит вас с ума!", "Вы чувствуете мучительное удовольствие от гигантского дилдо глубоко внутри!"))
			jitter = 6
			stun = 10
			moan = TRUE

	if(to_chat_mode == 1 || (to_chat_mode == 0 && dildo_size >= 4))
		to_chat(target, message)
	if(use_jitter && jitter && (target.client?.prefs.cit_toggles & SEX_JITTER)) //By Gardelin0
		target.Jitter(jitter)
	if(use_moan && moan)
		target.emote("moan")
	if(use_stun && stun)
		target.Stun(stun)
	if(add_lust)
		if(what_cum == CUM_TARGET_MOUTH || what_cum == CUM_TARGET_THROAT)
			lust_to_target = min(LOW_LUST*dildo_size/3, LOW_LUST) // realy small lust
		target.handle_post_sex(lust_to_target, where_cum, user, what_cum)

/obj/item/dildo/Initialize(mapload)
	. = ..()
	update_lust()

/obj/item/dildo/customize(mob/living/user)
	if(!..())
		return FALSE
	update_lust()

