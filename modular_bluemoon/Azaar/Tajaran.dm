/obj/item/clothing/mask/gas/sechailer/fir36
	name = "FIR-36 half-face rebreather"
	desc = "A close-fitting respirator designed by Forestfel Intersystem Industries and originally meant for Tajarans, the FIR-36 Rebreather is used by Kaitam klan Military Personnel. It reeks of Militarism."
	icon_state = "fir36"
	item_state = "fir36"
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON

/obj/item/clothing/mask/gas/syndicate/fir22
	name = "FIR-22 full-face rebreather"
	desc = "A full-face respirator designed by Forestfel Intersystem Industries and originally meant for Tajarans, the FIR-22 Rebreather is a snout-covering variant often seen used by Tajaran Military Personnel and Civilian Personnel alike. It reeks of militarism."
	icon_state = "fir22"
	item_state = "fir22"
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON

/////////////////////////////////////////////////////////// Пихаю в лодаут

/datum/gear/mask/fir36
	name = "FIR-36 half-face rebreather"
	path = /obj/item/clothing/mask/gas/sechailer/fir36
	restricted_roles = list("Head of Security", "Warden", "Detective", "Security Officer", "Peacekeeper", "Blueshield", "Brig Physician")

/datum/gear/mask/fir22
	name = "FIR-22 full-face rebreather"
	path = /obj/item/clothing/mask/gas/syndicate/fir22
