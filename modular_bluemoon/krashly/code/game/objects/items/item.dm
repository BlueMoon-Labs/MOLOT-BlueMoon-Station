/obj/item/hand_mirror
	name = "hand mirror"
	desc = "Красивое зеркальце. Самое то чтобы поправить свою прическу после какого бы то ни было инцедента."
	icon = 'modular_bluemoon/krashly/icons/obj/hand_mirror.dmi'
	icon_state = "mirror"
	w_class = WEIGHT_CLASS_SMALL

/obj/item/hand_mirror/attack_self(mob/user) // Функция зеркала
	if(ishuman(user))
		var/mob/living/carbon/human/H = user

		if(H.gender != FEMALE)
			var/new_style = input(user, "Select a facial hair style", "Grooming")  as null|anything in GLOB.facial_hair_styles_list
			if(!user.canUseTopic(src, BE_CLOSE, FALSE, NO_TK))
				return
			if(new_style)
				H.facial_hair_style = new_style
		else
			H.facial_hair_style = "Shaved"

		var/new_style = input(user, "Select a hair style", "Grooming")  as null|anything in GLOB.hair_styles_list
		if(!user.canUseTopic(src, BE_CLOSE, FALSE, NO_TK))
			return
		if(new_style)
			H.hair_style = new_style

		H.update_mutant_bodyparts()
		H.update_hair()

/obj/item/icona_madonna
	name = "Madonna icon"
	desc = "Икона великой Мадонны."
	icon =  'modular_bluemoon/krashly/icons/obj/structures.dmi'
	icon_state = "madonna"

/obj/structure/sign/flag/skull
	name = "flag of PMC Skull"
	desc = "Черный флаг с Черепом по центру. Флаг пахнет кровью."
	icon = 'modular_bluemoon/krashly/icons/obj/skull_flag.dmi'
	icon_state = "full"
	item_flag = /obj/item/sign/flag/skull

/obj/item/sign/flag
	var/flag_type = ""

/obj/item/sign/flag/skull
	name = "folded flag of the PMC Skull"
	desc = "Сложенный флаг ЧВК 'Череп'."
	flag_type = "skull"
	icon = 'modular_bluemoon/krashly/icons/obj/skull_flag.dmi'
	icon_state = "mini"
	sign_path = /obj/structure/sign/flag/skull

/obj/structure/closet/crate/coffin/attacked_by(obj/item/sign/flag/I, mob/living/user)
	if(I.flag_type == "skull")
		icon = 'modular_bluemoon/krashly/icons/obj/skull_flag.dmi'
		icon_state = "grob_full"
		locked = TRUE
		qdel(I)
	if(I.flag_type == "inteq")
		icon = 'modular_bluemoon/krashly/icons/obj/inteq_flag.dmi'
		icon_state = "grob_full"
		locked = TRUE
		qdel(I)

/datum/gear/donator/bm/skull_flag
	name = "PMC Skull flag"
	slot = ITEM_SLOT_BACKPACK
	path = /obj/item/sign/flag/skull
	ckeywhitelist = list("krashly", "stgs", "hazzi", "dolbajob", "vulpshiro", "sodastrike", "lonofera", "mihana964", "hellsinggc")
	subcategory = LOADOUT_SUBCATEGORIES_DON01

//InteQ

/obj/structure/sign/flag/fake_inteq
	name = "Flag of PMC InteQ"
	desc = "Коричнево-Оранжевый флаг с щитом по центру. Флаг пахнет кровью."
	icon = 'modular_bluemoon/krashly/icons/obj/inteq_flag.dmi'
	icon_state = "full"
	item_flag = /obj/item/sign/flag/fake_inteq

/obj/item/sign/flag/fake_inteq
	name = "Folded Flag of the PMC InteQ"
	desc = "Сложенный флаг ЧВК 'InteQ'."
	flag_type = "inteq"
	icon = 'modular_bluemoon/krashly/icons/obj/inteq_flag.dmi'
	icon_state = "mini"
	sign_path = /obj/structure/sign/flag/fake_inteq

