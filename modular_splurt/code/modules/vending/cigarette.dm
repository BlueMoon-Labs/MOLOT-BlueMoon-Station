/* BLUEMOON EDIT - CODE OVERRIDDEN IN 'modular_bluemoon\phoenix404\modules\vending\cigarette.dm'
/obj/machinery/vending/cigarette/Initialize()
    var/list/extra_contraband = list(
        /obj/item/storage/fancy/cigarettes/cigpack_mindbreaker = 3,
        /obj/item/storage/fancy/cigarettes/cigpack_cannabis = 3
    )
    LAZYADD(contraband, extra_contraband)
    . = ..()
*/
