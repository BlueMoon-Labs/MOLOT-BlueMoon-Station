/**
 * Данный антаг был вдоховлен игрою "Hatred" (2015).
 *
 * Антаг будет находиться в бета тесте неопределенное время в зависимости от того, смогу ли я "ловить моменты" появления антага в раунде и наблюдать за ним,
 * а также наличия конструктивного фидбека игроков.
 *
 * Краткое пояснение концепта антага и игромеханических решений:
 * 		Концепт: мажорный мидраунд антаг для медиум/хард динамика с целью моментального массового ПВП пиздореза. Почти как Lone Operative, но этот не должен
 * взрывать нюку и завершать раунд. Минимум манча и времени на разогрев. Только при существенном онлайне и с достаточным количеством живых офицеров СБ.
 * 		Хил от убийства других игроков: как и в оригинальной игре персонаж восстанавливает здоровье от кинематографичных убийств (glory kills) и это является
 * единственным способом востановить здоровье. Я полагаю и в сске оно будет выглядеть уместно и вполне сбалансированно. Игроку для восстановления
 * здоровья необходимо заставить живую цель не двигаться около 10 секунд и убить её выстрелом вплотную для восстановления здоровья. Тем самым мы снижаем
 * градус ахуевания антага и заставляем его делать передышики и играть аккуратнее, ведь он один, всегда уязвим и не может прятаться в космосе или вне станции,
 * как делает абсолютное большинство антагов.
 * 		Калаш с бесконечными патронами: в оригинальной игре это раундстарт каноничное оружие. По локации разбросана куча других оружий,
 * а также оружие щедро падает с бесконечных волн полицейских. Но в сске у нас ограниченное количество СБ, поэтому рано или поздно антаг пойдет манчить
 * себе оружие. Этот антаг создан для пиздореза, а не получасового манча оружейки, поэтому я хочу свести к минимуму любой существенный манч.
 * 		"Прикрученное намертво" снаряжение: всё минимально необходимое снаряжение намертво прикручено к персонажу. Оно хорошо сбалансированно
 * для ведения продолжительных пвп битв, но не является читами и накладывает массу ограничений, поэтому при возможности игрок скинул бы свое снаряжение и
 * взял бы что-то более мощное, убийственное или полезное, например МОДсьюты или хардсьюты ЕРТшников, но я ему не позволю, ибо как сказано в предыдущем
 * пункте: это антаг не для манча, а для моментального пиздореза.
 * 		Разгрузка с гранатами в обмен на сердца: это уже моя "отсебятина", такого в оригинальной игре нет. Очень спорная штука и она является первой
 * на очереди к нерфу, если антаг мне покажется излишне сильным. На этапе раннего бета тестирования будет отключена.
 *
 * Если будет востребованно, то я возможно сделаю:
 * 		- Антаг худ (квадратик над персонажем с иконкой роли)
 * 		- Спрайты для уникального шмота.
 * 		- Счетчик убийств и вывод его в итоги раунда (здесь мне нужна помощь, я не знаю, как считать сочные фраги).
 * 			- минимум убийств для получения гринтекста.
 * 			- порог убийств для самостоятельного вывода антага из раунда (если перебил пол станции).
 * 			- события после определенного кол-ва убийств.
 * 		- Разработка механа эффектного добивания ножом.
 * 		- Прибытие антага с шаттла карго.
 * 		- Больше QOL фич, если у меня или других игроков будут хорошие и выполнимые идеи.
 */

/datum/mind/proc/make_MassShooter()
	if(!has_antag_datum(/datum/antagonist/hatred))
		special_role = "Mass Shooter"
		assigned_role = "Mass Shooter"
		add_antag_datum(/datum/antagonist/hatred)

/datum/antagonist/hatred
	name = "Mass Shooter"
	roundend_category = "mass shooter"
	antagpanel_category = "Mass Shooter"
	job_rank = ROLE_OPERATIVE
	threat = 10
	// antag_hud_type = ANTAG_HUD_WIZ // TO BE ADDED
	// antag_hud_name = "wizard"
	antag_moodlet = /datum/mood_event/focused
	// ui_name = "AntagInfoWizard"
	suicide_cry = "I REGRET NOTHING."
	show_to_ghosts = TRUE
	can_coexist_with_others = FALSE
	// reminded_times_left = 1 // BLUEMOON ADD - 1 напоминания достаточно
	var/list/allowed_z_levels = list()
	/**
	 * Level of available gear is determined by a number of alive security officers and blueshields.
	 * 0 = low guns: a pistol or double barrel shotgun. NOT IMPLEMENTED YET!
	 * 1 = default classic and serious guns: AK-47 or riot shotgun
	 * 2 = ROBUST gear: +armor or +cursed belt |||| +fast executions + +1 life on low gear
	 */
	var/gear_level = 1
	var/static/list/low_guns = list("Pistol", "Double-barreled shotgun") // NOT IMPLEMENTED YET!
	var/static/list/classic_guns = list("AK47","Riot Shotgun")
	// there won't be special level 2 guns, because I don't want antag to have cheat guns. Level 2 gear is always better stats/traits for level 1 gear.
	var/static/list/high_gear = list("Belt of Hatred", "More armor")
	var/chosen_gun = null
	var/chosen_high_gear = null

