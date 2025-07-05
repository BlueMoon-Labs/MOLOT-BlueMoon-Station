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
 * здоровья необходимо заставить живую цель не двигаться более 10 секунд и убить её выстрелом вплотную для восстановления здоровья. Тем самым мы снижаем
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

/datum/antagonist/hatred/greet()
	SEND_SOUND(owner.current, sound(pick('modular_bluemoon/code/modules/antagonists/hatred/hatred_begin_1.ogg', \
										'modular_bluemoon/code/modules/antagonists/hatred/hatred_begin_2.ogg', \
										'modular_bluemoon/code/modules/antagonists/hatred/hatred_begin_3.ogg')))
	var/greet_text
	greet_text += "Ты - [span_red(span_bold("Безымянный Убийца"))]. Твое прошлое совершенно неважно, и даже если оно было, оно было незавидным.<br>"
	greet_text += "У тебя лишь две цели: <u>убивать</u> и <u>умереть славной смертью</u>.<br>"
	greet_text += "Твое проклятое снаряжение неразлучно с тобою и подстегивает тебя продолжать соврешать геноцид беззащитных гражданских.<br>"
	greet_text += "Твой [span_red("Автомат Ненависти")] и неутолимая жажда убивать вознаграждают тебя, ибо завершающий выстрел в упор в голову (рот) исцеляет твои раны. Обычная медицина бессильна.<br>"
	greet_text += "[span_red("Cумка для патронов")] сама пополняет пустые магазины.<br>"
	// greet_text += "[span_red("Разгрузка с гранатами")] пожирает сердца твоих жертв и вознаграждает тебя новой взрывоопасной аммуницией.<br>"
	greet_text += "[span_red(span_bold("Убивай и будь убит!"))] Ибо никто сегодня не защищен от твоей Ненависти.<br>"
	to_chat(owner.current, greet_text)
	antag_memory = greet_text
	owner.announce_objectives()

/datum/antagonist/hatred/on_gain()
	var/mob/living/carbon/human/H = owner.current
	if(!istype(H))
		return
	forge_objectives()
	// randomize_human(H)
	// H.set_species(/datum/species/human)
	// H.gender = MALE
	H.real_name = "The Man without a name"
	H.dna.remove_all_mutations()
	if((get_size(H) < 0.8  || 1.2 < get_size(H))) // better safe than sorry. players generally don't like invincible superheavy 200x sprite enemies. microsprite enemies too.
		H.update_size(1)
	if(H.mob_weight != MOB_WEIGHT_NORMAL)
		H.mob_weight = MOB_WEIGHT_NORMAL
		H.update_weight(H.mob_weight)
	H.update_body()
	H.equipOutfit(/datum/outfit/hatred)
	// ADD_TRAIT(H, TRAIT_STUNIMMUNE, "hatred") // Doesn't work against stunbatons anyway :(
	ADD_TRAIT(H, TRAIT_SLEEPIMMUNE, "hatred") // I challenge you to a glorious fight!
	ADD_TRAIT(H, TRAIT_VIRUSIMMUNE, "hatred")
	ADD_TRAIT(H, TRAIT_NONATURALHEAL, "hatred")
	ADD_TRAIT(H, TRAIT_IGNOREDAMAGESLOWDOWN, "hatred")
	ADD_TRAIT(H, TRAIT_FEARLESS, "hatred")
	ADD_TRAIT(H, TRAIT_STRONG_GRABBER, "hatred") // This way player will have less problems with his targets run/crawl away during glory kills
	appear_on_station()
	allowed_z_levels += SSmapping.levels_by_trait(ZTRAIT_CENTCOM)
	allowed_z_levels += SSmapping.levels_by_trait(ZTRAIT_RESERVED)
	allowed_z_levels += SSmapping.levels_by_trait(ZTRAIT_STATION)
	RegisterSignal(H, COMSIG_LIVING_LIFE, PROC_REF(check_hatred_off_station)) // almost like anchor implant, but doesn't hurt
	addtimer(CALLBACK(src, PROC_REF(alarm_station)), 30 SECONDS, TIMER_DELETE_ME) // Give a player a moment to understand what's going on.
	return ..()

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
							Нейтрализуйте угрозу любыми доступными способами. \
							ЦК санкционирует персоналу станции против данной цели: использование летального вооружения, открытие огня без предупреждения и казнь на месте. \
							Особые приметы: АК-47 и длинное кожаное пальто.", \
							"ВНИМАНИЕ: ОСОБО ОПАСНЫЙ ИНДИВИД", chosen_sound, has_important_message = TRUE)

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

/// THE GUN OF HATRED ///

/obj/item/gun/ballistic/automatic/ak47/hatred
	name = "\improper AK-47 rifle of Hatred"
	desc = "The scratches on this rifle say: \"The Genocide Machine\"."
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

