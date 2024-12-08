
/* BLUEMOON EDIT - CODE OVERRIDDEN IN 'modular_bluemoon\phoenix404\modules\vending\kinkmate.dm'
/obj/machinery/vending/kink/Initialize()
	var/list/extra_contraband = list(
		/obj/item/restraints/handcuffs/cable/silk_ribbon/red = 1,
		/obj/item/restraints/handcuffs/cable/silk_ribbon/yellow = 1,
		/obj/item/restraints/handcuffs/cable/silk_ribbon/blue = 1,
		/obj/item/restraints/handcuffs/cable/silk_ribbon/green = 1,
		/obj/item/restraints/handcuffs/cable/silk_ribbon/pink = 1,
		/obj/item/restraints/handcuffs/cable/silk_ribbon/orange = 1,
		/obj/item/restraints/handcuffs/cable/silk_ribbon/cyan = 1,
		/obj/item/restraints/handcuffs/cable/silk_ribbon/white = 1,
		/obj/item/restraints/handcuffs/cable/rope = 1,
		/obj/item/restraints/handcuffs/cable/belts/black = 1,
		/obj/item/restraints/handcuffs/cable/belts/brown = 1,
		/obj/item/restraints/handcuffs/cable/belts/red = 1,

	)
	var/list/extra_products = list()
	var/list/extra_premium = list()

	LAZYADD(products, extra_products)
	LAZYADD(contraband, extra_contraband)
	LAZYADD(premium, extra_premium)
	. = ..()
	*/
