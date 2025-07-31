// Да и плевать, что это не lewd, нечего плодить файлы без особой нужды
/datum/interaction/tailhug
	description = "Обнять хвостом."
	simple_message = "USER обнимает хвостом TARGET."
	simple_style = "lewd"
	required_from_user = INTERACTION_REQUIRE_TAIL
	write_log_user = "tailhug"
	write_log_target = "tailhuged by"
	interaction_sound = 'sound/weapons/thudswoosh.ogg'

/datum/interaction/tailhug/display_interaction(mob/living/user, mob/living/target)
	..()
	if(!HAS_TRAIT(user, TRAIT_LEWD_JOB))
		new /obj/effect/temp_visual/heart(user.loc)
	if(!HAS_TRAIT(target, TRAIT_LEWD_JOB))
		new /obj/effect/temp_visual/heart(target.loc)

/datum/interaction/tailweave
	description = "Сплестись хвостами."
	simple_message = "USER сплетается с хвостом TARGET."
	simple_style = "lewd"
	big_user_target_text = TRUE
	required_from_user = INTERACTION_REQUIRE_TAIL
	required_from_target = INTERACTION_REQUIRE_TAIL
	write_log_user = "tailweaved"
	write_log_target = "tailweaved by"
	interaction_sound = 'sound/weapons/thudswoosh.ogg'

/datum/interaction/tailweave/display_interaction(mob/living/user, mob/living/target)
	..()
	if(HAS_TRAIT(target, TRAIT_SHY) && prob(10))
		target.emote("blush")
	if(HAS_TRAIT(user, TRAIT_SHY) && prob(10))
		user.emote("blush")
	if(!HAS_TRAIT(user, TRAIT_LEWD_JOB))
		new /obj/effect/temp_visual/heart(user.loc)
	if(!HAS_TRAIT(target, TRAIT_LEWD_JOB))
		new /obj/effect/temp_visual/heart(target.loc)

/datum/interaction/selfhugtail
	description = "Обнять свой хвост."
	simple_message = "USER обнимает свой хвост."
	interaction_flags = INTERACTION_FLAG_USER_IS_TARGET
	required_from_user = INTERACTION_REQUIRE_TAIL
	write_log_user = "selftailhug"
	interaction_sound = 'sound/weapons/thudswoosh.ogg'
	max_distance = 0

/datum/interaction/lewd/slap/tail
	description = "Хвост. Шлёпнуть по заднице хвостом."
	simple_message = "USER с силой шлёпает задницу TARGET своим хвостом!"
	big_user_target_text = TRUE
	required_from_user = INTERACTION_REQUIRE_TAIL
	write_log_user = "tail-ass-slapped"
	write_log_target = "was tail-ass-slapped by"

////////////////////////////////
// база для эмоутов с хвостами//
////////////////////////////////

/datum/interaction/lewd/tail
	simple_style = "lewd"
	big_user_target_text = TRUE
	var/target_organ		// орган для взаимодействия
	var/try_milking = FALSE // пытаемся-ли выдоить что-то в контейнер
	// для фраз стоит находить формулировки в которых можно будет использовать USER и TARGET
	var/start_text
	var/help_text
	var/grab_text
	var/harm_text
	var/list/lewd_sounds
	var/p13target_strength_base_point = PLUG13_STRENGTH_NORMAL // точка к которой прибавляет +1 уровень при граб, дизарм и +2 уровня при харме

/datum/interaction/lewd/tail/proc/text_picker(mob/living/user, mob/living/partner) // особая проверка для замены текста в n ситуации
	return

/datum/interaction/lewd/tail/proc/lust_granted(mob/living/partner) // разрешение на получение удовольствия
	return TRUE

