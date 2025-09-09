/datum/interaction/lewd/crushhead
	description = "Убийственно. Сжать голову бёдрами."
	require_target_legs = REQUIRE_ANY
	require_target_num_legs = 2
	interaction_flags = INTERACTION_FLAG_ADJACENT | INTERACTION_FLAG_OOC_CONSENT | INTERACTION_FLAG_EXTREME_CONTENT
	write_log_user = "trying to squeeze"
	write_log_target = "was squeezed by"
	additional_details = list(
		list(
			"info" = "При включенном предпочтении во время критического состояния может взорвать голову",
			"icon" = "brain",
			"color" = "blue"
		)
	)
	p13user_emote = PLUG13_EMOTE_FACE
	p13user_strength = PLUG13_STRENGTH_LOW
	p13user_duration = PLUG13_DURATION_SHORT

	p13target_emote = PLUG13_EMOTE_MASOCHISM

/datum/interaction/lewd/crushhead/display_interaction(mob/living/user, mob/living/partner)
	if(!D.get_bodypart(BODY_ZONE_HEAD))
		to_chat(user,span_warning("У цели отсутствует голова!"))
		return
	var/message = "[pick("нежно прижимается к <b>[partner]</b>, обхватывая голову ляжками.",
					"отпускает голову <b>[partner]</b>, чтобы с новой силой сдавить её своими бедрами.",
					"нежно прижимает <b>[partner]</b> меж ножками и немного встряхивает своими наушниками.",
					"обхватывает <b>[partner]</b> своими бедрами и тихо постанывает.",
					"с шлепком закрывает своими бедрами лицо <b>[partner]</b> и впоследствии слабо сдавливает.")]"
	var/lust_amount = LOW_LUST // При уроне уже идет накопление LUST, так что много не требуется
	var/damage_amount = rand(1,3)

	if(user.a_intent == INTENT_HARM)
		lust_amount = NORMAL_LUST
		damage_amount = rand(8, 15)
		message = "[pick("прижимается к <b>[partner]</b>, своими бедрами, с силой сжимая голову.",
					"резко сдавливает ляжками <b>[partner]</b>, тем самым вызывая утробный стон жертвы.",
					"крепко прижимает <b>[partner]</b> к своему паху, сжимая голову с хрустом в шее.",
					"с силой закрепляется за <b>[partner]</b> своими ногами и хищно наблюдает.",
					"максимально грубым образом сдавливает голову <b>[partner]</b> до хруста в шее.")]"

		var/mob/living/carbon/human/H = partner
		if(istype(H) && partner.client)
			if(partner.client.prefs.extremeharm != "No")
				HeadStomp(user, partner)
				if(prob(30))
					H.bleed(2)
					H.add_splatter_floor(get_turf(BLOOD_COLOR_HUMAN), TRUE)
					new/obj/effect/decal/cleanable/blood
				if(prob(25))
					H.adjustOrganLoss(ORGAN_SLOT_BRAIN, rand(1,3))
					partner.adjustBruteLoss(rand(6,12))

		message = span_danger("<b>\The [user]</b> [message]")
	else
		message = span_lewd("<b>\The [user]</b> [message]")

	partner.apply_damage(damage_amount, BRUTE, BODY_ZONE_HEAD, partner.run_armor_check(BODY_ZONE_HEAD, MELEE))

	if(!HAS_TRAIT(user, TRAIT_LEWD_JOB))
		new /obj/effect/temp_visual/heart(user.loc)
	if(!HAS_TRAIT(partner, TRAIT_LEWD_JOB))
		new /obj/effect/temp_visual/heart(partner.loc)

	user.visible_message(message = message, ignored_mobs = user.get_unconsenting())
	playlewdinteractionsound(get_turf(user), 'modular_sand/sound/interactions/squelch1.ogg', 50, 1, -1)
	if(HAS_TRAIT(partner, TRAIT_MASO))
		partner.handle_post_sex(lust_amount, null, user)

	var/const/basic_scream_chance = 25 // %
	// basic% + (% of lust - basic%)
	if(prob(basic_scream_chance + max(ceil(partner.get_lust() / partner.get_climax_threshold()*100)-basic_scream_chance, 0)))
		partner.visible_message(span_lewd("<b>\The [partner]</b> [pick("дрожит от боли.",
				"тихо вскрикивает.",
				"выдыхает болезненный стон.",
				"звучно вздыхает от боли.",
				"сильно вздрагивает.",
				"вздрагивает, закатывая свои глаза.")]"))
		if(prob(30) && isclownjob(user))
			user.visible_message(span_lewd("<b>[user]</b> забавно хонкает!"))

/datum/interaction/lewd/crushhead/proc/HeadStomp(mob/living/carbon/human/A, mob/living/carbon/human/D)
    if((D.health / D.getMaxHealth()) < 0.1)
        D.crush_head(A)
