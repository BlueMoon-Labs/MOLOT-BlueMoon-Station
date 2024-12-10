/* BLUEMOON EDIT - CODE OVERRIDDEN IN 'modular_bluemoon\phoenix404\modules\vending\sustenance.dm'
/obj/machinery/vending/sustenance
	name = "\improper Sustenance Vendor"
	desc = "A vending machine which vends food, as required by section 47-C of the NT's Prisoner Ethical Treatment Agreement."
	product_slogans = "Наслаждайтесь едой.;Достаточно калорий, чтобы поддерживать напряженный труд.;Достаточно полезно.;Эффективно произведенный тофу!;Ммм! Так вкусно!;Поешьте.;Вам нужна еда, чтобы жить!;Даже заключенные заслуживают хлеба насущного!;Съешьте еще конфет-корн!;Попробуйте наши новые стаканчики со льдом.!"
	light_mask = "snack-light-mask"
	icon_state = "sustenance"
	products = list(/obj/item/reagent_containers/food/snacks/tofu = 24,
					/obj/item/reagent_containers/food/drinks/ice/sustanance = 12,
					/obj/item/reagent_containers/food/snacks/candy_corn = 6
					)
	contraband = list(/obj/item/kitchen/knife = 6,
					/obj/item/reagent_containers/food/drinks/coffee = 12,
					/obj/item/tank/internals/emergency_oxygen = 6,
					/obj/item/clothing/mask/breath = 6
					)

	refill_canister = /obj/item/vending_refill/sustenance
	default_price = PRICE_FREE
	extra_price = PRICE_FREE
	payment_department = NO_FREEBIES

/obj/item/vending_refill/sustenance
	machine_name = "Sustenance Vendor"
	icon_state = "refill_snack"
*/
