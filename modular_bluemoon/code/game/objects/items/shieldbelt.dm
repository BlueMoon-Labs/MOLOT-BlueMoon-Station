// Inteq type
/obj/item/shieldbelt
	name = "shielded belt"
	desc = "A belt with built in energy shielding. Will rapidly recharge when not under fire."
	icon = 'modular_bluemoon/icons/obj/clothing/belts.dmi'
	icon_state = "shieldbelt"
	item_state = "belt"
	slot_flags = ITEM_SLOT_BELT
	allowed = null

	var/max_charges = 3 //How many charges total the shielding has
	var/current_charges //if null, will default to max_chargs
	var/recharge_delay = 200 //How long after we've been shot before we can start recharging. 20 seconds here
	var/recharge_rate = 1 //How quickly the shield recharges once it starts charging
	var/shield_state = "shield-yellow"


/obj/item/shieldbelt/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/shielded, current_charges, max_charges, recharge_delay, recharge_rate, ITEM_SLOT_BELT, shield_state)

/obj/item/shieldbelt/equipped(mob/user, slot)
	..()
	if(slot == ITEM_SLOT_BELT)
		if(!IS_INTEQ(user))
			to_chat(user, "<span class='danger'><B>ЗАЩИТНОЕ УСТРОЙСТВО 'ПУЗЫРЬ'</B>: Обнаружены неавторизованные сигнатуры. <B>Производится нейтрализация экипировки.</B></span>")
			playsound(get_turf(src), 'sound/machines/nuke/confirm_beep.ogg', 65, 1, 1)
			addtimer(CALLBACK(src, PROC_REF(explode)), 3 SECONDS)

/obj/item/shieldbelt/proc/explode()
	do_sparks(3, 1, src)
	explosion(src.loc,0,1,1,1)
	qdel(src)

