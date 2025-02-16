/mob/living/simple_animal/hostile/blackmesa/xen/snark
	name = "Snark"
	desc = "Snarks are small, beetle-like xenian creatures with one beady green eye, an extendable beak, antennae, four legs, and a dark red thick segmented shell"
	icon = 'modular_bluemoon/olgachan/blackmesafromnova/icons/snarkicon.dmi'
	icon_state = "snark"
	icon_living = "snark"
	icon_gib = null
	faction = list(FACTION_XEN)
	mob_biotypes = MOB_ORGANIC|MOB_BUG
	mob_size = MOB_SIZE_TINY
	pass_flags = PASSTABLE | PASSGRILLE | PASSMOB
	speed = 1
	taunt_chance = 100
	turns_per_move = 20
	maxHealth = 50
	del_on_death = 1
	health = 40
	speed = 3
	dodging = TRUE
	obj_damage = 5
	harm_intent_damage = 15
	melee_damage_lower = 10
	melee_damage_upper = 10
	retreat_distance = 5
	minimum_distance = 5
	loot = list(/obj/effect/decal/cleanable/insectguts)
	attack_sound = 'modular_bluemoon/olgachan/blackmesafromnova/sound/mobs/snark/snark4.ogg'
	alert_sounds = list('modular_bluemoon/olgachan/blackmesafromnova/sound/mobs/snark/snark1.ogg','modular_bluemoon/olgachan/blackmesafromnova/sound/mobs/snark/snark2.ogg','modular_bluemoon/olgachan/blackmesafromnova/sound/mobs/snark/snark3.ogg')
	footstep_type = FOOTSTEP_MOB_CLAW

/mob/living/simple_animal/hostile/blackmesa/xen/snark/friendly
	name = "Snark with damaged beak"
	desc = "Snark, which beak has been damaged, now they're cant hurt you (but still tries to bite your fingers)"
	gold_core_spawnable = FRIENDLY_SPAWN
	faction = list("neutral")

/mob/living/simple_animal/hostile/blackmesa/xen/snark/friendly/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/wuv, "Shakes violently and tries to bite your fingers!")
	AddElement(/datum/element/strippable, GLOB.strippable_corgi_items)
	AddElement(/datum/element/mob_holder)
