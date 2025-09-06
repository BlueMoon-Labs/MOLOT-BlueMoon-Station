/**********************Light************************/

//this item is intended to give the effect of entering the mine, so that light gradually fades
/obj/effect/light_emitter
	name = "Light emitter"
	icon_state = "lighting_marker"
	anchored = TRUE
	invisibility = INVISIBILITY_ABSTRACT
	var/set_luminosity = 8
	var/set_cap = 0

/obj/effect/light_emitter/Initialize(mapload)
	. = ..()
	set_light(set_luminosity, set_cap)

/obj/effect/light_emitter/singularity_pull()
	return

/obj/effect/light_emitter/singularity_act()
	return

/obj/effect/light_emitter/podbay
	set_cap = 1

/obj/effect/light_emitter/thunderdome
	set_cap = 1
	set_luminosity = 1.6

/obj/effect/light_emitter/void
	light_color = LIGHT_COLOR_LAVENDER
	set_cap = 1
	set_luminosity = 5

// A "daylight" light emitter that's "safe" to flood-fill outdoors areas with. I hate this. - Rimi
/obj/effect/light_emitter/interlink
	set_luminosity = 4
	set_cap = 0.5

// almost like interlink but warmer and more "natural"
/obj/effect/light_emitter/fake_outdoors
	light_color = COLOR_LIGHT_YELLOW
	// set_cap = 1 // initial
	set_luminosity = 4 // interlink
	set_cap = 0.5 // interlink

/**********************Miner Lockers**************************/

/obj/structure/closet/wardrobe/miner
	name = "mining wardrobe"
	icon_door = "mixed"

/obj/structure/closet/wardrobe/miner/PopulateContents()
	new /obj/item/storage/backpack/duffelbag(src)
	new /obj/item/storage/backpack/explorer(src)
	new /obj/item/storage/backpack/satchel/explorer(src)
	new /obj/item/clothing/under/rank/cargo/miner/lavaland(src)
	new /obj/item/clothing/under/rank/cargo/miner/lavaland(src)
	new /obj/item/clothing/under/rank/cargo/miner/lavaland(src)
	new /obj/item/clothing/shoes/workboots/mining(src)
	new /obj/item/clothing/shoes/workboots/mining(src)
	new /obj/item/clothing/shoes/workboots/mining(src)
	new /obj/item/clothing/gloves/color/black(src)
	new /obj/item/clothing/gloves/color/black(src)
	new /obj/item/clothing/gloves/color/black(src)
	new /obj/item/clothing/suit/hooded/wintercoat/miner(src) //yes, even both mining locker types
	new /obj/item/clothing/suit/hooded/wintercoat/miner(src)
	new /obj/item/clothing/suit/hooded/wintercoat/miner(src)

/obj/structure/closet/secure_closet/miner
	name = "miner's equipment"
	icon_state = "mining"
	req_access = list(ACCESS_MINING)

/obj/structure/closet/secure_closet/miner/unlocked
	locked = FALSE

/obj/structure/closet/secure_closet/miner/PopulateContents()
	..()
	new /obj/item/stack/sheet/mineral/sandbags(src, 5)
	new /obj/item/storage/box/emptysandbags(src)
	new /obj/item/shovel(src)
	new /obj/item/pickaxe/mini(src)
	new /obj/item/radio/headset/headset_cargo/mining(src)
	new /obj/item/flashlight/seclite(src)
	new /obj/item/storage/bag/plants(src)
	new /obj/item/storage/bag/ore(src)
	new /obj/item/t_scanner/adv_mining_scanner/lesser(src)
	new /obj/item/gun/energy/kinetic_accelerator(src)
	new /obj/item/clothing/glasses/meson(src)
	new /obj/item/survivalcapsule(src)
	new /obj/item/assault_pod/mining(src)
	new /obj/item/clothing/suit/hooded/wintercoat/miner(src) //because you know you want it


/**********************Shuttle Computer**************************/

/obj/machinery/computer/shuttle/mining
	name = "Mining Shuttle Console"
	desc = "Used to call and send the mining shuttle."
	req_access = list(ACCESS_MINING)
	circuit = /obj/item/circuitboard/computer/mining_shuttle
	shuttleId = "mining"
	possible_destinations = "mining_home;mining_away;landing_zone_dock;mining_public;lavaland_common_away_xenoarch_1"
	no_destination_swap = TRUE
	var/static/list/dumb_rev_heads = list()

/obj/machinery/computer/shuttle/mining/common
	name = "Lavaland Shuttle Console"
	desc = "Used to call and send the lavaland shuttle."
	req_access = list()
	circuit = /obj/item/circuitboard/computer/mining_shuttle/common
	shuttleId = "mining_shuttle_common"
	possible_destinations = "commonmining_home;lavaland_common_away;lavaland_common_away_xenoarch_2"


/obj/machinery/computer/shuttle/mining/on_attack_hand(mob/user, act_intent = user.a_intent, unarmed_attack_flags)
	if(is_station_level(user.z) && user.mind && is_head_revolutionary(user) && !(user.mind in dumb_rev_heads))
		to_chat(user, "<span class='warning'>Ты думаешь, что покидать станцию СЕЙЧАС было бы _НУ ОЧЕНЬ_ глупо...</span>")
		dumb_rev_heads += user.mind
		return
	. = ..()

/**********************Mining car (Crate like thing, not the rail car)**************************/

/obj/structure/closet/crate/miningcar
	desc = "A mining car. This one doesn't work on rails, but has to be dragged."
	name = "Mining car (not for rails)"
	icon_state = "miningcar"