/datum/antagonist/hatred/greet()
	playsound(owner.current, pick('modular_bluemoon/code/modules/antagonists/hatred/hatred_begin_1.ogg', \
									'modular_bluemoon/code/modules/antagonists/hatred/hatred_begin_2.ogg', \
									'modular_bluemoon/code/modules/antagonists/hatred/hatred_begin_3.ogg'), vol = 50, vary = FALSE, ignore_walls = FALSE)
	var/greet_text
	greet_text += "Ты - [span_red(span_bold("Безымянный Убийца"))]. Твое прошлое совершенно неважно, и даже если оно было, оно было незавидным.<br>"
	greet_text += "Ты испытываешь непреодолимую ненависть, отвращение и презрение ко всем окружающим.<br>"
	greet_text += "У тебя лишь две цели: <u>убивать</u> и <u>умереть славной смертью</u>.<br>"
	greet_text += "Твое проклятое снаряжение неразлучно с тобою и подстегивает тебя продолжать соврешать геноцид беззащитных гражданских.<br>"
	greet_text += "Твоё [span_red("Оружие Ненависти")] и неутолимая жажда убивать вознаграждают тебя, ибо завершающий выстрел в упор в голову (рот) исцеляет твои раны. Обычная медицина бессильна.<br>"
	greet_text += "[span_red("Cумка для патронов")] сама пополняет пустые магазины/картриджи/клипсы. Никогда не выбрасывай их!<br>"
	if(chosen_high_gear == "Belt of Hatred")
		greet_text += "[span_red("Пояс с гранатами")] пожирает сердца твоих жертв и вознаграждает тебя новой взрывоопасной аммуницией.<br>"
	greet_text += "[span_red(span_bold("Убивай и будь убит!"))] Ибо никто сегодня не защищен от твоей Ненависти.<br>"
	to_chat(owner.current, greet_text)
	antag_memory = greet_text
	owner.announce_objectives()

/datum/antagonist/hatred/on_gain()
	var/mob/living/carbon/human/H = owner.current
	if(!istype(H))
		return
	// randomize_human(H)
	make_authentic_body()
	evaluate_security()
	forge_objectives()
	H.equipOutfit(/datum/outfit/hatred)
	. = ..()
	// ADD_TRAIT(H, TRAIT_STUNIMMUNE, "hatred") // Doesn't work against stunbatons anyway :(
	ADD_TRAIT(H, TRAIT_SLEEPIMMUNE, "hatred") // I challenge you to a glorious fight!
	ADD_TRAIT(H, TRAIT_VIRUSIMMUNE, "hatred")
	ADD_TRAIT(H, TRAIT_NONATURALHEAL, "hatred")
	ADD_TRAIT(H, TRAIT_IGNOREDAMAGESLOWDOWN, "hatred")
	ADD_TRAIT(H, TRAIT_FEARLESS, "hatred")
	ADD_TRAIT(H, TRAIT_STRONG_GRABBER, "hatred") // This way player will have less problems with his targets run/crawl away during glory kills
	ADD_TRAIT(H, TRAIT_QUICKER_CARRY, "hatred")
	ADD_TRAIT(H, TRAIT_NIGHT_VISION, "hatred")
	appear_on_station()
	allowed_z_levels += SSmapping.levels_by_trait(ZTRAIT_CENTCOM)
	allowed_z_levels += SSmapping.levels_by_trait(ZTRAIT_RESERVED)
	allowed_z_levels += SSmapping.levels_by_trait(ZTRAIT_STATION)
	RegisterSignal(H, COMSIG_LIVING_LIFE, PROC_REF(check_hatred_off_station)) // almost like anchor implant, but doesn't hurt
	addtimer(CALLBACK(src, PROC_REF(alarm_station)), 10 SECONDS, TIMER_DELETE_ME) // Give a player a moment to understand what's going on.

