/* BLUEMOON EDIT - CODE OVERRIDDEN IN 'modular_bluemoon\phoenix404\modules\vending\security.dm'
/obj/machinery/vending/security
	name = "\improper SecTech"
	desc = "A security equipment vendor."
	product_slogans = "Разбейте коммунистические черепа!;Побейте несколько голов!;Не забывайте - вред есть благо!;Ваше оружие здесь.;Наручники!;Стоять, подонок!;Не бейте меня!;Бейте их, Большой Брат.;Почему бы не съесть пончик?"
	icon_state = "sec"
	icon_deny = "sec-deny"
	light_mask = "sec-light-mask"
	req_access = list(ACCESS_SECURITY)
	products = list(/obj/item/restraints/handcuffs = 6,
					/obj/item/restraints/handcuffs/kinky = 6,
					/obj/item/restraints/handcuffs/cable/zipties = 6,
					/obj/item/grenade/flashbang = 4,
					/obj/item/assembly/flash/handheld = 5,
					/obj/item/reagent_containers/food/snacks/donut = 12,
					/obj/item/storage/box/evidence = 6,
					/obj/item/flashlight/seclite = 4,
					/obj/item/restraints/legcuffs/bola/energy = 12,
					/obj/item/evidencebag = 20,
					/obj/item/secbat = 5,
					/obj/item/fee_terminal = 10)
	contraband = list(/obj/item/clothing/glasses/sunglasses = 2,
					/obj/item/storage/fancy/donut_box = 2,
					/obj/item/storage/belt/sabre/secbelt = 1)
	premium = list(/obj/item/coin/antagtoken = 1,
					/obj/item/clothing/head/helmet/blueshirt = 4, //BlueMoon edit
					/obj/item/clothing/suit/armor/vest/blueshirt = 4, //BlueMoon edit
					/obj/item/clothing/under/rank/security/officer/blueshirt = 4, //BlueMoon edit
					/obj/item/clothing/gloves/tackler = 4, //BlueMoon edit
					/obj/item/grenade/stingbang = 4, //BlueMoon edit
					/obj/item/ssword_kit = 1,
					/obj/item/storage/belt/bandolier = 2,
					/obj/item/storage/belt/military = 2,
					/obj/item/storage/belt/military/assault/hecu = 1,
					/obj/item/storage/belt/military/assault/hecu/black = 1,
					/obj/item/storage/backpack/hipbag = 1,
					/obj/item/storage/backpack/hipbag/tan = 1,
					/obj/item/storage/backpack/hipbag/green = 1,
					/obj/item/storage/bag/ammo = 3)
	refill_canister = /obj/item/vending_refill/security
	default_price = PRICE_ALMOST_EXPENSIVE
	extra_price = PRICE_REALLY_EXPENSIVE
	payment_department = ACCOUNT_SEC

/obj/machinery/vending/security/pre_throw(obj/item/I)
	if(istype(I, /obj/item/grenade))
		var/obj/item/grenade/G = I
		G.preprime()
	else if(istype(I, /obj/item/flashlight))
		var/obj/item/flashlight/F = I
		F.on = TRUE
		F.update_brightness()

/obj/item/vending_refill/security
	icon_state = "refill_sec"
*/