/obj/item/gun/ballistic/automatic/ak47/hatred/handle_suicide(mob/living/carbon/human/user, mob/living/carbon/human/target, params, bypass_timer)
	var/is_glory = TRUE
	if(target?.stat == DEAD || !target.client) // already dead bodies or npcs don't count
		is_glory = FALSE
	. = ..()
	if(!. || user == target || !is_glory)
		return
	addtimer(CALLBACK(src, PROC_REF(check_glory_kill), user, target), 1 SECONDS, TIMER_DELETE_ME) // wait for boolet to do its job

/obj/item/gun/ballistic/automatic/ak47/hatred/proc/check_glory_kill(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(!target || target?.stat == DEAD) // "!target" is for situations when target is gibbed, dusted or something else irreversible happened with body
		user.fully_heal(TRUE) // the only way of healing
		// user.do_adrenaline(150, TRUE, 0, 0, TRUE, list(/datum/reagent/medicine/inaprovaline = 10, /datum/reagent/medicine/synaptizine = 15, /datum/reagent/medicine/regen_jelly = 20, /datum/reagent/medicine/stimulants = 20), "<span class='boldnotice'>You feel a sudden surge of energy!</span>")
		user.visible_message("As blood splashes onto [src], it starts glowing menacingly and its wielder seemingly regaining their strength and vitality.")
		to_chat(user, span_notice("The blood of the weak gives you an inhuman relief and strength to continue the massacre."))

/// THE POUCH OF HATRED ///

/obj/item/storage/bag/ammo/hatred
	name = "ammo pouch of Hatred"
	desc = "The cursed pouch with infinite bullets encourage you to relentlessly continue your atrocities against humanity. What a miracle and delight for your automatic Genocide Machine."

/obj/item/storage/bag/ammo/hatred/examine(mob/user)
	. = ..()
	. += span_notice("If you place an empty magazine into this phenomenal pouch next time you check it will be filled with bullets.")
	. += span_notice("<b>Alt-Click</b> to open.")
	. += span_notice("Once you lose this item it will turn into dust.")

/obj/item/storage/bag/ammo/hatred/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.can_hold = typecacheof(list(/obj/item/ammo_box/magazine/ak47))
	STR.attack_hand_interact = FALSE
	// STR.quickdraw = TRUE

/obj/item/storage/bag/ammo/hatred/PopulateContents()
	new /obj/item/ammo_box/magazine/ak47(src)
	new /obj/item/ammo_box/magazine/ak47(src)

/obj/item/storage/bag/ammo/hatred/Entered(atom/movable/AM, atom/oldLoc)
	. = ..()
	qdel(AM)
	new /obj/item/ammo_box/magazine/ak47(src)

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

/// THE CHEST RIG OF HATRED ///

/obj/item/storage/belt/military/hatred
	// name = "chest rig of Hatred"
	// desc = "The cursed chest rig eagerly devours hearts of your victims and supplies you with new deadly explosives."

// /obj/item/storage/belt/military/hatred/examine(mob/user)
// 	. = ..()
// 	. += span_notice("If you place a heart into this phenomenal chest rig next time you check there will be no heart but a deadly explosive.")
// 	. += span_notice("Once you lose this item it will turn into dust.")

// /obj/item/storage/belt/military/hatred/ComponentInitialize()
// 	. = ..()
// 	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
// 	STR.can_hold = typecacheof(list(/obj/item/grenade/syndieminibomb/concussion, /obj/item/grenade/frag, /obj/item/organ/heart))
// 	STR.max_items = 3

/obj/item/storage/belt/military/hatred/PopulateContents()
	new /obj/item/grenade/syndieminibomb/concussion(src)
	new /obj/item/grenade/frag(src)
	new /obj/item/grenade/frag(src)

// /obj/item/storage/belt/military/hatred/Entered(atom/movable/AM, atom/oldLoc)
// 	. = ..()
// 	if(istype(AM, /obj/item/organ/heart))
// 		qdel(AM)
// 		if(prob(50))
// 			new /obj/item/grenade/syndieminibomb/concussion(src)
// 		else
// 			new /obj/item/grenade/frag(src)

// /obj/item/storage/belt/military/hatred/equipped(mob/user, slot, initial)
// 	. = ..()
// 	ADD_TRAIT(src, TRAIT_NODROP, "hatred")

// /obj/item/storage/belt/military/hatred/dropped(mob/user, silent)
// 	. = ..()
// 	if(!QDELETED(src))
// 		visible_message("[src] рассыпается в прах на ваших глазах...")
// 		qdel(src)
// 		// Destroy(src)

/// THE OVERCOAT OF HATRED ///

/obj/item/clothing/suit/jacket/leather/overcoat/hatred
	name = "leather overcoat of Hatred"
	desc = "The shabby leather overcoat with decent armor paddings. Once it has been splashed with blood you can't take it off anymore."
	// clueless armor stats. A bit worse than red ert hardsuit and other types of hardsuits. decent versatile armor.
	armor = list(MELEE = 50, BULLET = 50, LASER = 50, ENERGY = 50, BOMB = 50, BIO = 30, RAD = 10, FIRE = 75, ACID = 75, WOUND = 50)

/obj/item/clothing/suit/jacket/leather/overcoat/hatred/equipped(mob/user, slot)
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, "hatred")