/obj/structure/sign/flag/inteq
	name = "flag of PMC InteQ"
	desc = "Коричнево-Оранжевый флаг с щитом по центру. Флаг пахнет кровью."
	icon = 'modular_bluemoon/krashly/icons/obj/inteq_flag.dmi'
	icon_state = "full"
	item_flag = /obj/item/sign/flag/inteq
	var/datum/proximity_monitor/advanced/demoraliser/demotivator

/obj/structure/sign/flag/inteq/Initialize(mapload)
	demotivator = new(src, 7, TRUE)
	START_PROCESSING(SSobj,src)
	return ..()

/obj/structure/sign/flag/inteq/process()
	if(world.time < demotivator.next_scare)
		return
	var/scared_someone = FALSE
	for(var/mob/living/viewer in view(5, src))
		demotivator.pugach(viewer)
		scared_someone = TRUE
	if(scared_someone)
		demotivator.next_scare = world.time + 120


/obj/structure/sign/flag/inteq/Destroy()
	QDEL_NULL(demotivator)
	return ..()

/obj/item/sign/flag/inteq
	name = "folded flag of the PMC InteQ"
	desc = "Сложенный флаг ЧВК 'InteQ'."
	flag_type = "inteq"
	icon = 'modular_bluemoon/krashly/icons/obj/inteq_flag.dmi'
	icon_state = "mini"
	sign_path = /obj/structure/sign/flag/inteq

/obj/item/sign/flag/inteq/afterattack(atom/target, mob/user, proximity)
	if(!iswallturf(target) || !proximity)
		return ..()
	if(!ishuman(user))
		return FALSE
	var/mob/living/carbon/human/placer = user
	if(!IS_INTEQ(placer) && !placer.mind?.antag_datums)
		to_chat(placer, span_warning("Вы разворачиваете флаг, и тут замечаете, что это пропаганда InteQ! Ну его, от греха подальше!"))
		placer.drop_all_held_items()
		return
	. = ..()

/obj/item/poster/random_inteq
	name = "random InteQ poster"
	poster_type = /obj/structure/sign/poster/contraband/inteq/random
	icon_state = "rolled_contraband"

/obj/item/storage/box/inteq_box/posters
	name = "InteQ Posters Box"
	desc = "Каробочка. Крутая."

/obj/item/storage/box/inteq_box/posters/PopulateContents()
	new	/obj/item/poster/random_inteq(src)
	new	/obj/item/poster/random_inteq(src)
	new	/obj/item/poster/random_inteq(src)
	new	/obj/item/poster/random_inteq(src)
	new	/obj/item/poster/random_inteq(src)
	new	/obj/item/poster/random_inteq(src)
	new	/obj/item/poster/random_inteq(src)

///////

/obj/structure/sign/poster/contraband/inteq
	var/datum/proximity_monitor/advanced/demoraliser/demotivator

/obj/structure/sign/poster/contraband/inteq/Initialize(mapload)
	demotivator = new(src, 7, TRUE)
	START_PROCESSING(SSobj,src)
	return ..()

/obj/structure/sign/poster/contraband/inteq/process()
	if(world.time < demotivator.next_scare)
		return
	var/scared_someone = FALSE
	for(var/mob/living/viewer in view(5, src))
		demotivator.pugach(viewer)
		scared_someone = TRUE
	if(scared_someone)
		demotivator.next_scare = world.time + 120

/obj/item/poster/random_inteq/poster_place_check(mob/user, turf/closed/wall)
	// Хз, как ты пытаешься повесить постер, будучи не хуманом, но мало ли
	if(!ishuman(user))
		return FALSE
	var/mob/living/carbon/human/placer = user
	if(IS_INTEQ(placer) || placer.mind?.antag_datums)
		return ..()
	to_chat(placer, span_warning("Вы разворачиваете постер, и тут замечаете, что это пропаганда InteQ! Ну его, от греха подальше!"))
	placer.drop_all_held_items()
	return FALSE
//////


