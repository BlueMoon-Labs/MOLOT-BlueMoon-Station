/datum/quirk/vegetarian
	name = "Вегетарианец"
	desc = "Мысли о поедании мяса для вас отвратительны."
	value = 0
	flavor_quirk = TRUE
	gain_text = span_notice("Вы чувствуете отвращение от мысли о поедании мяса.")
	lose_text = span_notice("Вы думаете, что поесть мяса не так уж и плохо.")
	medical_record_text = "Пациент соблюдает вегетарианскую диету."

/datum/quirk/vegetarian/add()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/species/species = H.dna.species
	species.liked_food &= ~MEAT
	species.disliked_food |= MEAT

/datum/quirk/vegetarian/remove()
	var/mob/living/carbon/human/H = quirk_holder
	if(H)
		var/datum/species/species = H.dna.species
		if(initial(species.liked_food) & MEAT)
			species.liked_food |= MEAT
		if(initial(species.disliked_food) & ~MEAT)
			species.disliked_food &= ~MEAT