// /obj/item/clothing/suit/jacket/leather/overcoat/hatred/dropped(mob/user)
// 	. = ..()
// 	qdel(src)

/obj/item/clothing/head/invisihat/hatred
	name = "Veil of Hatred"
	desc = "Once you felt <b><i>that</i></b> urge to commit relentless genocide of civilians, you clearly understood you were cursed... blessed... and... protected by invisible spirit of Hatred."
	// clueless armor stats. A bit worse than red ert hardsuit and other types of hardsuits. decent versatile armor.
	armor = list(MELEE = 50, BULLET = 50, LASER = 50, ENERGY = 50, BOMB = 50, BIO = 30, RAD = 10, FIRE = 75, ACID = 75, WOUND = 50)

/obj/item/clothing/head/invisihat/hatred/equipped(mob/user, slot)
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, "hatred")

/obj/item/clothing/head/invisihat/hatred/dropped(mob/user)
	. = ..()
	if(!QDELETED(src))
		visible_message("[src] рассыпается в прах на ваших глазах...")
		qdel(src)

/// OUTFIT ///

/datum/outfit/hatred
	name = "Hatred"
	head = /obj/item/clothing/head/invisihat/hatred
	// glasses = /obj/item/clothing/glasses/sunglasses
	glasses = /obj/item/clothing/glasses/hud/health/sunglasses/aviators // to help player identify when a target is in crit so player can safely execute him
	uniform = /obj/item/clothing/under/rank/civilian/util/greyshirt
	suit = /obj/item/clothing/suit/jacket/leather/overcoat/hatred
	gloves = /obj/item/clothing/gloves/tackler/combat/insulated/infiltrator
	shoes = /obj/item/clothing/shoes/jackboots/tall_default
	id = /obj/item/card/id/stowaway_stolen
	l_pocket = /obj/item/storage/bag/ammo/hatred
	belt = /obj/item/storage/belt/military/hatred
	// back = /obj/item/storage/backpack/duffelbag/durathread
	back = /obj/item/storage/backpack/rucksack
	backpack_contents = list(/obj/item/storage/box/survival/engineer = 1,
		/obj/item/flashlight/seclite = 1,
		/obj/item/kitchen/knife/combat = 1,
		/obj/item/sensor_device = 1,
		/obj/item/crowbar = 1
		)
	r_hand = /obj/item/gun/ballistic/automatic/ak47/hatred
	// implants = list(/obj/item/implant/explosive, /obj/item/implant/anchor) // post_equip() doesn't work for implants since implanting occurs afrer post_equip()

/datum/outfit/hatred/post_equip(mob/living/carbon/human/H, visualsOnly, client/preference_source)
	var/obj/item/implant/explosive/E = new
	E.implant(H)
	// var/obj/item/implant/anchor/A = new
	// A.implant(H)
	// A = locate() in H.implants
	// A.allowed_z_levels = list()
	// A.allowed_z_levels += SSmapping.levels_by_trait(ZTRAIT_CENTCOM)
	// A.allowed_z_levels += SSmapping.levels_by_trait(ZTRAIT_RESERVED)
	// A.allowed_z_levels += SSmapping.levels_by_trait(ZTRAIT_STATION)

	var/obj/item/clothing/under/rank/civilian/util/greyshirt/I = H.get_item_by_slot(ITEM_SLOT_ICLOTHING)
	I.has_sensor = NO_SENSORS
	ADD_TRAIT(I, TRAIT_NODROP, "hatred")

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
	minimum_players = 60 // never spawn this antag on low pops!
	requirements = list(101,101,101,101,101,101,60,40,30,10) // I'm not sure how this works and I don't trust it. So I took it from nukers.
	repeatable = FALSE // one man is enough to shake this station.
	// makeBody = FALSE
	// var/list/spawn_locs = list()

/datum/dynamic_ruleset/midround/from_ghosts/hatred/ready(forced = FALSE)
	. = ..()
	if(. && !forced)
		if(GLOB.security_level == SEC_LEVEL_GREEN) // разбавляем эксту внутривенно
			if(length(SSjob.get_living_sec()) < 4)
				return FALSE
		else if(length(SSjob.get_living_sec()) < 5) // я желаю достойного сопротивления.
			return FALSE

/datum/dynamic_ruleset/midround/from_ghosts/hatred/generate_ruleset_body(mob/applicant)
	var/datum/mind/player_mind = new /datum/mind(applicant.key)
	player_mind.active = TRUE
	var/mob/living/carbon/human/body = makeBody(applicant)
	// body.key = applicant.key
	player_mind.transfer_to(body)
	message_admins("[ADMIN_LOOKUPFLW(body)] has been made into a Mass Shooter by the midround ruleset.")
	log_game("DYNAMIC: [key_name(body)] was spawned as a Mass Shooter by the midround ruleset.")
	return body