/obj/structure/sign/poster/contraband/inteq/attackby(obj/item/tool, mob/user, params)
	if (tool.tool_behaviour == TOOL_WIRECUTTER)
		QDEL_NULL(demotivator)
	return ..()

/obj/structure/sign/poster/contraband/inteq/Destroy()
	QDEL_NULL(demotivator)
	return ..()

/obj/structure/sign/poster/contraband/inteq/on_attack_hand(mob/living/carbon/human/user)
	if(istype(user) && user.dna.check_mutation(TK))
		to_chat(user, "<span class='notice'>You telekinetically remove the [src].</span>")
	else if(user.gloves)
		if(istype(user.gloves,/obj/item/clothing/gloves/tackler))
			to_chat(user, "<span class='warning'>Вы срываете [src], но лезвия на обороте режут вам руку!</span>")
			user.apply_damage(5, BRUTE, pick(BODY_ZONE_L_ARM, BODY_ZONE_R_ARM))
	else
		to_chat(user, "<span class='warning'>Вы пытаетесь сорвать [src], но лезвия на обороте режут вам руку и мешают поддеть [src]!</span>")
		to_chat(user, "<span class='warning'>Нужны кусачки!</span>")
		user.apply_damage(5, BRUTE, pick(BODY_ZONE_L_ARM, BODY_ZONE_R_ARM))
		return
	.=..()
///////
/obj/structure/sign/poster/contraband/inteq/random
	name = "random contraband poster"
	icon_state = "random_contraband"
	never_random = TRUE
	random_basetype = /obj/structure/sign/poster/contraband/inteq

/obj/structure/sign/poster/contraband/inteq/inteq_recruitment
	name = "InteQ Recruitment"
	desc = "Увидь Галактику! Заработай денег! Вступай сегодня!"
	icon = 'modular_bluemoon/krashly/icons/obj/poster.dmi'
	icon_state = "poster_inteq"

/obj/structure/sign/poster/contraband/inteq/inteq_sign
	name = "InteQ poster"
	desc = "Частная Военная Компания, занимающаяся обороной частных предприятий и выполнением заказов. В данный момент они хотят уничтожить Пакт между НТ и Синдикатом..."
	icon = 'modular_bluemoon/krashly/icons/obj/poster.dmi'
	icon_state = "poster_inteq_baza"

/obj/structure/sign/poster/contraband/inteq/inteq_better_dead
	name = "Better Dead!"
	desc = "Сокрушим врагов!"
	icon = 'modular_bluemoon/krashly/icons/obj/poster.dmi'
	icon_state = "poster_inteq_better_dead"

/obj/structure/sign/poster/contraband/inteq/inteq_no_peace
	name = "No peace!"
	desc = "Не имей сто друзей, а имей сто рублей, Вступай в ЧВК 'InteQ'!"
	icon = 'modular_bluemoon/krashly/icons/obj/poster.dmi'
	icon_state = "poster_inteq_no_love"

/obj/structure/sign/poster/contraband/inteq/inteq_no_sex
	name = "No SEX"
	desc = "Хватит дрочить, вступай в ЧВК 'InteQ'!"
	icon = 'modular_bluemoon/krashly/icons/obj/poster.dmi'
	icon_state = "poster_inteq_no_sex"

/obj/structure/sign/poster/contraband/inteq/inteq_vulp
	name = "InteQ Recruitment"
	desc = "Коричневый постер. На нём написано: 'Даже если ты дрочишь на вульп, вступай в ЧВК 'InteQ'. Сокрушим врагов вместе!'."
	icon = 'modular_bluemoon/krashly/icons/obj/poster.dmi'
	icon_state = "poster_inteq_vulp"

/obj/item/storage/box/inteq_box
	name = "brown box"
	desc = "В неё определенно нет ничего опасного."
	icon = 'modular_bluemoon/krashly/icons/obj/box.dmi'
	icon_state = "inteqbox"

/obj/item/storage/box/inteq_box/inteq_clothes
	name = "clothes kit"

