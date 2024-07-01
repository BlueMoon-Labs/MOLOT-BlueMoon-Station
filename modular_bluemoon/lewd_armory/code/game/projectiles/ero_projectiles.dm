

/obj/item/projectile/beam/erodisabler
	name = "ero disabler beam"
	icon = 'modular_bluemoon/lewd_armory/icons/obj/effect/projectiles/projectile_lewd.dmi'
	icon_state = "omnilewd"
	damage = 30
	damage_type = STAMINA
	flag = ENERGY
	hitsound = 'sound/weapons/tap.ogg'
	eyeblur = 0
	pixels_per_second = TILES_TO_PIXELS(16.667)
	impact_effect_type = /obj/effect/temp_visual/impact_effect/lewd_disabler/lewd
	light_color = LIGHT_COLOR_PINK
	tracer_type = /obj/effect/projectile/tracer/disabler
	muzzle_type = /obj/effect/projectile/muzzle/disabler
	impact_type = /obj/effect/projectile/impact/disabler

/obj/item/projectile/beam/erodisabler/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(ishuman(target))
		var/mob/living/carbon/human/M = target // Присваиваем переменную цели
		var/wantsNoncon = FALSE //Переменная для префчека
		var/cooldown = M.lastlusttime + 600

		if(M.client && M.client?.prefs.erppref == "Yes" && CHECK_BITFIELD(M.client?.prefs.toggles, VERB_CONSENT) && M.client?.prefs.nonconpref == "Yes")
			wantsNoncon = TRUE //Назначаем переменную для префчека

		if((!wantsNoncon) || (HAS_TRAIT(M, TRAIT_NEVERBONER))) //Префчек
			return
		else
			if(prob(30)) //Сообщения цели в чат
				var/aroused_message = pick("Ваши бедра непроизвольно сомкнулись.", "Приятное покалывание ощущется в вашем паху.", "Вы чувствуете, как ток стимулирует вашу грудь.", "Мурашки пробегают по вашей коже.")
				to_chat(M, "<span class='userlove'>[aroused_message]</span>")
			if(prob(30)) //Стоны
				M.emote("moan")
			if(prob(20)) //Выбрасываем предмет из руки
				var/obj/item/I = M.get_active_held_item()
				if(!I)
					return
				else
					var/aroused_message = pick("Вы роняете предметы из рук, забывая о чем либо кроме своего тела", "Вы трогаете своё тело, в попытках унять возбуждение.")
					to_chat(M, "<span class='userlove'>[aroused_message]</span>")
					M.dropItemToGround(I)
			if(IS_STAMCRIT(M) && cooldown < world.time) // Если человек в крите и кд не прошло
				M.reagents.add_reagent(/datum/reagent/drug/aphrodisiac, 15)
				M.Jitter(25)
				M.Dizzy(25)
				M.cum() // Без таймера - жертва в стамкрите, будет возвращаться на эту строчку после каждого попадания.




