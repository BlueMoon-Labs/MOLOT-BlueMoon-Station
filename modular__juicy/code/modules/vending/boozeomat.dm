/* BLUEMOON EDIT - CODE OVERRIDDEN IN 'modular_bluemoon\code\modules\vending\boozeomat.dm'
/obj/machinery/vending/boozeomat/Initialize()
	var/list/extra_products = list(
		/obj/item/reagent_containers/food/drinks/bottle/blank/vampire_bottle = 10,
	)
	LAZYADD(products, extra_products)
	. = ..() */
