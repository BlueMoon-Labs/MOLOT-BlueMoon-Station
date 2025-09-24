
/obj/machinery/vending/cola
	name = "\improper Robust Softdrinks"
	desc = "A softdrink vendor provided by Robust Industries, LLC."
	icon_state = "Cola_Machine"
	//panel_type = "panel2"
	product_slogans = "Robust Softdrinks: прочнее, чем ящиком с инструментами по голове!;Освежающие!;Надеюсь, вы хотите пить!;Продано более одного миллиона напитков за сутки!;Хотите пить? Почему не кола?;Пожалуйста, выпейте!;Выпейте!;Лучшие напитки в космосе."
	products = list(
		/obj/item/reagent_containers/food/drinks/soda_cans/cola = 10,
		/obj/item/reagent_containers/food/drinks/soda_cans/synthdrink = 10,
		/obj/item/reagent_containers/food/drinks/soda_cans/space_mountain_wind = 10,
		/obj/item/reagent_containers/food/drinks/soda_cans/dr_gibb = 10,
		/obj/item/reagent_containers/food/drinks/soda_cans/starkist = 10,
		/obj/item/reagent_containers/food/drinks/soda_cans/space_up = 10,
		/obj/item/reagent_containers/food/drinks/soda_cans/pwr_game = 10,
		/obj/item/reagent_containers/food/drinks/soda_cans/lemon_lime = 10,
		/obj/item/reagent_containers/food/drinks/soda_cans/sol_dry = 10,
		/obj/item/reagent_containers/glass/beaker/waterbottle = 10,
		/obj/item/reagent_containers/glass/beaker/waterbottle/large = 5,
		/obj/item/reagent_containers/food/drinks/soda_cans/carbonatedcum = 5,
		/obj/item/reagent_containers/food/drinks/soda_cans/carbonatedfemcum = 5,
		/obj/item/reagent_containers/food/drinks/soda_cans/blood = 5,
		/obj/item/reagent_containers/food/drinks/soda_cans/blooddiscrete = 5
	)
	contraband = list(
		/obj/item/reagent_containers/food/drinks/soda_cans/thirteenloko = 6,
		/obj/item/reagent_containers/food/drinks/soda_cans/shamblers = 6,
		/obj/item/reagent_containers/glass/beaker/waterbottle/wataur = 2
	)
	premium = list(
		/obj/item/reagent_containers/food/drinks/drinkingglass/filled/nuka_cola = 1,
		/obj/item/reagent_containers/food/drinks/soda_cans/air = 1,
		/obj/item/reagent_containers/food/drinks/soda_cans/monkey_energy = 1,
		/obj/item/reagent_containers/food/drinks/soda_cans/grey_bull = 1
	)
	refill_canister = /obj/item/vending_refill/cola
	default_price = PRICE_CHEAP_AS_FREE
	extra_price = PRICE_ABOVE_NORMAL
	payment_department = ACCOUNT_SRV

/obj/item/vending_refill/cola
	machine_name = "Robust Softdrinks"
	icon_state = "refill_cola"

/obj/machinery/vending/cola/random
	name = "\improper Random Drinkies"
	icon_state = "random_cola"
	desc = "Uh oh!"

/obj/machinery/vending/cola/random/Initialize(mapload)
	. = ..()
	var/obj/machinery/vending/cola/T = pick(subtypesof(/obj/machinery/vending/cola) - /obj/machinery/vending/cola/random)
	T = new T(loc)
	T.pixel_x = pixel_x
	T.pixel_y = pixel_y
	return INITIALIZE_HINT_QDEL

/obj/machinery/vending/cola/blue
	icon_state = "Cola_Machine"
	light_mask = "cola-light-mask"
	light_color = COLOR_MODERATE_BLUE

/obj/machinery/vending/cola/black
	icon_state = "cola_black"
	light_mask = "cola-light-mask"

/obj/machinery/vending/cola/red
	icon_state = "red_cola"
	name = "\improper Space Cola Vendor"
	desc = "It vends cola, in space."
	product_slogans = "Космическая Кола!"
	light_mask = "red_cola-light-mask"
	light_color = COLOR_DARK_RED

/obj/machinery/vending/cola/space_up
	icon_state = "space_up"
	name = "\improper Space-up! Vendor"
	desc = "Indulge in an explosion of flavor."
	product_slogans = "В космос! Как пробоина в корпусе, но во рту."
	light_mask = "space_up-light-mask"
	light_color = COLOR_DARK_MODERATE_LIME_GREEN

