// Ported from BayStation12

/obj/item/device/cooler
	name = "portable cooling unit"
	desc = "PCU is a large portable heat sink with liquid cooled radiator packaged into a modified backpack. \
	It has an internal power unit with power rating of 10 KJ. There is the magnetic charger on top of the PCU for recharging. \
	System of strapes allows it to be worn <b>as a suit, on your back, strapped to a hazard vest, an armor or a hardsuit</b>."
	w_class = WEIGHT_CLASS_BULKY // Не лезет в сумку
	icon = 'modular_bluemoon/icons/obj/cooling_device.dmi'
	mob_overlay_icon = 'modular_bluemoon/icons/mob/clothing/back.dmi'
	anthro_mob_worn_overlay = 'modular_bluemoon/icons/mob/clothing/back.dmi'
	lefthand_file = 'modular_bluemoon/icons/mob/inhands/clothing_lefthand.dmi'
	righthand_file = 'modular_bluemoon/icons/mob/inhands/clothing_righthand.dmi'
	icon_state = "suitcooler"
	item_state = "suitcooler"
	slot_flags = ITEM_SLOT_BACK | ITEM_SLOT_OCLOTHING // Можно вешать на спину и на грудь (а также в слот хранилища некоторых костюмов)

	flags_1 = CONDUCT_1
	force = 8 // тяжёлое
	throwforce = 8
	throw_speed = 1
	throw_range = 4
	actions_types = list(/datum/action/item_action/toggle)

	custom_materials = list(/datum/material/iron = 30000, /datum/material/glass = 4500)

	var/on = FALSE					// включено или нет
	var/max_cooling = 18			// максимальное охлаждение, нужно для борьбы с нагревом в космосе
	var/is_charging = FALSE			// В процессе зарядки
	var/charge_consumption = 5.5	// Дж, используемый charge при максимальном охлаждении (около 30 минут при заряде в 10000)
	var/charge = 0					// Мы не используем батарейки, чтобы не было халявных накопителей высокой мощности из любого техфаба
	var/roundstart_charged = FALSE	// Для размещения на карте с начала раунда, заряженный вариант
	var/max_charge = 10000			// 10 кДж
	var/thermostat = T20C			// К какой температуре стремиться

/obj/item/device/cooler/charged // Заряжённый при размещении
	roundstart_charged = TRUE

///////////////////////////////////////////////////////////////////////////

/obj/item/device/cooler/lavaland // Специальный для шахтёров и планетоидов
	name = "mining cooling unit"
	desc = "PCU is a large portable heat sink with liquid cooled radiator packaged into a modified backpack. \
	It has an internal power unit with rating of 6 KJ, which can be charge with APCs or power cells with the magnetic charger on top of PCU. \
	System of strapes allows it to be worn <b>as a suit, on your back, on belt, strapped to a hazard vest, an armor an exploration suit or a hardsuit</b>. \
	Cooling efficient was significantly reduced, but it still can be used for planetary operations."
	slot_flags = ITEM_SLOT_BELT |  ITEM_SLOT_BACK | ITEM_SLOT_OCLOTHING
	force = 5 // маленький, но далеко не лёгкий
	max_cooling = 6 // этого вполне хватает для планетоида
	charge_consumption = 3.3 // 30 минут работы при полном заряде
	max_charge = 6000
	custom_materials = list(/datum/material/iron = 22000, /datum/material/glass = 3000)

/obj/item/device/cooler/lavaland/charged // Заряжённый при размещении (выдаётся при спавне шахтёрам-синтетикам в том числе)
	roundstart_charged = TRUE

///////////////////////////////////////////////////////////////////////////

/obj/item/device/cooler/ui_action_click(mob/living/user)
	toggle(usr)

/obj/item/device/cooler/Initialize()
	. = ..()
	if(roundstart_charged)
		charge = max_charge
	update_icon()

/obj/item/device/cooler/Destroy()
	. = ..()
	STOP_PROCESSING(SSobj, src)

/obj/item/device/cooler/process()
	update_icon()
	if(charge <= 0) // Если заряда нет, выключаемся и выдаём сообщение об аварии
		turn_off(1)
		return

	if(!is_in_slot()) // Если не в слоте, энергия всё равно потребляется
		charge -= charge_consumption
		return

	var/mob/living/carbon/human/H = loc

	var/temp_adj = min(H.bodytemperature - thermostat, max_cooling)

	if (temp_adj < 0.5)	//only cools, doesn't heat, also we don't need extreme precision
		charge -= charge_consumption
		return

	var/charge_usage = (temp_adj/max_cooling)*charge_consumption

	H.bodytemperature -= temp_adj

	charge -= charge_usage