/datum/interaction/lewd/tail/display_interaction(mob/living/user, mob/living/partner)

	var/obj/item/reagent_containers/liquid_container
	if(try_milking)
		var/obj/item/cached_item = user.get_active_held_item()
		if(istype(cached_item, /obj/item/reagent_containers))
			liquid_container = cached_item
		else
			cached_item = user.pulling
			if(istype(cached_item, /obj/item/reagent_containers))
				liquid_container = cached_item

	p13target_strength = p13target_strength_base_point
	simple_message = null	// используем для сообщения базовую переменную
	var/lust_amount = NORMAL_LUST
	var/obj/item/organ/genital/partner_organ = partner.getorganslot(target_organ)
	text_picker(user, partner)	// для особых случаев
	if(partner.is_fucking(user, CUM_TARGET_TAIL, partner_organ))
		switch(user.a_intent)
			if(INTENT_HELP)
				simple_message = islist(help_text) ? pick(help_text) : help_text
			if(INTENT_GRAB, INTENT_DISARM)
				p13target_strength = min(p13target_strength + 20, 100)
				simple_message = islist(grab_text) ? pick(grab_text) : grab_text
				lust_amount += 4 // чуть лучше, но не прям на HIGH_LUST
			if(INTENT_HARM)
				p13target_strength = min(p13target_strength + 40, 100)
				simple_message = islist(harm_text) ? pick(harm_text) : harm_text
				if(HAS_TRAIT(partner, TRAIT_MASO))
					lust_amount = HIGH_LUST
				else
					lust_amount = LOW_LUST
	else	// начинаем как на help независимо от интента
		simple_message = islist(start_text) ? pick(start_text) : start_text
		partner.set_is_fucking(user, CUM_TARGET_TAIL, partner_organ)

	if(liquid_container)
		simple_message += " Стараясь ловить исходящие жидкости в [liquid_container]"
	if(lust_granted(partner))
		partner.handle_post_sex(lust_amount, CUM_TARGET_TAIL, liquid_container ? liquid_container : user,  partner_organ)
	playlewdinteractionsound(get_turf(user), pick(lewd_sounds), 70, 1, -1)
	..() // отправка сообщения в родительском проке

/datum/interaction/lewd/tail/dick
	description = "Хвост. Подрочить член."
	required_from_user = INTERACTION_REQUIRE_TAIL
	required_from_target_exposed = INTERACTION_REQUIRE_PENIS
	p13target_emote = PLUG13_EMOTE_PENIS
	additional_details = list(INTERACTION_FILLS_CONTAINERS)
	write_log_user = "tailjerked dick"
	write_log_target = "dick tailjerked by"
	target_organ = ORGAN_SLOT_PENIS
	try_milking = TRUE
	lewd_sounds = list('modular_sand/sound/interactions/bang1.ogg',
						'modular_sand/sound/interactions/bang2.ogg',
						'modular_sand/sound/interactions/bang3.ogg')

/datum/interaction/lewd/tail/dick/lust_granted(mob/living/partner)
	return partner.has_penis()

/datum/interaction/lewd/tail/dick/text_picker(mob/living/user, mob/living/partner) // особая проверка для замены текста в n ситуации
	var/has_penis = partner.has_penis()
	start_text = list(
		"USER обхватывает своим хвостом [has_penis ? "член" : "дилдо"] TARGET.",
		"USER плавно обвивает [has_penis ? "член" : "дилдо"] TARGET, сжимая его кольцами хвоста.",
		"USER ласково охватывает [has_penis ? "член" : "дилдо"] TARGET хвостом."
	)

	help_text = list(
		"USER удовлетворяет [has_penis ? "член" : "дилдо"] TARGET, гуляя по нему своим хвостиком.",
		"USER водит кончиком хвоста вдоль ствола TARGET.",
		"USER двигает хвостом вверх-вниз по [has_penis ? "члену" : "дилдо"] TARGET, [has_penis ? "" : "безуспешно "]стараясь доставить удовольствие."
	)

	grab_text = list(
		"USER крепко зажимает хвостом [has_penis ? "член" : "дилдо"] TARGET, то и дело проскальзывая по всей его длине.",
		"USER хищно охватывает хвостом [has_penis ? "член" : "дилдо"] TARGET и двигается по нему, не давая расслабиться.",
		"USER удерживает [has_penis ? "член" : "дилдо"] TARGET плотным кольцом хвоста, совершая настойчивые поступательные движения."
	)

	harm_text = list(
		"USER издевательски грубо [has_penis ? "мучает член" : "скручивает дилдо"] TARGET, явно не заботясь об ощущениях партнера.",
		"USER давит и тянет [has_penis ? "член" : "дилдо"] TARGET хвостом, словно наслаждаясь [has_penis ? "причиняемой болью" : "жестокостью"].",
		"USER резко сжимает и выкручивает [has_penis ? "член" : "дилдо"] TARGET, действуя без жалости и удерживая с силой."
	)

