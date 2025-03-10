/datum/outfit/lfwb_ordinator
	name = "Ординатор Трибунала"

	uniform = /obj/item/clothing/under/syndicate/ordinator
	suit = /obj/item/clothing/suit/armor/hos/ordinator
	head = /obj/item/clothing/head/helmet/knight/ordinator
	shoes = /obj/item/clothing/shoes/combat/swat
	gloves = /obj/item/clothing/gloves/tackler/combat/insulated
	mask = /obj/item/clothing/mask/gas/atmos/lfwb
	glasses = /obj/item/clothing/glasses/hud/security/lfwb
	back = /obj/item/storage/backpack/rucksack
	l_pocket = /obj/item/ammo_box/magazine/fal
	r_pocket = /obj/item/flashlight/lantern
	suit_store = /obj/item/gun/ballistic/automatic/fal
	belt = /obj/item/storage/belt/grenade/full
	r_hand = /obj/item/claymore/baron
	l_hand = /obj/item/gun/energy/taser/bolestrel
	id = /obj/item/card/id/ert
	ears = /obj/item/radio/headset/headset_cent/alt

	backpack_contents = list(/obj/item/storage/box/survival/security=1,\
		/obj/item/storage/firstaid/tactical/slaver=1,\
		/obj/item/sign/flag/ravenheart/alt=1,\
		/obj/item/storage/box/raven_box/posters=1,\
		/obj/item/ammo_box/c308=1,\
		/obj/item/grenade/plastic/x4=1)

	give_space_cooler_if_synth = TRUE // BLUEMOON ADD

/datum/outfit/lfwb_ordinator/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE, client/preference_source)
	if(visualsOnly)
		return

	var/obj/item/radio/R = H.ears
	R.set_frequency(FREQ_CENTCOM)
	R.freqlock = TRUE

	var/obj/item/implant/mindshield/L = new //Here you go Deuryn
	L.implant(H, null, 1)

	var/obj/item/card/id/ert/W = H.wear_id
	W.access = get_all_accesses()//They get full station access.
	W.access += get_centcom_access("Death Commando")//Let's add their alloted CentCom access.
	W.registered_name = H.real_name
	W.assignment = "Tribunal Ordinator"
	W.update_label(W.registered_name)

/datum/outfit/lfwb_ordinator/officer
	name = "Офицер-ординатор трибунала"
	uniform = /obj/item/clothing/under/syndicate/ordinator/leader
	suit = /obj/item/clothing/suit/armor/hos/ordinator/leader
	l_hand = /obj/item/gun/energy/taser/legax

/datum/outfit/lfwb_ordinator/officer/pre_equip(mob/living/carbon/human/H, visualsOnly, client/preference_source)
	. = ..()
	var/list/extra_backpack_items = list(
		/obj/item/storage/box/pinpointer_squad
	)
	LAZYADD(backpack_contents, extra_backpack_items)

/datum/outfit/ert/commander/rabbit
	name = "Rabbit Team Leader"

	uniform = /obj/item/clothing/under/suit/lobotomy/rabbit
	head = /obj/item/clothing/head/rabbit_helmet
	suit = /obj/item/clothing/suit/armor/ego_gear/rabbit
	l_hand = /obj/item/gun/energy/e_gun/rabbit/captain
	glasses = /obj/item/clothing/glasses/hud/health/night/syndicate
	belt = /obj/item/storage/belt/military/ert_max
	backpack_contents = list(/obj/item/storage/box/survival/centcom=1)

	cybernetic_implants = list(
		/obj/item/organ/cyberimp/eyes/hud/security,
		/obj/item/organ/cyberimp/chest/nutrimentextreme,
		/obj/item/organ/cyberimp/chest/chem_implant/plus,
		/obj/item/organ/cyberimp/arm/shield,
		/obj/item/organ/eyes/robotic/thermals,
		/obj/item/organ/cyberimp/chest/thrusters,
	)

/datum/outfit/ert/commander/rabbit/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(visualsOnly)
		return

	var/obj/item/implant/explosive/L = new/obj/item/implant/explosive(H)
	L.implant(H, null, 1)
	H.faction |= "rabbit"
	..()

/datum/outfit/ert/security/rabbit
	name = "Rabbit Team"

	uniform = /obj/item/clothing/under/suit/lobotomy/rabbit
	head = /obj/item/clothing/head/rabbit_helmet/grunt
	suit = /obj/item/clothing/suit/armor/ego_gear/rabbit/grunts
	l_hand = /obj/item/gun/energy/e_gun/rabbit
	glasses = /obj/item/clothing/glasses/hud/health/night/syndicate
	belt = /obj/item/storage/belt/military/ert_max
	backpack_contents = list(/obj/item/storage/box/survival/centcom=1)

	cybernetic_implants = list(
		/obj/item/organ/cyberimp/eyes/hud/security,
		/obj/item/organ/cyberimp/chest/nutrimentextreme,
		/obj/item/organ/cyberimp/chest/chem_implant/plus,
		/obj/item/organ/cyberimp/arm/shield,
		/obj/item/organ/eyes/robotic/thermals,
		/obj/item/organ/cyberimp/chest/thrusters,
	)

/datum/outfit/ert/security/rabbit/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(visualsOnly)
		return

	var/obj/item/implant/explosive/L = new/obj/item/implant/explosive(H)
	L.implant(H, null, 1)
	H.faction |= "rabbit"
	..()