/datum/antagonist/hatred/proc/evaluate_security()
	var/security_alive = length(SSjob.get_living_sec())
	for(var/mob/living/carbon/human/player in GLOB.carbon_list)
		if(player.client && player.stat != DEAD && player.mind && (player.mind.assigned_role in list("Blueshield")))
			security_alive++
	// if(GLOB.security_level == SEC_LEVEL_GREEN) // разбавляем эксту внутривенно (GC)
	// 	security_alive++
	switch(security_alive)
		// if(-INFINITY to 4)
		// 	gear_level = 0
		if(-INFINITY to 5) 	// 4(GC)-5
			gear_level = 1
		if(6 to INFINITY) 	// 6+
			gear_level = 2

/datum/antagonist/hatred/proc/make_authentic_body()
	var/mob/living/carbon/human/H = owner.current
	H.real_name = "The Man without a name"
	H.set_species(/datum/species/human)
	H.set_gender(MALE, TRUE, forced = TRUE)
	H.dna.remove_all_mutations()
	H.skin_tone = "albino"
	//H.hair_style = Curtains diagonal_bangs sunny vivi #000000 "Bonnie"
	H.hair_style = "Curtains"
	H.hair_color = sanitize_hexcolor("#000000")
	H.facial_hair_style = "Beard (3 o\'Clock)" //"Shaved"
	H.facial_hair_color = sanitize_hexcolor("#000000")
	H.set_bark("growl2")
	H.vocal_speed = 8
	H.vocal_pitch = 0.6
	H.vocal_pitch_range = 0.3
	H.dna.update_ui_block(DNA_GENDER_BLOCK)
	H.dna.update_ui_block(DNA_SKIN_TONE_BLOCK)
	H.dna.update_ui_block(DNA_HAIR_STYLE_BLOCK)
	H.dna.update_ui_block(DNA_HAIR_COLOR_BLOCK)
	H.dna.update_ui_block(DNA_FACIAL_HAIR_STYLE_BLOCK)
	H.dna.update_ui_block(DNA_FACIAL_HAIR_COLOR_BLOCK)
	H.dna.features["legs"] = "Plantigrade"
	H.dna.species.mutant_bodyparts["legs"] = "Plantigrade"
	H.Digitigrade_Leg_Swap(TRUE)
	H.update_body()
	H.update_hair()

/datum/antagonist/hatred/proc/forge_objectives()
	var/datum/objective/O = new /datum/objective/genocide()
	O.owner = owner
	objectives += O
	O = new /datum/objective/martyr()
	O.owner = owner
	objectives += O

/datum/antagonist/hatred/proc/appear_on_station()
	var/list/possible_spawns = list()
	possible_spawns += get_safe_random_station_turf(typesof(/area/command/gateway))
	possible_spawns += get_safe_random_station_turf(typesof(/area/command/teleporter))
	// possible_spawns += get_safe_random_station_turf(typesof(/area/cargo/storage)) // for debug at Runtime Station
	for(var/turf/X in GLOB.xeno_spawn) //Some xeno spawns are in some spots that will instantly kill human, like atmos
		if(istype(X.loc, /area/maintenance))
			possible_spawns += X
	listclearnulls(possible_spawns)
	var/turf/chosen_spawn
	if(!isemptylist(possible_spawns))
		chosen_spawn = pick(possible_spawns)
	else
		chosen_spawn = find_safe_turf(extended_safety_checks = TRUE, dense_atoms = FALSE) // in case of some huge map problems
	owner.current.forceMove(chosen_spawn)
	do_sparks(4, TRUE, owner.current)

/datum/antagonist/hatred/proc/check_hatred_off_station()
	SIGNAL_HANDLER
	var/turf/my_location = get_turf(owner.current)
	if(!(my_location.z in allowed_z_levels))
		to_chat(owner.current, span_userdanger("Так просто они от меня не избавятся..."))
		appear_on_station()

/datum/antagonist/hatred/proc/alarm_station() // major antag is currently commencing genocide, so we must let everyone know.
	if(istype(src) && owner?.current)
		var/chosen_sound = pick('modular_bluemoon/code/modules/antagonists/hatred/hatred_spawned_1.ogg','modular_bluemoon/code/modules/antagonists/hatred/hatred_spawned_2.ogg')
		priority_announce("На ваш объект ворвался особо опасный вооруженный преступник с целью массового убийства гражданских лиц. \
							Нейтрализуйте угрозу любыми доступными средствами. \
							ЦК санкционирует всему персоналу станции против данной цели: использование летального вооружения, открытие огня без предупреждения и казнь на месте. \
							Особые приметы: мужчина в длинном черном кожаном пальто с длинными черными волосами и [chosen_gun].", \
							"ALERT: MASS SHOOTER!", chosen_sound, has_important_message = TRUE)

