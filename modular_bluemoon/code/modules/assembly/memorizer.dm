/obj/item/assembly/flash/memorizer
	name = "anomaly neutrolizer"
	desc = "A one-use device capable of instantly neutralizing substances."
	icon = 'icons/obj/device.dmi'
	icon_state = "memorizer2"

/obj/item/assembly/flash/memorizer/flash_carbon(mob/living/carbon/M, mob/user, power = 15, targeted = TRUE, generic_message = FALSE)
	if(!istype(M))
		return
	if(user)
		log_combat(user, M, "[targeted? "flashed(targeted) with memorizer" : "flashed(AOE) with memorizer"]", src)
	else //caused by emp/remote signal
		M.log_message("was [targeted? "flashed(targeted) with memorizer" : "flashed(AOE) with memorizer"]",LOG_ATTACK)
	if(generic_message && M != user)
		to_chat(M, "<span class='disarm'>[src] производит резкую вспышку неприятного свечения!</span>")
	if(targeted)
		if(M.flash_act(1, 1))
			if(M.confused < power)
				var/diff = power * CONFUSION_STACK_MAX_MULTIPLIER - M.confused
				M.confused += min(power, diff)
			if(user)
				terrible_conversion_proc(M, user)
				//visible_message("<span class='disarm'>[user] ошеломляет [M] флешером!</span>")
				to_chat(user, "<span class='danger'>Ты стёр [M] память!</span>")
				if(HAS_TRAIT(M, TRAIT_MINDSHIELD))
					to_chat(M, "<span class='reallybig'>Я не помню, что делал последние 10 минут...</span>")
					tgui_alert_async(M, "Я не помню, что делал последние 10 минут...")
				else
					to_chat(M, "<span class='reallybig'>Я ничего не помню. НИ-ЧЕ-ГО!</span>")
					tgui_alert_async(M, "Я ничего не помню. НИ-ЧЕ-ГО!")
			var/toblur = 20 - M.eye_blurry
			if(toblur > 0)
				M.blur_eyes(toblur)
		else if(user)
			//visible_message("<span class='disarm'>[user] не удалось ошеломить [M] флешером!</span>")
			to_chat(user, "<span class='warning'>Тебе не удалось стереть [M] память!</span>")
			//to_chat(M, "<span class='danger'>[user] не удалось ошеломить тебя!</span>")
		//else
			//to_chat(M, "<span class='danger'>[src] не удалось ошеломить тебя!</span>")
	else
		if(M.flash_act())
			var/diff = power * CONFUSION_STACK_MAX_MULTIPLIER - M.confused
			M.confused += min(power, diff)
/obj/item/assembly/flash/memorizer/burn_out() //Made so you can override it if you want to have an invincible flash from R&D or something.
	if(!crit_fail)
		crit_fail = TRUE
		icon_state="memorizerburnt"
	if(ismob(loc))
		var/mob/M = loc
		M.visible_message("<span class='danger'>[src] burns out!</span>","<span class='userdanger'>[src] burns out!</span>")
	else
		var/turf/T = get_turf(src)
		T.visible_message("<span class='danger'>[src] burns out!</span>")
