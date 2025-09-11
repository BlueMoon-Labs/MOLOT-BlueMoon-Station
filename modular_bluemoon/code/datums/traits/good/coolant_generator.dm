/datum/quirk/coolant_generator
	name = BLUEMOON_TRAIT_NAME_COOLANT_GENERATOR
	desc = "ТОЛЬКО ДЛЯ СИНТЕТИКОВ! В вашей системе охлаждения используется упрощённая версия охлаждающей жидкости, а также установлен компактный аппарат по дистилляции и переработки воды, позволяющий эффективно генерировать хладагент при потреблении воды. Данная система увеличивает постоянное энергопотребление примерно на 15%."
	value = 2
	gain_text = span_danger("Интересно, у органиков иногда возникает желание пустить воду по вене?")
	lose_text = span_notice("Охлаждение водой - прошлый век. Я буду охлаждаться на пиве, прямо как РБМК!")
	mob_trait = TRAIT_BLUEMOON_COOLANT_GENERATOR

/datum/quirk/coolant_generator/on_spawn()
	. = ..()
	if(!isrobotic(quirk_holder)) // только персонажи-синтетики могут пользоваться этим квирком
		to_chat(quirk_holder, span_warning("Все квирки были сброшены, т.к. квирк [src] не подходит виду персонажа."))
		var/list/user_quirks = quirk_holder.roundstart_quirks
		user_quirks -= src
		for(var/datum/quirk/Q as anything in user_quirks)
			qdel(Q)
		qdel(src)