/obj/machinery/vending/cola/starkist
	icon_state = "starkist"
	name = "\improper Star-kist Vendor"
	desc = "The taste of a star in liquid form."
	product_slogans = "Пейте звезды! Star-kist!"
	//panel_type = "panel7"
	light_mask = "starkist-light-mask"
	light_color = COLOR_LIGHT_ORANGE

/obj/machinery/vending/cola/sodie
	icon_state = "soda"
	//panel_type = "panel7"
	light_mask = "soda-light-mask"
	light_color = COLOR_WHITE

/obj/machinery/vending/cola/pwr_game
	icon_state = "pwr_game"
	name = "\improper Pwr Game Vendor"
	desc = "You want it, we got it. Brought to you in partnership with Vlad's Salads."
	product_slogans = "Мощь, которую жаждут геймеры! PWR GAME!!"
	light_mask = "pwr_game-light-mask"
	light_color = COLOR_STRONG_VIOLET

/obj/machinery/vending/cola/shamblers
	name = "\improper Shambler's Vendor"
	desc = "~Взболтай мне немного этого сока Шамблера!~"
	icon_state = "shamblers_juice"
	products = list(
		/obj/item/reagent_containers/food/drinks/soda_cans/cola = 10,
		/obj/item/reagent_containers/food/drinks/soda_cans/space_mountain_wind = 10,
		/obj/item/reagent_containers/food/drinks/soda_cans/dr_gibb = 10,
		/obj/item/reagent_containers/food/drinks/soda_cans/starkist = 10,
		/obj/item/reagent_containers/food/drinks/soda_cans/space_up = 10,
		/obj/item/reagent_containers/food/drinks/soda_cans/pwr_game = 10,
		/obj/item/reagent_containers/food/drinks/soda_cans/lemon_lime = 10,
		/obj/item/reagent_containers/food/drinks/soda_cans/sol_dry = 10,
		/obj/item/reagent_containers/food/drinks/soda_cans/shamblers = 10
	)
	product_slogans = "~Взболтай мне немного этого сока Шамблера! ~;Освежающий!;Jyrbv dv lg jfdv fw kyrk Jyrdscvi'j Alztv!;Более 1 триллиона душ выпито!;Жаждущий?;Nyp efk uizeb kyv uribevjj?;Kyv Jyrdscvi uizebj kyv ezxyk!;Drink up!;Krjkp."
	light_mask = "shamblers-light-mask"
	light_color = COLOR_MOSTLY_PURE_PINK

/obj/machinery/vending/cola/buzz_fuzz
	name = "\improper Buzz Fuzz Vendor"
	desc = "~A hive of Flavour!~"
	icon_state = "honey_vender"
	products = list(
		/obj/item/reagent_containers/food/drinks/soda_cans/cola = 10,
		/obj/item/reagent_containers/food/drinks/soda_cans/space_mountain_wind = 10,
		/obj/item/reagent_containers/food/drinks/soda_cans/dr_gibb = 10,
		/obj/item/reagent_containers/food/drinks/soda_cans/starkist = 10,
		/obj/item/reagent_containers/food/drinks/soda_cans/space_up = 10,
		/obj/item/reagent_containers/food/drinks/soda_cans/pwr_game = 10,
		/obj/item/reagent_containers/food/drinks/soda_cans/lemon_lime = 10,
		/obj/item/reagent_containers/food/drinks/soda_cans/sol_dry = 10,
		/obj/item/reagent_containers/food/drinks/soda_cans/shamblers = 5,
		/obj/item/reagent_containers/food/drinks/soda_cans/buzz_fuzz = 5,
		/obj/item/reagent_containers/glass/beaker/waterbottle/large = 5,
	)
	contraband = list(
		/obj/item/reagent_containers/food/drinks/soda_cans/thirteenloko = 6
	)
	premium = list(
		/obj/item/reagent_containers/food/drinks/beer/light = 1,
		/obj/item/reagent_containers/food/drinks/soda_cans/grey_bull = 1
	)
	product_slogans = "~Улей со вкусом!;Жгучий вкус!;Идеал рабочего трутня!;Жужжание!;Есть мед?;Королева одобряет этот напиток!;Верните недостающую энергию!;Пчела - потребитель!"


/* /obj/machinery/vending/cola/shamblers/Initialize(mapload)
	. = ..()
	set_active_language(get_random_spoken_language())

/obj/machinery/vending/cola/shamblers/speak(message)
	. = ..()
	set_active_language(get_random_spoken_language()) */
