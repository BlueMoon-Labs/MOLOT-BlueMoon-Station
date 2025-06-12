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
	description = "Хвост. Подрочить член."
	simple_style = "lewd"
	big_user_target_text = TRUE
	required_from_user = INTERACTION_REQUIRE_TAIL
	required_from_target_exposed = INTERACTION_REQUIRE_PENIS
	p13target_emote = PLUG13_EMOTE_PENIS
	additional_details = list(INTERACTION_FILLS_CONTAINERS)
	write_log_user = "tailjerked dick"
	write_log_target = "dick tailjerked by"
	var/target_organ = ORGAN_SLOT_PENIS	// орган для взаимодействия
	var/try_milking = TRUE // пытаемся-ли выдоить что-то в контейнер
	// для фраз стоит находить формулировки в которых можно будет
	var/start_text	= "USER обхватывает своим хвостом член TARGET."
	var/help_text	= "USER удвлетворяет член TARGET гуляя по нему своим хвостиком."
	var/grab_text	= "USER крепко зажимая хвостом член TARGET, то и дело проскальзывает по всей его  длине."
	var/harm_text	= "USER издевательски грубо мучает член TARGET, явно не собираясь заботиться о его ощущениях."
	var/list/lewd_sounds = list('modular_sand/sound/interactions/bang1.ogg',
						'modular_sand/sound/interactions/bang2.ogg',
						'modular_sand/sound/interactions/bang3.ogg')
	var/p13target_strength_base_point = PLUG13_STRENGTH_NORMAL // точка к которой прибавляет +1 уровень при граб, дизарм и +2 уровня при харме

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

	//выбираем текст и проверка режима взаимодействия
	p13target_strength = p13target_strength_base_point
	simple_message = null	// используем для сообщения базовую переменную
	var/lust_amount = NORMAL_LUST
	var/obj/item/organ/genital/partner_organ = partner.getorganslot(target_organ)
	if(partner.is_fucking(user, CUM_TARGET_TAIL, partner_organ))
		switch(user.a_intent)
			if(INTENT_HELP)
				simple_message = help_text
			if(INTENT_GRAB, INTENT_DISARM)
				p13target_strength = min(p13target_strength + 20, 100)
				simple_message = grab_text
				lust_amount += 4 // чуть лучше, но не прям на HIGH_LUST
			if(INTENT_HARM)
				p13target_strength = min(p13target_strength + 40, 100)
				simple_message = harm_text
				if(HAS_TRAIT(partner, TRAIT_MASO))
					lust_amount = HIGH_LUST
				else
					lust_amount = LOW_LUST
	else	// начинаем как на help независимо от интента
		simple_message = start_text
		partner.set_is_fucking(user, CUM_TARGET_TAIL, partner_organ)

	if(liquid_container)
		simple_message += ", стараясь ловить исходящие жидкости в [liquid_container]"
	partner.handle_post_sex(NORMAL_LUST, CUM_TARGET_TAIL, liquid_container ? liquid_container : user,  partner_organ)
	playlewdinteractionsound(get_turf(user), pick(lewd_sounds), 70, 1, -1)
	..() // отправка сообщения в родительском проке

/datum/interaction/lewd/tail/vagina
	description = "Хвост. Проникнуть в вагину."
	required_from_target_exposed = INTERACTION_REQUIRE_VAGINA
	p13target_emote = PLUG13_EMOTE_VAGINA
	additional_details = null
	target_organ = ORGAN_SLOT_VAGINA
	write_log_user = "tailfucked vagina"
	write_log_target = "vaginal tailfucked by"
	try_milking = FALSE
	start_text	= "USER заползает внутрь вагины TARGET своим хвостом."
	help_text	= "USER нежно проталкивает хвостик внутрь вагины TARGET."
	grab_text	= "USER настойчиво вбивается в вагину TARGET, то и дело поёрзывая из стороны в сторону."
	harm_text	= "USER издевательски грубо насилует вагину TARGET, стараясь дотянуться до самых глубин чужого нутра."
	lewd_sounds = list('modular_sand/sound/interactions/champ1.ogg',
						'modular_sand/sound/interactions/champ2.ogg')

