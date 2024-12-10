/* BLUEMOON EDIT - CODE OVERRIDDEN IN 'modular_bluemoon\phoenix404\modules\vending\kinkmate.dm'
/obj/machinery/vending/kink/Initialize()
	var/list/extra_products = list(
		/obj/item/summon_chalk = 5,
		/obj/item/card/id/lust = 5,
	)
	var/list/extra_contraband = list(
		/obj/item/reagent_containers/hypospray/medipen/lewdsleepy = 6,
	)

	var/list/extra_premium = list(
		/obj/item/clothing/mask/muzzle/mouthring = 5
		)

	LAZYADD(products, extra_products)
	LAZYADD(contraband, extra_contraband)
	LAZYADD(premium, extra_premium)
	. = ..()
*/
