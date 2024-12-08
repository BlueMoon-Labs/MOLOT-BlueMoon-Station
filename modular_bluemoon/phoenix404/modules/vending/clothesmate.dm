/obj/machinery/vending/clothing
	name = "ClothesMate"
	desc = "A vending machine for clothing."
	icon_state = "clothes"
	icon_deny = "clothes-deny"
	//panel_type = "panel15"
	product_slogans = "Одевайтесь для успеха!;Вам следует выглядеть шикарно!;Только посмотрите на эту шикарную одежду!;Зачем оставлять стиль на волю судьбы? Используйте ClothesMate!"
	vend_reply = "Спасибо за использование ClothesMate!"
	product_categories = list(
		list(
			"name" = "Head",
			"icon" = "hat-cowboy",
			"products" = list(
				/obj/item/clothing/head/that = 4,
				/obj/item/clothing/head/fedora = 3,
				/obj/item/clothing/head/beret = 3,
				/obj/item/clothing/head/beret/black = 3,
				/obj/item/clothing/head/beret/purple = 3,
				/obj/item/clothing/head/beret/blue = 3,
				/obj/item/clothing/head/sombrero = 3,
				/obj/item/clothing/head/beanie = 3,
				/obj/item/clothing/head/beanie/black = 3,
				/obj/item/clothing/head/beanie/red = 3,
				/obj/item/clothing/head/beanie/green = 3,
				/obj/item/clothing/head/beanie/darkblue = 3,
				/obj/item/clothing/head/beanie/purple = 3,
				/obj/item/clothing/head/beanie/yellow = 3,
				/obj/item/clothing/head/beanie/orange = 3,
				/obj/item/clothing/head/beanie/cyan = 3,
				/obj/item/clothing/head/beanie/striped = 3,
				/obj/item/clothing/head/beanie/stripedred = 3,
				/obj/item/clothing/head/beanie/stripedblue = 3,
				/obj/item/clothing/head/beanie/stripedgreen = 3,
				/obj/item/clothing/head/cowboyhat = 3,
				/obj/item/clothing/head/cowboyhat/black = 3,
				/obj/item/clothing/head/cowboyhat/white = 3,
				/obj/item/clothing/head/cowboyhat/pink = 3,
				/obj/item/clothing/head/christmashat = 3,
				/obj/item/clothing/head/christmashatg = 3,
				/obj/item/clothing/head/deckers = 20,
				/obj/item/clothing/head/allies = 20
			),
		),

		list(
			"name" = "Accessories",
			"icon" = "glasses",
			"products" = list(
				/obj/item/clothing/glasses/monocle = 3,
				/obj/item/clothing/accessory/pride = 25,
				/obj/item/clothing/glasses/regular = 2,
				/obj/item/clothing/glasses/regular/jamjar = 2,
				/obj/item/clothing/glasses/orange = 5,
				/obj/item/clothing/glasses/red = 5,
				/obj/item/clothing/glasses/osi = 20,
				/obj/item/clothing/mask/balaclava = 3,
				/obj/item/clothing/head/ushanka = 3,
				/obj/item/clothing/under/costume/soviet = 3,
				/obj/item/storage/belt/fannypack/black = 3,
				/obj/item/clothing/suit/jacket/letterman_syndie = 5,
				/obj/item/clothing/under/costume/jabroni = 2,
				/obj/item/clothing/suit/vapeshirt = 2,
				/obj/item/clothing/under/costume/geisha = 4,
				/obj/item/clothing/under/misc/keyholesweater = 3,
				/obj/item/clothing/under/misc/staffassistant = 5
			),
		),

		list(
			"name" = "Under",
			"icon" = "shirt",
			"products" = list(
				/obj/item/clothing/under/suit/turtle/teal = 3,
				/obj/item/clothing/under/suit/turtle/grey = 3,
				/obj/item/clothing/under/suit/navy = 3,
				/obj/item/clothing/under/suit/black_really = 3,
				/obj/item/clothing/under/suit/burgundy = 3,
				/obj/item/clothing/under/suit/charcoal = 3,
				/obj/item/clothing/under/suit/white = 3,
				/obj/item/clothing/under/suit/tan = 3,
				/obj/item/clothing/under/suit/charismatic_suit = 3,
				/obj/item/clothing/under/costume/kilt = 3,
				/obj/item/clothing/under/sweater = 3,
				/obj/item/clothing/under/sweater/black = 3,
				/obj/item/clothing/under/sweater/purple = 3,
				/obj/item/clothing/under/sweater/green = 3,
				/obj/item/clothing/under/sweater/red = 3,
				/obj/item/clothing/under/sweater/blue = 3,
				/obj/item/clothing/under/pants/jeans = 5,
				/obj/item/clothing/under/pants/classicjeans = 5
			),
		),

		list(
			"name" = "Suits & Skirts",
			"icon" = "vest",
			"products" = list(
				/obj/item/clothing/accessory/sweater = 3,
				/obj/item/clothing/accessory/sweater/pink = 3,
				/obj/item/clothing/accessory/sweater/heart = 3,
				/obj/item/clothing/accessory/sweater/blue = 3,
				/obj/item/clothing/accessory/sweater/nt = 3,
				/obj/item/clothing/accessory/sweater/mint = 3,
				/obj/item/clothing/accessory/sweater/shoulderless = 3,
				/obj/item/clothing/accessory/sweater/flower = 3,
				/obj/item/clothing/under/sweater = 4,
				/obj/item/clothing/suit/hooded/wintercoat = 3,
				/obj/item/clothing/under/suit/navy = 3,
				/obj/item/clothing/under/suit/black_really = 3,
				/obj/item/clothing/under/suit/burgundy = 3,
				/obj/item/clothing/under/suit/charcoal = 3,
				/obj/item/clothing/under/suit/white = 3,
				/obj/item/clothing/suit/bomber = 3,
				/obj/item/clothing/suit/jacket/letterman = 3,
				/obj/item/clothing/suit/jacket/letterman_red = 3,
				/obj/item/clothing/suit/poncho = 3,
				/obj/item/clothing/under/dress/skirt = 3,
				/obj/item/clothing/under/suit/white_on_white/skirt = 3,
				/obj/item/clothing/under/rank/captain/suit/skirt = 2,
				/obj/item/clothing/under/rank/civilian/head_of_personnel/suit/skirt = 2,
				/obj/item/clothing/suit/apron/purple_bartender = 2,
				/obj/item/clothing/suit/jacket/miljacket = 3,
				/obj/item/clothing/suit/apron/overalls = 3,
				/obj/item/clothing/suit/jacket = 4,
				/obj/item/clothing/suit/toggle/jacket/flannel = 4,
				/obj/item/clothing/suit/toggle/jacket/flannel/red = 4,
				/obj/item/clothing/suit/toggle/jacket/flannel/aqua = 4,
				/obj/item/clothing/suit/toggle/jacket/flannel/brown = 4,
				/obj/item/clothing/suit/toggle/jacket/flannel/white = 4,
				/obj/item/clothing/suit/toggle/jacket/hawaiian = 4,
				/obj/item/clothing/suit/toggle/jacket/hawaiian/fuch = 4,
				/obj/item/clothing/suit/toggle/jacket/hawaiian/vine = 4,
				/obj/item/clothing/suit/toggle/jacket/hawaiian/orange = 4,
				/obj/item/clothing/suit/toggle/jacket/hawaiian/motu = 4,
				/obj/item/clothing/suit/toggle/jacket/hawaiian/vice = 4,
				/obj/item/clothing/suit/jacket/puffer/vest = 4,
				/obj/item/clothing/suit/jacket/puffer = 4,
				/obj/item/clothing/suit/hooded/cloak/david = 4,
			),
		),

		list(
			"name" = "Shoes",
			"icon" = "socks",
			"products" = list(
				/obj/item/clothing/shoes/laceup = 5,
				/obj/item/clothing/shoes/sneakers/black = 6,
				/obj/item/clothing/shoes/wraps = 3,
				/obj/item/clothing/shoes/wraps/silver = 3,
				/obj/item/clothing/shoes/wraps/red = 3,
				/obj/item/clothing/shoes/wraps/blue = 3,
				/obj/item/clothing/shoes/sandal = 6,
				/obj/item/clothing/shoes/cowboyboots = 3,
				/obj/item/clothing/shoes/cowboyboots/black = 3,
				/obj/item/clothing/shoes/sneakers/black = 4,
				/obj/item/clothing/shoes/sneakers/white = 4,
				/obj/item/clothing/shoes/winterboots = 2,
			),
		),

		list(
			"name" = "Special",
			"icon" = "star",
			"products" = list(
				/obj/item/clothing/mask/kitsunewhi = 3,
				/obj/item/clothing/mask/kitsuneblk = 3,
				/obj/item/clothing/under/costume/kimono = 2,
				/obj/item/clothing/suit/irs = 5,
				/obj/item/clothing/head/irs = 5,
				/obj/item/clothing/head/tmc = 5,
				/obj/item/clothing/head/deckers = 5,
				/obj/item/clothing/head/yuri = 5,
				/obj/item/clothing/head/allies = 5,
				/obj/item/clothing/glasses/osi = 5,
				/obj/item/clothing/glasses/phantom = 5,
				/obj/item/clothing/mask/gas/driscoll = 5,
				/obj/item/clothing/under/costume/yuri = 5,
				/obj/item/clothing/under/costume/dutch = 5,
				/obj/item/clothing/under/costume/osi = 5,
				/obj/item/clothing/under/costume/tmc = 5,
				/obj/item/clothing/suit/deckers = 5,
				/obj/item/clothing/suit/soviet = 5,
				/obj/item/clothing/suit/yuri = 5,
				/obj/item/clothing/suit/tmc = 5,
				/obj/item/clothing/suit/pg = 5,
				/obj/item/clothing/shoes/jackbros = 5,
				/obj/item/clothing/shoes/saints = 5,
				/obj/item/clothing/suit/jacket/letterman = 5,
				/obj/item/clothing/suit/jacket/letterman_red = 3,
				/obj/item/clothing/suit/suspenders = 3,
				/obj/item/clothing/suit/suspenders/suspenders_white = 4,
				/obj/item/clothing/accessory/suitjacket = 2,
				/obj/item/clothing/accessory/suitjacket/charcoal = 2,
				/obj/item/clothing/accessory/suitjacket/navy = 2,
				/obj/item/clothing/accessory/suitjacket/burgundy = 2,
				/obj/item/clothing/accessory/suitjacket/checkered = 2,
				/obj/item/storage/backpack/snail = 3,
				/obj/item/umbrella = 5
			),
		),
	)

	contraband = list(
				/obj/item/clothing/accessory/turtleneck/tactifool/syndicate = 3,
				/obj/item/clothing/under/syndicate/tacticool = 3,
				/obj/item/clothing/under/syndicate/tacticool/skirt = 3,
				/obj/item/clothing/mask/balaclava = 3,
				/obj/item/clothing/head/ushanka = 3,
				/obj/item/clothing/under/costume/soviet = 3,
				/obj/item/storage/belt/fannypack/black = 3,
				/obj/item/clothing/suit/jacket/letterman_syndie = 5,
				/obj/item/clothing/under/costume/jabroni = 2,
				/obj/item/clothing/suit/vapeshirt = 2,
				/obj/item/clothing/under/costume/geisha = 4,
				/obj/item/clothing/under/misc/keyholesweater = 3,
				/obj/item/clothing/under/misc/staffassistant = 5
	)
	premium = list(
				/obj/item/clothing/under/suit/checkered = 4,
				/obj/item/clothing/head/mailman = 2,
				/obj/item/clothing/under/misc/mailman = 2,
				/obj/item/clothing/suit/jacket/leather = 4,
				/obj/item/clothing/suit/jacket/leather/overcoat = 4,
				/obj/item/clothing/under/pants/mustangjeans = 3,
				/obj/item/clothing/neck/necklace/dope = 5,
				/obj/item/clothing/under/costume/swagoutfit = 5,
				/obj/item/clothing/shoes/swagshoes = 5,
				/obj/item/clothing/suit/jacket/letterman_nanotrasen = 5,
				/obj/item/clothing/under/misc/corporateuniform = 5,
				/obj/item/clothing/suit/hooded/wintercoat/narsie/fake = 5,
				/obj/item/clothing/suit/hooded/wintercoat/ratvar/fake = 5,
				/obj/item/clothing/suit/hooded/wintercoat/polychromic = 5,
				/obj/item/clothing/suit/toggle/wbreakpoly/polychromic = 5,
				/obj/item/clothing/shoes/sneakers/poly/polychromic = 10,
				/obj/item/clothing/suit/toggle/jacket/fancytrench = 4,
				/obj/item/clothing/suit/toggle/jacket/greenjacket = 4,
				/obj/item/clothing/suit/jacket/gentlecoat = 4,
				/obj/item/clothing/suit/jacket/gothicshirtcross = 4,
				/obj/item/clothing/suit/jacket/gothicshirt = 4,
				/obj/item/clothing/suit/jacket/gothiccoat = 4,
				/obj/item/clothing/suit/jacket/heartcoat = 4,
				/obj/item/clothing/suit/jacket/purplehoodie = 4,
				/obj/item/clothing/suit/jacket/bluehoodie = 4,
				/obj/item/clothing/suit/toggle/jacket/whitehoodie = 4
	)
	refill_canister = /obj/item/vending_refill/clothing
	default_price = PRICE_CHEAP //Default of
	extra_price = PRICE_BELOW_NORMAL
	payment_department = NO_FREEBIES
	light_mask = "wardrobe-light-mask"
	light_color = LIGHT_COLOR_ELECTRIC_GREEN

/obj/machinery/vending/clothing/canLoadItem(obj/item/I,mob/user)
	return (I.type in products)

/obj/item/vending_refill/clothing
	machine_name = "ClothesMate"
	icon_state = "refill_clothes"
