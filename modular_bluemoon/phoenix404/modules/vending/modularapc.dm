/obj/machinery/vending/modularpc
	name = "\improper Deluxe Silicate Solutions"
	desc = "Your dream PC, just a few credits away!."
	icon_state = "modularpc"
	icon_deny = "modularpc-deny"
	light_mask = "modular-light-mask"
	products = list(
		/obj/item/computer_hardware/hard_drive/micro = 5,
		/obj/item/computer_hardware/hard_drive/small = 5,
		/obj/item/computer_hardware/hard_drive = 5,
		/obj/item/computer_hardware/processor_unit/small = 4,
		/obj/item/computer_hardware/processor_unit = 4,
		/obj/item/computer_hardware/network_card = 4,
		/obj/item/computer_hardware/network_card/wired = 4,
		/obj/item/computer_hardware/battery = 5,
		/obj/item/stock_parts/cell/computer/micro = 5,
		/obj/item/stock_parts/cell/computer = 5,
		/obj/item/computer_hardware/printer/mini = 3,
		/obj/item/computer_hardware/card_slot = 5,
		/obj/item/computer_hardware/radio_card = 4
	)
	premium = list(
		/obj/item/computer_hardware/recharger/apc_recharger = 3,
		/obj/item/computer_hardware/hard_drive/advanced = 3,
		/obj/item/computer_hardware/network_card/advanced = 3,
		/obj/item/computer_hardware/ai_slot = 2,
		/obj/item/stock_parts/cell/computer/advanced = 3,
		/obj/item/computer_hardware/processor_unit/photonic/small = 3,
		/obj/item/computer_hardware/processor_unit/photonic = 2,
		/obj/item/computer_hardware/printer = 2
	)
	refill_canister = /obj/item/vending_refill/modularpc
	default_price = PRICE_CHEAP
	extra_price = PRICE_ABOVE_NORMAL
	payment_department = ACCOUNT_SCI

/obj/item/vending_refill/modularpc
	machine_name = "Deluxe Silicate Solutions"
	icon_state = "refill_parts"
