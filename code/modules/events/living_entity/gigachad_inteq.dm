/datum/round_event_control/gigachad_inteq
	name = "InteQ Sledgehammer Mutant"
	typepath = /datum/round_event/gigachad_inteq
	max_occurrences = 2
	weight = 15
	category = EVENT_CATEGORY_ENTITIES

/datum/round_event/gigachad_inteq/announce(fake)
	send_fax_to_area(new /obj/item/paper/fax_CC_message/escapee/gigachad_inteq_announce, /area/security, "Психиатрический Отдел Nanotrasen", FALSE)
	// priority_announce("Один из наших... кхм... особых заключённых сбежал. Так получилось, что его последнее известное местонахождение до того, как их маячок заглох, - это ваша станция, так что будьте осторожней и остерегайтесь Технических Тоннелей. И еще... что это за стуки металла?",
	// sender_override = "Психиатрический Отдел Nanotrasen", has_important_message = TRUE)

/datum/round_event/gigachad_inteq/start()
	var/list/spawn_locs = list()
	var/list/unsafe_spawn_locs = list()
	for(var/X in GLOB.xeno_spawn)
		if(!isfloorturf(X))
			unsafe_spawn_locs += X
			continue
		var/turf/open/floor/F = X
		var/datum/gas_mixture/A = F.air
		var/oxy_moles = A.get_moles(GAS_O2)
		if((oxy_moles < 16 || oxy_moles > 50) || A.get_moles(GAS_PLASMA) || A.get_moles(GAS_CO2) >= 10)
			unsafe_spawn_locs += F
			continue
		if((A.return_temperature() <= 270) || (A.return_temperature() >= 360))
			unsafe_spawn_locs += F
			continue
		var/pressure = A.return_pressure()
		if((pressure <= 20) || (pressure >= 550))
			unsafe_spawn_locs += F
			continue
		spawn_locs += F

	if(!spawn_locs.len)
		spawn_locs += unsafe_spawn_locs

	if(!spawn_locs.len)
		message_admins("No valid spawn locations found, aborting...")
		return MAP_ERROR

	var/turf/T = get_turf(pick(spawn_locs))
	var/mob/living/simple_animal/hostile/gigachad_inteq/S = new(T)
	playsound(S, 'modular_bluemoon/kovac_shitcode/sound/weapons/sledge.ogg', 75, 1, 1000)
	message_admins("An InteQ mutant has been spawned at [COORD(T)][ADMIN_JMP(T)]")
	log_game("An InteQ mutant has been spawned at [COORD(T)]")
	return SUCCESSFUL_SPAWN

/////////////////Simple mob himself///////////////
/mob/living/simple_animal/hostile/gigachad_inteq
	name = "InteQ Agent"
	real_name = "InteQ Agent"
	icon = 'modular_bluemoon/kovac_shitcode/icons/gigachad_inteq.dmi'
	desc = "An experiment had gone out of control.."
	icon_state = "gigachad_inteq"
	icon_living = "gigachad_inteq"
	icon_dead = "syndicate_dead"
	icon_gib = "syndicate_gib"
	maxHealth = 1200
	health = 1200
	response_harm_continuous = "harmlessly punches"
	response_harm_simple = "harmlessly punch"
	harm_intent_damage = 0
	obj_damage = 100
	melee_damage_lower = 50
	melee_damage_upper = 60
	attack_verb_continuous = "smashes his sledgehammer into"
	attack_verb_simple = "smashes sledgehammer into"
	speed = 0.8
	environment_smash = ENVIRONMENT_SMASH_WALLS
	attack_sound = 'modular_bluemoon/kovac_shitcode/sound/weapons/sledge.ogg'
	status_flags = 0
	mob_size = MOB_SIZE_LARGE
	del_on_death = TRUE
	force_threshold = 10
	speak_chance = 90
	AIStatus = AI_ON
	speak = list("БЕГАЮЩИЕ ГВОЗДИ!!!", "БЕГИ, СУКА, БЕГИ!!!", "КАК ОРЕХ ЩА РАСКОЛЮ!!!")
	loot = list(/obj/item/storage/belt/military/inteq, /obj/item/clothing/head/helmet/swat/inteq, /obj/item/clothing/shoes/combat/coldres, /obj/effect/gibspawner/generic, /obj/effect/gibspawner/generic/animal, /obj/effect/gibspawner/human/bodypartless, /obj/effect/gibspawner/human)


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/datum/round_event_control/space_mosquito
	name = "Space Mosquito"
	typepath = /datum/round_event/space_mosquito
	max_occurrences = 2
	weight = 30
	category = EVENT_CATEGORY_ENTITIES