/datum/interaction/lewd/tail/ass
	description = "Хвост. Проникнуть в задницу."
	required_from_target_exposed = INTERACTION_REQUIRE_ANUS
	p13target_emote = PLUG13_EMOTE_ANUS
	additional_details = null
	target_organ = ORGAN_SLOT_ANUS
	write_log_user = "tailfucked ass"
	write_log_target = "ass tailfucked by"
	try_milking = FALSE
	start_text	= "USER проталкивается в колечко TARGET своим хвостом."
	help_text	= "USER скользит внутри зада TARGET своим хвостом."
	grab_text	= "USER активно вбивается хвостом внутрь ануса TARGET, то и дело стараясь утыкаться в чувствительные части."
	harm_text	= "USER насилует зад TARGET, словно стараясь прошить насквозь."
	lewd_sounds = list('modular_sand/sound/interactions/bang1.ogg',
						'modular_sand/sound/interactions/bang2.ogg',
						'modular_sand/sound/interactions/bang3.ogg')

/datum/interaction/lewd/tail/urethra
	description = "Хвост. Проникнуть в уретру."
	required_from_target_exposed = INTERACTION_REQUIRE_PENIS
	p13target_emote = PLUG13_EMOTE_PENIS
	additional_details = null
	target_organ = ORGAN_SLOT_PENIS
	write_log_user = "tailsounding urehtra"
	write_log_target = "urehtra tailsounded by"
	try_milking = FALSE
	start_text	= "USER утыкает хвостик в уретру TARGET, меленно в ту входя."
	help_text	= "USER проталкивает и изучает уретру TARGET своим хвостом."
	grab_text	= "USER старается хвостиком дойти до паха TARGET через уретру."
	harm_text	= "USER использует уретру TARGET как игрушку, явно не заботясь о чужих ощущениях."
	lewd_sounds = list('modular_sand/sound/interactions/bang1.ogg',
						'modular_sand/sound/interactions/bang2.ogg',
						'modular_sand/sound/interactions/bang3.ogg',
						'modular_sand/sound/interactions/bang4.ogg',
						'modular_sand/sound/interactions/bang5.ogg',
						'modular_sand/sound/interactions/bang6.ogg',)
	p13target_strength_base_point = PLUG13_STRENGTH_MEDIUM

////////////////////////////
//Итеракции с самим собой///
////////////////////////////

/datum/interaction/lewd/tail/self
	description = "Хвост. Подрочить свой член."
	required_from_user_exposed = INTERACTION_REQUIRE_PENIS
	required_from_target_exposed = null
	interaction_flags = INTERACTION_FLAG_OOC_CONSENT | INTERACTION_FLAG_USER_IS_TARGET
	write_log_user = "tailjerked own dick"
	write_log_target = null
	start_text	= "USER обхватывает хвостом собственный член."
	help_text	= "USER удвлетворяет себя гуляя по своему члену хвостиком."
	grab_text	= "USER крепко зажимая хвостом собственный, то и дело проскальзывает по всей его  длине."
	harm_text	= "USER явно желая доставить себе болезненные ощущения, особенно активно хвостом надрачивает свой член."
	lewd_sounds = list('modular_sand/sound/interactions/bang1.ogg',
						'modular_sand/sound/interactions/bang2.ogg',
						'modular_sand/sound/interactions/bang3.ogg')

