// Бутыль с систем клинером для заказов в карго и получения в вендоматах робо
/obj/item/reagent_containers/glass/bottle/system_cleaner
	name = "system cleaner bottle"
	desc = "Бутыль с реагентом, эффективно проводящим очистку системы у синтетиков. На этикетке авторучкой написано \"Используй Purge Corruption, ленивая скотина! Это для ремонта в поле!\"."
	icon = 'icons/obj/chemical.dmi'
	list_reagents = list(/datum/reagent/medicine/system_cleaner = 30)


// Реагент с гидравликой для синтетиков. Вся эта шняга с кровью работает как пиздос какой-то
/datum/reagent/blood/oil
	data = list("donor"=null,"viruses"=null,"blood_DNA"="REPLICATED", "bloodcolor" = BLOOD_COLOR_OIL, "bloodblend" = BLEND_MULTIPLY, "blood_type"="HF","resistances"=null,"trace_chem"=null,"mind"=null,"ckey"=null,"gender"=null,"real_name"=null,"cloneable"=null,"factions"=null)
	name = "Hydraulic Liquid"
	description = "Hydraulic liquid for synthetic crewmembers."
	taste_description = "oil"
	color = BLOOD_COLOR_OIL
	value = REAGENT_VALUE_NONE


// Более эффективная кровь для синтетиков
/datum/reagent/medicine/synthblood_deluxe
	name = "Super-pressurized hydraulic liquid"
	description = "Сверхэффективная гидравлическая жидкость, способная быстро восстановить работоспособность системы охлаждения у синтетиков. \
					 Была изобретена и применяется CyberSun для ремонта своих боевых роботов на передовой. Процесс производства \
					 достаточно дорогостоящий и требует применения блюспейс-сжатия, атомизации и насыщения. \
					 Более простые варианты данной жидкости могут быть произведены с помощью лишь блюспейс-сжатия и могут \
					 превращаться в обычную гидравлическую жидкость в соотношении 1/10. Вызывает кратковременные сбои сенсоров при применении."
	reagent_state = LIQUID
	color = "#D7C9C6"
	metabolization_rate = 5 * REAGENTS_METABOLISM
	chemical_flags = REAGENT_ROBOTIC_PROCESS

/datum/reagent/medicine/synthblood_deluxe/on_mob_add(mob/living/L, amount)
	. = ..()
	if(!isrobotic(L))
		return
	to_chat(L, span_boldnotice("В процессоре реагентов обнаружена гидравлическая жидкость под большим давлением. Производится подготовка для её интеграции. Возможны побочные эффекты.."))
	L.AdjustConfused(3)
	L.adjust_blurriness(3)

/datum/reagent/medicine/synthblood_deluxe/on_mob_life(mob/living/carbon/M)
	. = ..()
	if(!isrobotic(M))
		return
	M.reagents.add_reagent(/datum/reagent/blood/oil, metabolization_rate * 10)


// Ёмкость с супер-кровью для синтетиков.
/obj/item/reagent_containers/glass/bottle/synthblood_deluxe
	name = "H-Liquid DELUXE"
	desc = "Сверхэффективная гидравлическая жидкость, способная быстро восстановить работоспособность системы охлаждения у синтетиков. \
					 Была изобретена и применяется CyberSun для ремонта своих боевых роботов на передовой. Процесс производства \
					 достаточно дорогостоящий и требует применения блюспейс-сжатия, атомизации и насыщения. \
					 Более простые варианты данной жидкости могут быть произведены с помощью лишь блюспейс-сжатия и могут \
					 превращаться в обычную гидравлическую жидкость в соотношении 1/10. Вызывает кратковременные сбои сенсоров при применении."
	icon = 'icons/obj/chemical.dmi'
	list_reagents = list(/datum/reagent/medicine/synthblood_deluxe = 30)

// Исследование для крутых роботехнических штук
/datum/techweb_node/superior_robotics
	id = "sup_robotics"
	display_name = "Superior Robotics"
	description = "Glory to Omnissiah!"
	prereq_ids = list("adv_biotech", "adv_bluespace", "adv_robotics")
	design_ids = list("roboliq")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 3500)

