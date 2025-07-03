// Small issue with this. If the quirk holder has NO_HUNGER or NO_THIRST, this trait can still be taken and they will still get the benefits of it.
// It's unlikely that someone will be both, especially at round start, but vampirism makes me wary of having these separate.
/datum/quirk/hungry
	name = "Бездонный Желудок"
	desc = "В вас быстрее просыпаются голод и жажда. Необходимо есть и пить в два раза больше."
	value = -1
	flavor_quirk = TRUE
	gain_text = span_danger("Вы хотите есть и пить чаще.")
	lose_text = span_notice("Жор идёт на спад.")
	medical_record_text = "Пациенту требуется вдвое большее количество еды, по сравнению с типичным представителем их вида."

/datum/quirk/hungry/add()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/physiology/P = H.physiology
	P.hunger_mod *= 2

/datum/quirk/hungry/remove()
	var/mob/living/carbon/human/H = quirk_holder
	if(H)
		var/datum/physiology/P = H.physiology
		if(P)
			P.hunger_mod /= 2