/datum/interaction/lewd/tail/vagina
	description = "Хвост. Проникнуть в вагину."
	required_from_target_exposed = INTERACTION_REQUIRE_VAGINA
	p13target_emote = PLUG13_EMOTE_VAGINA
	target_organ = ORGAN_SLOT_VAGINA
	try_milking = TRUE
	additional_details = list(INTERACTION_FILLS_CONTAINERS)
	write_log_user = "tailfucked vagina"
	write_log_target = "vaginal tailfucked by"
	start_text = list(
		"USER заползает внутрь вагины TARGET своим хвостом.",
		"USER осторожно вводит хвост в вагину TARGET, словно исследуя её изнутри.",
		"USER медленно скользит хвостом внутрь, лаская внутренние стенки TARGET."
	)
	help_text = list(
		"USER нежно проталкивает хвостик внутрь вагины TARGET.",
		"USER лаского движется хвостом вглубь лона, прислушиваясь к реакции TARGET.",
		"USER ритмично вводит хвост в киску TARGET, стараясь доставить максимум удовольствия."
	)
	grab_text = list(
		"USER настойчиво вбивается в вагину TARGET хвостом, то и дело поёрзывая из стороны в сторону.",
		"USER глубоко продвигает хвост в вагину TARGET, с усилием раздвигая её стенки.",
		"USER вдавливает хвост в вагину TARGET и начинает двигаться, будто хочет заполнить её полностью."
	)
	harm_text = list(
		"USER издевательски грубо насилует вагину TARGET хвостом, стараясь дотянуться до самых глубин чужого нутра.",
		"USER с силой вбивает хвост в вагину TARGET с безжалостной силой, не давая ей ни секунды покоя.",
		"USER резко проникает хвостом в вагину TARGET, растягивая её и причиняя дискомфорт."
	)
	lewd_sounds = list('modular_sand/sound/interactions/champ1.ogg',
						'modular_sand/sound/interactions/champ2.ogg')

/datum/interaction/lewd/tail/ass
	description = "Хвост. Проникнуть в задницу."
	required_from_target_exposed = INTERACTION_REQUIRE_ANUS
	p13target_emote = PLUG13_EMOTE_ANUS
	target_organ = ORGAN_SLOT_ANUS
	write_log_user = "tailfucked ass"
	write_log_target = "ass tailfucked by"
	start_text = list(
		"USER проталкивается в колечко TARGET своим хвостом.",
		"USER осторожно просовывает хвост в анальное отверстие TARGET, продвигаясь глубже.",
		"USER вводит хвост в задний проход TARGET, раздвигая его стенки."
	)
	help_text = list(
		"USER скользит внутри зада TARGET своим хвостом.",
		"USER нежно двигает хвостом в анусе TARGET, массируя его изнутри.",
		"USER медленно проникает хвостом в зад TARGET, стараясь доставить приятные ощущения."
	)
	grab_text = list(
		"USER активно вбивается хвостом внутрь ануса TARGET, то и дело стараясь утыкаться в чувствительные части.",
		"USER вдавливает хвост в анальное отверстие TARGET, двигаясь уверенно и быстро.",
		"USER ритмично проталкивает хвост в анус TARGET, извиваясь и надавливая изнутри."
	)
	harm_text = list(
		"USER насилует зад TARGET хвостом, словно стараясь прошить насквозь.",
		"USER с силой проникает хвостом в анальное отверстие TARGET, причиняя тому болезненные ощущения.",
		"USER грубо вбивает хвост в задний проход TARGET, действуя с напором и без капли жалости."
	)
	lewd_sounds = list('modular_sand/sound/interactions/bang1.ogg',
						'modular_sand/sound/interactions/bang2.ogg',
						'modular_sand/sound/interactions/bang3.ogg')

