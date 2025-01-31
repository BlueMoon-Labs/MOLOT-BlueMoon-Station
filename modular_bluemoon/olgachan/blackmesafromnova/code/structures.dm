
#define COMSIG_QDELETING "parent_qdeleting"
#define isxenmob(A) (istype(A, /mob/living/simple_animal/hostile/blackmesa/xen))

/obj/structure/shockplant
	name = "Strange xen plant"
	desc = "Невероятно искрит! Не рекомендую подходить к нему слишком близко"
	icon = 'modular_bluemoon/olgachan/blackmesafromnova/icons/plants.dmi'
	icon_state = "electric_plant"
	density = TRUE
	anchored = TRUE
	max_integrity = 200
	light_range = 15
	light_power = 0.5
	light_color = "#53fafa"
	var/faction = ROLE_SYNDICATE
	var/shock_range = 6
	var/shock_cooldown = 3 SECONDS
	var/shock_power = 10000

	COOLDOWN_DECLARE(shock_cooldown_timer)


/obj/structure/shockplant/Initialize(mapload)
	. = ..()
	for(var/turf/open/iterating_turf as anything in circle_view_turfs(src, shock_range))
		RegisterSignal(iterating_turf, COMSIG_ATOM_ENTERED, PROC_REF(trigger))

/obj/structure/shockplant/proc/trigger(datum/source, atom/movable/entered_atom)
	SIGNAL_HANDLER

	if(!COOLDOWN_FINISHED(src, shock_cooldown_timer))
		return

	if(isliving(entered_atom))
		var/mob/living/entering_mob = entered_atom
		if(faction in entering_mob.faction)
			return
		tesla_zap(src, shock_range, shock_power, shocked_targets = list(entering_mob))
		playsound(src, 'sound/magic/lightningbolt.ogg', 100, TRUE)
		COOLDOWN_START(src, shock_cooldown_timer, shock_cooldown)



/proc/circle_view_turfs(center=usr,radius=3)

	var/turf/center_turf = get_turf(center)
	var/list/turfs = new/list()
	var/rsq = radius * (radius + 0.5)

	for(var/turf/checked_turf in view(radius, center_turf))
		var/dx = checked_turf.x - center_turf.x
		var/dy = checked_turf.y - center_turf.y
		if(dx * dx + dy * dy <= rsq)
			turfs += checked_turf
	return turfs

/obj/structure/sink/puddle/healing
	name = "healing puddle"
	desc = "By some otherworldy power, this puddle of water seems to slowly regenerate things!"
	color = "#71ffff"
	light_range = 3
	light_color = "#71ffff"
	var/heal_amount = 2

/obj/structure/sink/puddle/healing/Initialize(mapload)
	. = ..()
	START_PROCESSING(SSobj, src)

/obj/structure/sink/puddle/healing/process(seconds_per_tick)
	for(var/mob/living/iterating_mob in loc)
		iterating_mob.heal_overall_damage(heal_amount, heal_amount)

/mob/living/simple_animal/hostile/blackmesa/xen
	var/can_be_shielded = TRUE
	var/shielded = FALSE
	var/shield_count = 0

/mob/living/simple_animal/hostile/blackmesa/xen/update_overlays()
	. = ..()
	if(shielded)
		. += mutable_appearance('icons/effects/effects.dmi', "shield-yellow", MOB_SHIELD_LAYER)

/mob/living/simple_animal/hostile/blackmesa/xen/proc/lose_shield()
	shield_count--
	if(shield_count <= 0)
		shielded = FALSE
		update_appearance()

/mob/living/simple_animal/hostile/blackmesa/xen/apply_damage(damage = 0, damagetype = BRUTE, def_zone = null, blocked = FALSE, forced = FALSE, spread_damage = FALSE, wound_bonus = 0, bare_wound_bonus = 0, sharpness = NONE, attack_direction = null, attacking_item)
	if(shielded)
		balloon_alert_to_viewers("ineffective!")
		return FALSE
	return ..()

/obj/structure/xen_pylon
	name = "shield plant"
	desc = "It seems to be some kind of force field generator."
	icon = 'modular_bluemoon/olgachan/blackmesafromnova/icons/plants.dmi'
	icon_state = "crystal_pylon"
	max_integrity = 70
	density = TRUE
	anchored = TRUE
	/// The range at which we provide shield support to a mob.
	var/shield_range = 5
	/// A list of mobs we are currently shielding with attached beams.
	var/list/shielded_mobs = list()

/obj/structure/xen_pylon/Initialize(mapload)
	. = ..()
	for(var/mob/living/simple_animal/hostile/blackmesa/xen/iterating_mob in range(shield_range, src))
		if(!iterating_mob.can_be_shielded)
			continue
		register_mob(iterating_mob)
	for(var/turf/iterating_turf in RANGE_TURFS(shield_range, src))
		RegisterSignal(iterating_turf, COMSIG_ATOM_ENTERED, PROC_REF(mob_entered_range))

/obj/structure/xen_pylon/proc/mob_entered_range(datum/source, atom/movable/entered_atom)
	SIGNAL_HANDLER
	if(!isxenmob(entered_atom))
		return
	var/mob/living/simple_animal/hostile/blackmesa/xen/entered_xen_mob = entered_atom
	if(!entered_xen_mob.can_be_shielded)
		return
	register_mob(entered_xen_mob)

