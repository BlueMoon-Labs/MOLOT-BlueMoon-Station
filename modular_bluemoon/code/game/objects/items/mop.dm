/obj/item/mop/advanced
	var/max_upgrades = 4
	var/list/installed_upgrade = list()

/obj/item/mop/advanced/examine(mob/user)
	. = ..()
	if(max_upgrades)
		. += span_notice("It has [max_upgrades] modification slots.")
	if(installed_upgrade)
		. += span_notice("It has been upgraded with [installed_upgrade.len] modification, which can be removed with a screwdriver.")

/obj/item/mop/advanced/proc/clean_upgrades()
	refill_rate = initial(refill_rate)
	refill_reagent = initial(refill_reagent)
	stamusage = initial(stamusage)
	mopcap = initial(mopcap)
	reagents.clear_reagents()
	reach = initial(reach)
	installed_upgrade = list()

/obj/item/advanced_mop_upgrade
	name = "advanced mop modification kit"
	desc = "An upgrade for advacned mop."
	icon = 'icons/obj/objects.dmi'
	icon_state = "modkit"
	var/refill_rate
	var/modification_reagent
	var/stamusage
	var/mopcap
	var/reach_modif

/obj/item/advanced_mop_upgrade/proc/caninstall(obj/item/mop/advanced/MOP)
	if(MOP.installed_upgrade?.len >= MOP.max_upgrades)
		return FALSE
	if(reach_modif && MOP.reach >= 2)
		return FALSE
	if(mopcap && MOP.mopcap + mopcap < 1)
		return FALSE
	if(stamusage && MOP.stamusage + stamusage < 0)
		return FALSE
	if(refill_rate && MOP.refill_rate + refill_rate < 0)
		return FALSE
	if(modification_reagent && MOP.refill_reagent != initial(MOP.refill_reagent))
		return FALSE
	return TRUE

/obj/item/advanced_mop_upgrade/proc/install(obj/item/mop/advanced/MOP)
	MOP.installed_upgrade += src
	if(refill_rate)
		MOP.refill_rate = max(0, MOP.refill_rate + refill_rate)
	if(stamusage)
		MOP.stamusage = max(0, MOP.stamusage + stamusage)
	if(modification_reagent)
		MOP.refill_reagent = modification_reagent
		MOP.reagents.clear_reagents()
	if(mopcap)
		MOP.mopcap = max(1, MOP.mopcap + mopcap)
		MOP.reagents.clear_reagents()
		MOP.reagents.maximum_volume = MOP.mopcap
	if(reach_modif)
		MOP.reach = clamp(MOP.reach + reach_modif, 1, 2)

/obj/item/advanced_mop_upgrade/proc/uninstall(obj/item/mop/advanced/MOP)
	if(src in MOP.installed_upgrade)
		MOP.installed_upgrade -= src
	if(refill_rate)
		MOP.refill_rate = max(0, MOP.refill_rate - refill_rate)
	if(stamusage)
		MOP.stamusage = max(0, MOP.stamusage - stamusage)
	if(modification_reagent)
		MOP.refill_reagent = initial(MOP.refill_reagent)
		MOP.reagents.clear_reagents()
	if(mopcap)
		MOP.mopcap = max(1, MOP.mopcap - mopcap)
		MOP.reagents.clear_reagents()
		MOP.reagents.maximum_volume = MOP.mopcap
	if(reach_modif)
		MOP.reach = clamp(MOP.reach - reach_modif, 1, 2)

/obj/item/mop/advanced/attackby(obj/item/I, mob/user, params)
	if(user.a_intent == INTENT_HARM)
		return ..()

	if(istype(I, /obj/item/advanced_mop_upgrade))
		var/obj/item/advanced_mop_upgrade/new_upgrade = I
		if(!new_upgrade.caninstall(src))
			to_chat(user, span_warning("[src] upgrades conflict! Use a screwdriver to remove them."))
			return
		new_upgrade.forceMove(src)
		new_upgrade.install(src)
		to_chat(user, span_notice("You upgrade [src] with [new_upgrade]."))
		return

	else if(I.tool_behaviour == TOOL_SCREWDRIVER && installed_upgrade.len)
		I.play_tool_sound(src, 50)
		to_chat(user, span_notice("You remove upgrades from [src]"))
		for(var/obj/item/advanced_mop_upgrade/upgrade in installed_upgrade)
			upgrade.forceMove(get_turf(user))
			upgrade.uninstall(src)
		clean_upgrades()

	return ..()

/obj/item/advanced_mop_upgrade/cleaner
	name = "(advanced mop) cleaner modification kit"
	desc = "Меняет производимый в швабре реагент на клинер за счёт утяжеления конструкции."
	modification_reagent = /datum/reagent/space_cleaner
	stamusage = 5	// ну типо генератор клинера тяжёлый

/obj/item/advanced_mop_upgrade/cleaner/attackby(obj/item/nullrod/I, mob/user, params)
	if(istype(I))
		new /obj/item/advanced_mop_upgrade/holy(get_turf(src))
		playsound(I, 'sound/effects/ding.ogg', 50)
		user.visible_message("[user] ударяет [I] по [src] с небольшим звоном.")
		qdel(src)
		return
	..()

/obj/item/advanced_mop_upgrade/holy
	name = "(advanced mop) holy modification kit"
	desc = "Меняет производимый в швабре реагент на святую воду за счёт сильного утяжеления конструкции."
	modification_reagent = /datum/reagent/water/holywater
	refill_rate = -0.75
	stamusage = 10	// тяжёлые наши грехи

/obj/item/advanced_mop_upgrade/charge_rate
	name = "(advanced mop) charge rate modification kit"
	desc = "Увеличивает генерацию реагентов за счёт утяжеления конструкции."
	refill_rate = 0.25
	stamusage = 1

/obj/item/advanced_mop_upgrade/light
	name = "(advanced mop) light modification kit"
	desc = "Уменьшает тяжесть использования оборудованием."
	stamusage = -2

/obj/item/advanced_mop_upgrade/capacity
	name = "(advanced mop) capacity modification kit"
	desc = "Увеличивает хранилище швабры за счёт уменьшения скорости производства реагента."
	mopcap = 10
	refill_rate = -0.1

/obj/item/advanced_mop_upgrade/reach
	name = "(advanced mop) reach modification kit"
	desc = "Увеличивает дальность использования швабры за счёт утяжеления конструкции."
	reach_modif = 1
	stamusage = 5
