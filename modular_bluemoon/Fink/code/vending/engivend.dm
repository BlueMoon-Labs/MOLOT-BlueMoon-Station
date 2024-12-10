/* BLUEMOON EDIT - CODE OVERRIDDEN IN 'modular_bluemoon\phoenix404\modules\vending\engivend.dm'
/obj/machinery/vending/engivend/Initialize()
	var/list/extra_products = list(
		/obj/item/assembly/control = 10,
	)
	var/list/extra_contraband = list()
	var/list/extra_premium = list()

	LAZYADD(products, extra_products)
	LAZYADD(contraband, extra_contraband)
	LAZYADD(premium, extra_premium)
	. = ..()
	*/