/obj/structure/xen_pylon/proc/register_mob(mob/living/simple_animal/hostile/blackmesa/xen/mob_to_register)
	if(mob_to_register in shielded_mobs)
		return
	if(!istype(mob_to_register))
		return
	shielded_mobs += mob_to_register
	mob_to_register.shielded = TRUE
	mob_to_register.shield_count++
	mob_to_register.update_appearance()
	var/datum/beam/created_beam = Beam(mob_to_register, icon_state = "red_lightning", time = 10 MINUTES, maxdistance = (shield_range - 1))
	shielded_mobs[mob_to_register] = created_beam
	RegisterSignal(created_beam, COMSIG_QDELETING, PROC_REF(beam_died), override = TRUE)
	RegisterSignal(mob_to_register, COMSIG_QDELETING, PROC_REF(mob_died), override = TRUE)

/obj/structure/xen_pylon/proc/mob_died(atom/movable/source, force)
	SIGNAL_HANDLER
	var/datum/beam/beam = shielded_mobs[source]
	QDEL_NULL(beam)
	shielded_mobs[source] = null
	shielded_mobs -= source

/obj/structure/xen_pylon/proc/beam_died(datum/beam/beam_to_kill)
	SIGNAL_HANDLER
	for(var/mob/living/simple_animal/hostile/blackmesa/xen/iterating_mob as anything in shielded_mobs)
		if(shielded_mobs[iterating_mob] == beam_to_kill)
			iterating_mob.lose_shield()
			shielded_mobs[iterating_mob] = null
			shielded_mobs -= iterating_mob

/obj/structure/xen_pylon/Destroy()
	for(var/mob/living/simple_animal/hostile/blackmesa/xen/iterating_mob as anything in shielded_mobs)
		iterating_mob.lose_shield()
		var/datum/beam/beam = shielded_mobs[iterating_mob]
		QDEL_NULL(beam)
		shielded_mobs[iterating_mob] = null
		shielded_mobs -= iterating_mob
	shielded_mobs = null
	playsound(src, 'sound/magic/lightningbolt.ogg', 100, TRUE)
	new /obj/item/grenade/xen_crystal(get_turf(src))
	return ..()

/obj/item/grenade/xen_crystal
	name = "xen crystal"
	desc = "A crystal with anomalous properties."
	icon = 'modular_bluemoon/olgachan/blackmesafromnova/icons/plants.dmi'
	icon_state = "crystal_grenade"
	/// What range do we effect mobs?
	var/effect_range = 6
	/// The faction we convert the mobs to
	var/faction = ROLE_SYNDICATE

/obj/item/grenade/xen_crystal/prime(mob/living/lanced_by)
	for(var/mob/living/mob_to_neutralize in view(src, effect_range))
		if(is_type_in_list(mob_to_neutralize))
			return
		mob_to_neutralize.faction |= ROLE_SYNDICATE
		mob_to_neutralize.visible_message(span_green("[mob_to_neutralize] is overcome by a wave of peace and tranquility!"))
		new /obj/effect/particle_effect/sparks/quantum(get_turf(mob_to_neutralize))
	qdel(src)

/datum/export/xen_crystal
	cost = CARGO_CRATE_VALUE * 6 //1200
	unit_name = "anomalous crystal sample"
	export_types = list(/obj/item/grenade/xen_crystal)
	include_subtypes = FALSE


//записки

/obj/item/paper/fluff/blackmesasecret
	name = "Сектор H является не тем, чем кажется"
	default_raw_text = "Видишь это пустое нечто? Там должен был быть коридор, но его нету. Я надеюсь, ты понимаешь, что не должен был попасть сюда. В любом случае, если ты это читаешь, то поздравляю, ты каким-то образом нашёл одну из моих записей. Я дам тебе подсказку, что-бы ты понял, куда двигаться дальше. У лагерей свои секреты... Ты ведь знаешь, где находится самый большой? Теперь это самый тихий лагерь из всех. и те, кто это устроили, скоро прийдут за тобой. Сможешь ли ты найти там дверь?"

/obj/item/paper/fluff/blackmesasecret2
	name = "Сектор H является не тем, чем кажется"
	default_raw_text = "С каждым разом продвигаешься всё дальше и дальше, а этой пустоты, как и вопросов, всё больше и больше. Мне кажется, или я окончательно схожу с ума? Так или иначе, я дам тебе следующую подсказку, куда идти. Один из коридоров сильно пострадал, и попасть туда можно только пройдясь по краю пропасти. Ключ я, конечно же, оставлю тут же. Забочусь о вас, напарники."


/obj/item/paper/fluff/blackmesasecret3
	name = "Сектор H является не тем, чем кажется"
	default_raw_text = "Отлично... Кажется, ты снова нарвался на одно из моих убежищ. Спешу предупредить, что это, вероятнее всего, последняя запись. Я был с одним пехотинцем, как вдруг этот проклятый пришелец запрыгнул на его голову и захватил контроль. Пока он не трансформировался в того ужасного монстра, я упрятал его в одной из своих лабораторий. Ладно, дам тебе последнюю подсказку, куда идти. Просто знай, что в той части комплекса, куда ты сейчас направляешься, будут двери, закрытые ключ картой. Это мой кабинет вместе с небольшой лабораторией. Я хочу, что-бы ты выяснил, что происходит с теми, кто живут с этим пришельцем на голове... Слишком долго."


/obj/item/paper/fluff/blackmesahecu
	name = "У нас точно остались союзники?"
	default_raw_text = "Дальше располагается один из наших отрядов, но при виде нас они сразу открыли огонь. Меня сильно ранили, а мои, оставшиеся в отряде, отправились дальше по комплексу, так и не вернувшись. Я просто хочу домой."



//лампы

/obj/machinery/power/floodlight/lamppost/one/mesa
	icon_state = "one"
	number_of_lamps = 1
	light_power = 1.4
	layer = 4
	light_range = 15
	light_color = "#ffffdd"
	max_integrity = 9999999

