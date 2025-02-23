/obj/item/aspergillum
	name = "Holy Aspergillum"
	desc = "Древний инструмент для окропления святой водой. Да будет смыта ересь с этой станции!"
	icon = 'modular_bluemoon/icons/obj/items_and_weapons.dmi'
	icon_state = "aspergillum"
	force = 0
	throwforce = 0
	throw_speed = 2
	throw_range = 5
	w_class = WEIGHT_CLASS_SMALL
	attack_verb = list("blessed", "sprinkled with holy water", "sanctified")
	hitsound = 'sound/effects/splash.ogg'
	resistance_flags = FIRE_PROOF | UNACIDABLE | ACID_PROOF

	var/radius = 3
	var/busy = FALSE
	var/wet = FALSE
	var/water_per_use = 20
	var/water_per_transfer = 10
	var/sprinkling_delay = 8 SECONDS
	var/list/prayers = list("Exorcizo te, creatura aquæ, in nomine Dei Patris omnipotentis, et in nomine Jesu Christi, Filii ejus Domini nostri, et in virtute Spiritus Sancti",
							"Deus, qui ad salutem humani generis maxima quæque sacramenta in aquarum substantia condidisti",
							"Non illic resideat spiritus pestilens, non aura corrumpens: discedant omnes insidiæ latentis inimici",
							"Ut quidquid in domibus vel in locis fidelium hæc unda resperserit careat omni immunditia, liberetur a noxa")

/obj/item/aspergillum/examine(mob/user)
	. = ..()
	if(!user.mind?.isholy)
		. += span_warning("<hr>Вы не понимаете, как пользоваться этой вещью...")
	else
		. += span_notice("<hr>На кропиле сейчас [wet ? span_greenannounce("есть немного") : span_warning("НЕТ")] святой воды")
		. += span_notice("Чтобы освятить местность в радиусе <b>[radius] тайлов</b> вокруг, используйте кропило в руке на протяжении <b>[sprinkling_delay / 10] секунд</b>")
		. += span_notice("На одно использование уходит <b>[water_per_use] юнитов</b> святой воды. Чтобы восполнить, используйте кропило на любом контейнере, где она есть")


/obj/item/aspergillum/proc/set_wet(new_state)
	if(new_state == wet)
		return
	wet = new_state
	icon_state = wet ? "[initial(icon_state)]_w" : "[initial(icon_state)]"
	update_appearance()

/obj/item/aspergillum/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	if(!ishuman(user))
		to_chat(user, span_warning("Вы не понимаете, как этим пользоваться!"))
		return
	var/mob/living/carbon/human/chaplain = user
	if(!chaplain.mind || !chaplain.mind.isholy)
		to_chat(chaplain, span_warning("Вы не чувствуете себя достаточно [chaplain.gender == FEMALE ? "любимой" : "любимым"] высшими силами, чтобы пользоваться [src]..."))
		return
	// Опрыскиваем людей
	if(isliving(target))
		user.DelayNextAction(CLICK_CD_MELEE)
		if(wet)
			chaplain.visible_message(span_warning("[chaplain] опрыскивает [target] святой водой с помощью [src]!"))
			if(ishuman(target))
				var/mob/living/carbon/human/blessed = target
				chaplain.whisper("[pick(prayers)]")
				playsound(src, 'sound/effects/splash.ogg', 10)
				if(iscatperson(blessed) && prob(40))
					blessed.emote("hiss")
				if(prob(50))
					blessed.reagents.add_reagent(/datum/reagent/water/holywater, water_per_transfer)
					set_wet(FALSE)
				if(prob(50))
					playsound(blessed, 'sound/effects/pray.ogg', 35)
		return ..()

	// Собираем реагенты
	if(wet)
		to_chat(chaplain, span_warning("Нет нужды собирать отсюда святую воду."))
		return
	if(QDELETED(target) || !target.reagents)
		to_chat(chaplain, span_warning("Вы не можете собрать отсюда святой воды!"))
		return
	if(!target.reagents.total_volume || !target.is_drawable())
		to_chat(chaplain, span_warning("Вы не можете собрать святой воды с [target]."))
		return
	if(target.reagents.get_reagent_amount(/datum/reagent/water/holywater) < water_per_use)
		to_chat(chaplain, span_warning("В [target] слишком мало святой воды."))
		return
	target.reagents.remove_reagent(/datum/reagent/water/holywater, water_per_use)
	set_wet(TRUE)
	playsound(src, 'sound/effects/splash.ogg', 20)
	to_chat(chaplain, span_notice("Вы смачиваете [src] в [target]."))