/datum/round_event/space_mosquito/announce(fake)
	send_fax_to_area(new /obj/item/paper/fax_CC_message/escapee/mosquito_announce, /area/security, "Психиатрический Отдел Nanotrasen", FALSE)
	// priority_announce("Один из наших... кхм... особых заключённых сбежал. Так получилось, что его последнее известное местонахождение до того, как их маячок заглох, - это ваша станция, так что будьте осторожней и остерегайтесь Технических Тоннелей. И еще... это что, выкрики на нео-русском?",
	// sender_override = "Психиатрический Отдел Nanotrasen", has_important_message = TRUE)

/datum/round_event/space_mosquito/start()
	var/list/spawn_locs = list()
	var/list/unsafe_spawn_locs = list()
	for(var/X in GLOB.xeno_spawn)
		if(!isfloorturf(X))
			unsafe_spawn_locs += X
			continue
		var/turf/open/floor/F = X
		var/datum/gas_mixture/A = F.air
		var/oxy_moles = A.get_moles(GAS_O2)
		if((oxy_moles < 16 || oxy_moles > 50) || A.get_moles(GAS_PLASMA) || A.get_moles(GAS_CO2) >= 10)
			unsafe_spawn_locs += F
			continue
		if((A.return_temperature() <= 270) || (A.return_temperature() >= 360))
			unsafe_spawn_locs += F
			continue
		var/pressure = A.return_pressure()
		if((pressure <= 20) || (pressure >= 550))
			unsafe_spawn_locs += F
			continue
		spawn_locs += F

	if(!spawn_locs.len)
		spawn_locs += unsafe_spawn_locs

	if(!spawn_locs.len)
		message_admins("No valid spawn locations found, aborting...")
		return MAP_ERROR

	var/turf/T = get_turf(pick(spawn_locs))
	var/mob/living/simple_animal/hostile/space_mosquito/S = new(T)
	playsound(S, 'modular_bluemoon/kovac_shitcode/sound/komar_spawn.ogg', 75, 1, 1000)
	message_admins("A Space Mosquito has been spawned at [COORD(T)][ADMIN_JMP(T)]")
	log_game("A Space Mosquito has been spawned at [COORD(T)]")
	return SUCCESSFUL_SPAWN

/////////////////Simple mob himself///////////////
/mob/living/simple_animal/hostile/space_mosquito
	name = "Space Mosquito"
	real_name = "Space Mosquito"
	icon = 'modular_bluemoon/kovac_shitcode/icons/animals.dmi'
	desc = "An expert of battle and survival in extremal environment."
	icon_state = "komar"
	icon_living = "komar"
	icon_dead = "syndicate_dead"
	icon_gib = "syndicate_gib"
	maxHealth = 250
	health = 250
	response_harm_continuous = "harmlessly punches"
	response_harm_simple = "harmlessly punch"
	harm_intent_damage = 0
	obj_damage = 100
	melee_damage_lower = 250
	melee_damage_upper = 300
	attack_verb_continuous = "slashes"
	attack_verb_simple = "slashes"
	speed = -10
	environment_smash = ENVIRONMENT_SMASH_WALLS
	attack_sound = 'modular_bluemoon/kovac_shitcode/sound/komar.ogg'
	status_flags = 0
	mob_size = MOB_SIZE_HUMAN
	del_on_death = TRUE
	force_threshold = 10
	move_to_delay = 1 // ГОТТА ФАСТ БОЙЙЙ
	speak_chance = 0
	AIStatus = AI_ON
	loot = list(/obj/effect/gibspawner/human)

/mob/living/simple_animal/hostile/space_mosquito/AttackingTarget()
	. = ..()
	if(. && isliving(target))
		var/mob/living/L = target
		L.adjustBruteLoss(110)
		qdel(src)
	return
