/datum/interaction/lewd/crushhead
	description = "Убийственно. Сжать голову бёдрами."
	interaction_sound = null
	required_from_user_unexposed = INTERACTION_REQUIRE_FEET
	required_from_target_unexposed = INTERACTION_REQUIRE_MOUTH
	interaction_flags = INTERACTION_FLAG_ADJACENT | INTERACTION_FLAG_OOC_CONSENT | INTERACTION_FLAG_EXTREME_CONTENT

	write_log_user = "trying to squeeze"
	write_log_target = "was squeezed by"
	additional_details = list(
		list(
			"info" = "При включенном предпочтении при сильных повреждениях может взорвать голову",
			"icon" = "lungs",
			"color" = "blue"
		)
	)

	max_distance = 1
	p13user_emote = PLUG13_EMOTE_FACE
	p13user_strength = PLUG13_STRENGTH_LOW
	p13user_duration = PLUG13_DURATION_SHORT

	p13target_emote = PLUG13_EMOTE_MASOCHISM

/datum/interaction/lewd/crushhead/display_interaction(mob/living/user, mob/living/partner)
	var/message

	if(user.a_intent == INTENT_HARM)
		user.is_fucking(partner, CUM_TARGET_MOUTH)
		var/obj/item/bodypart/affecting = partner.get_bodypart(ran_zone(BODY_ZONE_HEAD))
		partner.apply_damage(rand(5, 10), BRUTE, affecting, partner.run_armor_check(affecting, MELEE))
		partner.adjustBruteLoss(rand(3,6))
		message = "[pick("прижимается к <b>[partner]</b>, своими бедрами, с силой сжимая голову.",
					"резко сдавливает ляжками <b>[partner]</b>, тем самым вызывая утробный стон жертвы.",
					"крепко прижимает <b>[partner]</b> к своему паху, сжимая голову с хрустом в шее.",
					"с силой закрепляется за <b>[partner]</b> своими ногами и хищно наблюдает.",
					"максимально грубым образом сдавливает голову <b>[partner]</b> до хруста в шее.")]"
	else
		var/obj/item/bodypart/affecting = partner.get_bodypart(ran_zone(BODY_ZONE_HEAD))
		partner.apply_damage(rand(1, 3), BRUTE, affecting, partner.run_armor_check(affecting, MELEE))
		message = "[pick("нежно прижимается к <b>[partner]</b>, обхватывая голову ляжками.",
					"отпускает голову <b>[partner]</b>, чтобы с новой силой сдавить её своими бедрами.",
					"нежно прижимает <b>[partner]</b> меж ножками и немного встряхивает своими наушниками.",
					"обхватывает <b>[partner]</b> своими бедрами и тихо постанывает.",
					"с шлепком закрывает своими бедрами лицо <b>[partner]</b> и впоследствии слабо сдавливает.")]"
		var/client/cli = partner.client
		var/mob/living/carbon/C = partner
		if(cli && istype(C))
			if(cli.prefs.extremeharm != "No")
				if(prob(30))
					C.bleed(2)
					C.add_splatter_floor(get_turf(BLOOD_COLOR_HUMAN), TRUE)
					new/obj/effect/decal/cleanable/blood
				if(prob(25))
					C.adjustOrganLoss(ORGAN_SLOT_EYES, rand(10,20))
					C.adjustOrganLoss(ORGAN_SLOT_BRAIN, rand(7,15))
					partner.adjustBruteLoss(rand(6,12))

	user.visible_message(message = span_lewd("<b>\The [user]</b> [message]"), ignored_mobs = user.get_unconsenting())
	playlewdinteractionsound(get_turf(user), 'modular_sand/sound/interactions/squelch1.ogg', 50, 1, -1)
	var/lust_amount = NORMAL_LUST //если наша цель довести до пика, то не стоит это закрывать за кучей укусов
	if(HAS_TRAIT(partner, TRAIT_MASO))
		lust_amount *= 2
	partner.handle_post_sex(lust_amount, CUM_TARGET_HAND, user)
	if(prob(50 + partner.get_lust()))
		partner.visible_message("<span class='lewd'><b>\The [partner]</b> [pick("дрожит от боли.",
				"тихо вскрикивает.",
				"выдыхает болезненный стон.",
				"звучно вздыхает от боли.",
				"сильно вздрагивает.",
				"вздрагивает, закатывая свои глаза.")]</span>")