/datum/antagonist/hatred/on_removal()
	var/mob/living/L = owner.current
	UnregisterSignal(L, COMSIG_LIVING_LIFE)
	. = ..()
	if(istype(L))
		to_chat(L, span_userdanger("As Hatred leaves your mind, it consumes you completely..."))
		L.dust() // from ghosts we come, to ghosts we leave.

/datum/objective/genocide
	name = "Genocide of civilians"
	explanation_text = "Убей столько народу, сколько успеешь за свою короткую оставшуюся жизнь. Не щади никого. Кровь слабых питает тебя."
	martyr_compatible = TRUE
	completed = TRUE // i have no idea how to count your personal kills.
	// completable = FALSE

/obj/item/gun/handle_suicide(mob/living/carbon/human/user, mob/living/carbon/human/target, params, bypass_timer, time_to_kill = 12 SECONDS)
	if(!user.mind.has_antag_datum(/datum/antagonist/hatred))
		return ..()
	var/is_glory = TRUE
	if(target?.stat == DEAD || !target.client) // already dead bodies or npcs don't count
		is_glory = FALSE
	. = ..(user, target, params, bypass_timer, time_to_kill = 8 SECONDS)
	if(!. || user == target || !is_glory)
		return
	addtimer(CALLBACK(src, PROC_REF(check_glory_kill), user, target), 1 SECONDS, TIMER_DELETE_ME) // wait for boolet to do its job

