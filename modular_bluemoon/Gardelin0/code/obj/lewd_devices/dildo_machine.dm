/obj/structure/bed/dildo_machine
	name = "Dildo machine"
	desc = "It provides pleasure."
	icon = 'modular_bluemoon/Gardelin0/icons/obj/lewd_devices.dmi'
	icon_state = "dilmachine"
	anchored = 0
	var/mode = "normal"
	var/fuck_delay = 4
	var/on = 0
	var/hole = CUM_TARGET_VAGINA
	var/obj/item/dildo/attached_dildo = new /obj/item/dildo/custom
	buckle_lying = TRUE
	flags_1 = NODECONSTRUCT_1

/obj/structure/bed/dildo_machine/New()
	..()
	add_overlay(mutable_appearance('modular_bluemoon/Gardelin0/icons/obj/lewd_devices.dmi', "dilmachine_over", MOB_LAYER + 1))

/obj/structure/bed/dildo_machine/examine(mob/user)
	. = ..()
	if(attached_dildo)
		. += "There is a <span class='notice'>[attached_dildo.name]</span> attached to it."
		. += span_notice("Ctrl-Click \the [src.name] to detach dildo.")

/obj/structure/bed/dildo_machine/CtrlClick(mob/user)
	. = ..()
	if(!(attached_dildo) || !iscarbon(user) || !in_range(src, user))
		return
	if(on)
		to_chat(user, span_userlove("You can't detach the dildo from the machine while it's on."))
		return
	user.put_in_hands(attached_dildo)
	attached_dildo = null
	to_chat(user, span_userlove("You detach the dildo from the machine."))

/obj/structure/bed/dildo_machine/verb/change_hole()
	set name = "Change hole"
	set category = "Object"
	set src in oview(1)
	var/input = input(usr,"Change intensity mode") as null|anything in list("vagina", "anus")
	switch(input)
		if("vagina")
			hole = CUM_TARGET_VAGINA
		if("anus")
			hole = CUM_TARGET_ANUS

/obj/structure/bed/dildo_machine/verb/change_mode()
	set name = "Change mode"
	set category = "Object"
	set src in oview(1)

	var/input = input(usr,"Change intensity mode") as null|anything in list("low", "normal", "high")
	if(input)
		mode = input
		if(mode == "low")
			fuck_delay = 5
		if(mode == "normal")
			fuck_delay = 4
		if(mode == "high")
			fuck_delay = 2

/obj/structure/bed/dildo_machine/verb/toggle()
	set name = "Toggle dildo machine"
	set category = "Object"
	set src in oview(1)
	if(!on && !attached_dildo) // not active and missing dildo
		to_chat(usr, span_userlove("You can't toggle machine, without dildo."))
		return
	on = !on
	spawn()
		while(on)
			if(activate_after(src, fuck_delay))
				fuck()
	if(on)
		to_chat(usr, "[src] вкл.")
	else
		to_chat(usr, "[src] выкл.")

/obj/structure/bed/dildo_machine/proc/fuck()
	if(!on || !attached_dildo || !hole)
		return

	if(has_buckled_mobs())
		for(var/m in buckled_mobs)
			var/mob/living/carbon/human/M = m

			var/obj/item/organ/genital/organ = M.getorganslot(hole)
			if(!organ || !(organ.is_exposed() || organ.always_accessible))
				return

			attached_dildo.target_reaction(M,null,1,hole,null,TRUE,TRUE,TRUE,TRUE)
			M.client?.plug13.send_emote(hole == CUM_TARGET_ANUS ? PLUG13_EMOTE_ANUS : PLUG13_EMOTE_GROIN, min(fuck_delay * 5, 100), PLUG13_DURATION_NORMAL)
			playsound(loc, "modular_bluemoon/Gardelin0/sound/effect/lewd/interactions/bang[rand(1, 6)].ogg", 30, 1)
			var/message = "[pick("вгоняет дилдо в", "трахает")] [hole == CUM_TARGET_VAGINA ? "вагину" : "попку"] [M]"
			switch(mode)
				if("high")
					message = "[pick("активно","безжалостно","жестоко")] [pick("трахает", "насилует", "долбит")] [hole == CUM_TARGET_VAGINA ? "вагину" : "попку"] [M]"
				if("low")
					message = "[pick("медленно","плавно","мягко")] [pick("вводит дилдо в", "погружает дилдо в")] [hole == CUM_TARGET_VAGINA ? "вагину" : "попку"] [M]"
			visible_message(span_love("\the [src] [message]"))
			/*
			switch(hole)
				if(CUM_TARGET_VAGINA)
					if(M.has_vagina(REQUIRE_EXPOSED))
						fuck_hole = "pussy"
						M.handle_post_sex(fuck_delay, null, src)
						M.client?.plug13.send_emote(PLUG13_EMOTE_GROIN, min(fuck_delay * 5, 100), PLUG13_DURATION_NORMAL)
						playsound(loc, "modular_bluemoon/Gardelin0/sound/effect/lewd/interactions/bang[rand(1, 6)].ogg", 30, 1)
						switch(mode)
							if("low")
								to_chat(M, span_love(pick("Я чувствую слабые фрикции в киске!", "Оно слабо стимулирует мне вагину!")))
							if("normal")
								to_chat(M, span_love(pick("Я чувствую фрикции в киске!", "Оно стимулирует мне вагину!")))
							if("high")
								to_chat(M, span_userdanger(pick("Сильные фрикции в киске сводят меня с ума!", "Вы чувствуете мучительное удовольствие от сильной стимуляции вагины!")))
								M.Jitter(3)
								M.Stun(3)
								if(prob(50))
									M.emote("moan")
				if(CUM_TARGET_ANUS)
					if(M.has_anus(REQUIRE_EXPOSED))
						M.handle_post_sex(fuck_delay, null, src)
						M.client?.plug13.send_emote(PLUG13_EMOTE_ANUS, min(fuck_delay * 5, 100), PLUG13_DURATION_NORMAL)
						playsound(loc, "modular_bluemoon/Gardelin0/sound/effect/lewd/interactions/bang[rand(1, 6)].ogg.ogg", 30, 1)
						switch(mode)
							if("low")
								to_chat(M, span_love(pick("Я чувствую слабые фрикции в попе!", "Оно слабо стимулирует мне анус!")))
							if("normal")
								to_chat(M, span_love(pick("Я чувствую фрикции в попе!", "Оно стимулирует мне анус!")))
							if("high")
								to_chat(M, span_userdanger(pick("Сильные фрикции в попе сводят меня с ума!", "Вы чувствуете мучительное удовольствие от сильной стимуляции ануса!")))
								M.Jitter(3)
								M.Stun(3)
								if(prob(50))
									M.emote("moan")
				*/
