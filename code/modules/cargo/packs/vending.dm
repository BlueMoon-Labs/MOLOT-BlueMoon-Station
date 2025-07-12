
//Reminders-
// If you add something to this list, please group it by type and sort it alphabetically instead of just jamming it in like an animal
// cost = 700- Minimum cost, or infinite points are possible.
//////////////////////////////////////////////////////////////////////////////
/////////////////////////////// Vending //////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

/datum/supply_pack/vending
	group = "Vending"

//////////////////////////////////////////////////////////////////////////////
///////////////////////// Service, Medical, Sec //////////////////////////////
//////////////////////////////////////////////////////////////////////////////

/datum/supply_pack/vending/bartending
	name = "Bartending Supply Crate"
	desc = "Приобретите автомат по продаже напитков и закусок, а также бесплатную книгу, содержащую тщательно хранимые секреты профессии бармена!"
	cost = 2000
	contains = list(/obj/item/vending_refill/boozeomat,
					/obj/item/vending_refill/coffee,
					/obj/item/book/granter/action/drink_fling)
	crate_name = "bartending supply crate"

/datum/supply_pack/vending/hydro
	name = "Cartridge Supply Crate"
	desc = "Пополните запас картриджей для КПК. Содержит техническую заправку для торгового автомата."
	cost = 5000
	contains = list(/obj/item/vending_refill/cart)
	crate_name = "hydroponics supply crate"
	crate_type = /obj/structure/closet/crate

/datum/supply_pack/vending/cigarette
	name = "Cigarette Supply Crate"
	desc = "Не верьте сообщениям - курите сегодня! Содержит заправку для автомата по продаже сигарет."
	cost = 1500
	contains = list(/obj/item/vending_refill/cigarette)
	crate_name = "cigarette supply crate"
	crate_type = /obj/structure/closet/crate

/datum/supply_pack/vending/dinner
	name = "Dinnerware Supply Crate"
	desc = "Используйте тарелку и возьмите с собой какую-нибудь посуду! Содержит набор для заправки посуды и продуктов питания в торговом автомате."
	cost = 2500
	contains = list(/obj/item/vending_refill/sustenance,
					/obj/item/vending_refill/dinnerware)
	crate_name = "dinnerware supply crate"
	crate_type = /obj/structure/closet/crate

/datum/supply_pack/vending/dinner
	name = "Engineering Supply Crate"
	desc = "Пакеты с инструментами, ожидающими использования для ремонта. Содержит набор для заправки инструментов и технических средств торгового автомата."
	cost = 5500 //Powerfull
	access = ACCESS_ENGINE
	contains = list(/obj/item/vending_refill/youtool,
					/obj/item/vending_refill/engivend)
	crate_name = "engineering supply crate"
	crate_type = /obj/structure/closet/crate/secure/engineering

/datum/supply_pack/vending/games
	name = "Games Supply Crate"
	desc = "Начните свою игру с помощью этого игрового автомата."
	cost = 1000
	contains = list(/obj/item/vending_refill/games)
	crate_name = "games supply crate"
	crate_type = /obj/structure/closet/crate

/datum/supply_pack/vending/hydro
	name = "Hydroponics Supply Crate"
	desc = "Разве ты не рад, что тебе не нужно делать это естественным путем? Содержит заправку для торговых автоматов megaseed и nutrimax."
	cost = 5000
	contains = list(/obj/item/vending_refill/hydroseeds,
					/obj/item/vending_refill/hydronutrients)
	crate_name = "hydroponics supply crate"
	crate_type = /obj/structure/closet/crate

/datum/supply_pack/vending/kinkmate
	name = "Kinkmate Supply and Construction Kit"
	desc = "Веселый способ провести смену. Содержит 2 упаковки невыразимых желаний."
	cost = 5000
	contains = list(/obj/item/vending_refill/kink,
					/obj/item/vending_refill/kink)
	crate_name = "Kinkmate construction kit"

/datum/supply_pack/vending/barkbox
	name = "Bark Box Supply Crate"
	desc = "Не хватает вещей, чтобы ваши питомцы были счастливы?"
	cost = 2000
	contraband = TRUE
	contains = list(/obj/item/vending_refill/barkbox)
	crate_name = "bark box supply crate"

/datum/supply_pack/vending/medical
	name = "Medical Vending Crate"
	desc = "Содержит заправки для медицинских торговых автоматов."
	cost = 2000
	contains = list(/obj/item/vending_refill/medical,
					/obj/item/vending_refill/wallmed)
	crate_name = "medical vending crate"
	crate_type = /obj/structure/closet/crate/medical

/datum/supply_pack/vending/security
	name = "SecTech Supply Crate"
	desc = "Офицер Пол купил все пончики? Заполните этим ящиком автомат средств безопасности. Для открытия требуется доступ безопасности."
	cost = 1500
	access = ACCESS_SECURITY
	contains = list(/obj/machinery/vending/security)
	crate_name = "SecTech supply crate"
	crate_type = /obj/structure/closet/crate/secure/gear
	can_private_buy = FALSE

