/obj/item/storage/box/deviant_kit/lust
	name = "Sex Worker kit"
	desc = "Kit with ID and permit for employee of Silver Love Co."
	illustration = "id"

/obj/item/storage/box/deviant_kit/heresy
	name = "Occult kit"
	desc = "Вещественное одобрение на проведение оккультной деятельности"
	illustration = "id"

/obj/item/storage/box/deviant_kit/agony
	name = "Ravenheart Resident kit"
	desc = "Kit with ID and permit for research related to extreme activities whose nature of agony is strictly prohibited by scientific evidence."
	illustration = "id"

/obj/item/storage/box/deviant_kit/muck
	name = "Muck activity kit"
	desc = "Жрать гавно."
	illustration = "id"

/obj/item/storage/box/deviant_kit/lust/PopulateContents()
	new /obj/item/card/id/lust(src)
	new /obj/item/clothing/accessory/permit/special/deviant/lust(src)

/obj/item/storage/box/deviant_kit/heresy/PopulateContents()
	new /obj/item/card/id/heresy(src)
	if (GLOB.round_type == ROUNDTYPE_EXTENDED)
		new /obj/item/clothing/accessory/permit/special/deviant/heresey(src)

/obj/item/storage/box/deviant_kit/agony/PopulateContents()
	new /obj/item/card/id/agony(src)
	new /obj/item/clothing/accessory/permit/special/deviant/agony(src)

/obj/item/storage/box/deviant_kit/muck/PopulateContents()
	new /obj/item/card/id/muck(src)
	new /obj/item/clothing/accessory/permit/special/deviant/muck(src)

/datum/gear/hands/lust_kit
	name = "Sex Worker kit"
	path = /obj/item/storage/box/deviant_kit/lust
	item_icon = 'modular_bluemoon/Fink/icons/clothing/Magic_Gang.dmi'
	item_icon_state = "lust_id"

/datum/gear/hands/heresy_kit
	name = "Occult kit"
	path = /obj/item/storage/box/deviant_kit/heresy
	item_icon = 'modular_bluemoon/Fink/icons/clothing/Magic_Gang.dmi'
	item_icon_state = "occult_id"

/datum/gear/hands/agony_kit
	name = "Ravenheart Resident kit"
	path = /obj/item/storage/box/deviant_kit/agony
	item_icon = 'modular_bluemoon/Fink/icons/clothing/Magic_Gang.dmi'
	item_icon_state = "agony_id"

/datum/gear/donator/muck_kit
	name = "Muck activity kit"
	path = /obj/item/storage/box/deviant_kit/muck
	cost = 1
	ckeywhitelist = list()
	donator_group_id = DONATOR_GROUP_TIER_1
	item_icon = 'modular_bluemoon/Fink/icons/clothing/Magic_Gang.dmi'
	item_icon_state = "muck_id"
