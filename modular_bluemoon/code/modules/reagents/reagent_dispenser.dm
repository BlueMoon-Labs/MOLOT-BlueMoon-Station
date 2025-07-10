// Kvass barrel
/obj/structure/reagent_dispensers/kvass_barrel
	name = "kvass barrel"
	desc = "A yellow-green barrel full of kvass."
	icon = 'modular_bluemoon/icons/obj/reagent_dispensers.dmi'
	icon_state = "kvassbarrel"
	reagent_id = /datum/reagent/consumable/kvass

/obj/structure/reagent_dispensers/beerkeg/attack_animal(mob/living/simple_animal/M)
	var/explosion_chance = 10
	if(M.a_intent == INTENT_HARM)
		explosion_chance += 30

	M.visible_message(span_danger("[M] играется с пивной кегой!"),
		span_nicegreen("Ты играешься с пивной кегой!"),
		span_hear("Кто-то катает пивную кегу рядом с вами!"))

	if(prob(explosion_chance) && isdog(M))
		explosion(src, light_impact_range = 3, flame_range = 5, flash_range = 10)
		playsound(src, 'sound/effects/kega.ogg', 100, 1)
		if(!QDELETED(src))
			qdel(src)
		return TRUE
	else
		playsound(M, 'sound/weapons/thudswoosh.ogg', 100, TRUE, 1)
		do_jitter_animation()
	. = ..()

/obj/structure/reagent_dispensers/beerkeg/on_attack_hand(mob/living/carbon/M)
	. = ..()

	var/explosion_chance = 10
	if(M.a_intent == INTENT_HARM)
		explosion_chance += 10
	if(ismonkey(M))
		explosion_chance += 10
	if(isdwarf(M)) // ROCK AND STONE!
		explosion_chance = 0

	var/message = ""
	var/self_message = ""
	var/blind_message = span_hear("Кто-то катает пивную кегу рядом с вами!")

	if(!explosion_chance)
		message = span_nicegreen("[M] мастерски играется с пивной кегой!")
		self_message = span_nicegreen("Ты мастерски играешься с пивной кегой!")
	else
		if(M.a_intent == INTENT_HARM)
			message = span_danger("[M] пинает пивную кегу!")
			self_message = span_danger("Ты пинаешь пивную кегу!")
			blind_message = span_hear("Кто-то пинает пивную кегу рядом с вами!")
		else
			message = span_danger("[M] играется с пивной кегой!")
			self_message = "[span_nicegreen("Ты играешься с пивной кегой!")] [span_warning("Кажется это небезопасно...")]"
	M.visible_message(message, self_message, blind_message)

	if(prob(explosion_chance) && ishuman(M) || ismonkey(M))
		explosion(src, light_impact_range = 3, flame_range = 5, flash_range = 10)
		playsound(src, 'sound/effects/kega.ogg', 100, 1)
		if(!QDELETED(src))
			qdel(src)
		return TRUE
	else
		playsound(M, 'sound/weapons/thudswoosh.ogg', 100, TRUE, 1)
		do_jitter_animation()

/obj/structure/reagent_dispensers/proc/do_jitter_animation(jitteriness = 10)
	if(anchored)
		return
	var/amplitude = min(4, (jitteriness/100) + 1)
	var/pixel_x_diff = rand(-amplitude, amplitude)
	var/pixel_y_diff = rand(-amplitude/3, amplitude/3)
	var/final_pixel_x = pixel_x
	var/final_pixel_y = pixel_y
	animate(src, pixel_x = pixel_x_diff, pixel_y = pixel_y_diff , time = 2, loop = 6, flags = ANIMATION_PARALLEL | ANIMATION_RELATIVE)
	animate(pixel_x = final_pixel_x , pixel_y = final_pixel_y , time = 2)
	floating_need_update = TRUE