/obj/item/gun/proc/check_glory_kill(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(QDELETED(target) || target?.stat == DEAD)
		user.fully_heal(TRUE) // the only way of healing
		// user.do_adrenaline(150, TRUE, 0, 0, TRUE, list(/datum/reagent/medicine/inaprovaline = 10, /datum/reagent/medicine/synaptizine = 15, /datum/reagent/medicine/regen_jelly = 20, /datum/reagent/medicine/stimulants = 20), "<span class='boldnotice'>You feel a sudden surge of energy!</span>")
		user.visible_message("As blood splashes onto [src], it starts glowing menacingly and its wielder seemingly regaining their strength and vitality.")
		to_chat(user, span_notice("The blood of the weak gives you an inhuman relief and strength to continue the massacre."))
		var/obj/item/storage/belt/military/assault/hatred/B = user.get_item_by_slot(ITEM_SLOT_BELT)
		if(istype(B))
			to_chat(user, span_notice("[B.name] hungrily growls in anticipation of the coming sacrifice."))
			B.glory_points++

/// THE GUN OF HATRED ///

/obj/item/gun/ballistic/automatic/ak47/hatred
	name = "\improper AK-47 rifle of Hatred"
	desc = "The scratches on this rifle say: \"The Genocide Machine\"."
	resistance_flags = FIRE_PROOF | ACID_PROOF
	var/mob/living/carbon/human/original_wielder = null

/obj/item/gun/ballistic/automatic/ak47/hatred/Destroy()
	if(!isnull(original_wielder))
		UnregisterSignal(original_wielder, COMSIG_MOB_DEATH)
	. = ..()

/obj/item/gun/ballistic/automatic/ak47/hatred/examine(mob/user)
	. = ..()
	if(HAS_TRAIT(src, TRAIT_NODROP))
		. += span_danger("You cannot make your fingers drop this weapon of Doom.")

/obj/item/gun/ballistic/automatic/ak47/hatred/equipped(mob/living/user, slot)
	. = ..()
	if(isnull(original_wielder))
		original_wielder = user
		RegisterSignal(original_wielder, COMSIG_MOB_DEATH, PROC_REF(on_wielder_death))
	if(original_wielder == user)
		ADD_TRAIT(src, TRAIT_NODROP, "hatred")

/obj/item/gun/ballistic/automatic/ak47/hatred/proc/on_wielder_death()
	SIGNAL_HANDLER
	if(!QDELETED(src))
		var/obj/item/I = new /obj/item/gun/ballistic/automatic/ak47(get_turf(src))
		I.name = "\improper AK-47 rifle of Faded Hatred"
		I.desc = "It looks less menacing than before. The blood stained scratches on this rifle say: \"The Genocide Machine\"."
		qdel(src)

/obj/item/gun/ballistic/automatic/ak47/hatred/dropped(mob/user, silent)
	. = ..()
	if(!QDELETED(src))
		if(user == original_wielder) // lost arm
			REMOVE_TRAIT(src, TRAIT_NODROP, "hatred")

/// THE SHOTGUN OF HATRED ///

/obj/item/gun/ballistic/shotgun/riot/hatred
	name = "\improper Riot Shotgun of Hatred"
	desc = "The scratches on this shotgun say: \"The Bringer of Doom\"."
	mag_type = /obj/item/ammo_box/magazine/internal/shot/com // has same stats as an original riot, but this has lethal ammo from the start
	resistance_flags = FIRE_PROOF | ACID_PROOF
	var/mob/living/carbon/human/original_wielder = null

/obj/item/gun/ballistic/shotgun/riot/hatred/Destroy()
	if(!isnull(original_wielder))
		UnregisterSignal(original_wielder, COMSIG_MOB_DEATH)
	. = ..()

/obj/item/gun/ballistic/shotgun/riot/hatred/examine(mob/user)
	. = ..()
	. += span_notice("[span_bold("Ctrl-Shift-Click")] to quickly empty [src].")
	if(HAS_TRAIT(src, TRAIT_NODROP))
		. += span_danger("You cannot make your fingers drop this weapon of Doom.")

/obj/item/gun/ballistic/shotgun/riot/hatred/CtrlShiftClick(mob/living/carbon/human/user)
	pump(user, TRUE)
	while(chambered)
		stoplag(3)
		pump(user, TRUE)

/obj/item/gun/ballistic/shotgun/riot/hatred/equipped(mob/living/user, slot)
	. = ..()
	if(isnull(original_wielder))
		original_wielder = user
		RegisterSignal(original_wielder, COMSIG_MOB_DEATH, PROC_REF(on_wielder_death))
	if(original_wielder == user)
		ADD_TRAIT(src, TRAIT_NODROP, "hatred")

/obj/item/gun/ballistic/shotgun/riot/hatred/proc/on_wielder_death()
	SIGNAL_HANDLER
	if(!QDELETED(src))
		var/obj/item/I = new /obj/item/gun/ballistic/shotgun/riot(get_turf(src))
		I.name = "\improper Riot Shotgun of Faded Hatred"
		I.desc = "It looks less menacing than before. The blood stained scratches on this shotgun say: \"The Bringer of Doom\"."
		qdel(src)

/obj/item/gun/ballistic/shotgun/riot/hatred/dropped(mob/user, silent)
	. = ..()
	if(!QDELETED(src))
		if(user == original_wielder) // lost arm
			REMOVE_TRAIT(src, TRAIT_NODROP, "hatred")

/// THE POUCH OF HATRED ///

/obj/item/storage/bag/ammo/hatred
	name = "\improper Ammo pouch of Hatred"
	desc = "The cursed pouch with infinite bullets encourage you to relentlessly continue your atrocities against humanity. What a miracle and delight for your Genocide Machines."
	// var/gun_type = "" // is needed if I impliment new ways of magically creating ammo in this pocket for different gun types

/obj/item/storage/bag/ammo/hatred/examine(mob/user)
	. = ..()
	// switch(gun_type)
	// 	if("AK47")
	. += "If you place an empty magazine/clip into this phenomenal pouch next time you check it will be filled with bullets."
	. += span_notice("[span_bold("Alt-Click")] to open.")
	. += span_notice("Once you lose this item it will turn into dust.")

/obj/item/storage/bag/ammo/hatred/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.attack_hand_interact = FALSE
	// STR.quickdraw = TRUE

/obj/item/storage/bag/ammo/hatred/Entered(atom/movable/AM, atom/oldLoc)
	. = ..()
	// switch(gun_type)
	// 	if("AK47")
	var/M = AM.type
	qdel(AM)
	new M(src)

// /obj/item/storage/bag/ammo/hatred/Exited(atom/movable/AM, atom/newLoc)
// 	. = ..()
// 	switch(gun_type)
// 		if("Riot Shotgun")
// 			var/M = AM.type
// 			new M(src)

// TRAIT_NODROP doesn't work on items in pockets T_T
/obj/item/storage/bag/ammo/hatred/MouseDrop(atom/over, src_location, over_location, src_control, over_control, params)

/obj/item/storage/bag/ammo/hatred/equipped(mob/user, slot, initial)
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, "hatred")

/obj/item/storage/bag/ammo/hatred/dropped(mob/user, silent)
	. = ..()
	if(!QDELETED(src))
		visible_message("[src] рассыпается в прах на ваших глазах...")
		qdel(src)

/// THE BELT OF HATRED ///

/obj/item/storage/belt/military/assault/hatred
	name = "\improper Belt of Hatred"
	desc = "The cursed belt eagerly devours hearts of your victims and supplies you with new deadly explosives."
	resistance_flags = FIRE_PROOF | ACID_PROOF
	var/glory_points = 0

