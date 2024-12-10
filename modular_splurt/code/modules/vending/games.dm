/* BLUEMOON EDIT - CODE OVERRIDDEN IN 'modular_bluemoon\phoenix404\modules\vending\games.dm'
/obj/machinery/vending/games/Initialize(mapload)
	var/list/extra_products = list(
		/obj/item/toy/cards/deck/tarot = 3
	)
	LAZYADD(products, extra_products)
	. = ..()
*/