// Дизайн для фабрикатора платы генератора жидкостей
/datum/design/board/robo_liquid_generator
	name = "Machine Design (RoboLiquid Generator)"
	desc = "Allows for the construction of circuit boards used to build a RoboLiquid Generator."
	id = "roboliq"
	build_path = /obj/item/circuitboard/machine/robo_liquid_generator
	category = list("Research Machinery")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

// Плата для генератора полезных для робототехника жидкостей
/obj/item/circuitboard/machine/robo_liquid_generator
	name = "RoboLiquid Generator (Machine Board)"
	icon_state = "science"
	build_path = /obj/machinery/robo_liquid_generator
	desc = "Звучит достаточно инновационно?"
	req_components = list(
		/obj/item/stock_parts/manipulator = 3,
		/obj/item/stock_parts/matter_bin = 2,
		/obj/item/stock_parts/capacitor = 2,
		/obj/item/stack/sheet/glass = 1)
	needs_anchored = FALSE

/obj/machinery/robo_liquid_generator
	name = "RoboLiquid Generator"
	desc = "Генератор полезных для ремонта синтетиков жидкостей и реагентов с применением передовых технологий молекулярного анализа и блюспейс-сжатия."
	density = TRUE
	layer = BELOW_OBJ_LAYER
	icon = 'icons/obj/chemical.dmi'
	icon_state = "HPLCempty"
	use_power = IDLE_POWER_USE
	idle_power_usage = 30
	resistance_flags = FIRE_PROOF | ACID_PROOF
	circuit = /obj/item/circuitboard/machine/robo_liquid_generator

	var/obj/item/reagent_containers/beaker = null

	var/bluespace_amount = 0
	var/max_single_material_amount = 12000
	var/processing_speed = 1
	var/processing_amount = 5

	var/list/production = list(
		/datum/reagent/medicine/system_cleaner = 50,
		/datum/reagent/medicine/synthblood_deluxe = 200,
		/datum/reagent/blood/oil = 50)

	var/selected_production = null

	var/in_progress = FALSE


/obj/machinery/robo_liquid_generator/Destroy()
	QDEL_NULL(beaker)
	return ..()

/obj/machinery/robo_liquid_generator/on_deconstruction()
	var/atom/A = drop_location()
	if(beaker && istype(beaker))
		beaker.forceMove(A)
	return ..()

/obj/machinery/robo_liquid_generator/RefreshParts()
	// 2 ёмкости материи - умножаем вместимость на среднее значение их рейтинга
	var/new_amount_cap = initial(max_single_material_amount)
	var/all_rating = 0
	for(var/obj/item/stock_parts/matter_bin/mb in component_parts)
		all_rating += mb.rating
	new_amount_cap *= all_rating / 2
	max_single_material_amount = round(new_amount_cap)

	// 3 манипулятора - умножаем скорость на среднее значение их рейтинга
	var/new_speed = initial(processing_speed)
	all_rating = 0
	for(var/obj/item/stock_parts/manipulator/m in component_parts)
		all_rating += m.rating
	new_speed *= all_rating / 3
	processing_speed = round(new_speed)

	// 2 конденсатора - умножаем выхлоп на среднее значение их рейтинга, делённое на два
	var/new_processing_amount = initial(processing_amount)
	all_rating = 0
	for(var/obj/item/stock_parts/capacitor/c in component_parts)
		all_rating += c.rating
	new_processing_amount *= clamp(all_rating / (2 * 2), 1, 30)
	processing_amount = round(new_processing_amount)

	updateUsrDialog()


