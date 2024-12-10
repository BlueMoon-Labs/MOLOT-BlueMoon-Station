/* BLUEMOON EDIT - CODE OVERRIDDEN IN 'modular_bluemoon\phoenix404\modules\vending\kinkmate.dm'
/obj/machinery/vending/kink/Initialize()
	var/list/extra_products = list(
		/obj/item/clothing/under/dress/skirt/lustymaid = 5,
		/obj/item/clothing/under/dress/skirt/maidsexy = 5,
		/obj/item/clothing/wrists/helper_bracelet = 10,
		/obj/item/clothing/wrists/helper_bracelet/love_need_bracelet = 10,
		/obj/item/clothing/wrists/helper_bracelet/fuckme_need_bracelet = 10,
		/obj/item/clothing/wrists/helper_bracelet/fuckyou_need_bracelet = 10,
		/obj/item/clothing/wrists/helper_bracelet/rape_need_bracelet = 10,
		/obj/item/magicwand = 5,
		/obj/item/magicwand/blackwand = 5,
		/obj/item/sybian_kit = 5,
		/obj/item/dildo_machine_kit = 5,
		/obj/item/gloryhole_kit = 5,
		/obj/item/qareen_chalk = 5,
	)
	var/list/extra_contraband = list(
		/obj/item/storage/box/tentaclescubes = 1, //Just one, because someone is going to spam it, I swear to Azura
		/obj/item/storage/box/tentacle_panties =3
	)
	var/list/extra_premium = list()

	LAZYADD(products, extra_products)
	LAZYADD(contraband, extra_contraband)
	LAZYADD(premium, extra_premium)
	. = ..()
	 */
