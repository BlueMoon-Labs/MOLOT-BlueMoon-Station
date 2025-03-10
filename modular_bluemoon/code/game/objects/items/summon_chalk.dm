/obj/item/summon_chalk
	name = "summon chalk"
	desc = "A weird chalk covered in ectoplasm."
	icon = 'modular_bluemoon/Gardelin0/icons/items/qareen_chalk.dmi'
	icon_state = "chalk_pink"
	throw_speed = 3
	throw_range = 5
	w_class = WEIGHT_CLASS_TINY

/obj/item/summon_chalk/afterattack(atom/target, mob/user as mob, proximity)
	if(!proximity || !istype(target, /turf/open/floor))
		return
	if(GLOB.master_mode != "Extended")
		to_chat(user, "<span class='warning'>Unfortunately, magic does not work.</span>") //*boowomp
		return

	visible_message("<span class='notice'>[user] starts scribe some kind of runes!</span>")
	if(do_after(user, 5 SECONDS, target))
		new /obj/effect/summon_rune(target)
		qdel(src)

/obj/effect/summon_rune
	name = "Lewd summon rune"
	desc = "It is believed this rune is capable of summoning horny creatures!"
	icon = 'modular_bluemoon/Gardelin0/icons/items/qareen_chalk.dmi'
	icon_state = "rune_pink"
	light_color = LIGHT_COLOR_PINK
	var/cooldown = 0

/obj/effect/summon_rune/Initialize(mapload)
	. = ..()
	set_light(2)

/obj/effect/summon_rune/attack_hand(mob/living/carbon/M)
	if(cooldown > world.time)// ~
		to_chat(M, span_userdanger("Need to wait before new rite!"))
		return

	if(tgui_alert(M, "Do you want to attempt to summon?", "Attempt to summon?", list("Yes", "No")) != "Yes")
		return
	if(cooldown > world.time) // Двойная проверка на случай если сразу двое тыкнуть по руне
		to_chat(M, span_userdanger("Someone started the rite!"))
		return

	cooldown = world.time + 40 SECONDS

	var/list/applicants = list()	// Делаем список всех с квирком призываемого
	var/list/applicants_result = list() // Формулируем список для выбора
	for(var/mob/living/carbon/human/H in GLOB.carbon_list)
		if(!HAS_TRAIT(H, TRAIT_LEWD_SUMMON) || HAS_TRAIT(H, TRAIT_LEWD_SUMMONED))
			continue
		if(!H.client)
			continue
		applicants += H
		var/species = "[H.dna.species]"
		if(H.dna && H.dna.custom_species)
			species = "[H.dna.custom_species]"
		var/player_info
		if(H.client.prefs && H.client.prefs.summon_nickname)
			player_info += "[H.client.prefs.summon_nickname], "
		player_info += "[H.gender] [species]"
		applicants_result[initial(player_info)] = player_info

	if(!applicants_result.len)
		to_chat(M, span_userdanger("Nobody to summon!"))
	var/target_info = input("Please, select a person to summon!", "Select", null, null) as null|anything in applicants_result
	if(!target_info)
		return
	var/mob/living/carbon/human/target = applicants[applicants_result.Find(target_info)]
	if(isnull(target))
		to_chat(M, span_userdanger("Nobody to summon!"))
		return

	if(HAS_TRAIT(target, TRAIT_LEWD_SUMMONED)) // Двойная проверка на случай если призываемого уже призвали
		to_chat(M, span_userdanger("It seems that this soul has already been called by someone else!"))
		return

	var/massage_time = world.time + 1 SECONDS //Поглощаем энтропию и теорио вероятности тыкнуть энтер в момент появления
	if(tgui_alert(target, "You have been summoned! Do you want to answer?", "Do you want to answer?", list("Yes", "No")) != "Yes")
		to_chat(M, span_userdanger("It refuses to answer!"))
		return

	if(massage_time > world.time)
		if(tgui_alert(target, "Too quick! You are really want to answer?", "Do you really want to answer the summon?", list("Yes", "No")) != "Yes")
			to_chat(M, span_userdanger("It refuses to answer!"))
			return

	to_chat(M, span_lewd("Something is happening!"))
	var/old_pos = target.loc
	var/summon_nickname = "unus ex satellitibus tuis"
	if(M.client.prefs.summon_nickname)
		summon_nickname = M.client.prefs.summon_nickname
	var/phrase = pick("O magne Asmodee! Quaeso inducere [summon_nickname] ad me!", \
					  "Coniuro te, daemon luxuriae! Utinam [summon_nickname] mea vota persolvat!", \
					  "Cupidus meus ardet, magne! Amor [summon_nickname] me moveat affectus!")
	M.say(phrase)
	if(!teleport_summoned(target, src.loc, TRUE, TRUE))
		to_chat(M, span_userdanger("Something went wrong in summoning ritual!"))
		new /obj/effect/temp_visual/yellowsparkles(src.loc)
		return
	to_chat(target, span_hypnophrase("You are turning on!"))
	new /obj/effect/summon_rune/return_rune(src.loc, target, old_pos)
	qdel(src)

