/* BLUEMOON EDIT - CODE OVERRIDDEN IN 'modular_bluemoon\phoenix404\modules\vending\cola.dm'
/obj/machinery/vending/cola/Initialize()
    var/list/extra_products = list(
        /obj/item/reagent_containers/glass/beaker/waterbottle/large = 5
    )
    LAZYADD(products, extra_products)
    . = ..()
*/
