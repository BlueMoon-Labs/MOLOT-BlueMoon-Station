/obj/item/pen/attack(mob/living/M, mob/living/user, stealth)
	if(!istype(M))
		return

	if(!force)
		if(M.can_inject(user, 1))
			if(user.a_intent == INTENT_HARM) //old poke requires harm intent.
				return ..()

			else //writing time
				var/mob/living/carbon/human/T = M
				if(!iscarbon(T)) //not carbon.
					return

				// BLUEMOON EDIT START - возможность писать на отдельных частях тела
				var/target_body_part = zone2body_parts_covered_complicated(user.zone_selected)
				if(!target_body_part)
					to_chat(user, span_warning("Вы должны выбрать часть тела!"))
					return

				var/list/items_on_target = list()
				items_on_target = T.get_equipped_items()

				for(var/A in items_on_target)
					var/obj/item/worn_clothes = A
					if(worn_clothes.body_parts_covered & target_body_part)
						to_chat(user, span_warning("Вам мешает одежда."))
						return

				var/obj/item/G = user.pick_receiving_organ(T, NONE, "Выбирите где оставить надпись", "Выберите CANCEL что-бы написать на выбранной конечности")
				// BLUEMOON ADD END

				/* BLUEMOON REMOVAL START - сверху более умная реализация по отдельным частям тела
				if(!T.is_chest_exposed())
					to_chat(user, "<span class='warning'>You cannot write on someone with their clothes on.</span>")
					return
				/ BLUEMOON REMOVAL END */

				var/obj/item/bodypart/BP = G ? G : T.get_bodypart(user.zone_selected) // Выборка части тела
				if(user.zone_selected == BODY_ZONE_PRECISE_GROIN) // проверка на гроин
					BP = T.get_bodypart(BODY_ZONE_CHEST)
				if(isnull(BP)) // Если выбраны глаза  или рот
					return
				/* BLUEMOON ADD START - перемещаем код выше
				var/obj/item/BP = (G ? G : T.get_bodypart(user.zone_selected))

				if(!BP)
					return
				/ BLUEMOON ADD END */

				if(target_body_part == 2) // проверка на туловище
					target_body_part = CHEST



				var/writting = input(user, "Оставить надпись, не заменяет уже имеющийся", "Надпись на [T]")  as text|null
				if(!writting)
					return

				if(user != T)
					src.visible_message("<span class='notice'>[user] начинает выводить надпись на [T]'s [BP.name].</span>")
				else
					to_chat(user, "<span class='notice'>Вы начали выводить надпись на [BP.name].</span>")

				if(do_mob(user, T, 4 SECONDS))
					if((length(BP.writtentext))+(length(writting)) < 130) //130 лимит символов.
						BP.writtentext += html_encode(writting) //you can add to text, not remove it.
					else
						to_chat(user, "<span class='notice'>Недостаточно места для надписи на [T]'s [BP.name].</span>")
						return

				if(!(user==T))
					to_chat(user, "<span class='notice'>Вы оставили надпись на [T]'s [BP.name].</span>")
				else
					to_chat(user, "<span class='notice'>Вы оставили надпись на [BP.name].</span>")
	else
		. = ..()


