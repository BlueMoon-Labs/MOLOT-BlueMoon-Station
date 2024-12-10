/datum/reagent/consumable/semen/reaction_mob(mob/living/M, method, reac_volume)
	. = ..()
	if(!istype(src, /datum/reagent/consumable/semen/femcum))
		if(HAS_TRAIT(M, TRAIT_GFLUID_DETECT) || HAS_TRAIT(M,TRAIT_DUMB_CUM))
			to_chat(M, span_love("Вы узнаете хорошо знакомый вам вкус свежей спермы~"))
		if(HAS_TRAIT(M, TRAIT_DUMB_CUM))
			var/datum/quirk/dumb4cum/quirk_target = locate() in M.roundstart_quirks
			quirk_target.uncrave()
			M.set_drugginess(1)
			if(prob(15))
				to_chat(M, span_love(pick("Как же вкусно!~", "Восхитительно!~", "Невозможно удержаться!~")))
				M.emote("moan")

/datum/reagent/consumable/semen/on_mob_life(mob/living/carbon/M)
	. = ..()
	if(iscatperson(M) && HAS_TRAIT(M,TRAIT_DUMB_CUM)  && !istype(src, /datum/reagent/consumable/semen/femcum)) //special "milk" tastes nice for special felinids
		if(prob(3))
			to_chat(M, span_notice(pick("Mmmm~ boy's milk feels so good inside me~", "Ahh~ boy's milk~")))
			M.emote("purr")

/datum/reagent/consumable/ethanol/cum_in_a_hot_tub/semen/reaction_mob(mob/living/carbon/M)
	. = ..()
	if(HAS_TRAIT(M, TRAIT_GFLUID_DETECT) || HAS_TRAIT(M,TRAIT_DUMB_CUM))
		to_chat(M, span_love("Вы чувствуете явную нотку свежей спермы в напитке~"))