/datum/interaction/lewd/tail/urethra
	description = "Хвост. Проникнуть в уретру."
	required_from_target_exposed = INTERACTION_REQUIRE_PENIS
	p13target_emote = PLUG13_EMOTE_PENIS
	target_organ = ORGAN_SLOT_PENIS
	write_log_user = "tailsounding urehtra"
	write_log_target = "urehtra tailsounded by"
	lewd_sounds = list('modular_sand/sound/interactions/bang1.ogg',
						'modular_sand/sound/interactions/bang2.ogg',
						'modular_sand/sound/interactions/bang3.ogg',
						'modular_sand/sound/interactions/bang4.ogg',
						'modular_sand/sound/interactions/bang5.ogg',
						'modular_sand/sound/interactions/bang6.ogg',)
	p13target_strength_base_point = PLUG13_STRENGTH_MEDIUM

/datum/interaction/lewd/tail/urethra/lust_granted(mob/living/partner)
	return partner.has_penis()

/datum/interaction/lewd/tail/urethra/text_picker(mob/living/user, mob/living/partner)
	var/has_penis = partner.has_penis()
	start_text = list(
		"USER утыкает хвостик в [has_penis ? "уретру" : "отверстие дилдо"] TARGET, медленно входя.",
		"USER аккуратно просовывает кончик хвоста в [has_penis ? "уретру" : "отверстие дилдо"] TARGET.",
		"USER начинает проникновение хвостом в [has_penis ? "уретру" : "отверстие дилдо"] TARGET, растягивая вход своим движением."
	)
	help_text = list(
		"USER проталкивает и изучает [has_penis ? "уретру" : "отверстие дилдо"] TARGET своим хвостом.",
		"USER медленно двигает хвост внутри [has_penis ? "уретры" : "отверстия дилдо"] TARGET, ощущая каждую деталь.",
		"USER ласково толкается хвостом в [has_penis ? "уретре" : "отверстии дилдо"] TARGET, [has_penis ? "" : "безуспешно "]стараясь принести удовольствие."
	)
	grab_text = list(
		"USER старается хвостиком дойти до паха TARGET через [has_penis ? "уретру" : "отверстие дилдо"].",
		"USER активно продвигает хвост вглубь [has_penis ? "уретры" : "отверстия дилдо"] TARGET, словно стремясь дотянуться до самого основания.",
		"USER вдавливает хвост всё дальше по [has_penis ? "уретре" : "отверстию дилдо"] TARGET, упорно пробираясь к паху."
	)
	harm_text = list(
		"USER использует [has_penis ? "уретру" : "отверстие дилдо"] TARGET как игрушку, явно не заботясь о чужих ощущениях.",
		"USER безжалостно вбивает хвост в [has_penis ? "уретру" : "отверстие дилдо"] TARGET, не снижая давления ни на секунду.",
		"USER грубо насилует [has_penis ? "уретру" : "отверстие дилдо"] TARGET хвостом, растягивая [has_penis ? "её" : "его"] изнутри."
	)

////////////////////////////
//Итеракции с самим собой///
////////////////////////////

/datum/interaction/lewd/tail/dick/self
	description = "Хвост. Подрочить свой член."
	required_from_user_exposed = INTERACTION_REQUIRE_PENIS
	required_from_target_exposed = null
	interaction_flags = INTERACTION_FLAG_OOC_CONSENT | INTERACTION_FLAG_USER_IS_TARGET
	write_log_user = "tailjerked own dick"
	write_log_target = null
	lewd_sounds = list('modular_sand/sound/interactions/bang1.ogg',
						'modular_sand/sound/interactions/bang2.ogg',
						'modular_sand/sound/interactions/bang3.ogg')

