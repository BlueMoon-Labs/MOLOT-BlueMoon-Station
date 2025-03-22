/obj/item/melee/baseball_bat
	hole = CUM_TARGET_VAGINA

/obj/item/melee/baseball_bat/AltClick(mob/living/carbon/human/user as mob)
	hole = hole == CUM_TARGET_VAGINA ? CUM_TARGET_ANUS : CUM_TARGET_VAGINA
	to_chat(user, "<span class='notice'>Я целюсь в... [hole].</span>")

/obj/item/melee/baseball_bat/attack(mob/living/target, mob/living/user)
	. = ..()
	if(homerun_ready && !HAS_TRAIT(user, TRAIT_PACIFISM) && user != target)
		if(!user.canUseTopic(target, BE_CLOSE))
			return
		var/atom/throw_target = get_edge_target_turf(target, user.dir)
		user.DelayNextAction(CLICK_CD_MELEE)
		user.visible_message("<span class='userdanger'>It's a home run!</span>")
		target.throw_at(throw_target, rand(8,10), 14, user)
		target.ex_act(EXPLODE_HEAVY)
		playsound(get_turf(src), 'sound/weapons/homerun.ogg', 100, TRUE)
		homerun_ready = 0
		return
	else if(!target.anchored && !HAS_TRAIT(user, TRAIT_PACIFISM))
		if(!user.canUseTopic(target, BE_CLOSE))
			return
		var/atom/throw_target = get_edge_target_turf(target, user.dir)
		user.DelayNextAction(CLICK_CD_MELEE)
		// BLUEMOON ADDITION AHEAD - нельзя отправлять в полёт тяжёлых, т.к. у них модификатор к урону и это можно абузить для предотвращения проблем с мобильностью
		if(target.mob_weight > MOB_WEIGHT_NORMAL)
			return
		// Нельзя отправить в полёт самого себя
		if(user != target)
			var/whack_speed = (prob(60) ? 1 : 4)
			target.throw_at(throw_target, rand(1, 2), whack_speed, user) // sorry friends, 7 speed batting caused wounds to absolutely delete whoever you knocked your target into (and said target)
		// BLUEMOON ADDITION END
		return

// Prova, cause I can

/obj/item/melee/baton/prova
	name = "prova"
	desc = "An enhanced taser stick, a favorite of the legendary John Prodman."
	icon = 'modular_splurt/icons/obj/items_and_weapons.dmi'
	icon_state = "prova"
	lefthand_file = 'modular_splurt/icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'modular_splurt/icons/mob/inhands/weapons/melee_righthand.dmi'
	item_state = "prova"