/obj/item/device/cooler/emp_act(severity)
	. = ..()
	if(. & EMP_PROTECT_SELF)
		return

	if(on)
		if(prob(50))
			turn_off(1)

	charge -= severity * rand(20, 25)
	if(charge < 0)
		charge = 0
	update_icon()

// Checks whether the cooling unit is being worn on the back/suit slot.
// That way you can't carry it in your hands while it's running to cool yourself down.
/obj/item/device/cooler/proc/is_in_slot()
	var/mob/living/carbon/human/H = loc
	if(!istype(H))
		return 0

	return (H.back == src) || (H.s_store == src) || (H.belt == src) || (H.wear_suit == src)

/obj/item/device/cooler/proc/turn_on()
	if(charge <= 0)
		return

	on = TRUE
	START_PROCESSING(SSobj, src)
	update_icon()

/obj/item/device/cooler/proc/turn_off(failed)
	if(failed)
		visible_message(span_warning("The PCU clicks and whines as it powers down."))
	on = FALSE
	STOP_PROCESSING(SSobj, src)
	update_icon()

/obj/item/device/cooler/attack_self(mob/user)
	toggle(user)

/obj/item/device/cooler/proc/toggle(mob/user)
	if(charge <= 0)
		to_chat(user, span_warning("You press a switch button on the PCU, but it doesn't respond. Perhaps it is out of charge."))
		return

	if(on)
		turn_off()
	else
		turn_on()

	to_chat(user, span_notice("You switch the PCU [on ? "on" : "off"]."))

/obj/item/device/cooler/proc/drain_power(atom/target, mob/user, var/is_apc = FALSE)
	var/maxcapacity = FALSE // Если достигнут максимальный заряд, прекращаем заряжаться
	var/drain = 500 // Дж
	is_charging = TRUE

	if(is_apc)
		var/obj/machinery/power/apc/apc = target

		user.visible_message(span_notice("[user] puts the PCU's magnetic charger on [is_apc ? "the APC" : "\a [target]"]."), span_notice("You hold the magnetic charger over [is_apc ? "the APC" : "\a [target]"]. It's getting hotter."))
		while(charge < max_charge) // Если не достигнут максимальный заряд ПОУ и в источник ещё есть заряд, продолжаем заряжаться

			if(apc.surplus() < drain * 20) // Не подключен к сети, в которой есть напряжение, достаточное для зарядки ПОУ
				user.visible_message(span_notice("[user] takes back the PCU's magnetic charger as it buzzes."), span_warning("The magnetic charger buzzes - the APC isn't connected to a powernet with enough power to charge, as it need at leat 10 KWs due high-speed charge. You take it back and place it in the socket on the PCU."))
				break

			if(charge + drain > max_charge)
				drain = max_charge - charge
				maxcapacity = TRUE
				playsound(src.loc, 'sound/machines/beep.ogg', 50, 0)

			if(!do_after(user, 1.5 SECONDS, target = user))
				user.visible_message(span_notice("[user] takes back the PCU's magnetic charger."), span_notice("You take back the magnetic charger and place it in the socket on the PCU."))
				break
			apc.use_power(drain * 20) // я-забил-хрен-на-подсчёт-кВт*ч-для-работы-этой-штуки, по итогу зарядка через АПЦ просто неэффективна по энергии
			charge += drain
			target.update_icon()
			if(maxcapacity)
				user.visible_message(span_notice("[user] takes back the PCU's magnetic charger."), span_notice("You take back the magnetic charger as it beep and place it in the socket on the PCU."))
	is_charging = FALSE

	if(istype(target, /obj/item/stock_parts/cell))
		var/obj/item/stock_parts/cell/cell = target

		if(!cell.charge)
			return

		user.visible_message(span_notice("[user] puts the PCU's magnetic charger on [is_apc ? "the APC" : "\a [target]"]."), span_notice("You hold the magnetic charger over [is_apc ? "the APC" : "\a [target]"]. It's getting hotter."))
		while(cell.charge > 0 && !maxcapacity)

			if(cell.charge < drain) // Высасываем оставшийся заряд, а не сверх него
				drain = cell.charge

			if(charge + drain > max_charge)
				drain = max_charge - charge
				maxcapacity = TRUE
				playsound(src.loc, 'sound/machines/beep.ogg', 50, 0)

			if(!do_after(user, 1.5 SECONDS, target = user))
				user.visible_message(span_notice("[user] takes back the PCU's magnetic charger."), span_notice("You take back the magnetic charger and place it in the socket on the PCU."))
				break

			cell.charge -= drain
			charge += drain
			target.update_icon()
			if(maxcapacity || !cell.charge)
				user.visible_message(span_notice("[user] takes back the PCU's magnetic charger."), span_notice("You take back the magnetic charger as it beep and place it in the socket on the PCU."))

	charge = clamp(charge, 0, max_charge) // не меньше нуля, не больше максимума

