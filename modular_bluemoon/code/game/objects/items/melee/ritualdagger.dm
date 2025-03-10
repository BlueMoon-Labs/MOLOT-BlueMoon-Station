/obj/item/toy/crayon/ritualdagger
	name = "Ritual dagger"
	icon = 'modular_bluemoon/icons/obj/items_and_weapons.dmi'
	icon_state = "dagger"
	item_state = "switchblade_ext"
	lefthand_file = 'icons/mob/inhands/weapons/swords_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/swords_righthand.dmi'
	desc = "A fancy short knife used to make blood arts."
	force = 10
	w_class = WEIGHT_CLASS_SMALL
	throwforce = 5
	throw_speed = 3
	throw_range = 5
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb = list("stabbed", "slashed", "cut")
	resistance_flags = FIRE_PROOF
	sharpness = SHARP_POINTY
	bare_wound_bonus = 20
	charges = -1
	paint_color = "#FF0000"
	var/next_check = 0 //cooldown handler
	var/cooldown = 10
	edible = FALSE

/obj/item/toy/crayon/ritualdagger/attack(mob/living/carbon/target, mob/living/carbon/user)
	if(next_check < world.time)
		if(user.a_intent == INTENT_HELP)
			if(isliving(target))
				next_check = world.time + cooldown
				paint_color = target.dna.species.exotic_blood_color
				target.blood_volume -= 15
				target.apply_damage(2, BRUTE, pick(BODY_ZONE_L_ARM, BODY_ZONE_R_ARM))
				target = target.loc
				draw_on(target, user)
		else
			..()
	else
		return

/obj/item/toy/crayon/ritualdagger/afterattack(atom/target, mob/user, proximity, params)
	return