/obj/item/storage/belt/military/assault/hatred/examine(mob/user)
	. = ..()
	. += "If you place a heart into this phenomenal belt next time you check there will be no heart but a deadly explosive."
	. += span_notice("[src] is ready to accept [span_bold("[glory_points]")] hearts. Get more Glory Kills to make it accept more.")
	. += span_notice("Once you lose this item it will turn into dust.")

/obj/item/storage/belt/military/assault/hatred/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 3

/obj/item/storage/belt/military/assault/hatred/Entered(atom/movable/AM, atom/oldLoc)
	. = ..()
	if(istype(AM, /obj/item/organ/heart) && glory_points)
		glory_points--
		qdel(AM)
		if(prob(50))
			new /obj/item/grenade/syndieminibomb/concussion(src)
		else
			new /obj/item/grenade/frag(src)

/obj/item/storage/belt/military/assault/hatred/equipped(mob/user, slot, initial)
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, "hatred")

/obj/item/storage/belt/military/assault/hatred/dropped(mob/user, silent)
	. = ..()
	if(!QDELETED(src))
		visible_message("[src] рассыпается в прах на ваших глазах...")
		qdel(src)

/// THE OVERCOAT OF HATRED ///

/obj/item/clothing/suit/jacket/leather/overcoat/hatred
	name = "leather overcoat of Hatred"
	desc = "The shabby leather overcoat with decent armor paddings. Once it has been splashed with blood you can't take it off anymore."
	// clueless armor stats. A bit worse than red ert hardsuit and other types of hardsuits. decent versatile armor.
	armor = list(MELEE = 40, BULLET = 40, LASER = 40, ENERGY = 40, BOMB = 40, BIO = 40, RAD = 10, FIRE = 70, ACID = 70, WOUND = 40)
	resistance_flags = FIRE_PROOF

/obj/item/clothing/suit/jacket/leather/overcoat/hatred/equipped(mob/user, slot)
	. = ..()
	if(slot == ITEM_SLOT_OCLOTHING)
		ADD_TRAIT(src, TRAIT_NODROP, "hatred")

/obj/item/clothing/suit/jacket/leather/overcoat/hatred/dropped(mob/user)
	. = ..()
	if(!QDELETED(src))
		REMOVE_TRAIT(src, TRAIT_NODROP, "hatred")

/obj/item/clothing/head/invisihat/hatred
	name = "Veil of Hatred"
	desc = "Once you felt <b><i>that</i></b> urge to commit relentless genocide of civilians, you clearly understood you were cursed... blessed... and... protected by invisible spirit of Hatred."
	// clueless armor stats. A bit worse than red ert hardsuit and other types of hardsuits. decent versatile armor.
	armor = list(MELEE = 40, BULLET = 40, LASER = 40, ENERGY = 40, BOMB = 40, BIO = 40, RAD = 10, FIRE = 70, ACID = 70, WOUND = 40)
	resistance_flags = FIRE_PROOF

/obj/item/clothing/head/invisihat/hatred/equipped(mob/user, slot)
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, "hatred")

/obj/item/clothing/head/invisihat/hatred/dropped(mob/user)
	. = ..()
	if(!QDELETED(src))
		visible_message("[src] рассыпается в прах на ваших глазах...")
		qdel(src)

/// OUTFIT ///
/// defult gear. will be changed during pre_equip().
/datum/outfit/hatred
	name = "Hatred"
	head = /obj/item/clothing/head/invisihat/hatred
	// glasses = /obj/item/clothing/glasses/sunglasses
	glasses = /obj/item/clothing/glasses/hud/health/sunglasses/aviators // to help player identify when a target is in crit so player can safely execute him
	uniform = /obj/item/clothing/under/rank/civilian/util/greyshirt
	suit = /obj/item/clothing/suit/jacket/leather/overcoat/hatred
	gloves = /obj/item/clothing/gloves/tackler/combat/insulated
	shoes = /obj/item/clothing/shoes/jackboots/tall_default
	id = /obj/item/card/id/stowaway_stolen
	l_pocket = /obj/item/storage/bag/ammo/hatred
	r_pocket = /obj/item/flashlight/seclite
	belt = /obj/item/storage/belt/military/assault
	back = /obj/item/storage/backpack/rucksack
	backpack_contents = list(/obj/item/storage/box/survival/engineer = 1,
		/obj/item/kitchen/knife/combat = 1,
		/obj/item/sensor_device = 1,
		/obj/item/crowbar = 1
		)
	r_hand = /obj/item/gun/ballistic/automatic/ak47/hatred
	// implants = list(/obj/item/implant/explosive, /obj/item/implant/anchor) // post_equip() doesn't work for implants since implanting occurs afrer post_equip()

