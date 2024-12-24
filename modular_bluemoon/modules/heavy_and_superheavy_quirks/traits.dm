/*
КВИРКИ
*/

/datum/quirk/bluemoon_heavy
	name = "Тяжёлый"
	desc = "Вы весите \
	<font style='border-bottom:2px dotted white;cursor:help;' title='\
	Ослабление скорости до уровня, как будто персонаж ростом 120% (если рост уже не 120% или больше). \
	Даже шагом перемещение громкое. \
	Другим сложнее куда-то тянуть Вас. \
	Вас сложнее отправить в полёт, но и последствия будут серьезнее. \
	Если вы наступите на кого-то меньше вас ростом, то это будет ещё болезненнее. \
	'>заметно больше в сравнении со среднестатистическим космонавтом.</font> \
	(Не берите вместе с особенностью \"Сверхтяжёлый\", может привести к настакиванию замедления)."

	value = 1
	mob_trait = TRAIT_BLUEMOON_HEAVY
	gain_text = span_notice("Вы явно набрали в весе... Не то, чтобы это сильно мешало.")
	lose_text = span_danger("Сбросить 3-4 десятка киллограмм за одну смену - это достижение. И вы его открыли.")
	medical_record_text = "Вес пациента выше среднего для космонавтов."

/datum/quirk/bluemoon_heavy/proc/update_size_movespeed()
	var/searched_slowdown = 0.2 * CONFIG_GET(number/body_size_slowdown_multiplier) // проверка как для размера в 120%
	var/user_slowdown = (abs(get_size(quirk_holder) - 1) * CONFIG_GET(number/body_size_slowdown_multiplier))

	if(searched_slowdown - user_slowdown > 0) //подсчёт наличия разницы в росте с искомой и её начисление для замедления персонажа
		quirk_holder.add_or_update_variable_movespeed_modifier(/datum/movespeed_modifier/heavy_quirk_slowdown, TRUE, searched_slowdown - user_slowdown)
	else
		quirk_holder.remove_movespeed_modifier(/datum/movespeed_modifier/heavy_quirk_slowdown)

/datum/quirk/bluemoon_heavy/on_spawn()
	. = ..()
	quirk_holder.throw_range = 4
	quirk_holder.throw_speed = 1
	update_size_movespeed()

/datum/quirk/bluemoon_heavy/remove()
	quirk_holder.throw_range = initial(quirk_holder.throw_range)
	quirk_holder.throw_speed = initial(quirk_holder.throw_speed)
	update_size_movespeed()

/datum/quirk/bluemoon_heavy_super
	name = "Сверхтяжёлый"

	desc = "Ваш вес можно сравнивать с \
	<font style='border-bottom:2px dotted white;cursor:help;' title='\
	Ослабление скорости до уровня, как будто персонаж ростом 170% (если рост уже не 170% или больше). Замедление нельзя преодолеть. \
	Вас могут тянуть только киборги, антагонисты, мехи (толкать), персонажи с некоторыми боевыми искусствами, такие же сверхтяжёлые персонажи и экипаж в МОДах, оснащённых гидравлическими клешнями (в дальнейшем - \"ОСОБЫЕ\"). \
	Даже шагом, вы перемещаетесь громко. \
	Предметы (и персонажи) при попытке сесть на них будут ломаться. \
	'>крупным животным, автомобилем или малым промышленным шагоходом.</font> \
	Драка с вами в ближнем бою \
	<font style='border-bottom:2px dotted white;cursor:help;' title='\
	Только киборги, халки и другие сверхтяжёлые персонажи могут толкать Вас и опрокидывать на стол. \
	Вы причиняете (и получаете) больше повреждений при полёте. \
	При наступании на кого-то, эффекты в два раза хуже для цели. \
	Если вы подскользнетесь, то будет в два раза хуже. \
	Вставать с пола в два раза затратнее по выносливости. \
	Удар бутылкой о голову, а также битой, не имеют эффекта опрокидывания/отбрасывания. \
	Вас нельзя нести на плече или метнуть с рук. \
	Ваш урон без оружия увеличивается в процентном соотношении за каждый процент размера персонажей. \
	'>менее эффективна.</font> \
	При этом, вам намного \
	<font style='border-bottom:2px dotted white;cursor:help;' title='\
	Бонус за местоположения тела при операции всегда считаются, как если бы Вы находились на обычном столе (даже если персонаж на хирургическом столе или на полу). \
	Только ОСОБЫЕ персонажи могут помочь вам встать обратно на ноги.                            \
	У всех, кто пытается вас переместить, скорее всего, НЕ БУДЕТ нужного снаряжения или особенностей для этого. Будьте готовы, что вас могут убить \
	из-за невозможности переместить или не станут доставлять в медбей/помогать прямо на месте смерти. \
	'>сложнее помочь.</font> \
	Оглушающее оружие \
	<font style='border-bottom:2px dotted white;cursor:help;' title='\
	Шоковые дубинки, телескопические и т.п. (кроме оружия контрактника, дубинки абдукторов и электропосоха) не роняют на пол, а также наносят в два раза меньше урона по стамине. \
	Оглушающие снаряды (например, лучи дизейблера) наносят в два раза меньше урона по стамине. \
	'>действует на вас слабее.</font>"

	value = 2
	mob_trait = TRAIT_BLUEMOON_HEAVY_SUPER
	gain_text = span_warning("Плитка под вашими ногами может треснуть от неосторожного шага.")
	lose_text = span_notice("Вы явно стали весить намного меньше. Сверхтяжёлый танк больше не кузен.")
	medical_record_text = "Вес пациента намного выше среднестастистической для космонавтов. Перемещение привычными средствами посторонними лицами невозможно."