/datum/interaction/lewd/tail/vagina/self
	description = "Хвост. Проникнуть в свою вагину."
	required_from_user_exposed = INTERACTION_REQUIRE_VAGINA
	required_from_target_exposed = null
	interaction_flags = INTERACTION_FLAG_OOC_CONSENT | INTERACTION_FLAG_USER_IS_TARGET
	write_log_user = "tailfucked own vagina"
	write_log_target = null
	start_text	= "USER заползает хвостиком внутрь своей вагины."
	help_text	= "USER нежно проталкивает хвостик внутрь своего лона."
	grab_text	= "USER настойчиво вбивается внутрь своего лона, то и дело поёрзывая из стороны в сторону."
	harm_text	= "USER насилует собственное лоно при помощи хвоста, словно пытаясь вбиться как можно глубже."
	lewd_sounds = list('modular_sand/sound/interactions/champ1.ogg',
						'modular_sand/sound/interactions/champ2.ogg')

/datum/interaction/lewd/tail/ass/self
	description = "Хвост. Проникнуть в свою задницу."
	required_from_user_exposed = INTERACTION_REQUIRE_ANUS
	required_from_target_exposed = null
	interaction_flags = INTERACTION_FLAG_OOC_CONSENT | INTERACTION_FLAG_USER_IS_TARGET
	write_log_user = "tailfucked own ass"
	write_log_target = null
	start_text	= "USER проталкивает хвостик в свой зад."
	help_text	= "USER скользит внутри своего кишечника при помощи хвоста."
	grab_text	= "USER активно вбивается хвостом внутрь собственного ануса."
	harm_text	= "USER насилует свой зад хвостом, словно стараясь прошить себя насквозь."
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
	start_text	= "USER утыкает хвостик в свою уретру, меленно в ту входя."
	help_text	= "USER проталкивает и изучает собственную уретру при помощи хвоста."
	grab_text	= "USER старается хвостиком дойти до своего паха через уретру."
	harm_text	= "USER вбивает хвостик собственную уретру с явной грубостью обходясь со своим телом."
	lewd_sounds = list('modular_sand/sound/interactions/bang1.ogg',
						'modular_sand/sound/interactions/bang2.ogg',
						'modular_sand/sound/interactions/bang3.ogg',
						'modular_sand/sound/interactions/bang4.ogg',
						'modular_sand/sound/interactions/bang5.ogg',
						'modular_sand/sound/interactions/bang6.ogg',)

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
	if(partner.getOxyLoss() > 40) //задушить и руками можно, это чисто ЕРП эмоут
		oxy_damage = 0
	if(user.a_intent == INTENT_HARM)
		message = "грубо обхватывает своим хвостом шею <b>\the [partner]</b> стараясь перекрыть доступ к кислороду"
		if(partner.is_fucking(user, CUM_TARGET_TAIL))
			var/affecting = partner.get_bodypart(BODY_ZONE_HEAD)
			partner.apply_damage(1, BRUTE, affecting, partner.run_armor_check(affecting, MELEE))
			message = "стягивая хвост вокруг шеи <b>\the [partner]</b> уже до хруста, активно меж тем стараясь не дать продохнуть"
	else
		message = "захватывает глотку <b>\the [partner]</b> своим хвостом стараясь перекрывать доступ к кислороду"
		if(partner.is_fucking(user, CUM_TARGET_TAIL))
			message = "стягивает всё сильнее глотку <b>\the [partner]</b> своим хвостом в попытке перекрыть доступ к кислороду"

	if(!HAS_TRAIT(partner, TRAIT_NOBREATH) && oxy_damage)
		partner.apply_damage(oxy_damage, OXY)
	partner.set_is_fucking(user, CUM_TARGET_TAIL)
	user.visible_message(span_danger("<b>\The [user]</b> [message]."), ignored_mobs = user.get_unconsenting())
	playlewdinteractionsound(get_turf(user), 'sound/weapons/thudswoosh.ogg', 50, 1, -1)
	var/lust_amount = NORMAL_LUST //если наша цель довести до пика, то не стоит это закрывать за попытками увести в крит от удушья
	if(HAS_TRAIT(partner, TRAIT_CHOKE_SLUT)) // да, даже если не дышит, может ему по кайфу от шарфика вокруг шеи
		lust_amount *= 2
	partner.handle_post_sex(lust_amount, CUM_TARGET_HAND, user)