/obj/item/device/cooler/attack_obj(atom/target, mob/user)
	if(istype(target, /obj/machinery/power/apc))
		if(is_charging)
			to_chat(user, span_warning("You are already charging [src]!"))
			return
		drain_power(target, user, is_apc = TRUE)
		return
	. = ..()

/obj/item/device/cooler/afterattack(atom/target, mob/user, proximity, params)
	. = ..()
	if(!proximity || !check_allowed_items(target))
		return

	if(istype(target, /obj/item/stock_parts/cell))
		if(is_charging)
			to_chat(user, span_warning("You are already charging [src]!"))
			return
		drain_power(target, user)
		return

/obj/item/device/cooler/update_icon()
	cut_overlays()
	icon_state = "suitcooler"

	if(!on)
		return

	switch(round(100*charge/max_charge))
		if(86 to INFINITY)
			overlays.Add("battery-0")
		if(69 to 85)
			overlays.Add("battery-1")
		if(52 to 68)
			overlays.Add("battery-2")
		if(35 to 51)
			overlays.Add("battery-3")
		if(18 to 34)
			overlays.Add("battery-4")
		if(-INFINITY to 17)
			overlays.Add("battery-5")

/obj/item/device/cooler/examine(user, distance)
	. = ..()
	if(distance >= 1)
		return

	if(on)
		. += span_info("It is switched on and running.")
	else
		. += span_info("It is switched off.")

	if(charge > 0)
		. += span_info("The charge meter reads [round(100*charge/max_charge)]%.")
	else
		. += span_warning("The charge meter is blank.")

	. += span_info("You can charge it with APCs or power cells.")

	. += span_info("Вы можете называть это \"ПОУ\" или \"PCU\".") // Распространяем терминологию через IC

///////////////////////////////////////////////////////////////////////////

/obj/item/device/cooler/advanced // Улучшенный кулер меньших размеров
	name = "advanced PCU"
	desc = "PCU is a large portable heat sink with liquid cooled radiator packaged into a modified backpack. \
	This is modernized version designed for mobility, holding on a belt and storing in your backpack storage. \
	Carrying uranium elements feels to be oddly unhealthy... Not for a synths, though?"
	w_class = WEIGHT_CLASS_NORMAL
	icon_state = "suitcooler_adv"
	item_state = "suitcooler_adv"
	slot_flags = ITEM_SLOT_BELT | ITEM_SLOT_BACK
	alternate_worn_layer = ABOVE_HEAD_LAYER
	force = 6
	custom_materials = list(/datum/material/iron = 45000, /datum/material/glass = 3000, /datum/material/gold = 11000, /datum/material/uranium = 1000)

/obj/item/device/cooler/advanced/update_icon()
	cut_overlays()
	icon_state = "suitcooler_adv"

	if(!on)
		return

	switch(round(100*charge/max_charge))
		if(86 to INFINITY)
			overlays.Add("battery_adv-0")
		if(69 to 85)
			overlays.Add("battery_adv-1")
		if(52 to 68)
			overlays.Add("battery_adv-2")
		if(35 to 51)
			overlays.Add("battery_adv-3")
		if(18 to 34)
			overlays.Add("battery_adv-4")
		if(4 to 17)
			overlays.Add("battery_adv-5")
		if(-INFINITY to 4)
			overlays.Add("battery_adv-6")

/obj/item/device/cooler/advanced/charged
	roundstart_charged = TRUE

///////////////////////////////////////////////////////////////////////////
/*
Сборка через техфаб
*/

/datum/design/cooler
	name = "Portable Cooling Unit"
	desc = "A large portable heat sink with liquid cooled radiator packaged into a modified backpack. Useful for IPCs and other synthetics during EVA operations."
	id = "cooler"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 30000, /datum/material/glass = 4500)
	build_path = /obj/item/device/cooler // печатаются пустые, чтобы не было проще выбросить старый и напечатать новый
	category = list("Equipment")

/datum/design/cooler/lavaland
	name = "Mining Cooling Unit"
	desc = "A large portable heat sink with liquid cooled radiator packaged into a modified backpack. \
	This one can be strapped on belt, but lost in efficiency due reduced size. Useful for IPCs and other synthetics during mining operations."
	id = "cooler_mining"
	materials = list(/datum/material/iron = 22000, /datum/material/glass = 3000)
	build_path = /obj/item/device/cooler/lavaland
	category = list("Mining Designs")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_CARGO

/datum/design/cooler/advanced
	name = "Advanced Portable Cooling Unit"
	desc = "Well known portable heat sink, now sized to oxygen tank dimensions. Fittable for backpacks."
	id = "cooler_advanced"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 62000, /datum/material/glass = 7200, /datum/material/gold = 15200, /datum/material/uranium = 1600)
	build_path = /obj/item/device/cooler/advanced
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SECURITY