/datum/quirk/bluemoon_heavy_super/proc/update_size_movespeed()
	var/searched_slowdown = 0.7 * CONFIG_GET(number/body_size_slowdown_multiplier) // проверка как для размера в 170%
	var/user_slowdown = (abs(get_size(quirk_holder) - 1) * CONFIG_GET(number/body_size_slowdown_multiplier))

	if(searched_slowdown - user_slowdown > 0) //подсчёт наличия разницы в росте с искомой и её начисление для замедления персонажа
		quirk_holder.add_or_update_variable_movespeed_modifier(/datum/movespeed_modifier/heavy_quirk_slowdown, TRUE, searched_slowdown - user_slowdown)
		quirk_holder.movespeed_override = 3 - (searched_slowdown - user_slowdown)
	else
		quirk_holder.add_or_update_variable_movespeed_modifier(/datum/movespeed_modifier/heavy_quirk_slowdown, TRUE, 0)
		quirk_holder.movespeed_override = 3

/datum/quirk/bluemoon_heavy_super/proc/check_mob_size()
	if(get_size(quirk_holder) < 0.8) // Самый маленький размер для сверхтяжёлых квирков - это 80%
		to_chat(quirk_holder, "Вы поняли, что ваш необъятный вес делает невозможным становление слишком маленьким.")
		quirk_holder.update_size(0.8)

/datum/quirk/bluemoon_heavy_super/on_spawn()
	. = ..()
	quirk_holder.throw_range = 1
	quirk_holder.throw_speed = 0.5
	update_size_movespeed()
	check_mob_size()
	quirk_holder.movespeed_override = 3 // Персонаж не может иметь замедление ниже этого значения (только быть ещё сильнее замедленным)

/datum/quirk/bluemoon_heavy_super/remove()
	quirk_holder.throw_range = initial(quirk_holder.throw_range)
	quirk_holder.throw_speed = initial(quirk_holder.throw_speed)
	update_size_movespeed()
	quirk_holder.movespeed_override = initial(quirk_holder.movespeed_override)

/datum/quirk/bluemoon_devourer
	name = "Пожиратель"
	desc = "Ваши размеры огромны, а голод неутолим. Всё, что съедобно, для вас еда, а ожирение не помеха. Особенности вашей физиологии позволяют вам \
	передвигаться на порядок быстрее, однако тело более восприимчиво к повреждениям. Вы не можете быть лёгким или сверхтяжёлым, а нормалазер на вас не действует."
	value = 3
	mob_trait = TRAIT_BLUEMOON_DEVOURER
	medical_record_text = "Субъект проявляет признаки гигантизма и аномальной прожорливости, а также способность усваивать любую пищу."
	gain_text = span_notice("Вы чувствуете неумалимый голод.")
	lose_text = span_notice("Ваш голод проходит.")
	processing_quirk = TRUE

/datum/quirk/bluemoon_devourer/add()
	// да, кушать можно всё, но нужно сильно больше
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/species/species = H.dna.species
	species.disliked_food = null
	H.physiology.hunger_mod *= 2
	H.maxHealth *= 0.75 // -50% от доп хп.
	// Действие на сборс сытости
	var/datum/action/innate/vomit/act_vomit = new
	act_vomit.Grant(H)

	var/datum/action/innate/secrete_chemicals/act_secrete_chemicals = new
	act_secrete_chemicals.Grant(H)
	// Add examine text
	RegisterSignal(quirk_holder, COMSIG_PARENT_EXAMINE, PROC_REF(on_examine_holder))
	ADD_TRAIT(H,TRAIT_BLUEMOON_ANTI_NORMALIZER, ROUNDSTART_TRAIT)