/obj/item/aspergillum/attack_self(mob/user)
	if(!ishuman(user))
		to_chat(user, span_warning("Вы не понимаете, как этим пользоваться!"))
		return
	var/mob/living/carbon/human/chaplain = user
	if(!chaplain.mind || !chaplain.mind.isholy)
		to_chat(chaplain, span_warning("Вы не чувствуете себя достаточно [chaplain.gender == FEMALE ? "любимой" : "любимым"] высшими силами, чтобы пользоваться [src]..."))
		return
	if(!wet)
		to_chat(chaplain, span_warning("Нужно сначала смочить [src] в святой воде!"))
		return
	if(busy)
		to_chat(chaplain, span_warning("Вы уже используете [src]."))
		return
	chaplain.visible_message(span_his_grace("[chaplain] начинает окроплять всё вокруг святой водой при помощи [src]..."), span_his_grace("Вы начинаете окроплять всё вокруг святой водой при помощи [src]..."))
	busy = TRUE
	if(!do_after(chaplain, sprinkling_delay, get_turf(chaplain.loc)))
		busy = FALSE
		return

	for(var/obj/effect/rune/R in oview(radius, chaplain))
		R.invisibility = 0
	for(var/turf/T in oview(radius, chaplain))
		T.Bless()
	set_wet(FALSE)
	playsound(src, 'sound/effects/pray.ogg', 30)
	chaplain.whisper("[pick(prayers)]")
	sleep(0.5 SECONDS)
	var/list/end_prayers = list("In nomine Domini Patris", "et Filii", "et Spiritus Sancti", "Amen.")
	for(var/i = 1, i <= GLOB.cardinals.len, i++)
		chaplain.whisper("[end_prayers[i]]")
		var/blessed_turf = get_turf(get_step(chaplain.loc, GLOB.cardinals[i]))
		if(isturf(blessed_turf))
			sleep(0.5 SECONDS)
			chaplain.dir = GLOB.cardinals[i]
			chaplain.do_attack_animation(blessed_turf, ATTACK_EFFECT_BOOP, src)
			playsound(src, 'sound/effects/splash.ogg', 10)
	busy = FALSE
	. = ..()

/obj/item/aspergillum/ert
	name = "Inquisitor's Aspergillum"
	desc = "Древний инструмент для окропления святой водой, улучшенный для лучших инквизиторов Пакта, мокрый не столько от святой воды, сколько от крови еретиков. Бегите, грешники!"
	icon_state = "aspergillum_ert"
	attack_verb = list("exorcised", "sprinkled with holy water... violently", "purged of heresy")
	resistance_flags = INDESTRUCTIBLE
	water_per_transfer = 33 // Магия блюспейса
	water_per_use = 3 // Магия блюспейса
	sprinkling_delay = 3 SECONDS
	wet = TRUE
	radius = 7
	prayers = list("LET ALL HERESY BE PURGED!",
					"WITNESS HOLY LIGHT, HERETICS!",
					"BE EXPELLED, UNHOLY!",
					"IN THE NAME OF GOD!")

/obj/item/aspergillum/ert/Initialize(mapload)
	. = ..()
	RegisterSignal(src, COMSIG_ATOM_ATTACK_HAND, PROC_REF(check_hand_attack))

/obj/item/aspergillum/ert/Destroy()
	UnregisterSignal(src, COMSIG_ATOM_ATTACK_HAND)
	. = ..()

/obj/item/aspergillum/ert/proc/check_hand_attack(datum/source, mob/user)
	if(istype(user, /mob/living/simple_animal/drone/cogscarab))
		to_chat(user, span_cultlarge("[src] защищается от вашей попытки его подобрать!"))
		return COMPONENT_NO_ATTACK_HAND