/datum/interaction/lewd/tail/dick/self/text_picker(mob/living/user, mob/living/partner)
	var/has_penis = user.has_penis()
	start_text = list(
		"USER обхватывает хвостом собственный [has_penis ? "член" : "дилдо"].",
		"USER плотно обвивает свой [has_penis ? "член" : "дилдо"] хвостом, начиная медленные движения.",
		"USER накручивает хвост на свой [has_penis ? "член" : "дилдо"], плотно окутывая его."
	)
	help_text = list(
		"USER [has_penis ? "" : "безуспешно "]удовлетворяет себя, гуляя по своему [has_penis ? "члену" : "дилдо"] хвостиком.",
		"USER нежно скользит хвостом вверх-вниз по своему [has_penis ? "члену" : "дилдо"], подстраиваясь под каждое движение.",
		"USER ритмично ласкает свой [has_penis ? "член" : "дилдо"] хвостом, [has_penis ? "" : "безуспешно "]стараясь доставить себе удовольствие."
	)
	grab_text = list(
		"USER крепко зажимает хвостом собственный [has_penis ? "член" : "дилдо"], то и дело проскальзывая по всей его длине.",
		"USER не отпуская сжимает [has_penis ? "член" : "дилдо"] хвостом, двигаясь по нему с нарастающей силой.",
		"USER удерживает свой [has_penis ? "член" : "дилдо"] плотным кольцом хвоста и активно мастурбирует, не сбавляя темпа."
	)
	harm_text = list(
		"USER, [has_penis ? "явно" : "безуспешно"] желая доставить себе болезненные ощущения, особенно активно хвостом надрачивает свой [has_penis ? "член" : "дилдо"].",
		"USER намеренно сжимает [has_penis ? "член до боли" : "дилдо до хруста"] хвостом, маструбируя резкими движениями.",
		"USER грубо работает хвостом по своему [has_penis ? "члену" : "дилдо"], [has_penis ? "будто" : "безуспешно"] стремясь испытать боль и наслаждение одновременно."
	)

/datum/interaction/lewd/tail/vagina/self
	description = "Хвост. Проникнуть в свою вагину."
	required_from_user_exposed = INTERACTION_REQUIRE_VAGINA
	required_from_target_exposed = null
	interaction_flags = INTERACTION_FLAG_OOC_CONSENT | INTERACTION_FLAG_USER_IS_TARGET
	write_log_user = "tailfucked own vagina"
	write_log_target = null
	start_text = list(
		"USER заползает хвостиком внутрь своей вагины.",
		"USER медленно вводит хвост в собственное лоно, затаив дыхание от ощущений.",
		"USER аккуратно просовывает хвост в свою вагину, погружая его всё глубже."
	)

	help_text = list(
		"USER нежно проталкивает хвостик внутрь своего лона.",
		"USER мягко скользит хвостом в собственной вагине.",
		"USER ласково играет хвостом внутри своей вагины, двигаясь плавно и осторожно."
	)

	grab_text = list(
		"USER настойчиво вбивается внутрь своего лона, то и дело поёрзывая из стороны в сторону.",
		"USER глубоко вводит хвост в себя, активно двигаясь и постанывая.",
		"USER продавливает свой хвост вглубь вагины, не стесняясь плотных толчков и движений."
	)

	harm_text = list(
		"USER насилует собственное лоно при помощи хвоста, словно пытаясь вбиться как можно глубже.",
		"USER с напором вбивает хвост в себя, будто нарочно причиняя себе боль.",
		"USER грубо раздвигает собственную вагину хвостом, действуя резко и без пощады."
	)
	lewd_sounds = list('modular_sand/sound/interactions/champ1.ogg',
						'modular_sand/sound/interactions/champ2.ogg')