/datum/quirk/bluemoon_devourer/remove()
	var/mob/living/carbon/human/H = quirk_holder
	if(H)
		var/datum/species/species = H.dna.species

		species.liked_food = initial(species.liked_food)
		species.disliked_food = initial(species.disliked_food)

		//удаляем все модификаторы урона и скорости
		H.remove_movespeed_modifier(/datum/movespeed_modifier/giant_quirk_boost)

		var/datum/physiology/P = H.physiology
		if(P)
			P.hunger_mod /= 2

		H.maxHealth *= 1.34

		var/datum/action/innate/vomit/act_vomit = locate() in H.actions
		act_vomit.Remove(H)

		var/datum/action/innate/secrete_chemicals/act_secrete_chemicals = locate() in H.actions
		act_secrete_chemicals.Remove(H)

		UnregisterSignal(quirk_holder, COMSIG_PARENT_EXAMINE)
		REMOVE_TRAIT(H,TRAIT_BLUEMOON_ANTI_NORMALIZER, ROUNDSTART_TRAIT)

// Quirk examine text
/datum/quirk/bluemoon_devourer/proc/on_examine_holder(atom/examine_target, mob/living/carbon/human/examiner, list/examine_list)
	examine_list += "[quirk_holder.ru_ego(TRUE)] явно мучает голод."


/datum/quirk/bluemoon_devourer/proc/update_size_modifiers(new_size, cur_size)
	if (check_mob_size() && new_size != cur_size) // не даём уменьшиться, в т.ч. если мёртв
		var/mob/living/carbon/human/H= quirk_holder

		var/user_slowdown = (abs(new_size - 1) * CONFIG_GET(number/body_size_slowdown_multiplier))

		H.add_or_update_variable_movespeed_modifier(/datum/movespeed_modifier/giant_quirk_boost, TRUE, user_slowdown * -0.8) // убираем 80% от замедления


/datum/quirk/bluemoon_devourer/proc/check_mob_size()
	if(!isliving(quirk_holder))
		return FALSE

	var/mob/living/owner = quirk_holder

	if(get_size(owner) < 2)
		to_chat(owner, "Ваш размер невозможно изменить")
		owner.update_size(2)
		return FALSE
	return TRUE

/datum/quirk/bluemoon_devourer/on_spawn()
	. = ..()
	var/mob/living/H = quirk_holder
	// Этот участок фиксит проблемы, когда надевается нормалайзер раундстартом (из лодаута) и перк пожирателя. Они наслаиваются и по итогу ломается скорость и размер
	var/datum/component/size_normalized/comp = H.GetComponent(/datum/component/size_normalized)
	if(comp)
		qdel(comp)
	// конец участка
	update_size_modifiers(get_size(H), 1)

/*
ПЕРЕМЕННЫЕ ДЛЯ МОДИФИКАТОРОВ СКОРОСТИ
*/

/datum/movespeed_modifier/heavy_mob_drag
	variable = TRUE
	blacklisted_movetypes = (FLYING|FLOATING)

/datum/movespeed_modifier/heavy_quirk_slowdown
	variable = TRUE

/datum/movespeed_modifier/giant_quirk_boost
	variable = TRUE
	blacklisted_movetypes = (FLYING|FLOATING)

/*
ПЕРЕМЕННАЯ ДЛЯ ОГРАНИЧЕНИЯ МАКСИМАЛЬНОЙ СКОРОСТИ
*/

/mob
	var/movespeed_override = 0

/*
Действия
*/

/datum/action/innate/vomit
	name = "Vomit"
	desc = "Vomit some digested food from your body."
	icon_icon = 'icons/mob/actions/actions_xeno.dmi'
	button_icon_state = "alien_barf"

/datum/action/innate/vomit/Activate()
	var/mob/living/carbon/human/H = owner
	H.vomit(lost_nutrition = 50, stun = FALSE)
	H.adjustToxLoss(-10)

/datum/action/innate/secrete_chemicals
	name = "Screte Chemicals"
	desc = "Screte some chemicals into your blood."
	icon_icon = 'icons/mob/actions/actions_xeno.dmi'
	button_icon_state = "alien_acid"

/datum/action/innate/secrete_chemicals/Activate()
	var/mob/living/carbon/human/H = owner
	if(H.nutrition >= NUTRITION_LEVEL_WELL_FED)
		H.reagents.add_reagent(/datum/reagent/medicine/salglu_solution, 10)
		H.reagents.add_reagent(/datum/reagent/drug/aphrodisiac, 5)
		H.add_lust(20)
		H.adjust_nutrition(100)
		to_chat(owner, "<span class='notice'>Вы разлагаете часть ваших пищевых запасов, выпуская в кровь смесь реагентов.</span>")
	else
		to_chat(owner, "<span class='notice'>Вы слишком голодны для этого.</span>")
