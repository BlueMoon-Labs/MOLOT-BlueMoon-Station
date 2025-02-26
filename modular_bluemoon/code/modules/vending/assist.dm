/obj/machinery/vending/assist
	name = "\improper Part-Mart"
	desc = "All the finest of miscellaneous electronics one could ever need! Not responsible for any injuries caused by reckless misuse of parts."
	//icon_state = "parts"
	//icon_deny = "parts-deny"
	//panel_type = "panel10"
	products = list(
		/obj/item/assembly/igniter = 6,
		/obj/item/assembly/prox_sensor = 7,
		/obj/item/assembly/playback = 4,
		/obj/item/assembly/signaler = 6,
		/obj/item/stock_parts/capacitor = 3,
		/obj/item/stock_parts/manipulator = 3,
		/obj/item/stock_parts/matter_bin = 3,
		/obj/item/stock_parts/micro_laser = 3,
		/obj/item/stock_parts/scanning_module = 3,
		/obj/item/stock_parts/cell/crap = 6,
		/obj/item/wirecutters = 3
	)
	contraband = list(
		/obj/item/assembly/health = 4,
		/obj/item/assembly/timer = 2,
		/obj/item/assembly/voice = 4,
		/obj/item/pressure_plate = 2,
		/obj/item/multitool = 2,
		/obj/item/stock_parts/cell/upgraded = 2
	)
	premium = list(
		/obj/item/stock_parts/cell/upgraded/plus = 2,
		/obj/item/circuitboard/machine/vendor = 3,
		/obj/item/flashlight/lantern = 2,
		/obj/item/vending_refill/custom = 3,
		/obj/item/beacon = 2
	)

	refill_canister = /obj/item/vending_refill/assist
	product_slogans = "Только самое лучшее!;Лом - сила!;Всегда держите монтировку под рукой!;Самое надежное оборудование!;Самое лучшее оборудование в космосе!"
	default_price = PRICE_REALLY_CHEAP
	extra_price = PRICE_ALMOST_CHEAP
	payment_department = NO_FREEBIES
	light_mask = "parts-light-mask"

/obj/item/vending_refill/assist
	machine_name = "Part-Mart"
	icon_state = "refill_parts"
