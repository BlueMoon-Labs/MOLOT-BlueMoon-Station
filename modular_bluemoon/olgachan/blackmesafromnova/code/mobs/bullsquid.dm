/mob/living/simple_animal/hostile/blackmesa/xen/bullsquid
	name = "bullsquid"
	desc = "Противное инопланетное существо прямиком из другого измерения. Его противные глаза уже сверлят вас."
	icon = 'modular_bluemoon/olgachan/blackmesafromnova/icons/mobs.dmi'
	icon_state = "bullsquid"
	icon_living = "bullsquid"
	icon_dead = "bullsquid_dead"
	icon_gib = null
	mob_biotypes = list(MOB_ORGANIC, MOB_BEAST)
	environment_smash = ENVIRONMENT_SMASH_STRUCTURES
	faction = list(FACTION_XEN)
	speak_chance = 50
	speak_emote = list("growls")
	emote_taunt = list("growls", "snarls", "grumbles")
	taunt_chance = 100
	turns_per_move = 7
	maxHealth = 110
	health = 110
	obj_damage = 50
	harm_intent_damage = 15
	melee_damage_lower = 15
	melee_damage_upper = 15
	ranged = TRUE
	retreat_distance = 4
	minimum_distance = 4
	dodging = TRUE
	projectilesound = 'modular_bluemoon/olgachan/blackmesafromnova/sound/mobs/bullsquid/goo_attack3.ogg'
	melee_damage_upper = 18
	attack_sound = 'modular_bluemoon/olgachan/blackmesafromnova/sound/mobs/bullsquid/attack1.ogg'
	gold_core_spawnable = HOSTILE_SPAWN
	alert_sounds = list('modular_bluemoon/olgachan/blackmesafromnova/sound/mobs/bullsquid/detect1.ogg','modular_bluemoon/olgachan/blackmesafromnova/sound/mobs/bullsquid/detect2.ogg','modular_bluemoon/olgachan/blackmesafromnova/sound/mobs/bullsquid/detect3.ogg')
	projectiletype = /obj/item/projectile/neurotox/bullsquid


/obj/item/projectile/neurotox/bullsquid
	name = "nasty ball of ooze"
	icon_state = "declone"
	damage = 5
	damage_type = BURN
	knockdown = 20
	impact_effect_type = /obj/effect/temp_visual/impact_effect/neurotoxin
	hitsound = 'modular_bluemoon/olgachan/blackmesafromnova/sound/mobs/bullsquid/splat1.ogg'
	hitsound_wall = 'modular_bluemoon/olgachan/blackmesafromnova/sound/mobs/bullsquid/splat1.ogg'

/obj/effect/temp_visual/impact_effect/neurotoxin
	icon_state = "greenglow"
	color = "#5BDD04"
	icon = 'icons/effects/effects.dmi'
	layer = ABOVE_ALL_MOB_LAYER
	duration = 3

/obj/effect/temp_visual/impact_effect/neurotoxin/Initialize(mapload)
	. = ..()
	new /obj/effect/decal/cleanable/bullsquid_ooze(get_turf(src))


/obj/effect/decal/cleanable/bullsquid_ooze
	name = "Nasty ooze"
	desc = "Отвратительная смесь феромонов и других токсичных реагентов"
	icon = 'icons/effects/effects.dmi'
	icon_state = "greenglow"

/obj/item/projectile/neurotox/bullsquid/on_hit(atom/target, blocked = FALSE)
	..()
	if(iscarbon(target))
		var/mob/living/carbon/C = target
		C.reagents.add_reagent(/datum/reagent/toxin/leaper_venom, 5)
		return
	if(isanimal(target))
		var/mob/living/simple_animal/L = target
		L.adjustHealth(25)


/obj/item/projectile/neurotox/bullsquid/on_range()
	var/turf/T = get_turf(src)
	..()
	new /obj/structure/bullsquidshot(T)


/obj/structure/bullsquidshot
	name = "Ball of ooze"
	desc = "A floating bubble containing leaper venom. The contents are under a surprising amount of pressure."
	icon = 'icons/obj/projectiles.dmi'
	icon_state = "declone"
	max_integrity = 10
	density = FALSE

/obj/structure/bullsquidshot/Initialize(mapload)
	. = ..()
	INVOKE_ASYNC(src, TYPE_PROC_REF(/atom/movable, float), TRUE)
	QDEL_IN(src, 100)

/obj/structure/bullsquidshot/Destroy()
	new /obj/effect/temp_visual/impact_effect/neurotoxin(get_turf(src))
	playsound(src,'modular_bluemoon/olgachan/blackmesafromnova/sound/mobs/bullsquid/splat1.ogg',50, 1, -1)
	return ..()

/obj/structure/bullsquidshot/Crossed(atom/movable/AM)
	if(isliving(AM))
		var/mob/living/L = AM
		if(!istype(L, /mob/living/simple_animal/hostile/jungle/leaper))
			playsound(src,'modular_bluemoon/olgachan/blackmesafromnova/sound/mobs/bullsquid/splat1.ogg',50, 1, -1)
			L.DefaultCombatKnockdown(50)
			if(iscarbon(L))
				var/mob/living/carbon/C = L
				C.reagents.add_reagent(/datum/reagent/toxin/leaper_venom, 5)
			if(isanimal(L))
				var/mob/living/simple_animal/A = L
				A.adjustHealth(25)
			qdel(src)
	return ..()
