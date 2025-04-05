
/obj/machinery/power/floodlight/urbanismlight
	name = "Floodlight"
	icon = 'modular_bluemoon/olgachan/urbanismpack/icons/icons.dmi'
	icon_state = "oldfloodlight"
	anchored = TRUE
	armor = list(MELEE = 30, BULLET =30, LASER = 20, ENERGY = 10, BOMB = 30, BIO = 10, RAD = 0, FIRE = 50, ACID = 50)

/obj/machinery/power/floodlight/urbanismlight/mesaspec
	icon_state = "oldfloodlight_on"
	layer = 4
	light_range = 15
	light_color = "#ffffdd"
	max_integrity = 9999999


/obj/structure/closet/crate/urbanismcrate
	name = "military crate"
	icon = 'modular_bluemoon/olgachan/urbanismpack/icons/icons.dmi'
	icon_state = "milcrate"

/obj/structure/closet/crate/large/urbanismcratelarge
	name = "big box"
	icon = 'modular_bluemoon/olgachan/urbanismpack/icons/icons.dmi'
	icon_state = "box"

/obj/structure/closet/crate/large/urbanismcratelarge/mil
	name = "big military box"
	icon_state = "boxmil"

/obj/structure/urbanismdamagedbarrel
	name = "Old rusty barrel"
	desc = "An old barrel with some junk in"
	icon = 'modular_bluemoon/olgachan/urbanismpack/icons/icons.dmi'
	icon_state = "drumfire"
	anchored = TRUE
	density = TRUE
	armor = list(MELEE = 30, BULLET =30, LASER = 20, ENERGY = 10, BOMB = 30, BIO = 10, RAD = 0, FIRE = 50, ACID = 50)

/obj/structure/reagent_dispensers/urbanismbarrel
	name = "Barrel"
	desc = "Typical barrel. Contains... Something"
	icon = 'modular_bluemoon/olgachan/urbanismpack/icons/icons.dmi'
	icon_state = "barrel"
	anchored = TRUE
	armor = list(MELEE = 60, BULLET =50, LASER = 10, ENERGY = 10, BOMB = 30, BIO = 10, RAD = 0, FIRE = 50, ACID = 50)

/obj/structure/reagent_dispensers/urbanismbarrel/red
	icon_state = "redbarrel"

/obj/structure/barricade/urbanism
	name = "Barricade"
	desc = "Basic barricade meant to protect idiots like you from danger."
	icon = 'modular_bluemoon/olgachan/urbanismpack/icons/icons.dmi'
	icon_state = "crowd_barrier"
	anchored = TRUE
	density = TRUE
	pass_flags_self = LETPASSTHROW
	max_integrity = 280
	proj_pass_rate = 20
	climbable = TRUE
	armor = list(MELEE = 30, BULLET =40, LASER = 10, ENERGY = 10, BOMB = 30, BIO = 10, RAD = 0, FIRE = 50, ACID = 50)

/obj/structure/barricade/urbanism/roadblock
	resistance_flags = INDESTRUCTIBLE
	icon_state = "concrete"

/obj/structure/urbanismpile
	name = "Trash Crate"
	desc = "Crate full of trash... Found someone?"
	icon = 'modular_bluemoon/olgachan/urbanismpack/icons/icons.dmi'
	icon_state = "dumpsteropen_halffull"
	resistance_flags = INDESTRUCTIBLE
	anchored = TRUE
	density = TRUE

/obj/structure/urbanismtire
	name = "Tire"
	desc = "Just tire! Tire for cars and fireplaces"
	icon = 'modular_bluemoon/olgachan/urbanismpack/icons/icons.dmi'
	icon_state = "shina"
	anchored = TRUE
	density = TRUE
	armor = list(MELEE = 20, BULLET =40, LASER = 10, ENERGY = 10, BOMB = 30, BIO = 10, RAD = 0, FIRE = 50, ACID = 50)

/obj/structure/urbanismpower
	name = "Power Line"
	desc = "Эта необычная старая вышка обеспечивает электричеством то место, где вы сейчас находитесь"
	icon = 'modular_bluemoon/olgachan/urbanismpack/icons/bigsprites.dmi'
	icon_state = "powerline"
	anchored = TRUE
	density = TRUE
	armor = list(MELEE = 50, BULLET =40, LASER = 50, ENERGY = 60, BOMB = 50, BIO = 10, RAD = 0, FIRE = 50, ACID = 50)
	layer = SPACEVINE_LAYER

/obj/structure/urbanismpower/transformer
	name = "Power transformer"
	desc = "электротехническое устройство в сетях электроснабжения с двумя или более обмотками, который посредством электромагнитной индукции преобразует одну величину переменного напряжения и тока в другую величину переменного напряжения и тока, той же частоты без изменения её передаваемой мощности"
	icon = 'modular_bluemoon/olgachan/urbanismpack/icons/bigsprites.dmi'
	icon_state = "powertransformer"

/obj/structure/urbanismbigcrate
	name = "Big boxes"
	desc = "One big box with one smaller on it. Honestly, they are empty"
	icon = 'modular_bluemoon/olgachan/urbanismpack/icons/bigsprites.dmi'
	icon_state = "crate"
	anchored = TRUE
	density = TRUE
	armor = list(MELEE = 50, BULLET =40, LASER = 50, ENERGY = 60, BOMB = 50, BIO = 10, RAD = 0, FIRE = 50, ACID = 50)
	layer = SPACEVINE_LAYER

/obj/structure/urbanismcars
	name = "Damaged car"
	desc = "Just lost in time broken (and bit rusty) vehicle"
	icon = 'modular_bluemoon/olgachan/urbanismpack/icons/vehicles.dmi'
	icon_state = "car_wreck"
	anchored = TRUE
	density = TRUE
	armor = list(MELEE = 70, BULLET =60, LASER = 50, ENERGY = 80, BOMB = 50, BIO = 10, RAD = 10, FIRE = 50, ACID = 50)
	layer = SPACEVINE_LAYER
