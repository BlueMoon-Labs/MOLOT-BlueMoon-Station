/datum/quirk/awoo
	name = "Неконтролируемый вой"
	desc = "Вам иногда нравиться завывать, есть ли на то причиниа или нет. Также вы не можете удержаться перед воем других."
	value = 0
	gain_text = "<span class='notice'>Иногда так хочется повыть...</span>"
	lose_text = "<span class='notice'>Я больше не хочу выть.</span>"
	mob_trait = TRAIT_AWOO
	//var/timer	//можно через таймеры, но я бы предпочел псевдорандом
	//var/timer_trigger = 1 MINUTES
	var/last_awoo
	var/default_chance = 0.01 //одна сотая процента
	var/chance = 0.01
	processing_quirk = TRUE
	mood_quirk = TRUE

/datum/quirk/awoo/add()
	// Set timer
	//timer = addtimer(CALLBACK(src, PROC_REF(do_awoo), timer_trigger, TIMER_STOPPABLE)
	last_awoo = world.time
	chance = default_chance

//datum/quirk/awoo/remove()
	// Remove timer
	//deltimer(timer)

/datum/quirk/awoo/on_process()
	if(prob(chance))
		if((last_awoo + 5 SECONDS) > world.time)
			return
		// Check if conscious
		if(quirk_holder.stat == CONSCIOUS)
			// Display emote
			quirk_holder.nextsoundemote = world.time - 10
			addtimer(CALLBACK(quirk_holder, TYPE_PROC_REF(/mob, emote), pick("awoo", "howl")), rand(10,30))
			chance = default_chance
	if(chance < 100)
		chance += 0.001

/datum/quirk/awoo/proc/do_awoo()
	if(quirk_holder)
		if((last_awoo + 10 SECONDS) > world.time)
			return
		// Check if conscious
		if(quirk_holder.stat == CONSCIOUS)
			// Display emote
			quirk_holder.nextsoundemote = world.time - 10
			addtimer(CALLBACK(quirk_holder, TYPE_PROC_REF(/mob, emote), pick("awoo", "howl")), rand(10,30))
			chance = default_chance
			//timer_trigger = 1 MINUTES
		//else
			//timer_trigger = 5 MINUTES
	// Remove timer
	//deltimer(timer)
	//timer = null
	// Add new timer
	//timer = addtimer(CALLBACK(src, PROC_REF(do_awoo), timer_trigger, TIMER_STOPPABLE)

/datum/emote/sound/human/awoo
	emote_volume = 100
	emote_range = MEDIUM_RANGE_SOUND_EXTRARANGE
	emote_falloff_exponent = 1
	emote_distance_multiplier_min_range = 12

/datum/emote/sound/human/awoo/run_emote(mob/user, params)
	. = ..()
	if(!.)
		return
	if (HAS_TRAIT(user, TRAIT_AWOO))
		var/mob/living/carbon/M = user
		var/datum/quirk/awoo/quirk_target = locate() in M.roundstart_quirks
		quirk_target.last_awoo = world.time
		quirk_target.chance = quirk_target.default_chance
		SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "to_awoo", /datum/mood_event/to_awoo)

/datum/emote/sound/human/howl
	emote_volume = 100
	emote_range = MEDIUM_RANGE_SOUND_EXTRARANGE
	emote_falloff_exponent = 1
	emote_distance_multiplier_min_range = 12

/datum/emote/sound/human/howl/run_emote(mob/user, params)
	. = ..()
	if(!.)
		return
	if (HAS_TRAIT(user, TRAIT_AWOO))
		var/mob/living/carbon/M = user
		var/datum/quirk/awoo/quirk_target = locate() in M.roundstart_quirks
		quirk_target.last_awoo = world.time
		quirk_target.chance = quirk_target.default_chance
		SEND_SIGNAL(user, COMSIG_ADD_MOOD_EVENT, "to_awoo", /datum/mood_event/to_awoo)

/datum/quirk/light
	name = "Лёгкий"
	desc = "Вы в разы легче того, чем вы выглядите! Хотя и размеры теперь не особо помогают в выживании."
	value = 0
	mob_trait = TRAIT_BLUEMOON_LIGHT
	gain_text = "<span class='notice'>Вы ощущаете себя легче пёрышка!</span>"
	lose_text = "<span class='danger'>Вы ощёщаете себя тяжелее.</span>"
	medical_record_text = "Пациент имеет аномально низкий вес."
	antag_removal_text // Text will be given to the quirk holder if they get an antag that has it blacklisted.

/datum/quirk/clearly_audible
	name = "Хорошо слышимый"
	desc = "Объясняя ваше маленькость вас уж точно услышат (позволяет при маленьком размере иметь хорошо слышимую речь)"
	value = 0
	mob_trait = TRAIT_BLUEMOON_CLEARLY_AUDIBLE
	gain_text = "<span class='notice'>Ваш голос звучит ещё более звонко!</span>"
	lose_text = "<span class='danger'>Кхе-кхе...</span>"

/datum/quirk/clearly_audible/add()
	quirk_holder.RemoveElement(/datum/element/smalltalk)

/datum/quirk/clearly_audible/remove()
	quirk_holder.adjust_mobsize() //ленивое добавление /datum/element/smalltalk если нужно

/datum/quirk/anti_normalizer
	name = "Невосприимчивость к нормалайзеру"
	desc = "Syntech производит устройства-нормалайзеры, подводящие параметры размера существ к человеческим. \
	По тем или иным причинам, на вас эта технология не работает, как и их size tool."
	value = 0
	mob_trait = TRAIT_BLUEMOON_ANTI_NORMALIZER
	gain_text = "<span class='notice'>В последний раз, когда вы пытались надеть нормалайзер, он не работал.</span>"
	lose_text = "<span class='notice'>Может быть стоит попробовать надеть нормалайзер и теперь он будет работать?</span>"
	medical_record_text = "Пациент обладает параметрами, которые делают его неподходящим кандидатом для нормалайзеров и части других девайсов от Syntech."

/datum/quirk/spiky
	name = "Колючий"
	desc = "Ваше тело частично или полностью покрыто острыми иглами. Любой, кто попытается вас потрогать, рискует пораниться."
	value = 0
	mob_trait = TRAIT_SPIKY
