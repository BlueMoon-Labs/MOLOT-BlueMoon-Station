/* BLUEMOON EDIT - CODE OVERRIDDEN IN 'modular_bluemoon\phoenix404\modules\vending\wardrobes.dm'
/obj/machinery/vending/wardrobe/chap_wardrobe/Initialize()
	var/list/extra_products = list(/obj/item/reagent_containers/glass/mortar/urn = 10,)
	var/list/extra_contraband = list(
		/obj/item/card/id/agony = 5,
		/obj/item/choice_beacon/box/creepy_statue_kit = 6,
		/obj/item/choice_beacon/box/creepy_statue_kit/big = 1,
			)

	var/list/extra_premium = list(
		/obj/item/reagent_containers/censer = 1,

	)

	LAZYADD(products, extra_products)
	LAZYADD(contraband, extra_contraband)
	LAZYADD(premium, extra_premium)
	. = ..()
*/