/obj/structure/bed/dildo_machine/attackby(obj/item/used_item, mob/user, params)
	add_fingerprint(user)
	if(used_item.tool_behaviour == TOOL_WRENCH)
		to_chat(user, "<span class='notice'>You begin to [anchored ? "unwrench" : "wrench"] [src].</span>")
		if(used_item.use_tool(src, user, 20, volume=30))
			to_chat(user, "<span class='notice'>You successfully [anchored ? "unwrench" : "wrench"] [src].</span>")
			setAnchored(!anchored)
	else if(istype(used_item, /obj/item/screwdriver))
		to_chat(user, span_notice("You unscrew the frame and begin to deconstruct it..."))
		playsound(loc, "'sound/items/screwdriver.ogg'", 30, 1)
		if(used_item.use_tool(src, user, 8 SECONDS, volume = 50))
			to_chat(user, span_notice("You disassemble it."))
			var/obj/item/dildo_machine_kit/machine = new /obj/item/dildo_machine_kit (src.loc)
			qdel(machine.attached_dildo)
			machine.attached_dildo = null
			if(attached_dildo)
				attached_dildo.forceMove(machine)
				machine.attached_dildo = attached_dildo
				attached_dildo = null
			qdel(src)
	else if(!attached_dildo && istype(used_item, /obj/item/dildo) && !(used_item.item_flags & ABSTRACT))
		if(user.transferItemToLoc(used_item, src))
			attached_dildo = used_item
			return TRUE
	else
		return ..()

/obj/item/dildo_machine_kit
	name = "dildo machine construction kit"
	desc = "Construction requires a screwdriver. Put it on the ground first!"
	icon = 'modular_bluemoon/Gardelin0/icons/obj/lewd_devices.dmi'
	icon_state = "kit"
	throwforce = 0
	var/unwrapped = 0
	w_class = WEIGHT_CLASS_HUGE
	var/obj/item/dildo/attached_dildo = new /obj/item/dildo/custom

/obj/item/dildo_machine_kit/examine(mob/user)
	. = ..()
	if(attached_dildo)
		. += "There is a <span class='notice'>[attached_dildo.name]</span> inside, but you can't pull it out."

/obj/item/dildo_machine_kit/attackby(obj/item/used_item, mob/user, params) //constructing a bed here.
	add_fingerprint(user)
	if(istype(used_item, /obj/item/screwdriver))
		if (!(item_flags & IN_INVENTORY) && !(item_flags & IN_STORAGE))
			to_chat(user, span_notice("You screw the frame to the floor and begin to construct it..."))
			playsound(loc, "'sound/items/screwdriver.ogg'", 30, 1)
			if(used_item.use_tool(src, user, 8 SECONDS, volume = 50))
				to_chat(user, span_notice("You assemble it."))
				var/obj/structure/bed/dildo_machine/machine = new /obj/structure/bed/dildo_machine (src.loc)
				qdel(machine.attached_dildo)
				machine.attached_dildo = null
				if(attached_dildo)
					attached_dildo.forceMove(machine)
					machine.attached_dildo = attached_dildo
					attached_dildo = null
				qdel(src)
			return
	else
		return ..()
