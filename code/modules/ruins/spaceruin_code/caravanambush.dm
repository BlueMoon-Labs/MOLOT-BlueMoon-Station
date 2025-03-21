//caravan ambush

/obj/item/wrench/caravan
	icon_state = "wrench_caravan"
	desc = "A prototype of a new wrench design, allegedly the red color scheme makes it go faster."
	name = "experimental wrench"
	toolspeed = 0.3

/obj/item/screwdriver/caravan
	icon_state = "screwdriver_caravan"
	desc = "A prototype of a new screwdriver design, allegedly the red color scheme makes it go faster."
	name = "experimental screwdriver"
	toolspeed = 0.3
	random_color = FALSE

/obj/item/wirecutters/caravan
	icon_state = "cutters_caravan"
	desc = "A prototype of a new wirecutter design, allegedly the red color scheme makes it go faster."
	name = "experimental wirecutters"
	toolspeed = 0.3
	random_color = FALSE

/obj/item/crowbar/red/caravan
	icon_state = "crowbar_caravan"
	desc = "A prototype of a new crowbar design, allegedly the red color scheme makes it go faster."
	name = "experimental crowbar"
	toolspeed = 0.3

/obj/machinery/computer/shuttle/caravan

/obj/item/circuitboard/computer/caravan
	build_path = /obj/machinery/computer/shuttle/caravan

/obj/item/circuitboard/computer/caravan/trade1
	build_path = /obj/machinery/computer/shuttle/caravan/trade1

/obj/item/circuitboard/computer/caravan/pirate
	build_path = /obj/machinery/computer/shuttle/caravan/pirate

/obj/item/circuitboard/computer/caravan/syndicate1
	build_path = /obj/machinery/computer/shuttle/caravan/syndicate1

/obj/item/circuitboard/computer/caravan/syndicate2
	build_path = /obj/machinery/computer/shuttle/caravan/syndicate2

/obj/item/circuitboard/computer/caravan/syndicate3
	build_path = /obj/machinery/computer/shuttle/caravan/syndicate3

/obj/item/circuitboard/computer/caravan/syndicate4
	build_path = /obj/machinery/computer/shuttle/caravan/syndicate4

/obj/machinery/computer/shuttle/caravan/trade1
	name = "Small Freighter Shuttle Console"
	desc = "Used to control the Small Freighter."
	circuit = /obj/item/circuitboard/computer/caravan/trade1
	shuttleId = "caravantrade1"
	possible_destinations = "whiteship_away;whiteship_home;whiteship_z4;whiteship_lavaland;caravantrade1_custom;caravantrade1_ambush"

/obj/machinery/computer/camera_advanced/shuttle_docker/caravan/Initialize(mapload)
	. = ..()
	GLOB.jam_on_wardec += src

/obj/machinery/computer/camera_advanced/shuttle_docker/caravan/Destroy()
	GLOB.jam_on_wardec -= src
	return ..()

/obj/machinery/computer/camera_advanced/shuttle_docker/caravan/trade1
	name = "Small Freighter Navigation Computer"
	desc = "Used to designate a precise transit location for the Small Freighter."
	shuttleId = "caravantrade1"
	lock_override = NONE
	shuttlePortId = "caravantrade1_custom"
	jump_to_ports = list("whiteship_away" = 1, "whiteship_home" = 1, "whiteship_z4" = 1, "caravantrade1_ambush" = 1)
	view_range = 6.5
	x_offset = -5
	y_offset = -5
	designate_time = 100

/obj/machinery/computer/shuttle/caravan/pirate
	name = "Pirate Cutter Shuttle Console"
	desc = "Used to control the Pirate Cutter."
	icon_screen = "syndishuttle"
	icon_keyboard = "syndie_key"
	light_color = LIGHT_COLOR_RED
	circuit = /obj/item/circuitboard/computer/caravan/pirate
	shuttleId = "caravanpirate"
	possible_destinations = "caravanpirate_custom;caravanpirate_ambush"

/obj/machinery/computer/camera_advanced/shuttle_docker/caravan/pirate
	name = "Pirate Cutter Navigation Computer"
	desc = "Used to designate a precise transit location for the Pirate Cutter."
	icon_screen = "syndishuttle"
	icon_keyboard = "syndie_key"
	shuttleId = "caravanpirate"
	lock_override = NONE
	shuttlePortId = "caravanpirate_custom"
	jump_to_ports = list("caravanpirate_ambush" = 1)
	view_range = 6.5
	x_offset = 3
	y_offset = -6

/obj/machinery/computer/shuttle/caravan/syndicate1
	name = "Syndicate Fighter Shuttle Console"
	desc = "Used to control the Syndicate Fighter."
	icon_screen = "syndishuttle"
	icon_keyboard = "syndie_key"
	light_color = LIGHT_COLOR_RED
	req_access = list(ACCESS_SYNDICATE)
	circuit = /obj/item/circuitboard/computer/caravan/syndicate1
	shuttleId = "caravansyndicate1"
	possible_destinations = "caravansyndicate1_custom;caravansyndicate1_ambush;caravansyndicate1_listeningpost"