/datum/interaction/lewd/tail/ass/self
	description = "Хвост. Проникнуть в свою задницу."
	required_from_user_exposed = INTERACTION_REQUIRE_ANUS
	required_from_target_exposed = null
	interaction_flags = INTERACTION_FLAG_OOC_CONSENT | INTERACTION_FLAG_USER_IS_TARGET
	write_log_user = "tailfucked own ass"
	write_log_target = null
	start_text = list(
		"USER проталкивает хвостик в свой зад.",
		"USER медленно вводит хвост в свой анус, ощущая, как он заполняется изнутри.",
		"USER просовывает хвост в задний проход, постепенно погружая его всё глубже."
	)
	help_text = list(
		"USER скользит внутри своего кишечника при помощи хвоста.",
		"USER аккуратно двигает хвостом в собственном анусе, наслаждаясь внутренним давлением.",
		"USER нежно водит хвостом внутри себя, массируя задний проход."
	)
	grab_text = list(
		"USER активно вбивается хвостом внутрь собственного ануса.",
		"USER резко толкает хвост в свое колечко, двигаясь с упорством и силой.",
		"USER плотно заполняет свой зад хвостом, не прекращая движений."
	)
	harm_text = list(
		"USER насилует свой зад хвостом, словно стараясь прошить себя насквозь.",
		"USER безжалостно вгоняет хвост в свой анус, не давая себе ни малейшего отдыха.",
		"USER с силой продавливает хвост в задний проход, будто стремясь разорвать себя изнутри."
	)
	lewd_sounds = list('modular_sand/sound/interactions/bang1.ogg',
						'modular_sand/sound/interactions/bang2.ogg',
						'modular_sand/sound/interactions/bang3.ogg')

/datum/interaction/lewd/tail/urethra/self
	description = "Хвост. Проникнуть в свою уретру."
	required_from_user_exposed = INTERACTION_REQUIRE_PENIS
	required_from_target_exposed = null
	interaction_flags = INTERACTION_FLAG_OOC_CONSENT | INTERACTION_FLAG_USER_IS_TARGET
	write_log_user = "tailsounding own urehtra"
	write_log_target = null
	lewd_sounds = list('modular_sand/sound/interactions/bang1.ogg',
						'modular_sand/sound/interactions/bang2.ogg',
						'modular_sand/sound/interactions/bang3.ogg',
						'modular_sand/sound/interactions/bang4.ogg',
						'modular_sand/sound/interactions/bang5.ogg',
						'modular_sand/sound/interactions/bang6.ogg',)

/datum/interaction/lewd/tail/urethra/self/text_picker(mob/living/user, mob/living/partner)
	var/has_penis = user.has_penis()
	start_text = list(
		"USER утыкает хвостик в [has_penis ? "свою уретру" : "отверстие свего дилдо"], медленно входя.",
		"USER аккуратно вводит кончик хвоста в [has_penis ? "собственную уретру" : "свой дилдо"], замирая от ощущения проникновения.",
		"USER неспешно просовывает хвост в [has_penis ? "свою уретру" : "отверстие свего дилдо"], наслаждаясь [has_penis ? "растяжением и трением внутри себя" : "ощущениями"]."
	)
	help_text = list(
		"USER проталкивает и изучает [has_penis ? "собственную уретру" : "свой дилдо"] при помощи хвоста.",
		"USER осторожно двигает хвостом в [has_penis ? "своей уретре" : "отверстии свего дилдо"], чувствуя каждый изгиб и сжатие.",
		"USER медленно и плавно продвигает хвост вглубь [has_penis ? "уретры" : "дилдо"], словно исследуя изнутри."
	)
	grab_text = list(
		"USER старается хвостиком дойти до своего паха через [has_penis ? "уретру" : "отверстие дилдо"].",
		"USER упорно проталкивает хвост вглубь сво[has_penis ? "ей уретры" : "его дилдо"], стремясь проникнуть как можно дальше.",
		"USER с напором двигает хвост по [has_penis ? "уретре" : "дилдо"], будто желая коснуться основания своего тела."
	)
	harm_text = list(
		"USER вбивает хвостик в собственн[has_penis ? "ую уретру" : "ый дилдо"], с явной грубостью обходясь с[has_penis ? "о своим телом" : " ним"].",
		"USER резко и безжалостно продавливает хвост внутрь сво[has_penis ? "ей уретры" : "его дилдо"], не обращая внимания на [has_penis ? "боль" : "давление"].",
		"USER жестко использует св[has_penis ? "ою уретру" : "ой дилдо"] для проникновения хвоста, [has_penis ? "причиняя" : "безуспешно пытаясь причинить"] себе резкое, пронизывающее ощущение."
	)

