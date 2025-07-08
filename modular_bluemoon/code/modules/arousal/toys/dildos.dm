/obj/item/dildo
	var/last_heavy_message_time = 0

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
/obj/item/dildo/proc/target_reaction(mob/living/target, mob/living/user = null, to_chat_mode = 0, what_cum = null, where_cum = null, use_stun = TRUE, add_lust = TRUE, use_moan = FALSE, use_jitter = TRUE, ignore_delay = FALSE)
	var/message = ""
	var/moan = FALSE
	var/stun = 0
	var/jitter = 0
	var/lust_to_target = lust_amount
	var/heavy_message_delay = 400 // 40 sec
	if(isnull(user))
		user = target
	switch(dildo_size)
		if(4)
			if(what_cum == CUM_TARGET_MOUTH || what_cum == CUM_TARGET_THROAT)
				message = pick(
					"Я чувствую, как огромный дилдо заполняет мой рот до предела!",
					"Моя глотка пульсирует, обхватывая огромный дилдо!",
					"Огромный дилдо растягивает мои челюсти, не оставляя пространства для воздуха!",
					"Каждое движение огромного дилдо вызывает у меня слезы и жар по всему телу!",
					"Огромный дилдо упирается в горло, заставляя меня задыхаться от наслаждения!")
			else
				message = pick(
					"Огромный дилдо внутри терзает вас волнами экстаза!",
					"Вы чувствуете нестерпимое удовольствие от огромного дилдо глубоко внутри!",
					"Огромный дилдо будто заполняет всё изнутри, оставляя чувство распирающего наслаждения!",
					"Каждое движение огромного дилдо вызывает сладкую боль и трепет внизу живота!",
					"Ваши мышцы сжимаются от напряжения, пока огромный дилдо двигается внутри!")
			if(ignore_delay || (world.time - last_heavy_message_time >= heavy_message_delay))
				last_heavy_message_time = world.time
				message = span_userdanger(message)
			else
				message = span_alertwarning(message)
			jitter = 5
			stun = 6
			moan = TRUE
		if(3)
			if(what_cum == CUM_TARGET_MOUTH || what_cum == CUM_TARGET_THROAT)
				message = span_love(pick(
					"Большой дилдо входит в рот, вызывая возбуждение.",
					"Мое горло натужно принимает большой дилдо.",
					"Большой дилдо мягко раздвигает губы, скользя внутрь с нарастающим жаром.",
					"С каждым толчком большой дилдо углубляется, заставляя меня стонать.",
					"Я чувствую, как большой дилдо прижимается к языку, вызывая дрожь."))
			else
				message = span_love(pick(
					"Я чувствую большой дилдо внутри себя!",
					"Вас пронзает ощутимое удовольствие от большого дилдо глубоко внутри!",
					"Большой дилдо наполняет меня приятной тяжестью, от которой перехватывает дыхание!",
					"С каждым движением большого дилдо я чувствую нарастающий жар по всему телу!"))
			jitter = 3
			stun = 3
			moan = TRUE
		if(2)
			if(what_cum == CUM_TARGET_MOUTH || what_cum == CUM_TARGET_THROAT)
				message = span_love(pick(
					"Я чувствую, как дилдо толкает в самое основание языка.",
					"Каждый раз, когда дилдо входит в рот, накатывает волна возбуждения.",
					"Дилдо приятно давит на язык и тянет слюну вниз по подбородку.",
					"Дилдо скользит во рту, все больше возбуждая."))
			else
				message = span_love(pick(
					"Я чувствую дилдо внутри себя.",
					"Приятное удовольствие от дилдо глубоко внутри, проходит сквозь меня.",
					"Дилдо достаточно глубоко внутри, вызывает жар во всём теле.",
					"Я чувствую, как средний дилдо трёт мои стенки, вызывая пульсацию.",
					"С каждым движением среднего дилдо я теряюсь в ощущениях."))
		if(1)
			if(what_cum == CUM_TARGET_MOUTH || what_cum == CUM_TARGET_THROAT)
				message = span_love(pick(
					"Небольшой дилдо удобно ложится на язык, вызывая щекочущее возбуждение.",
					"Я ощущаю, как маленький дилдо мягко упирается в заднюю стенку глотки.",
					"Маленький дилдо скользит почти незаметно, оставляя сладкий след возбуждения.",
					"Даже с таким размером — каждый толчок маленького дилдо вызывает приятную дрожь."))
			else
				message = span_love(pick(
					"Я чувствую небольшой дилдо внутри себя.",
					"Лёгкое удовольствие от небольшого дилдо глубоко внутри, проходит сквозь меня.",
					"Маленький дилдо приятно стимулирует изнутри, вызывая нежную пульсацию.",
					"Каждое движение маленького дилдо мягкое, но отчётливо чувствуемое.",
					"Небольшой дилдо дарит уютное, почти интимное ощущение заполненности."))
		// for 5 size and if some add bigger dildo
		else
			if(what_cum == CUM_TARGET_MOUTH || what_cum == CUM_TARGET_THROAT)
				message = pick(
					"Я задыхаюсь от гигантского дилдо, но удовольствие лишь нарастает!",
					"Я чувствую, как гигантский дилдо давит на горло изнутри, почти перекрывая воздух!",
					"Гигантский дилдо упирается в самую глубину, заставляя глотку трепетать от боли и желания!",
					"Каждый толчок гигантского дилдо будто сотрясает череп, оставляя за собой только жар и дрожь!",
					"Гигантский дилдо полностью захватывает горло, почти лишая меня воздуха, и разума!")
			else
				message = pick(
					"Гигантский дилдо внутри сводит вас с ума!",
					"Вы чувствуете мучительное удовольствие от гигантского дилдо глубоко внутри!",
					"Гигантский дилдо растягивает изнутри до предела, вызывая восторг и трепет.",
					"Каждое движение гигантского дилдо будто разрывает грань между болью и наслаждением.",
					"Гигантский словно пульсирует распирая изнутри, заставляя терять контроль.")
			if(ignore_delay || (world.time - last_heavy_message_time >= heavy_message_delay))
				last_heavy_message_time = world.time
				message = span_userdanger(message)
			else
				message = span_alertwarning(message)
			jitter = 6
			stun = 10
			moan = TRUE

	if(to_chat_mode == 1 || (to_chat_mode == 0 && dildo_size >= 4))
		to_chat(target, message)
	if(use_jitter && jitter && (target.client?.prefs.cit_toggles & SEX_JITTER)) //By Gardelin0
		target.Jitter(jitter)
	if(use_moan && moan)
		if(what_cum == CUM_TARGET_MOUTH || what_cum == CUM_TARGET_THROAT)
			target.emote("girlymoan") // realy small lust
		else
			target.emote("moan")
	if(use_stun && stun)
		target.Stun(stun)
	if(what_cum == CUM_TARGET_MOUTH || what_cum == CUM_TARGET_THROAT)
		lust_to_target = min(LOW_LUST*dildo_size/3, LOW_LUST) // realy small lust
	if(add_lust)
		target.handle_post_sex(lust_to_target, where_cum, user, what_cum)

	return lust_to_target // Unified lust value if you want to make your own handle_post_sex

/obj/item/dildo/Initialize(mapload)
	. = ..()
	update_lust()

/obj/item/dildo/customize(mob/living/user)
	if(!..())
		return FALSE
	update_lust()

