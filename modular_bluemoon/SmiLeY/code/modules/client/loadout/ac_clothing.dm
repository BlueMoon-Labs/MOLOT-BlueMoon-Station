//					ГОЛОВА					//
//					ГОЛОВА					//
//					ГОЛОВА					//

/obj/item/clothing/head/soft/sec/ac
	name = "AC Cap"
	desc = "Special cap for special Mercenaries."
	icon = 'modular_bluemoon/SmiLeY/icons/obj/clothing/ac_clothing.dmi'
	mob_overlay_icon = 'modular_bluemoon/SmiLeY/icons/mob/clothing/ac_clothing.dmi'
	icon_state = "acsoft"
	soft_type = "ac"

/obj/item/clothing/head/warden/ac
	name = "AC Officer Cap"
	desc = "Special cap for special Mercenaries."
	icon = 'modular_bluemoon/SmiLeY/icons/obj/clothing/ac_clothing.dmi'
	mob_overlay_icon = 'modular_bluemoon/SmiLeY/icons/mob/clothing/ac_clothing.dmi'
	icon_state = "ac_officer"

/obj/item/clothing/head/beret/sec/ac
	name = "AC Beret"
	desc = "Beret for Mercenaries with special reinforced fabric to offer some protection."
	icon = 'modular_bluemoon/SmiLeY/icons/obj/clothing/ac_clothing.dmi'
	mob_overlay_icon = 'modular_bluemoon/SmiLeY/icons/mob/clothing/ac_clothing.dmi'
	icon_state = "ac_beret"

/datum/gear/head/ac_beret
	name = "AC Beret"
	path = /obj/item/clothing/head/beret/sec/ac
	subcategory = LOADOUT_SUBCATEGORY_UNIFORM_JOBS
	restricted_desc = "Head of Security, Warden, Detective, Security Officer, Brig Physician, Peacekeeper, Blueshield."
	restricted_roles = list("Head of Security", "Warden", "Detective", "Security Officer", "Brig Physician", "Peacekeeper", "Blueshield")

/datum/gear/head/ac_cap
	name = "AC Cap"
	path = /obj/item/clothing/head/soft/sec/ac
	subcategory = LOADOUT_SUBCATEGORY_UNIFORM_JOBS
	restricted_desc = "Head of Security, Warden, Detective, Security Officer, Brig Physician, Peacekeeper, Blueshield."
	restricted_roles = list("Head of Security", "Warden", "Detective", "Security Officer", "Brig Physician", "Peacekeeper", "Blueshield")

/datum/gear/head/ac_officercap
	name = "AC Officer Cap"
	path = /obj/item/clothing/head/warden/ac
	subcategory = LOADOUT_SUBCATEGORY_UNIFORM_JOBS
	restricted_desc = "Head of Security, Warden, Blueshield."
	restricted_roles = list("Head of Security", "Warden", "Blueshield")

//					КОСТЮМЫ					//
//					КОСТЮМЫ					//
//					КОСТЮМЫ					//

/obj/item/clothing/suit/toggle/armor/hos/hos_formal/ac
	name = "AC Armored Coat"
	desc = "An coat for a prestigious Mercenaries in the Adamas Cattus PMC."
	icon = 'modular_bluemoon/SmiLeY/icons/obj/clothing/ac_clothing.dmi'
	mob_overlay_icon = 'modular_bluemoon/SmiLeY/icons/mob/clothing/ac_clothing.dmi'
	anthro_mob_worn_overlay = 'modular_bluemoon/SmiLeY/icons/mob/clothing/ac_clothing.dmi'
	icon_state = "ac_coat"

/datum/gear/suit/ac_armoredcoat
	name = "AC Armored Coat"
	path = /obj/item/clothing/suit/toggle/armor/hos/hos_formal/ac
	subcategory = LOADOUT_SUBCATEGORY_UNIFORM_JOBS
	restricted_desc = "Head of Security, Warden, Blueshield."
	restricted_roles = list("Head of Security", "Warden", "Blueshield")

//					УНИФОРМА					//
//					УНИФОРМА					//
//					УНИФОРМА					//