/obj/effect/summon_rune/proc/teleport_summoned(mob/living/carbon/target, pos_to_teleport, switch_summoned = FALSE, nude_target = TRUE)
	if(!target || !pos_to_teleport)
		return FALSE
	if(switch_summoned)
		if(HAS_TRAIT(target, TRAIT_LEWD_SUMMONED))
			REMOVE_TRAIT(target, TRAIT_LEWD_SUMMONED, TRAIT_LEWD_SUMMONED)
		else
			ADD_TRAIT(target, TRAIT_LEWD_SUMMONED, TRAIT_LEWD_SUMMONED)
			if(target.mind?.has_antag_datum(/datum/antagonist/ghost_role/ghost_cafe))
				target.ghost_cafe_traits(FALSE) // Выдаём и забираем трэйты в разных места для ситуаций ухода госта обратно домой

	playsound(loc, "modular_bluemoon/Gardelin0/sound/effect/spook.ogg", 50, 1)
	new /obj/effect/temp_visual/yellowsparkles(target.loc)
	if(nude_target)
		nuding(target)
	do_teleport(target, pos_to_teleport, channel = TELEPORT_CHANNEL_MAGIC, forced = TRUE)
	if(!HAS_TRAIT(target, TRAIT_LEWD_SUMMONED) && switch_summoned && target.mind?.has_antag_datum(/datum/antagonist/ghost_role/ghost_cafe))
		var/datum/antagonist/ghost_role/ghost_cafe/GC = target.mind?.has_antag_datum(/datum/antagonist/ghost_role/ghost_cafe)
		target.ghost_cafe_traits(TRUE, GC.adittonal_allowed_area)
	new /obj/effect/temp_visual/yellowsparkles(src.loc)
	return TRUE

/obj/effect/summon_rune/return_rune
	var/mob/living/carbon/returner
	var/return_pos

/obj/effect/summon_rune/return_rune/Initialize(mapload, mob/living/carbon/mob_to_return, var/pos_to_return)
	. = ..()
	returner = mob_to_return
	return_pos = pos_to_return
	START_PROCESSING(SSobj, src)

/obj/effect/summon_rune/return_rune/process()
	if(!returner)
		STOP_PROCESSING(SSobj, src)
		new /obj/effect/temp_visual/yellowsparkles(src)
		qdel(src)

	var/xdiff=abs(returner.x-src.x)
	var/ydiff=abs(returner.y-src.y)
	if(xdiff>=3 || ydiff>=3) // не отходим далеко от руны
		teleport_summoned(returner, src.loc, FALSE, FALSE)
	//spawn_atom_to_turf(/obj/effect/temp_visual/hierophant/telegraph/edge, src, 1, FALSE) // красивое
	//sleep(80)
	//if(QDELETED(src))
	//	return

/obj/effect/summon_rune/return_rune/attack_hand(mob/living/carbon/M)
	if(returner != M)
		return
	if(tgui_alert(M, "Do you want to attempt to return?", "Attempt to return?", list("Yes", "No")) == "Yes")
		teleport_summoned(M, return_pos, TRUE)
		returner = null
		qdel(src)

/obj/effect/summon_rune/return_rune/Destroy(force)
	. = ..()
	if(returner)
		teleport_summoned(returner, return_pos, TRUE)

/obj/effect/summon_rune/proc/nuding(mob/living/carbon/human/target)
	// Деактивируем модсьют во избежание багов
	var/obj/item/mod/control/modsuit = target.get_item_by_slot(ITEM_SLOT_BACK)
	if(modsuit && istype(modsuit) && modsuit.active)
		modsuit.toggle_activate(target, TRUE)
		modsuit.conceal(target, target.shoes)
		modsuit.conceal(target, target.wear_suit)
		modsuit.conceal(target, target.gloves)
		if(istype(target.head, /obj/item/clothing/head/mod))
			modsuit.conceal(target, target.head)
	if(target.back)
		target.dropItemToGround(target.back, TRUE)
	if(target.shoes)
		target.dropItemToGround(target.shoes, TRUE)
	if(target.gloves)
		target.dropItemToGround(target.gloves, TRUE)
	if(target.w_uniform)
		target.dropItemToGround(target.w_uniform, TRUE)
	if(target.wear_suit)
		target.dropItemToGround(target.wear_suit, TRUE)
	if(target.wear_neck)
		target.dropItemToGround(target.wear_neck, TRUE)
	if(target.head)
		target.dropItemToGround(target.head, TRUE)