/obj/machinery/computer/camera_advanced/shuttle_docker/caravan/syndicate1
	name = "Syndicate Fighter Navigation Computer"
	desc = "Used to designate a precise transit location for the Syndicate Fighter."
	icon_screen = "syndishuttle"
	icon_keyboard = "syndie_key"
	shuttleId = "caravansyndicate1"
	lock_override = NONE
	shuttlePortId = "caravansyndicate1_custom"
	jump_to_ports = list("caravansyndicate1_ambush" = 1, "caravansyndicate1_listeningpost" = 1)
	view_range = 0
	x_offset = 2
	y_offset = 0

/obj/machinery/computer/shuttle/caravan/syndicate2
	name = "Syndicate Fighter Shuttle Console"
	desc = "Used to control the Syndicate Fighter."
	icon_screen = "syndishuttle"
	icon_keyboard = "syndie_key"
	req_access = list(ACCESS_SYNDICATE)
	light_color = LIGHT_COLOR_RED
	circuit = /obj/item/circuitboard/computer/caravan/syndicate2
	shuttleId = "caravansyndicate2"
	possible_destinations = "caravansyndicate2_custom;caravansyndicate2_ambush;caravansyndicate1_listeningpost"

/obj/machinery/computer/camera_advanced/shuttle_docker/caravan/syndicate2
	name = "Syndicate Fighter Navigation Computer"
	desc = "Used to designate a precise transit location for the Syndicate Fighter."
	icon_screen = "syndishuttle"
	icon_keyboard = "syndie_key"
	shuttleId = "caravansyndicate2"
	lock_override = NONE
	shuttlePortId = "caravansyndicate2_custom"
	jump_to_ports = list("caravansyndicate2_ambush" = 1, "caravansyndicate1_listeningpost" = 1)
	view_range = 0
	x_offset = 0
	y_offset = 2

/obj/machinery/computer/shuttle/caravan/syndicate3
	name = "Syndicate Drop Ship Console"
	desc = "Used to control the Syndicate Drop Ship."
	icon_screen = "syndishuttle"
	icon_keyboard = "syndie_key"
	req_access = list(ACCESS_SYNDICATE)
	light_color = LIGHT_COLOR_RED
	circuit = /obj/item/circuitboard/computer/caravan/syndicate3
	shuttleId = "caravansyndicate3"
	possible_destinations = "caravansyndicate3_custom;caravansyndicate3_ambush;caravansyndicate1_listeningpost"

/obj/machinery/computer/camera_advanced/shuttle_docker/caravan/syndicate3
	name = "Syndicate Drop Ship Navigation Computer"
	desc = "Used to designate a precise transit location for the Syndicate Drop Ship."
	icon_screen = "syndishuttle"
	icon_keyboard = "syndie_key"
	shuttleId = "caravansyndicate3"
	lock_override = NONE
	shuttlePortId = "caravansyndicate3_custom"
	jump_to_ports = list("caravansyndicate3_ambush" = 1, "caravansyndicate1_listeningpost" = 1)
	view_range = 2.5
	x_offset = -1
	y_offset = -3

/obj/machinery/computer/shuttle/caravan/syndicate4
	name = "SBC Starfury Console"
	desc = "Used to control the Syndicate Drop Ship."
	icon_screen = "syndishuttle"
	icon_keyboard = "syndie_key"
	req_access = list(ACCESS_SYNDICATE)
	light_color = LIGHT_COLOR_RED
	circuit = /obj/item/circuitboard/computer/caravan/syndicate4
	shuttleId = "sbc_corvette"
	possible_destinations = "sbc_corvette_custom;ds1_syndicate;ds2_syndicate;caravansyndicate1_listeningpost;whiteship_z4"

/obj/machinery/computer/camera_advanced/shuttle_docker/caravan/syndicate4
	name = "Starfury Navigation Computer"
	desc = "Used to designate a precise transit location for the Syndicate Drop Ship."
	icon_screen = "syndishuttle"
	icon_keyboard = "syndie_key"
	shuttleId = "sbc_corvette"
	lock_override = NONE
	shuttlePortId = "sbc_corvette_custom"
	jump_to_ports = list("ds2_syndicate" = 1, "caravansyndicate1_listeningpost" = 1, "whiteship_home" = 1, "whiteship_z4" = 1)
	view_range = 2.5
	x_offset = 7
	y_offset = 1
	designate_time = 300

/obj/machinery/computer/shuttle/ds_syndicate
	name = "Starfury Navigation Computer"
	desc = "A console that controls the Syndicate Drop Ship."
	icon_screen = "syndishuttle"
	icon_keyboard = "syndie_key"
	circuit = /obj/item/circuitboard/computer/ds_syndicate
	shuttleId = "sbc_corvette"
	possible_destinations = "ds1_syndicate;ds2_syndicate;caravansyndicate1_listeningpost"
	req_access = list(ACCESS_SYNDICATE)
	var/allow_silicons = FALSE
	var/allow_emag = FALSE

/obj/machinery/computer/shuttle/ds_syndicate/emag_act(mob/user)
	if(!allow_emag)
		to_chat(user, "<span class='warning'>[src]'s security firewall is far too powerful for you to bypass.</span>")
		return SEND_SIGNAL(src, COMSIG_ATOM_EMAG_ACT)
	return ..()

/obj/machinery/computer/shuttle/ds_syndicate/attack_ai()
	return allow_silicons ? ..() : FALSE

/obj/machinery/computer/shuttle/ds_syndicate/attack_robot()
	return allow_silicons ? ..() : FALSE