/datum/outfit/hatred/pre_equip(mob/living/carbon/human/H, visualsOnly, client/preference_source)
	var/datum/antagonist/hatred/Ha = H.mind?.has_antag_datum(/datum/antagonist/hatred)
	if(!Ha)
		return
	// Ha.gear_level = tgui_input_list(H, "ЭТО ОКОШКО ДЛЯ ОБМАНА ПОДСЧЕТА ОФИЦЕРОВ В РАУНДЕ И НУЖНО ТОЛЬКО ДЛЯ ДЕБАГА, В ИГРЕ ЕГО НЕ БУДЕТ", "gear level?", list(1, 2), 1)
	var/available_sets = Ha.classic_guns
	// switch(Ha.gear_level) // 1 is default
	// 	if(0)
	// 		available_sets = Ha.low_guns
	// 	if(1 to 2)
	// 		available_sets = Ha.classic_guns
	SEND_SOUND(H, 'sound/misc/notice2.ogg')
	Ha.chosen_gun = tgui_input_list(H, "Выбери стартовое оружие и сделай это БЫСТРО!", "Выбери оружие геноцида", available_sets, available_sets[1], 10 SECONDS)
	switch(Ha.chosen_gun)
		if(null)
			Ha.chosen_gun = "AK47"
			r_hand = /obj/item/gun/ballistic/automatic/ak47/hatred
		if("AK47")
			r_hand = /obj/item/gun/ballistic/automatic/ak47/hatred
		if("Riot Shotgun")
			r_hand = /obj/item/gun/ballistic/shotgun/riot/hatred
	if(Ha.gear_level == 2)
		Ha.chosen_high_gear = tgui_input_list(H, "Выбери дополнительную экипировку и сделай это БЫСТРО!", "Выбери оружие геноцида", Ha.high_gear, Ha.high_gear[1], 10 SECONDS)
		switch(Ha.chosen_high_gear)
			if(null)
				Ha.chosen_high_gear = "Belt of Hatred"
				belt = /obj/item/storage/belt/military/assault/hatred
			if("Belt of Hatred")
				belt = /obj/item/storage/belt/military/assault/hatred

/datum/outfit/hatred/post_equip(mob/living/carbon/human/H, visualsOnly, client/preference_source)
	var/obj/item/implant/explosive/E = new
	E.implant(H)
	var/obj/item/clothing/under/U = H.get_item_by_slot(ITEM_SLOT_ICLOTHING)
	U.has_sensor = NO_SENSORS
	ADD_TRAIT(U, TRAIT_NODROP, "hatred")

	var/obj/item/I = H.get_item_by_slot(ITEM_SLOT_FEET)
	I.resistance_flags = FIRE_PROOF

	I = H.get_item_by_slot(ITEM_SLOT_EYES)
	I.resistance_flags = FIRE_PROOF

	I = H.get_item_by_slot(ITEM_SLOT_GLOVES)
	I.resistance_flags = FIRE_PROOF

	I = H.get_item_by_slot(ITEM_SLOT_BACK)
	I.resistance_flags = FIRE_PROOF

	var/obj/item/storage/belt/B = H.get_item_by_slot(ITEM_SLOT_BELT)
	new /obj/item/grenade/syndieminibomb/concussion(B)
	new /obj/item/grenade/frag(B)
	new /obj/item/grenade/frag(B)

	var/obj/item/storage/bag/ammo/hatred/P = H.get_item_by_slot(ITEM_SLOT_LPOCKET)
	var/datum/component/storage/STR = P.GetComponent(/datum/component/storage)
	var/datum/antagonist/hatred/Ha = H.mind?.has_antag_datum(/datum/antagonist/hatred)
	if(!Ha)
		return
	// P.gun_type = Ha.chosen_gun
	switch(Ha.chosen_gun)
		// if("Pistol")
		// 	STR.can_hold = typecacheof(list(/obj/item/ammo_box/magazine/e45))
		// 	new /obj/item/ammo_box/magazine/e45/lethal(P)
		// 	new /obj/item/ammo_box/magazine/e45/lethal(P)
		// 	new /obj/item/ammo_box/magazine/e45/lethal(P)
		if("AK47")
			STR.can_hold = typecacheof(list(/obj/item/ammo_box/magazine/ak47))
			new /obj/item/ammo_box/magazine/ak47(P)
			new /obj/item/ammo_box/magazine/ak47(P)
		if("Riot Shotgun")
			STR.can_hold = typecacheof(list(/obj/item/ammo_box/shotgun/loaded))
			new /obj/item/ammo_box/shotgun/loaded/buckshot(P)
			new /obj/item/ammo_box/shotgun/loaded(P)
			new /obj/item/ammo_box/shotgun/loaded/incendiary(P)
			// new /obj/item/ammo_casing/shotgun/dragonsbreath(P)

	switch(Ha.chosen_high_gear)
		if("More armor")
			var/obj/item/clothing/C = H.get_item_by_slot(ITEM_SLOT_OCLOTHING)
			// initial = 	list(MELEE = 40, BULLET = 40, LASER = 40, ENERGY = 40, BOMB = 40, BIO = 40, RAD = 10, FIRE = 70, ACID = 70, WOUND = 40)
			// 				list(MELEE = 60, BULLET = 60, LASER = 60, ENERGY = 60, BOMB = 60, BIO = 40, RAD = 30, FIRE = 90, ACID = 90, WOUND = 60)
			C.armor = C.armor.setRating(MELEE = 60, BULLET = 60, LASER = 60, ENERGY = 60, BOMB = 60, BIO = 40, RAD = 30, FIRE = 90, ACID = 90, WOUND = 60)
			C = H.get_item_by_slot(ITEM_SLOT_HEAD)
			C.armor = C.armor.setRating(MELEE = 60, BULLET = 60, LASER = 60, ENERGY = 60, BOMB = 60, BIO = 40, RAD = 30, FIRE = 90, ACID = 90, WOUND = 60)