// Ура душить хвостом
/datum/interaction/lewd/tail_choke
	description = "Опасно. Придушить хвостом."
	required_from_user = INTERACTION_REQUIRE_TAIL
	interaction_flags = INTERACTION_FLAG_ADJACENT | INTERACTION_FLAG_OOC_CONSENT | INTERACTION_FLAG_EXTREME_CONTENT
	write_log_user = "tailchoke"
	write_log_target = "had tailchoked by"
	p13target_emote = PLUG13_EMOTE_MASOCHISM

/datum/interaction/lewd/tail_choke/display_interaction(mob/living/user, mob/living/partner)
	var/message
	var/oxy_damage = user.a_intent == INTENT_HARM ? rand(3, 6) : 3
	var/lust_amount = LOW_LUST //если наша цель довести до пика, то не стоит это закрывать за попытками увести в крит от удушья
	if(partner.getOxyLoss() > 40) //задушить и руками можно, это чисто ЕРП эмоут
		oxy_damage = 0
	if(user.a_intent == INTENT_HARM)
		message = list(
			"грубо обхватывает своим хвостом шею <b>\the [partner]</b>, стараясь перекрыть доступ к воздуху.",
			"обвивает шею <b>\the [partner]</b> хвостом, и тут же начинает сжимать, перекрывая дыхательные пути.",
			"резко стягивает хвост вокруг шеи <b>\the [partner]</b>, вызывая удушье."
		)
		if(partner.is_fucking(user, CUM_TARGET_TAIL))
			var/affecting = partner.get_bodypart(BODY_ZONE_HEAD)
			partner.apply_damage(1, BRUTE, affecting, partner.run_armor_check(affecting, MELEE))
			message = list(
				"стягивая хвост вокруг шеи <b>\the [partner]</b> уже до хруста, активно меж тем стараясь не дать продохнуть.",
				"сдавливает шею <b>\the [partner]</b> хвостом, пока она не хрустнет, не давая сделать вдох.",
				"обвивает шею <b>\the [partner]</b>, с неослабевающим давлением сжимая и лишая дыхания."
			)
	else
		message = list(
			"захватывает глотку <b>\the [partner]</b> своим хвостом, стараясь перекрывать доступ к воздуху.",
			"хвостом удерживает шею <b>\the [partner]</b>, всё сильнее сдавливая её.",
			"вцепляется хвостом в шею <b>\the [partner]</b>, удерживая и не давая сделать вдох."
		)
		if(partner.is_fucking(user, CUM_TARGET_TAIL))
			message = list(
				"стягивает всё сильнее глотку <b>\the [partner]</b> своим хвостом в попытке перекрыть доступ к воздуху.",
				"своим хвостом неумолимо сдавливает шею <b>\the [partner]</b>, стараясь лишить дыхания.",
				"вжимает хвост в горло <b>\the [partner]</b>, не позволяя ни вдохнуть."
			)

	if(!HAS_TRAIT(partner, TRAIT_NOBREATH) && oxy_damage)
		partner.apply_damage(oxy_damage, OXY)
	if(HAS_TRAIT(partner, TRAIT_CHOKE_SLUT))
		lust_amount = NORMAL_LUST
	partner.set_is_fucking(user, CUM_TARGET_TAIL)
	user.visible_message(span_danger("<b>\The [user]</b> [(islist(message) ? pick(message) : message)]."), ignored_mobs = user.get_unconsenting())
	playlewdinteractionsound(get_turf(user), 'sound/weapons/thudswoosh.ogg', 50, 1, -1)
	partner.handle_post_sex(lust_amount, CUM_TARGET_HAND, user)
