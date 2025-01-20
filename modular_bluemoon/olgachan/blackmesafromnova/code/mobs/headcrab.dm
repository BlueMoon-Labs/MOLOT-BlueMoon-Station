/mob/living/simple_animal/hostile/blackmesa/xen/headcrab
	name = "Headcrab"
	desc = "A small parasitic creature that would like to connect with your brain stem."
	icon = 'icons/mob/headcrab.dmi'
	icon_state = "headcrab"
	icon_living = "headcrab"
	icon_dead = "headcrab_dead"
	faction = list(FACTION_XEN)
	health = 60
	maxHealth = 60
	melee_damage_lower = 5
	melee_damage_upper = 10
	ranged = 1
	ranged_message = "leaps"
	ranged_cooldown_time = 40
	var/jumpdistance = 4
	var/jumpspeed = 1
	attack_verb_continuous = "грызёт"
	attack_verb_simple = "грызёт"
	attack_sound = 'sound/creatures/headcrab_attack.ogg'
	speak_emote = list("hisses")
	var/is_zombie = 0
	robust_searching = 1
	var/host_species = ""
	var/list/human_overlays = list()

/mob/living/simple_animal/hostile/blackmesa/xen/headcrab/BiologicalLife(seconds, times_fired)
	if(..() && !stat)
		if(!is_zombie && isturf(src.loc))
			for(var/mob/living/carbon/human/H in oview(src, 1))
				if(!H.get_item_by_slot(ITEM_SLOT_HEAD) && prob(50))
					visible_message("<span class='danger'>[src] запрыгивает на голову [H], вгрызясь своими лапками в затылок жертвы!</span>", "<span class='danger'>[src] запрыгивает на голову [H], вгрызясь своими лапками в затылок жертвы!</span>")
					H.death(FALSE)
					Zombify(H)
					break
		if(times_fired % 4 == 0)
			for(var/mob/living/simple_animal/K in oview(src, 1))
				if(K.stat == DEAD)
					visible_message("<span class='danger'>[src] пожирает [K]!</span>")
					if(health < maxHealth)
						health += 10
					qdel(K)
					break

/mob/living/simple_animal/hostile/blackmesa/xen/headcrab/OpenFire(atom/A)
	if(check_friendly_fire)
		for(var/turf/T in getline(src,A))
			for(var/mob/living/L in T)
				if(L == src || L == A)
					continue
				if(faction_check_mob(L) && !attack_same)
					return
	visible_message("<span class='danger'><b>[src]</b> [ranged_message] at [A]!</span>")
	throw_at(A, jumpdistance, jumpspeed, spin = FALSE, diagonals_first = TRUE)
	ranged_cooldown = world.time + ranged_cooldown_time

/mob/living/simple_animal/hostile/blackmesa/xen/headcrab/proc/Zombify(mob/living/carbon/human/H)
	is_zombie = TRUE
	if(H.wear_suit)
		var/obj/item/clothing/suit/armor/A = H.wear_suit
		if(A.armor && A.armor.getRating("melee"))
			maxHealth += A.armor.getRating("melee")
	maxHealth += 200
	health = maxHealth
	name = "zombie"
	desc = "A corpse animated by the alien being on its head."
	melee_damage_lower += 10
	melee_damage_upper += 15
	ranged = 0
	stat_attack = CONSCIOUS
	icon = H.icon
	faction = list(FACTION_XEN)
	speak = list('sound/creatures/zombie_idle1.ogg','sound/creatures/zombie_idle2.ogg','sound/creatures/zombie_idle3.ogg')
	speak_chance = 50
	speak_emote = list("groans")
	attack_verb_continuous = "грызёт"
	attack_verb_simple = "грызёт"
	attack_sound = 'sound/creatures/zombie_attack.ogg'
	icon_state = "zombie2_s"
	H.hair_style = null
	H.update_hair()
	host_species = H.dna.species.name
	human_overlays = H.overlays
	update_icons()
	H.forceMove(src)
	visible_message("<span class='warning'>[H.name] восстаёт из мёртвых!</span>")

/mob/living/simple_animal/hostile/blackmesa/xen/headcrab/death()
	..()
	if(is_zombie)
		qdel(src)

/mob/living/simple_animal/hostile/blackmesa/xen/headcrab/handle_automated_speech() // This way they have different screams when attacking, sometimes. Might be seen as sphagetthi code though.
	if(speak_chance)
		if(rand(0,200) < speak_chance)
			if(speak && speak.len)
				playsound(get_turf(src), pick(speak), 200, 1)

/mob/living/simple_animal/hostile/headcrab/Destroy()
	if(contents)
		for(var/mob/M in contents)
			M.loc = get_turf(src)
	return ..()

/mob/living/simple_animal/hostile/blackmesa/xen/headcrab/update_icons()
	. = ..()
	if(is_zombie)
		overlays.Cut()
		overlays = human_overlays
		var/image/I = image('icons/mob/headcrab.dmi', icon_state = "headcrabpod")
		if(host_species == "Vox")
			I = image('icons/mob/headcrab.dmi', icon_state = "headcrabpod_vox")
		else if(host_species == "Gray")
			I = image('icons/mob/headcrab.dmi', icon_state = "headcrabpod_gray")
		overlays += I

/mob/living/simple_animal/hostile/blackmesa/xen/headcrab/CanAttack(atom/the_target)
	if(stat_attack == DEAD && isliving(the_target) && !ishuman(the_target))
		var/mob/living/L = the_target
		if(L.stat == DEAD)
			// Override default behavior of stat_attack, to stop headcrabs targeting dead mobs they cannot infect, such as silicons.
			return FALSE
	return ..()