/obj/item/aspergillum/ert/proc/check_unholy(atom/target)
	if(!isliving(target))
		return FALSE
	var/mob/living/livingmob = target
	if(livingmob.mind && (livingmob.mind.has_antag_datum(/datum/antagonist/heretic) || livingmob.mind?.has_antag_datum(/datum/antagonist/bloodsucker) || livingmob.mind?.has_antag_datum(/datum/antagonist/devil)))
		return TRUE
	if(is_servant_of_ratvar(livingmob) || iscultist(livingmob) || isconstruct(livingmob) || isclockmob(livingmob))
		return TRUE
	if(istype(livingmob, /mob/living/simple_animal/hostile/clockwork) || istype(livingmob, /mob/living/simple_animal/drone/cogscarab))
		return TRUE
	if(istype(livingmob, /mob/living/simple_animal/hostile/clockcultistmelee) || istype(livingmob, /mob/living/simple_animal/hostile/clockcultistranged))
		return TRUE
	return FALSE

/obj/item/aspergillum/ert/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	if(check_unholy(target))
		var/mob/living/heretic = target
		heretic.adjustStaminaLoss(25, TRUE)
		if(istype(heretic, /mob/living/simple_animal))
			heretic.apply_damage(20, BRUTE)
		else if(wet && ishuman(heretic) && prob(33))
			heretic.reagents.add_reagent(/datum/reagent/water/holywater, water_per_transfer)
			set_wet(FALSE)
		user.say("[pick(prayers)]")
		to_chat(heretic, span_cultbold("Святая энергия жжёт вас!"))
		user.DelayNextAction(CLICK_CD_MELEE)
		return
	. = ..()

/obj/item/aspergillum/ert/examine(mob/user)
	. = ..()
	var/can_read_unholy = isobserver(user) || check_unholy(user)
	if(can_read_unholy)
		. += span_cultbold("<hr>Эта вещь наполнена святой энергией! Подбирать такую кому-то из грешников было бы очень неблагоразумно!")

/obj/item/aspergillum/ert/can_be_pulled(user, grab_state, force)
	. = ..()
	if(!.)
		return FALSE
	if(check_unholy(user))
		if(ishuman(user))
			var/mob/living/carbon/human/pickuper = user
			pickuper.Dizzy(5 SECONDS)
			pickuper.Confused(10 SECONDS)
			pickuper.Stun(3 SECONDS)
			pickuper.blur_eyes(7)
			pickuper.adjustStaminaLoss(25, TRUE)
			pickuper.adjustOrganLoss(ORGAN_SLOT_BRAIN, 10, 100)
			pickuper.drop_all_held_items()
			to_chat(pickuper, span_userdanger("Священная энергия пробегает по вашим венам!"))
			pickuper.emote("shiver")
			playsound(pickuper,'sound/hallucinations/veryfar_noise.ogg', 40)
			return FALSE
		else
			var/mob/living/sufferer = user
			sufferer.apply_damage(15, BRUTE)
			playsound(sufferer,'sound/hallucinations/veryfar_noise.ogg', 10)
			to_chat(sufferer, span_cultlarge("[src] защищается от вашей попытки его утащить!"))
			return FALSE

/obj/item/aspergillum/ert/pickup(mob/living/user)
	if(!ishuman(user))
		to_chat(user, span_warning("Вы не можете поднять эту вещь!"))
		return
	var/mob/living/carbon/human/pickuper = user
	if(check_unholy(user))
		pickuper.Confused(10 SECONDS)
		pickuper.Stun(5 SECONDS)
		pickuper.blur_eyes(7)
		pickuper.adjustStaminaLoss(30)
		pickuper.adjustOrganLoss(ORGAN_SLOT_BRAIN, 10, 100)
		pickuper.drop_all_held_items()
		to_chat(pickuper, span_userdanger("Священная энергия пробегает по вашим венам!"))
		pickuper.emote("shiver")
		playsound(pickuper,'sound/hallucinations/veryfar_noise.ogg', 40)
		return
	. = ..()