/datum/supply_pack/vending/snack
	name = "Snack Supply Crate"
	desc = "Одна заправка в торговом автомате, приносящая добро! Рекомендованный стоматологом номер один заказ!"
	cost = 1500
	contains = list(/obj/item/vending_refill/snack)
	crate_name = "snacks supply crate"

/datum/supply_pack/vending/cola
	name = "Softdrinks Supply Crate"
	desc = "Тебя ударили ящиком с инструментами, но у тебя все еще есть эти надоедливые зубы? Избавьтесь от этих жемчужных белков с помощью этой заправки для автомата с газировкой уже сегодня!"
	cost = 1500
	contains = list(/obj/item/vending_refill/cola)
	crate_name = "soft drinks supply crate"

/datum/supply_pack/vending/vendomat
	name = "Vendomat Supply Crate"
	desc = "Содержит блок пополнения запасов Vendomat!"
	cost = 1200
	contains = list(/obj/item/vending_refill/assist)
	crate_name = "vendomat supply crate"

//////////////////////////////////////////////////////////////////////////////
//////////////////////////// Wardrobe Vendors ////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

/datum/supply_pack/vending/wardrobes/autodrobe
	name = "Autodrobe Supply Crate"
	desc = "Автомат без вашего любимого платья? Решите эту проблему сегодня с помощью этой автоматической заправки."
	cost = 1500
	contains = list(/obj/item/vending_refill/autodrobe)
	crate_name = "autodrobe supply crate"

/datum/supply_pack/vending/wardrobes/cargo
	name = "Cargo Wardrobe Supply Crate"
	desc = "В этом ящике содержится пополнение для CargoDrobe."
	cost = 750
	contains = list(/obj/item/vending_refill/wardrobe/cargo_wardrobe)
	crate_name = "cargo department supply crate"

/datum/supply_pack/vending/wardrobes/engineering
	name = "Engineering Wardrobe Supply Crate"
	desc = "Этот ящик содержит заправки для EngiDrobe и AtmosDrobe."
	cost = 1500
	contains = list(/obj/item/vending_refill/wardrobe/engi_wardrobe,
					/obj/item/vending_refill/wardrobe/atmos_wardrobe)
	crate_name = "engineering department wardrobe supply crate"

/datum/supply_pack/vending/wardrobes/general
	name = "General Wardrobes Supply Crate"
	desc = "В этом ящике содержатся заправки для CuraDrobe, BarDrobe, ChefDrobe, JaniDrobe, ChapDrobe."
	cost = 3750
	contains = list(/obj/item/vending_refill/wardrobe/curator_wardrobe,
					/obj/item/vending_refill/wardrobe/bar_wardrobe,
					/obj/item/vending_refill/wardrobe/chef_wardrobe,
					/obj/item/vending_refill/wardrobe/jani_wardrobe,
					/obj/item/vending_refill/wardrobe/chap_wardrobe)
	crate_name = "general wardrobes vendor refills"

/datum/supply_pack/vending/wardrobes/hydroponics
	name = "Hydrobe Supply Crate"
	desc = "В этом ящике находится заправка для Hydrobe."
	cost = 750
	contains = list(/obj/item/vending_refill/wardrobe/hydro_wardrobe)
	crate_name = "hydrobe supply crate"

/datum/supply_pack/vending/wardrobes/medical
	name = "Medical Wardrobe Supply Crate"
	desc = "В этом ящике находится заправка для MediDrobe, ChemDrobe, GeneDrobe, и ViroDrobe."
	cost = 3000
	contains = list(/obj/item/vending_refill/wardrobe/medi_wardrobe,
					/obj/item/vending_refill/wardrobe/chem_wardrobe,
					/obj/item/vending_refill/wardrobe/gene_wardrobe,
					/obj/item/vending_refill/wardrobe/viro_wardrobe)
	crate_name = "medical department wardrobe supply crate"

/datum/supply_pack/vending/wardrobes/science
	name = "Science Wardrobe Supply Crate"
	desc = "В этом ящике находится заправка для SciDrobe и RoboDrobe."
	cost = 1500
	contains = list(/obj/item/vending_refill/wardrobe/robo_wardrobe,
					/obj/item/vending_refill/wardrobe/science_wardrobe)
	crate_name = "science department wardrobe supply crate"

/datum/supply_pack/vending/wardrobes/security
	name = "Security Wardrobe Supply Crate"
	desc = "В этом ящике находится заправка для SecDrobe и LawDrobe."
	cost = 1500
	contains = list(/obj/item/vending_refill/wardrobe/sec_wardrobe,
					/obj/item/vending_refill/wardrobe/law_wardrobe)
	crate_name = "security department supply crate"
