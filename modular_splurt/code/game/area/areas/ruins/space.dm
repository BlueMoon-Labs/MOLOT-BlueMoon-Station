/area/ruin/space/radiostation
	name = "Nanotrasen Radio Station"
	icon_state = "DJ"
	has_gravity = STANDARD_GRAVITY

/area/ruin/space/radiostation/solars
	name = "NT Radio Solars"
	icon_state = "yellow"

/area/ruin/space/radiostation/engineering
	name = "NT Radio Engineering"
	icon_state = "engine"
	has_gravity = STANDARD_GRAVITY

/area/ruin/space/radiostation/engines
	name = "NT Radio Engines"
	icon_state = "engine"
	has_gravity = STANDARD_GRAVITY

/area/ruin/space/radiostation/janitor
	name = "NT Radio Custodial Closet"
	icon_state = "janitor"
	has_gravity = STANDARD_GRAVITY

/area/ruin/space/radiostation/break_room
	name = "NT Radio Break Room"
	icon_state = "cafeteria"
	has_gravity = STANDARD_GRAVITY

/area/ruin/space/radiostation/control_room
	name = "NT Radio Control Room"
	icon_state = "DJ"
	has_gravity = STANDARD_GRAVITY

/area/ruin/space/radiostation/cabin
	name = "NT Radio Cabin"
	icon_state = "dorms"
	has_gravity = STANDARD_GRAVITY

/area/ruin/space/syndielistenspace
	name = "Syndicate Listening Post"
	icon_state = "yellow"
	has_gravity = STANDARD_GRAVITY
/*
/obj/effect/mob_spawn/human/space/syndicate/special(mob/living/new_spawn)
	new_spawn.grant_language(/datum/language/codespeak, source = LANGUAGE_MIND)

/obj/effect/mob_spawn/human/space/syndicate/comms
	name = "Syndicate Comms Agent"
	roundstart = FALSE
	death = FALSE
	icon = 'icons/obj/machines/sleeper.dmi'
	icon_state = "sleeper_s"
	outfit = /datum/outfit/syndicate_comms_space
	assignedrole = "Space Syndicate Comms Agent"
	job_description = "Space Syndicate Comms Agent"
	short_desc = "Вы Специалист Разведки Синдиката, работающий на Аванпосту Прослушки и изучающий аномальное поле Системы Синих Лун."
	flavour_text = "К сожалению это или к счастью, но сотрудники вашего партнёра, Nanotrasen, начали добычу полезных ископаемых в этом секторе. Следите за вражеской активностью как можно лучше и старайтесь не высовываться. Используйте коммуникационное оборудование для оказания поддержки любым полевым агентам и сотрудникам Космической Станции."
	important_info = "Вы не Антагонист. Вы можете отправиться на станцию в Эксту. В Динамик вам следует быть ниже травы и тише воды."
	can_load_appearance = TRUE

/datum/outfit/syndicate_comms_space
	name = "Space Syndicate Comms Agent"
	uniform = /obj/item/clothing/under/syndicate
	suit = /obj/item/clothing/suit/armor/vest
	mask = /obj/item/clothing/mask/chameleon
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/tackler/combat/insulated
	ears = /obj/item/radio/headset/syndicate/alt
	back = /obj/item/storage/backpack
	l_pocket = /obj/item/melee/transforming/energy/sword/saber
	r_pocket = /obj/item/gun/ballistic/automatic/pistol
	id = /obj/item/card/id/syndicate/anyone
	implants = list(/obj/item/implant/weapons_auth, /obj/item/implant/anchor)

/datum/outfit/syndicate_empty/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE, client/preference_source)
	H.faction |= ROLE_SYNDICATE
*/
/area/ruin/space/ruinsolars
	name = "Solar Array"
	dynamic_lighting = DYNAMIC_LIGHTING_IFSTARLIGHT
	requires_power = FALSE
	has_gravity = FALSE
	area_flags = UNIQUE_AREA
	flags_1 = NONE
	sound_environment = SOUND_AREA_SPACE
