/obj/machinery/vending/sovietvend
	name = "KomradeVendtink"
	desc = "Rodina-mat' zovyot!"
	icon_state = "soviet"
	vend_reply = "The fascist and capitalist svin'ya shall fall, komrade!"
	product_slogans = "Качество, за которым стоит стоять в очереди!;Получи серп и молот!;Советский Союз превыше всего!;Буржуй, акстись!;Не балуй!!;Народы Мира не хотят повторения бедствий войны!;Вперёд на Запад!!"
	products = list(
		/obj/item/clothing/under/costume/soviet = 20,
		/obj/item/clothing/head/ushanka = 20,
		/obj/item/clothing/shoes/jackboots = 20,
		/obj/item/clothing/head/squatter_hat = 20,
		/obj/item/clothing/under/misc/squatter = 20,
		/obj/item/clothing/under/misc/squatter/pants = 20,
		/obj/item/clothing/under/misc/blue_camo = 20,
		/obj/item/clothing/head/russobluecamohat = 20
		)
	contraband = list(
		/obj/item/clothing/suit/armor/vest/russian_coat = 4,
		/obj/item/clothing/mask/balaclava = 4,
		/obj/item/clothing/head/helmet/rus_ushanka = 4,
		/obj/item/clothing/head/helmet/rus_cap = 4,
		/obj/item/clothing/suit/space/hardsuit/soviet = 3,
		/obj/item/gun/energy/laser/LaserAK = 4
		)
	premium = list()

	refill_canister = /obj/item/vending_refill/soviet
	default_price = PRICE_FREE
	extra_price = PRICE_FREE
	payment_department = NO_FREEBIES

/obj/item/vending_refill/soviet
	machine_name 	= "sovietvend"
	icon_state 		= "refill_soviet"
