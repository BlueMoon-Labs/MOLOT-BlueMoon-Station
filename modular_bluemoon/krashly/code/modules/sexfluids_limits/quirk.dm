/datum/quirk/fluid_leak_tits
	name = "Протечка! (Грудь)"
	desc = "Ваши органы не знают предела в выработке телесных жидкостей, от того ваше грудное молоко или другие жидкости могут протекать!"
	value = 0
	mob_trait = TRAIT_FLUID_TITS

/datum/quirk/fluid_leak_tits/add()
	if(!HAS_TRAIT(quirk_holder, TRAIT_FLUID))
		ADD_TRAIT(quirk_holder, TRAIT_FLUID, ROUNDSTART_TRAIT)

/datum/quirk/fluid_leak_tits/remove()
	if(HAS_TRAIT(quirk_holder, TRAIT_FLUID))
		REMOVE_TRAIT(quirk_holder, TRAIT_FLUID, ROUNDSTART_TRAIT)

/datum/quirk/fluid_leak_pizda
	name = "Протечка! (Матка)"
	desc = "Ваши органы не знают предела в выработке телесных жидкостей, от того ваше грудное молоко или другие жидкости могут протекать!"
	value = 0
	mob_trait = TRAIT_FLUID_WOMB

/datum/quirk/fluid_leak_pizda/add()
	if(!HAS_TRAIT(quirk_holder, TRAIT_FLUID))
		ADD_TRAIT(quirk_holder, TRAIT_FLUID, ROUNDSTART_TRAIT)

/datum/quirk/fluid_leak_pizda/remove()
	if(HAS_TRAIT(quirk_holder, TRAIT_FLUID))
		REMOVE_TRAIT(quirk_holder, TRAIT_FLUID, ROUNDSTART_TRAIT)

/datum/quirk/fluid_leak_penis
	name = "Протечка! (Яйца(Пенис))"
	desc = "Ваши органы не знают предела в выработке телесных жидкостей, от того ваше грудное молоко или другие жидкости могут протекать!"
	value = 0
	mob_trait = TRAIT_FLUID_PENIS

/datum/quirk/fluid_leak_penis/add()
	if(!HAS_TRAIT(quirk_holder, TRAIT_FLUID))
		ADD_TRAIT(quirk_holder, TRAIT_FLUID, ROUNDSTART_TRAIT)
/datum/quirk/fluid_leak_penis/remove()
	if(HAS_TRAIT(quirk_holder, TRAIT_FLUID))
		REMOVE_TRAIT(quirk_holder, TRAIT_FLUID, ROUNDSTART_TRAIT)