/// DYNAMIC THINGS ///

/datum/dynamic_ruleset/midround/from_ghosts/hatred
	name = "Mass Shooter"
	antag_datum = /datum/antagonist/hatred
	antag_flag = "Mass Shooter"
	antag_flag_override = ROLE_OPERATIVE
	// enemy_roles = list("Blueshield", "Peacekeeper", "Brig Physician", "Security Officer", "Warden", "Detective", "Head of Security","Bridge Officer", "Captain")
	// required_enemies = list(0,0,0,0,5,5,4,4,3,0)
	required_round_type = list(ROUNDTYPE_DYNAMIC_HARD, ROUNDTYPE_DYNAMIC_MEDIUM)
	required_candidates = 1
	weight = 9 // будет 7 или 8, так как этот антаг имеет высокие требования к количеству живых офицеров и в нагруженные динамики это требование будет невыполено. на время бета теста выставлено 9.
	cost = 10
	minimum_players = 50 // security alive check is more than enough, but there must be a bare minimum of players
	requirements = list(101,101,101,101,101,101,60,40,30,10) // I'm not sure how this works and I don't trust it. So I took it from nukers.
	repeatable = FALSE // one man is enough to shake this station.
	// makeBody = FALSE
	// var/list/spawn_locs = list()

/datum/dynamic_ruleset/midround/from_ghosts/hatred/ready(forced = FALSE)
	. = ..()
	if(. && !forced)
		if(GLOB.security_level in list(SEC_LEVEL_GREEN, SEC_LEVEL_BLUE)) // разбавляем эксту внутривенно
			if(length(SSjob.get_living_sec()) < 4)
				return FALSE
		else if(length(SSjob.get_living_sec()) < 5) // я желаю достойного сопротивления.
			return FALSE

/datum/dynamic_ruleset/midround/from_ghosts/hatred/generate_ruleset_body(mob/applicant)
	var/datum/mind/player_mind = new /datum/mind(applicant.key)
	player_mind.active = TRUE
	var/turf/entry_spawn_loc
	if(length(GLOB.newplayer_start))
		entry_spawn_loc = pick(GLOB.newplayer_start)
	else
		entry_spawn_loc = get_safe_random_station_turf(typesof(/area/centcom/evac))
	var/mob/living/carbon/human/body = new (entry_spawn_loc)
	player_mind.transfer_to(body)
	message_admins("[ADMIN_LOOKUPFLW(body)] has been made into a Mass Shooter by the midround ruleset.")
	log_game("DYNAMIC: [key_name(body)] was spawned as a Mass Shooter by the midround ruleset.")
	return body

/datum/admins/proc/makeMassShooter()
	var/list/mob/candidates = pollGhostCandidates("Do you wish to be considered for the position of a Mass Shooter?", ROLE_OPERATIVE)
	var/mob/applicant = pick_n_take(candidates)
	var/datum/mind/player_mind = new /datum/mind(applicant.key)
	player_mind.active = TRUE
	var/turf/entry_spawn_loc
	if(length(GLOB.newplayer_start))
		entry_spawn_loc = pick(GLOB.newplayer_start)
	else
		entry_spawn_loc = get_safe_random_station_turf(typesof(/area/centcom/evac))
	var/mob/living/carbon/human/body = new (entry_spawn_loc)
	player_mind.transfer_to(body)
	body.mind.make_MassShooter()
	return TRUE
