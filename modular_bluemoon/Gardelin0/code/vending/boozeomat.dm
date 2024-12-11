/* BLUEMOON EDIT - CODE OVERRIDDEN IN 'modular_bluemoon\phoenix404\modules\vending\boozeomat.dm'
/obj/machinery/vending/boozeomat/Initialize()
	var/list/extra_products = list(
		/obj/item/reagent_containers/food/drinks/bottle/blank/syrup_bottle = 5,
		/obj/item/reagent_containers/food/drinks/bottle/blank/syrup_bottle/banana = 5,
		/obj/item/reagent_containers/food/drinks/bottle/blank/syrup_bottle/caramel = 5,
		/obj/item/reagent_containers/food/drinks/bottle/blank/syrup_bottle/chili = 5,
		/obj/item/reagent_containers/food/drinks/bottle/blank/syrup_bottle/crocin = 5,
		/obj/item/reagent_containers/food/drinks/bottle/blank/syrup_bottle/semen = 5,
		/obj/item/reagent_containers/food/drinks/bottle/blank/syrup_bottle/grape = 5,
		/obj/item/reagent_containers/food/drinks/bottle/blank/syrup_bottle/cactus = 5,
		/obj/item/reagent_containers/food/drinks/bottle/blank/syrup_bottle/mint = 5,
		/obj/item/reagent_containers/food/drinks/bottle/blank/syrup_bottle/orange = 5,
		/obj/item/reagent_containers/food/drinks/bottle/blank/syrup_bottle/saltcaramel = 5,
		/obj/item/reagent_containers/food/drinks/bottle/blank/syrup_bottle/vanilla = 5,
		/obj/item/reagent_containers/food/drinks/bottle/blank/syrup_bottle/watermelon = 5,
	)
	var/list/extra_contraband = list()
	var/list/extra_premium = list()

	LAZYADD(products, extra_products)
	LAZYADD(contraband, extra_contraband)
	LAZYADD(premium, extra_premium)
	. = ..()
*/
