// картонки
/obj/item/card/id/heresy
	icon = 'modular_bluemoon/Fink/icons/clothing/Magic_Gang.dmi'
	name = "Occult ID Card"
	desc = "ID for research related to occult activities whose nature of phenomena is poorly supported by scientific evidence."
	icon_state = "occult_id"
	assignment = "Herecit"
	uses_overlays = FALSE
	card_sticker = TRUE

/obj/item/card/id/lust
	icon = 'modular_bluemoon/Fink/icons/clothing/Magic_Gang.dmi'
	name = "Sex Worker ID"
	desc = "ID for employee of Silver Love Co."
	icon_state = "lust_id"
	assignment = "Sex worker"
	uses_overlays = FALSE
	card_sticker = TRUE

/obj/item/card/id/agony
	icon = 'modular_bluemoon/Fink/icons/clothing/Magic_Gang.dmi'
	name = "Ravenheart Resident ID "
	desc = "ID for research related to extreme activities whose nature of agony is strictly prohibited by scientific evidence."
	icon_state = "agony_id"
	assignment = "Ravenheart Resident"
	uses_overlays = FALSE
	card_sticker = TRUE

/obj/item/card/id/muck
	icon = 'modular_bluemoon/Fink/icons/clothing/Magic_Gang.dmi'
	name = "Muck ID Card"
	desc = "Жрать гавно."
	icon_state = "muck_id"
	assignment = "Mucker"
	uses_overlays = FALSE
	card_sticker = TRUE
// спермиты

/obj/item/clothing/accessory/permit/occult
	icon = 'modular_bluemoon/Fink/icons/clothing/Magic_Gang.dmi'
	icon_state = "occult_permit"
	name = "Occult activity permit"
	desc = "Вещественное одобрение на проведение оккультной деятельности"
	permitted_weapons = "Оружие культра Рат`вара и прочих не кровавых культов"
	notes = "Носитель имеет право на проведение ритуалов, жертвоприношений и аггитирование без страха преследования со стороны службы безопасности."

/obj/item/clothing/accessory/permit/lust
	icon = 'modular_bluemoon/Fink/icons/clothing/Magic_Gang.dmi'
	icon_state = "lust_permit"
	name = "Horny activity permit"
	desc = "Вещественное одобрение на проведение извращённой~ деятельности"
	permitted_weapons = "Holy dildo, BDSM whip, Riding crop "
	notes = "Носитель имеет право обустраивать бордели и оргии, иметь при себе и использовать афродизиаки, ходить голым, а также имеет права на публичное совокупление и изнасилования без страха преследования со стороны службы безопасности."

/obj/item/clothing/accessory/permit/agony
	icon = 'modular_bluemoon/Fink/icons/clothing/Magic_Gang.dmi'
	icon_state = "agony_permit"
	name = "Agony activity permit"
	desc = "Вещественное одобрение на проведение жестокой деструктивной деятельности"
	permitted_weapons = "Bloody Nullrods(Armblade, Darkblade, Red Claymore, Pithfork, Tentacle) Satan Bible"
	notes = "Носитель имеет право на поклонение любому божеству (Нар`си, Сатана в т.ч.), на проведение пыток, боёв и казней и т.д. без страха преследования со стороны службы безопасности."

/obj/item/clothing/accessory/permit/muck
	icon = 'modular_bluemoon/Fink/icons/clothing/Magic_Gang.dmi'
	icon_state = "muck_permit"
	name = "Muck activity permit"
	desc = "Вещественное одобрение на проведение мерзкой в общем понимании деятельности"
	permitted_weapons = "N/A"
	notes = "Носитель имеет право на раскидывание мусора, быть грязным, вонючим и противным без страха преследования со стороны службы безопасности."

///


/obj/item/clothing/accessory/permit/special/occult
	icon = 'modular_bluemoon/Fink/icons/clothing/Magic_Gang.dmi'
	icon_state = "occult_plus"
	name = "Occult activity permit"
	desc = "Вещественное одобрение ЦК на проведение оккультной деятельности"
	permitted_weapons = "Оружие культра Рат`вара и прочих не кровавых культов"
	notes = "Носитель имеет право на проведение ритуалов, жертвоприношений и аггитирование без страха преследования со стороны службы безопасности."

/obj/item/clothing/accessory/permit/special/lust
	icon = 'modular_bluemoon/Fink/icons/clothing/Magic_Gang.dmi'
	icon_state = "lust_plus"
	name = "Horny activity permit"
	desc = "Вещественное одобрение ЦК на проведение извращённой~ деятельности"
	permitted_weapons = "Holy dildo, BDSM whip, Riding crop "
	notes = "Носитель имеет право обустраивать бордели и оргии, иметь при себе и использовать афродизиаки, ходить голым, а также имеет права на публичное совокупление и изнасилования без страха преследования со стороны службы безопасности."

/obj/item/clothing/accessory/permit/special/agony
	icon = 'modular_bluemoon/Fink/icons/clothing/Magic_Gang.dmi'
	icon_state = "agony_plus"
	name = "Agony activity permit"
	desc = "Вещественное одобрение ЦК на проведение жестокой деструктивной деятельности"
	permitted_weapons = "Bloody Nullrods(Armblade, Darkblade, Red Claymore, Pithfork, Tentacle) Satan Bible"
	notes = "Носитель имеет право на поклонение любому божеству (Нар`си, Сатана в т.ч.), на проведение пыток, боёв и казней и т.д. без страха преследования со стороны службы безопасности."

/obj/item/clothing/accessory/permit/special/muck
	icon = 'modular_bluemoon/Fink/icons/clothing/Magic_Gang.dmi'
	icon_state = "muck_plus"
	name = "Muck activity permit"
	desc = "Вещественное одобрение ЦК на проведение мерзкой в общем понимании деятельности"
	permitted_weapons = "N/A"
	notes = "Носитель имеет право на раскидывание мусора, быть грязным, вонючим и противным без страха преследования со стороны службы безопасности."

// коробка

/obj/item/storage/box/deviants
	name = "box of deviant permits"
	desc = "Has so many different deviant permits."
	illustration = "id"

/obj/item/storage/box/deviants/PopulateContents()

	new	/obj/item/clothing/accessory/permit/occult(src)
	new	/obj/item/clothing/accessory/permit/occult(src)
	new	/obj/item/clothing/accessory/permit/lust(src)
	new	/obj/item/clothing/accessory/permit/lust(src)
	new	/obj/item/clothing/accessory/permit/agony(src)
	new	/obj/item/clothing/accessory/permit/agony(src)
	new	/obj/item/clothing/accessory/permit/muck(src)