/obj/machinery/robo_liquid_generator/attackby(obj/item/I, mob/user, params)
	if(default_deconstruction_screwdriver(user, "HPLCempty", "HPLCempty", I))
		return

	else if(default_deconstruction_crowbar(I))
		return

	if(default_unfasten_wrench(user, I))
		return

	if(panel_open)
		to_chat(user, span_warning("Закройте панель, прежде чем использовать [name]!"))
		return

	if(istype(I, /obj/item/reagent_containers) && !(I.item_flags & ABSTRACT) && I.is_open_container())
		. = TRUE
		var/obj/item/reagent_containers/B = I
		if(!user.transferItemToLoc(B, src))
			return
		replace_beaker(user, B)
		to_chat(user, span_notice("Вы вставляете [B] в [src]."))
		updateUsrDialog()
		update_icon()

	if(istype(I, /obj/item/stack/sheet/bluespace_crystal))
		var/obj/item/stack/sheet/bluespace_crystal/new_material = I
		// Получаем количество блюспейса, которое хочет вставить юзер, умножением числа кристаллов на кол-во порошка в кристалле
		var/added_amount = new_material.amount * MINERAL_MATERIAL_AMOUNT
		// Если юзер пытается вставить больше чем есть свободного места
		if(added_amount + bluespace_amount > max_single_material_amount)
			// Округляем так, чтобы влезало
			added_amount = clamp(added_amount, 0, max_single_material_amount - bluespace_amount)
			added_amount = floor(added_amount / MINERAL_MATERIAL_AMOUNT) * MINERAL_MATERIAL_AMOUNT
		// Если юзер пытается вставить меньше, чем 1 кристалл. Обычно это случается если там 9500 / 10 000 заполнено или что-то такое
		if(added_amount < MINERAL_MATERIAL_AMOUNT)
			to_chat(user, span_warning("Вы не можете загрузить столько [new_material] в [src]!"))
			return
		// Блюспейс кристаллы вытащить нельзя, поэтому даём предупреждение, если пытается вставить > 10 слитков
		if(added_amount > MINERAL_MATERIAL_AMOUNT * 10)
			var/confirmation = alert(user, "Вы уверены, что хотите установить столько [new_material]? В дальнейшем его изъять будет невозможно.", "Загрузка", "Да", "Нет")
			if(confirmation != "Да")
				return
		new_material.use(floor(added_amount / MINERAL_MATERIAL_AMOUNT))
		bluespace_amount += added_amount
		updateUsrDialog()
	else
		return ..()

/obj/machinery/robo_liquid_generator/AltClick(mob/living/user)
	. = ..()
	if(beaker)
		replace_beaker(user)
	return TRUE

/obj/machinery/robo_liquid_generator/proc/replace_beaker(mob/living/user, obj/item/reagent_containers/new_beaker)
	if(!istype(user, /mob/living/carbon/human) || !user.canUseTopic(src, BE_CLOSE, FALSE, NO_TK))
		return
	if(beaker)
		var/obj/item/reagent_containers/B = beaker
		B.forceMove(drop_location())
		if(user && Adjacent(user) && user.can_hold_items())
			user.put_in_hands(B)
		beaker = null
	if(new_beaker)
		beaker = new_beaker
	update_icon()
	updateUsrDialog()

/obj/machinery/robo_liquid_generator/proc/consume_bluespace(amount)
	. = TRUE
	if(bluespace_amount < amount)
		return FALSE
	bluespace_amount -= amount

// Прок, проверяющий возможность производства и останавливающий его. Если не остановил - выдаёт коллбэки на себя и dispose_reagent()
/obj/machinery/robo_liquid_generator/proc/produce_reagent()
	if(panel_open || stat & (BROKEN|NOPOWER))
		in_progress = FALSE
		updateUsrDialog()
		return
	if(!selected_production)
		in_progress = FALSE
		updateUsrDialog()
		return
	if(!beaker)
		in_progress = FALSE
		updateUsrDialog()
		return
	var/datum/reagents/R = beaker.reagents
	var/free = R.maximum_volume - R.total_volume
	if(free < processing_amount)
		say("Контейнер заполнен. Производство остановлено.")
		selected_production = null
		in_progress = FALSE
		updateUsrDialog()
		return
	if(!consume_bluespace(production[selected_production]))
		say("Сырьё закончилось. Производство остановлено.")
		selected_production = null
		in_progress = FALSE
		updateUsrDialog()
		return
	in_progress = TRUE
	// Через n секунд он выплюнет запрошенный реагент и начнёт новый цикл
	var/production_time =  30 SECONDS / processing_speed
	addtimer(CALLBACK(src, PROC_REF(dispose_reagent), selected_production), production_time, TIMER_DELETE_ME)
	addtimer(CALLBACK(src, PROC_REF(produce_reagent)), production_time, TIMER_DELETE_ME)
	updateUsrDialog()

