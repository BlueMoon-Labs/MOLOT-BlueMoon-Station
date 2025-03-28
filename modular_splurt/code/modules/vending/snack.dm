/* BLUEMOON EDIT - CODE OVERRIDDEN IN 'modular_bluemoon\code\modules\vending\snacks.dm'
/obj/machinery/vending/snack/Initialize(mapload)
	var/list/extra_products = list(
		/obj/item/storage/fancy/jellybean_bowl = 5,
		/obj/item/reagent_containers/food/snacks/sfseeds = 5
	)
	LAZYADD(products, extra_products)
	. = ..()
*/
