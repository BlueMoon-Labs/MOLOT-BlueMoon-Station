/* BLUEMOON EDIT - CODE OVERRIDDEN IN 'modular_bluemoon\phoenix404\modules\vending\wardrobes.dm'
/obj/machinery/vending/wardrobe/chef_wardrobe/Initialize()
	var/list/extra_products = list()
	var/list/extra_contraband = list(
		/obj/item/card/id/muck = 2,
	)
	var/list/extra_premium = list()

	LAZYADD(products, extra_products)
	LAZYADD(contraband, extra_contraband)
	LAZYADD(premium, extra_premium)
	. = ..()
*/