// Прок, выплёвывающий реагент
/obj/machinery/robo_liquid_generator/proc/dispose_reagent(reagent_type)
	if(panel_open || stat & (BROKEN|NOPOWER))
		return
	if(!selected_production)
		return
	if(!beaker)
		return
	var/datum/reagents/R = beaker.reagents
	var/free = R.maximum_volume - R.total_volume
	if(free < processing_amount)
		say("Контейнер заполнен. Производство остановлено.")
		selected_production = null
		updateUsrDialog()
		return
	R.add_reagent(reagent_type, processing_amount)
	playsound(src, 'sound/effects/bubbles.ogg', 25)
	updateUsrDialog()

/obj/machinery/robo_liquid_generator/on_attack_hand(mob/user, act_intent, attackchain_flags)
	add_fingerprint(user)
	ui_interact(user)
	. = ..()

/obj/machinery/robo_liquid_generator/ui_interact(mob/user, datum/tgui/ui)
	. = ..()
	var/data = "<html><body>"
	data += "<center><h2>RoboLiquid Generator</h2></center><br>"
	// Информация о состоянии генератора
	data += "<b>Всего блюспейс-порошка</b>: [bluespace_amount]<br>"
	var/datum/reagent/selec_prod = selected_production
	data += "<b>Выбранный реагент</b>: [initial(selec_prod.name)]<br>"
	data += "<b>Производство</b> - [in_progress ? "ВЕДЁТСЯ" : "НЕ ВЕДЁТСЯ"]<br>"
	// Варианты производства
	for(var/prod in production)
		var/datum/reagent/reagent_prod = prod
		data += "<a href='?src=[REF(src)];selected_reagent=[prod]'>[initial(reagent_prod.name)] ([production[prod]]bs)</a><br>"
	// Отмена производства
	data += "<a href='?src=[REF(src)];selected_reagent=1'>NONE</a><br>"
	// Контейнер
	data += "<b>Ёмкость</b>: [istype(beaker) ? "[icon2html(beaker, user)][beaker.name] - [beaker.reagents.total_volume]/[beaker.reagents.maximum_volume]" : "ОТСУТСТВУЕТ"]"
	data += " <a href='?src=[REF(src)];detach_beaker=1'>Вынуть</a><br>"
	data += "<hr>"
	// Информация о том, как улучшен генератор
	data += "<b>Максимум порошка</b>: [max_single_material_amount]<br>"
	data += "<b>Скорость производства</b>: [processing_speed]<br>"
	data += "<b>Реагентов за цикл</b>: [processing_amount]<br>"
	data += "</body></html>"
	var/datum/browser/popup = new(user, "roboliquid_generator", "RoboLiquid Generator", 500, 400)
	popup.set_content(data)
	popup.open()

/obj/machinery/robo_liquid_generator/Topic(href, href_list)
	. = ..()
	if(href_list["selected_reagent"])
		if(href_list["selected_reagent"] == "1")
			selected_production = null
			say("Запрошена остановка производства...")
			updateUsrDialog()
			return
		var/new_reagent = text2path(href_list["selected_reagent"])
		if(production[new_reagent])
			if(selected_production == new_reagent)
				say("Выбран тот же реагент!")
				return
			selected_production = new_reagent
			playsound(src, 'sound/machines/chime.ogg', 25, TRUE)
			updateUsrDialog()
			if(!in_progress)
				var/datum/reagent/new_prod = selected_production
				say("Начинаем производить [initial(new_prod.name)]")
				produce_reagent()
				updateUsrDialog()
	if(href_list["detach_beaker"])
		replace_beaker(usr, null)