/obj/item/storage/box/inteq_box/inteq_clothes/PopulateContents()
	new /obj/item/clothing/under/inteq(src)
	new /obj/item/clothing/suit/armor/inteq(src)
	new /obj/item/clothing/gloves/combat(src)
	new /obj/item/clothing/shoes/combat(src)
	new /obj/item/storage/belt/military/inteq(src)
	new /obj/item/clothing/glasses/hud/security/sunglasses/inteq(src)
	new /obj/item/clothing/head/helmet/swat/inteq(src)
	new /obj/item/clothing/mask/gas/inteq(src)
	new /obj/item/storage/backpack/security/inteq(src)

/obj/item/soap/inteq
	desc = "Жёлтое мыло с крайне мощными химическими агентами, которые отмывают кровь быстрее."
	icon_state = "soapinteq"
	cleanspeed = 10
	icon = 'modular_bluemoon/krashly/icons/obj/inteq_soap.dmi'
	lefthand_file = 'modular_bluemoon/krashly/icons/mob/inhands/obj/lefthand.dmi'
	righthand_file = 'modular_bluemoon/krashly/icons/mob/inhands/obj/righthand.dmi'

/obj/item/reagent_containers/food/snacks/intecookies
	name = "InteCookies"
	desc = "Песочное печенье, каждое из которых в форме маленьких щитов."
	icon = 'modular_bluemoon/krashly/icons/obj/inteq_snacks.dmi'
	icon_state = "inteqcookies"
	trash = /obj/item/trash/intecookies
	bitesize = 3
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/cooking_oil = 2, /datum/reagent/consumable/sodiumchloride = 3)
	filling_color = "#cfa156"
	tastes = list("shortbread cookies" = 1)
	foodtype = JUNKFOOD | FRIED
	dunkable = TRUE

/obj/item/trash/intecookies
	name = "intecookies bag"
	icon = 'modular_bluemoon/krashly/icons/obj/inteq_snacks.dmi'
	icon_state = "inteqcookies_trash"
	grind_results = list(/datum/reagent/aluminium = 1)

/obj/item/storage/fancy/cigarettes/cigpack_inteq
	name = "cigarette packet"
	desc = "Пачка сигарет от известной ЧВК."
	icon = 'modular_bluemoon/krashly/icons/obj/inteq_cigarettes.dmi'
	icon_state = "inteq"
	spawn_type = /obj/item/clothing/mask/cigarette/inteq

/obj/item/clothing/mask/cigarette/inteq
	desc = "Сигарета от известной ЧВК."
	list_reagents = list(/datum/reagent/drug/nicotine = 15, /datum/reagent/medicine/omnizine = 15)

/obj/item/toy/mecha/hermes
	name = "toy Hermes"
	icon = 'modular_bluemoon/krashly/icons/obj/toys.dmi'
	icon_state = "toy_hermes"
	max_combat_health = 6 //300 integrity

/obj/item/toy/mecha/ares
	name = "toy Ares"
	icon = 'modular_bluemoon/krashly/icons/obj/toys.dmi'
	icon_state = "toy_ares"
	max_combat_health = 7 //350 integrity


// Лодаут

/datum/gear/accessory/hand_mirror
	name = "A hand mirror"
	path = /obj/item/hand_mirror
	loadout_flags = LOADOUT_CAN_NAME | LOADOUT_CAN_DESCRIPTION

/////// Заказ Алхимика. ///////
// Рескин шмоток:

/obj/item/paper/book_alch
	name = "Alchemist's Book"
	desc = "Покрылась пылью и кажется заполнена странными рунами."
	icon = 'modular_bluemoon/krashly/icons/obj/alchemist.dmi'

/obj/item/paper/book_alch/AltClick(mob/living/user, obj/item/I)
	if(!user.canUseTopic(src, BE_CLOSE))
		return
	if(istype(src, /obj/item/paper/carbon))
		var/obj/item/paper/carbon/Carbon = src
		if(!Carbon.copied)
			to_chat(user, span_notice("Take off the carbon copy first."))
			return
	//Origami Master
	var/datum/action/innate/origami/origami_action = locate() in user.actions
	if(origami_action?.active)
		make_plane(user, I, /obj/item/paperplane/syndicate)
	else
		make_plane(user, I, /obj/item/paperplane/book_alch)

