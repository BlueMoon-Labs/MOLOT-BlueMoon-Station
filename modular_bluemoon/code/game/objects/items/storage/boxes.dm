/obj/item/storage/box/deviant_kit/lust
	name = "Sex Worker kit"
	desc = "Kit with ID and permit for employee of Silver Love Co."
	illustration = "id"

/obj/item/storage/box/deviant_kit/lust/PopulateContents()
	new /obj/item/card/id/lust(src)
	new /obj/item/clothing/accessory/permit/special/deviant/lust(src)

/obj/item/storage/box/deviant_kit/heresy
	name = "Occult kit"
	desc = "Вещественное одобрение на проведение оккультной деятельности"
	illustration = "id"

/obj/item/storage/box/deviant_kit/heresy/PopulateContents()
	new /obj/item/card/id/heresy(src)
	if (GLOB.round_type == ROUNDTYPE_EXTENDED)
		new /obj/item/clothing/accessory/permit/special/deviant/heresey(src)

/obj/item/storage/box/deviant_kit/agony
	name = "Ravenheart Resident kit"
	desc = "Kit with ID and permit for research related to extreme activities whose nature of agony is strictly prohibited by scientific evidence."
	illustration = "id"

/obj/item/storage/box/deviant_kit/agony/PopulateContents()
	new /obj/item/card/id/agony(src)
	new /obj/item/clothing/accessory/permit/special/deviant/agony(src)

/obj/item/storage/box/deviant_kit/muck
	name = "Muck activity kit"
	desc = "Жрать гавно."
	illustration = "id"

/obj/item/storage/box/deviant_kit/muck/PopulateContents()
	new /obj/item/card/id/muck(src)
	new /obj/item/clothing/accessory/permit/special/deviant/muck(src)
