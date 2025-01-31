/obj/effect/mob_spawn/robot
	mob_type = /mob/living/silicon/robot
	assignedrole = "Ghost Role"

/obj/effect/mob_spawn/robot/Initialize(mapload)
	. = ..()

/obj/effect/mob_spawn/robot/equip(mob/living/silicon/robot/R)
	. = ..()

/obj/effect/mob_spawn/robot/ghostcafe
	name = "Cafe Robotic Storage"
	uses = -1
	icon = 'modular_sand/icons/obj/machines/robot_storage.dmi'
	icon_state = "robostorage"
	mob_name = "a cafe robot"
	roundstart = FALSE
	anchored = TRUE
	density = FALSE
	death = FALSE
	assignedrole = "Cafe Robot"
	short_desc = "Вы Киборг из Призрачного Кафе!"
	flavour_text = "Вы совершенно уверены в одном. Вы не живое существо. Вы в симуляции? Заходя за данную роль вы соглашаетесь с тем, что на территории Гост-Кафе полностью отсутствуют какие-либо правила Ролевой Игры. Тем не менее, базовые серверные правила не отменяются. Вы должны вести себя адекватно так, чтобы не мешать другим игрокам и не портить саму локацию. Если в чём-то не уверены или нужна помощь - всегда можете попросить помощи Администратора. Несоблюдение базовых норм поведения повлекут за собой наказание."
	skip_reentry_check = TRUE
	banType = ROLE_GHOSTCAFE
	mob_type = /mob/living/silicon/robot/modules/roleplay
	can_load_appearance = 2
	antagonist_type = /datum/antagonist/ghost_role/ghost_cafe

/obj/effect/mob_spawn/robot/ghostcafe/special(mob/living/silicon/robot/new_spawn)
	if(new_spawn.client)
		new_spawn.updatename(new_spawn.client)
		new_spawn.gender = NEUTER
		var/datum/antagonist/ghost_role/ghost_cafe/GC = new_spawn.mind?.has_antag_datum(/datum/antagonist/ghost_role/ghost_cafe)
		GC.adittonal_allowed_area = get_area(src)
		GC.adittonal_allowed_area = GC.adittonal_allowed_area.type
		new_spawn.ghost_cafe_traits(TRUE, GC.adittonal_allowed_area)
		to_chat(new_spawn,"<span class='boldwarning'>Ghosting is free!</span>")