/obj/item/paperplane/book_alch
	name = "Alchemist's Book"
	desc = "Покрылась пылью и кажется заполнена странными рунами."
	icon = 'modular_bluemoon/krashly/icons/obj/alchemist.dmi'
	throw_range = 1
	throw_speed = 1
	throwforce = 2

/obj/item/storage/wallet/cat_alch
	name = "Alchemist's Neko Wallet"
	desc = "Этот кот просит денег."
	icon = 'modular_bluemoon/krashly/icons/obj/alchemist.dmi'
	icon_state = "maneki-neko"

// Шмотки в конкретный лодаут по Кею.

/datum/gear/donator/bm/book_alch
	name = "Alchemist's Book"
	slot = ITEM_SLOT_BACKPACK
	path = /obj/item/paper/book_alch
	ckeywhitelist = list("trollandrew")
	subcategory = LOADOUT_SUBCATEGORIES_DON02
	loadout_flags = LOADOUT_CAN_NAME | LOADOUT_CAN_DESCRIPTION

/datum/gear/donator/bm/cat_alch
	name = "Neko Wallet"
	slot = ITEM_SLOT_BACKPACK
	path = /obj/item/storage/wallet/cat_alch
	ckeywhitelist = list("trollandrew")
	subcategory = LOADOUT_SUBCATEGORIES_DON02
	loadout_flags = LOADOUT_CAN_NAME | LOADOUT_CAN_DESCRIPTION

/datum/gear/donator/bm/vape
	name = "Vape"
	slot = ITEM_SLOT_BACKPACK
	path = /obj/item/clothing/mask/vape
	ckeywhitelist = list("trollandrew")
	subcategory = LOADOUT_SUBCATEGORIES_DON02
	loadout_flags = LOADOUT_CAN_NAME | LOADOUT_CAN_DESCRIPTION

/datum/gear/donator/bm/electropack
	name = "Electropack"
	slot = ITEM_SLOT_HANDS
	path = /obj/item/electropack
	ckeywhitelist = list("trollandrew")
	subcategory = LOADOUT_SUBCATEGORIES_DON02
	loadout_flags = LOADOUT_CAN_NAME | LOADOUT_CAN_DESCRIPTION

/datum/gear/donator/bm/straight_jacket
	name = "Straight Jacket"
	slot = ITEM_SLOT_OCLOTHING
	path = /obj/item/clothing/suit/straight_jacket
	ckeywhitelist = list("trollandrew")
	subcategory = LOADOUT_SUBCATEGORIES_DON02
	loadout_flags = LOADOUT_CAN_NAME | LOADOUT_CAN_DESCRIPTION

/datum/gear/donator/bm/boxing
	name = "Boxing Gloves"
	slot = ITEM_SLOT_GLOVES
	path = /obj/item/clothing/gloves/boxing
	ckeywhitelist = list("trollandrew")
	subcategory = LOADOUT_SUBCATEGORIES_DON02
	loadout_flags = LOADOUT_CAN_NAME | LOADOUT_CAN_DESCRIPTION

/datum/gear/donator/bm/coconut_bong
	name = "Coconut Bong"
	slot = ITEM_SLOT_BACKPACK
	path = /obj/item/bong/coconut
	ckeywhitelist = list("trollandrew")
	subcategory = LOADOUT_SUBCATEGORIES_DON02
	loadout_flags = LOADOUT_CAN_NAME | LOADOUT_CAN_DESCRIPTION

/datum/gear/donator/bm/armyknife
	name = "Army Knife"
	slot = ITEM_SLOT_BACKPACK
	path = /obj/item/armyknife
	ckeywhitelist = list("trollandrew")
	subcategory = LOADOUT_SUBCATEGORIES_DON02
	loadout_flags = LOADOUT_CAN_NAME | LOADOUT_CAN_DESCRIPTION
