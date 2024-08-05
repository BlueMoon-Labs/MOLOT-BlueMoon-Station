/datum/quirk/nt_employee
	name = "Сотрудник НаноТрейзен"
	desc = "Вы обычный сотрудник НаноТрейзен. В начале смены вы получаете корпоративный бейдж и знание корпоративного языка."
	value = 0
	mood_quirk = FALSE
	processing_quirk = FALSE

/datum/quirk/nt_employee/on_spawn()
	. = ..()

	quirk_holder.grant_language(/datum/language/corpspeak, TRUE, TRUE, LANGUAGE_MIND)
	give_item(/obj/item/clothing/accessory/badge_nt, quirk_holder)

/datum/quirk/syndi_employee
	name = "Сотрудник Синдиката"
	desc = "Вы обычный сотрудник Синдиката. В начале смены вы получаете корпоративный бейдж и знание кодового языка."
	value = 0
	mood_quirk = FALSE
	processing_quirk = FALSE

/datum/quirk/syndi_employee/on_spawn()
	. = ..()

	quirk_holder.grant_language(/datum/language/codespeak, TRUE, TRUE, LANGUAGE_MIND)
	give_item(/obj/item/clothing/accessory/badge_syndi, quirk_holder)
