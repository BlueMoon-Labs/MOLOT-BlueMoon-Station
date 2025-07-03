/datum/quirk/headpat_slut
	name = "Тактилофилия"
	desc = "Вам нравится, когда другие прикасаются к вашей голове! Может, даже слишком... когда другие гладят вас по голове, это повышает ваше настроение и возбуждает вас."
	mob_trait = TRAIT_HEADPAT_SLUT
	flavor_quirk = TRUE
	value = 0
	gain_text = span_notice("Вы жаждете ласки!")
	lose_text = span_notice("Ваша зависимость от ласки исчезает.")
	medical_record_text = "Пациент очень любвеобильный."

/datum/quirk/headpat_slut/add()
	. = ..()
	quirk_holder.AddElement(/datum/element/wuv/headpat, null, null, /datum/mood_event/pet_animal)

/datum/quirk/headpat_slut/remove()
	. = ..()
	// BLUEMOON EDIT START - sanity check
	if(!quirk_holder)
		return
	// BLUEMOON EDIT END
	quirk_holder.RemoveElement(/datum/element/wuv/headpat)
