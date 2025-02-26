/obj/machinery/vending/sovietsoda
	name = "\improper BODA"
	desc = "Old sweet water vending machine."
	icon_state = "sovietsoda"
	//panel_type = "panel8"
	light_mask = "soviet-light-mask"
	product_slogans = "Для царя и страны.;Вы сегодня выполнили свою норму питания?;Очень хорошо!;Мы простые люди, потому что это все, что мы едим.;Если есть человек, то есть проблема. Если нет человека, то нет и проблемы.."
	products = list(
		/obj/item/reagent_containers/food/drinks/drinkingglass/filled/soda = 30,
	)
	contraband = list(
		/obj/item/reagent_containers/food/drinks/drinkingglass/filled/cola = 20,
	)
	resistance_flags = FIRE_PROOF
	refill_canister = /obj/item/vending_refill/sovietsoda
	default_price = 1
	extra_price = 2 //One credit for every state of FREEDOM
	payment_department = NO_FREEBIES
	light_color = COLOR_PALE_ORANGE

/obj/item/vending_refill/sovietsoda
	machine_name = "BODA"
	icon_state = "refill_cola"
