/mob/living/simple_animal/hostile/skibidi_toilet
	name = "Skibidi Human"
	desc = "Туалет... из которого выглядывает голова. Странно..."
	icon = 'modular_bluemoon/icons/mob/skibidi_toilet.dmi'
	icon_state = "skibidi_toilet"
	icon_living = "skibidi_toilet"
	icon_dead = "syndicate_dead"
	icon_gib = "syndicate_gib"
	maxHealth = 150
	health = 150
	response_harm_continuous = "harmlessly bite"
	response_harm_simple = "harmlessly punch"
	harm_intent_damage = 3
	obj_damage = 100
	melee_damage_lower = 15
	melee_damage_upper = 30
	attack_verb_continuous = "slashes"
	attack_verb_simple = "slashes"
	speed = -1
	environment_smash = ENVIRONMENT_SMASH_WALLS
	attack_sound = 'modular_bluemoon/sound/creatures/skibidi_attack.ogg'
	status_flags = CANKNOCKDOWN
	mob_size = MOB_SIZE_HUMAN
	del_on_death = TRUE
	force_threshold = 10
	move_to_delay = 1 // ГОТТА ФАСТ БОЙЙЙ
	speak_chance = 0
	AIStatus = AI_ON
	loot = list(/obj/effect/gibspawner/human)

/mob/living/simple_animal/hostile/skibidi_toilet/vulp
	name = "Skibidi Vulpa"
	desc = "Туалет... из которого выглядывает мохнатая голова. Странно..."
	icon_state = "skibidi_vulpa"
	icon_living = "skibidi_vulpa"
