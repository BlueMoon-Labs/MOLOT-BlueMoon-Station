/datum/quirk/cum_plus
	name = "Сверхпродуктивные Гениталии"
	desc = "Ваши гениталии производят и вмещают больше, чем обычно."
	value = 0
	flavor_quirk = TRUE
	gain_text = span_notice("Вы чувствуете давление в паху.")
	lose_text = span_notice("Вы чувствуете, как ваш пах стал легче.")
	medical_record_text = "Гениталии пациента демонстрируют высокую продуктивность."
	var/increasedcum

/datum/quirk/cum_plus/add()
	var/mob/living/carbon/M = quirk_holder
	if(M.getorganslot(ORGAN_SLOT_TESTICLES))
		var/obj/item/organ/genital/testicles/T = M.getorganslot(ORGAN_SLOT_TESTICLES)
		T.fluid_mult += 0.5 //Base is 1
		T.fluid_max_volume *= 1.75 //Fixes this.

/datum/quirk/cum_plus/remove()
	var/mob/living/carbon/M = quirk_holder
	if(!M)
		return
	if(quirk_holder.getorganslot(ORGAN_SLOT_TESTICLES))
		var/obj/item/organ/genital/testicles/T = M.getorganslot(ORGAN_SLOT_TESTICLES)
		T.fluid_mult -= 0.5 //Base is 1
		T.fluid_max_volume *= 0.25 //Base is 50

/datum/quirk/cum_plus/on_process()
	var/mob/living/carbon/M = quirk_holder //If you get balls later, then this will still proc
	if(M.getorganslot(ORGAN_SLOT_TESTICLES))
		var/obj/item/organ/genital/testicles/T = M.getorganslot(ORGAN_SLOT_TESTICLES)
		if(!increasedcum)
			T.fluid_mult = 1.5 //Base is 0.133
			T.fluid_max_volume *= 1.75
			increasedcum = TRUE
