//UNTICKED Оставлен до лучших времён или переосмысления квирка
#define TRAIT_IMAGINARYPERSON		"ImaginaryPerson"

/datum/quirk/imaginary_person
	name = "Вторая личность"
	desc = "У вас появился дружок в голове. Кто знает, поможет он вам, или нет... Только не соглашайтесь на его предложение сделать клуб!"
	value = 0
	mob_trait = TRAIT_IMAGINARYPERSON
	human_only = TRUE
	gain_text = null // Handled by trauma.
	lose_text = null
	medical_record_text = "У пациента неизлечимое нарушение психики в районе осознания себя как отдельной личности."
	on_spawn_immediate = FALSE

/datum/quirk/imaginary_person/add()
	var/datum/brain_trauma/severe/split_personality/T = new()
	var/mob/living/carbon/human/H = quirk_holder
	H.gain_trauma(T, TRAUMA_RESILIENCE_ABSOLUTE)

/datum/quirk/imaginary_person/remove()
	var/datum/brain_trauma/severe/split_personality/T = new()
	var/mob/living/carbon/human/H = quirk_holder
	H.cure_trauma_type(T, TRAUMA_RESILIENCE_ABSOLUTE)