/obj/item/clothing/under/rank/security/officer/ac
	name = "AC Tanktop Uniform"
	desc= "An uniform for very special Mercenaries, sometimes they prefer to drink beer more then water."
	icon = 'modular_bluemoon/SmiLeY/icons/obj/clothing/ac_clothing.dmi'
	mob_overlay_icon = 'modular_bluemoon/SmiLeY/icons/mob/clothing/ac_clothing.dmi'
	icon_state = "ac_tanktop"
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON
	can_adjust = FALSE

/obj/item/clothing/under/rank/security/officer/ac/ac_combatuni
	name = "AC Combat Uniform"
	desc= "Standart tactical uniform for Mercencary in Catcrin PMC Adamas Cattus."
	icon_state = "ac_turtleneck"

/obj/item/clothing/under/rank/security/officer/ac/ac_combatski
	name = "AC Combat Skirt"
	desc= "Standart tactical skirt for Mercenary in Catcrin PMC Adamas Cattus."
	icon_state = "ac_turtleneck_skirt"

/obj/item/clothing/under/rank/security/officer/ac/ac_cassuit
	name = "AC Casual Uniform"
	desc= "Casual suit for special operations for Mercenaries in Adamas Cattus."
	icon_state = "ac_uni"

/obj/item/clothing/under/rank/security/officer/ac/ac_casski
	name = "AC Casual Skirt"
	desc= "Casual skirt for special operations for Mercenaries in Adamas Cattus."
	icon_state = "ac_uni_skirt"

/datum/gear/uniform/ac_tanktopuni
	name = "AC Tanktop Uniform"
	path = /obj/item/clothing/under/rank/security/officer/ac
	subcategory = LOADOUT_SUBCATEGORY_UNIFORM_JOBS
	restricted_desc = "Head of Security, Warden, Detective, Security Officer, Brig Physician, Peacekeeper, Blueshield."
	restricted_roles = list("Head of Security", "Warden", "Detective", "Security Officer", "Brig Physician", "Peacekeeper", "Blueshield")

/datum/gear/uniform/ac_combatuni
	name = "AC Combat Uniform"
	path = /obj/item/clothing/under/rank/security/officer/ac/ac_combatuni
	subcategory = LOADOUT_SUBCATEGORY_UNIFORM_JOBS
	restricted_desc = "Head of Security, Warden, Detective, Security Officer, Brig Physician, Peacekeeper, Blueshield."
	restricted_roles = list("Head of Security", "Warden", "Detective", "Security Officer", "Brig Physician", "Peacekeeper", "Blueshield")

/datum/gear/uniform/ac_combatski
	name = "AC Combat Skirt"
	path = /obj/item/clothing/under/rank/security/officer/ac/ac_combatski
	subcategory = LOADOUT_SUBCATEGORY_UNIFORM_JOBS
	restricted_desc = "Head of Security, Warden, Detective, Security Officer, Brig Physician, Peacekeeper, Blueshield."
	restricted_roles = list("Head of Security", "Warden", "Detective", "Security Officer", "Brig Physician", "Peacekeeper", "Blueshield")

/datum/gear/uniform/ac_cassuit
	name = "AC Casual Uniform"
	path = /obj/item/clothing/under/rank/security/officer/ac/ac_cassuit
	subcategory = LOADOUT_SUBCATEGORY_UNIFORM_JOBS
	restricted_desc = "Head of Security, Warden, Detective, Security Officer, Brig Physician, Peacekeeper, Blueshield."
	restricted_roles = list("Head of Security", "Warden", "Detective", "Security Officer", "Brig Physician", "Peacekeeper", "Blueshield")

/datum/gear/uniform/ac_casski
	name = "AC Casual Skirt"
	path = /obj/item/clothing/under/rank/security/officer/ac/ac_casski
	subcategory = LOADOUT_SUBCATEGORY_UNIFORM_JOBS
	restricted_desc = "Head of Security, Warden, Detective, Security Officer, Brig Physician, Peacekeeper, Blueshield."
	restricted_roles = list("Head of Security", "Warden", "Detective", "Security Officer", "Brig Physician", "Peacekeeper", "Blueshield")
