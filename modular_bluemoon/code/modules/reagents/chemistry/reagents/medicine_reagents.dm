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

/datum/reagent/medicine/spermatex
	name = "Spermatex"
	description = "Destroys sperm and removes from the patient's body without affecting other chemicals. It is not a means of contraception!"
	reagent_state = LIQUID
	color = "#ffffd0"
	metabolization_rate = 0.5 * REAGENTS_METABOLISM
	pH = 7

/datum/reagent/medicine/spermatex/on_mob_add(mob/living/carbon/M)
	M.remove_status_effect(STATUS_EFFECT_DRIPPING_CUM)

/datum/reagent/medicine/spermatex/on_mob_life(mob/living/carbon/M)
	. = 1
	M.reagents.remove_reagent(/datum/reagent/consumable/semen, 10)
	..()
