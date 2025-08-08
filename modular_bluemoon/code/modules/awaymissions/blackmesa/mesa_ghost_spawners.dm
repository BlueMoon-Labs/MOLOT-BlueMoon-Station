//Персонал чёрной мезы

/obj/effect/mob_spawn/human/black_mesa
	name = "Black mesa scientist"
	icon = 'icons/obj/machines/sleeper.dmi'
	icon_state = "sleeper_s"
	density = TRUE
	roundstart = FALSE
	death = FALSE
	outfit = /datum/outfit/science_team
	short_desc = "Ты являешься одним из немногих выживших после инцидента в чёрной мезе"
	flavour_text = "Ты старший научный научный сотрудник сектора H. Недавно тебя повысили в должности, перенаправив в этот сектор, но что-то пошло не так. Исходя из оповещений BMAS, По всему сектору начались портальные штормы. По этому вы, засев в одном из кабинетов, ждёте помощи."
	important_info = "(ПРИ ИСПОЛЬЗОВАНИИ АКТУАЛИЗАТОРА СТРОГО ЗАПРЕЩЕНО ВЫБИРАТЬ ЛЮБУЮ ДРУГУЮ РАСУ КРОМЕ ЧЕЛОВЕКА. ПРИ НАРУШЕНИЯХ ИЛИ ОШИБКАХ ПРОСЬБА ОБРАТИТСЯ К АДМИНИСТРАЦИИ) Не пытайся исследовать комплекс до прибытия экспедиционной группы. В случае, когда прошло 20 минут от начала раунда, а исследователи так и не пришли, ты можешь постепенно продвигаться по комплексу."
	category = "offstation"
	faction = list(FACTION_BLACKMESA)
	antagonist_type = /datum/antagonist/ghost_role/black_mesa

/obj/effect/mob_spawn/human/black_mesa/special(mob/living/carbon/human/spawned_human)
	. = ..()
	spawned_human.grant_language(/datum/language/modular_sand/solcommon, source = LANGUAGE_MIND)
	spawned_human.remove_language(/datum/language/common)

/datum/outfit/science_team
	name = "science team member"
	uniform = /obj/item/clothing/under/rank/rnd/scientist/halflife
	suit = /obj/item/clothing/suit/toggle/labcoat
	shoes = /obj/item/clothing/shoes/laceup
	back = /obj/item/storage/backpack
	backpack_contents = list(/obj/item/radio, /obj/item/reagent_containers/glass/beaker)
	id = /obj/item/card/id/hlscientist
	id_trim = /datum/id_trim/science_team

/datum/id_trim/science_team
	assignment = "Учёный Чёрной Мезы"
	trim_state = "retro"

/obj/item/card/id/hlscientist
	name = "Black mesa scientist"
	assignment = "Учёный Чёрной Мезы"
	icon_state = "retro"



/obj/effect/mob_spawn/human/black_mesa/guard
	name = "Black mesa guard"
	outfit = /datum/outfit/security_guard
	short_desc = "Ты являешься выжившим охранником чёрной мезы"
	flavour_text = "Ты один из охранников Чёрной Мезы, а конкретно Сектора H. Твоя работа была размеренной и спокойной, но что-то пошло не так. Теперь ты, оставшись со своим напарником, лежишь без сознания в чудом уцелевшем КПП охраны"

/obj/effect/mob_spawn/human/black_mesa/special(mob/living/carbon/human/spawned_human)
	. = ..()
	spawned_human.grant_language(/datum/language/modular_sand/solcommon, source = LANGUAGE_MIND)
	spawned_human.remove_language(/datum/language/common)

/datum/outfit/security_guard
	name = "Black mesa guard"
	uniform = /obj/item/clothing/under/rank/security/officer/peacekeeper
	head = /obj/item/clothing/head/helmet/blueshirt
	gloves = /obj/item/clothing/gloves/color/black
	suit = /obj/item/clothing/suit/armor/vest/blueshirt
	shoes = /obj/item/clothing/shoes/jackboots
	back = /obj/item/storage/backpack
	backpack_contents = list(/obj/item/radio, /obj/item/gun/ballistic/automatic/pistol/hl9mm, /obj/item/ammo_box/magazine/pistolm9mm, /obj/item/reagent_containers/food/snacks/donut/apple,)
	id = /obj/item/card/id/hlguard
	id_trim = /datum/id_trim/security_guard

/obj/item/card/id/hlguard
	name = "Black mesa guard"
	assignment = "Охранник чёрной мезы"
	icon_state = "retro"

/datum/id_trim/security_guard
	assignment = "Охранник Чёрной Мезы"
	trim_state = "retro"
	access = list(ACCESS_BRIG, ACCESS_SECURITY, ACCESS_AWAY_SEC)

/obj/item/clothing/under/rank/rnd/scientist/halflife
	name = "science team costume"
	desc = "Самый обычный костюм работника комплекса чёрной мезы"
	icon = 'modular_bluemoon/icons/obj/clothing/uniforms.dmi'
	mob_overlay_icon = 'modular_bluemoon/icons/mob/clothing/uniforms.dmi'
	anthro_mob_worn_overlay = 'modular_bluemoon/icons/mob/clothing/uniforms_digi.dmi'
	icon_state = "hl_scientist"
	item_state = "hl_scientist"
	can_adjust = FALSE

/obj/effect/mob_spawn/human/black_mesa/sectorhdirector
	name = "Black mesa sector H director"
	icon = 'icons/obj/machines/sleeper.dmi'
	icon_state = "sleeper_s"
	density = TRUE
	roundstart = FALSE
	death = FALSE
	outfit = /datum/outfit/sectorhdirector
	short_desc = "Вы являетесь главным директором Сектора H"
	flavour_text = "Ты стоял на одной из высших должностей в Чёрной Мезе, пока в одном из секторов не случился каскадный резонанс с последующим портальным штормом. Ты инициировал эвакуацию большей части персонала. Но в последний момент, когда вы собирались покинуть свой кабинет, один из порталов отправил вас прямо в сердце сектора. Теперь же вам ничего не остаётся, кроме как ожидать помощи и попытаться привести в чувства оставшийся персонал"
	important_info = "(ПРИ ИСПОЛЬЗОВАНИИ АКТУАЛИЗАТОРА СТРОГО ЗАПРЕЩЕНО ВЫБИРАТЬ ЛЮБУЮ ДРУГУЮ РАСУ КРОМЕ ЧЕЛОВЕКА. ПРИ НАРУШЕНИЯХ ИЛИ ОШИБКАХ ПРОСЬБА ОБРАТИТСЯ К АДМИНИСТРАЦИИ)Не пытайся исследовать комплекс до прибытия экспедиционной группы. В случае, когда прошло 20 минут от начала раунда, а исследователи так и не пришли, ты можешь постепенно продвигаться по комплексу."
	category = "offstation"
	antagonist_type = /datum/antagonist/ghost_role/black_mesa

/obj/effect/mob_spawn/human/black_mesa/special(mob/living/carbon/human/spawned_human)
	. = ..()
	spawned_human.grant_language(/datum/language/modular_sand/solcommon, source = LANGUAGE_MIND)
	spawned_human.remove_language(/datum/language/common)

/datum/outfit/sectorhdirector
	name = "Sector H director"
	uniform = /obj/item/clothing/under/rank/rnd/research_director
	head = /obj/item/clothing/head/beret/sci
	suit = /obj/item/clothing/suit/toggle/labcoat
	shoes = /obj/item/clothing/shoes/laceup
	back = /obj/item/storage/backpack
	belt = /obj/item/melee/classic_baton
	backpack_contents = list(/obj/item/radio, /obj/item/reagent_containers/glass/beaker)
	id = /obj/item/card/id/sectorhdirector
	id_trim = /datum/id_trim/sectorhdirector

/obj/item/card/id/sectorhdirector
	name = "Sector H director"
	assignment = "Директор сектора H"
	icon_state = "retro"

/datum/id_trim/sectorhdirector
	assignment = "Директор сектора H"
	trim_state = "retro"

//ХЕКУ

/obj/effect/mob_spawn/human/black_mesa/hecu
	name = "HECU grunt"
	outfit = /datum/outfit/hecu
	short_desc = "Ты являешься, скорее всего, одним из немногих обычных пехотинцев, оставшихся в секторе H без какой либо поддержки со стороны правительства."
	flavour_text = "Ваш отряд был направлен в Чёрную Мезу для оказания медицинской, инженерной и боевой помощи основным отрядам HECU. Но, к сожалению, с каждым часом ситуация становилась всё хуже. Ведь правительство, поняв, что посланные пехотинцы не справляются, решили их всех предательски убить. Всё, что вы смутно знаете о миссии, так это только то, что основная задача отрядов, которым вы помогали - устранять всех свидетелей? Но имеет ли это вес, когда вас бросили? Теперь ваша задача сейчас - окопаться в этом клятом лагере и или ждать помощи, или попытаться следовать приказу основных отрядов."
	important_info = "(ПРИ ИСПОЛЬЗОВАНИИ АКТУАЛИЗАТОРА СТРОГО ЗАПРЕЩЕНО ВЫБИРАТЬ ЛЮБУЮ ДРУГУЮ РАСУ КРОМЕ ЧЕЛОВЕКА. ПРИ НАРУШЕНИЯХ ИЛИ ОШИБКАХ ПРОСЬБА ОБРАТИТСЯ К АДМИНИСТРАЦИИ) Не пытайтесь исследовать карту далее основного атриума, ангара с автобусами и вашего палаточного медицинского отдела ( не ломайте стены в комнаты, закрытые ключ картами). Вы можете покинуть гейт/исследовать его ТОЛЬКО В ТОМ СЛУЧАЕ, когда договоритесь с исследовательской командой. Если вы решили враждовать с исследователями, то вам после этого запрещено покидать гейт и как либо пытатся продвигатся далее по локации."
	roundstart = FALSE
	death = FALSE
	density = TRUE
	category = "offstation"
	antagonist_type = /datum/antagonist/ghost_role/hecu

/obj/effect/mob_spawn/human/black_mesa/hecu/special(mob/living/carbon/human/spawned_human)
	. = ..()
	spawned_human.grant_language(/datum/language/modular_sand/solcommon, source = LANGUAGE_MIND)
	spawned_human.grant_language(/datum/language/old_codes, source = LANGUAGE_MIND)
	spawned_human.grant_language(/datum/language/signlanguage, source = LANGUAGE_MIND)
	spawned_human.remove_language(/datum/language/common)

/obj/effect/mob_spawn/human/black_mesa/hecu/breacher
	name = "HECU breacher"
	outfit = /datum/outfit/hecu_breacher

/obj/effect/mob_spawn/human/black_mesa/hecu/medic
	name = "HECU field medic"
	outfit = /datum/outfit/hecu_medic
	short_desc = "Ты являешься профессиональным полевым медиком небольшого отряда поддержки HECU."

/obj/effect/mob_spawn/human/black_mesa/hecu/engineer
	name = "HECU engineer"
	outfit = /datum/outfit/hecu_engineer
	short_desc = "Ты являешься профессиональным инженером небольшого отряда поддержки HECU."

/obj/effect/mob_spawn/human/black_mesa/hecu/special(mob/living/carbon/human/spawned_human)
	. = ..()
	spawned_human.remove_language(/datum/language/common)

/datum/outfit/hecu
	name = "HECU grunt"
	uniform = /obj/item/clothing/under/rank/security/officer/urban_camo
	mask = /obj/item/clothing/mask/gas/hecu
	head = /obj/item/clothing/head/helmet/hecu
	suit = /obj/item/clothing/suit/armor/hecu
	gloves = /obj/item/clothing/gloves/combat
	belt = /obj/item/storage/belt/military/assault/hecu
	shoes = /obj/item/clothing/shoes/combat
	l_pocket = /obj/item/reagent_containers/food/drinks/flask
	r_pocket = /obj/item/flashlight/flare
	r_hand = /obj/item/choice_beacon/mesagrunt
	back = /obj/item/storage/backpack/hecu
	backpack_contents = list(
		/obj/item/storage/box/survival/radio,
		/obj/item/storage/firstaid/emergency,
		/obj/item/kitchen/knife/combat,
	)

/datum/outfit/hecu_engineer
	name = "HECU engineer"
	uniform = /obj/item/clothing/under/rank/security/officer/urban_camo
	glasses = /obj/item/clothing/glasses/welding
	head = /obj/item/clothing/head/helmet/hecu
	suit = /obj/item/clothing/suit/armor/hecu
	gloves = /obj/item/clothing/gloves/combat
	belt = /obj/item/storage/belt/military/assault/hecu/engi
	shoes = /obj/item/clothing/shoes/combat
	l_pocket = /obj/item/reagent_containers/food/drinks/flask
	r_pocket = /obj/item/flashlight/flare
	r_hand = /obj/item/gun/ballistic/automatic/mp5
	back = /obj/item/storage/backpack/hecu
	backpack_contents = list(
		/obj/item/storage/box/survival/radio,
		/obj/item/storage/firstaid/emergency,
		/obj/item/kitchen/knife/combat,
		/obj/item/lighter/donator/bm/militaryzippo,
		/obj/item/storage/fancy/cigarettes/cigpack_robust,
		/obj/item/gun/ballistic/automatic/pistol/hl9mm,
		/obj/item/ammo_box/magazine/pistolm9mm,
		/obj/item/ammo_box/magazine/pistolm9mm,
		/obj/item/ammo_box/magazine/mp5,
	)

/datum/outfit/hecu_breacher
	name = "HECU breacher"
	uniform = /obj/item/clothing/under/rank/security/officer/urban_camo
	mask = /obj/item/clothing/mask/balaclava
	head = /obj/item/clothing/head/helmet/hecu
	glasses = /obj/item/clothing/glasses/hud/security/hecu_ski
	suit = /obj/item/clothing/suit/armor/hecu
	gloves = /obj/item/clothing/gloves/combat
	belt = /obj/item/storage/belt/bandolier
	shoes = /obj/item/clothing/shoes/combat
	l_pocket = /obj/item/reagent_containers/food/drinks/flask
	r_pocket = /obj/item/flashlight/flare
	r_hand = /obj/item/choice_beacon/mesabreacher
	back = /obj/item/storage/backpack/hecu
	backpack_contents = list(
		/obj/item/storage/box/survival/radio,
		/obj/item/storage/firstaid/emergency,
		/obj/item/kitchen/knife/combat,
		/obj/item/gun/ballistic/automatic/pistol/hl9mm,
		/obj/item/ammo_box/magazine/pistolm9mm,
	)

/datum/outfit/hecu_medic
	name = "HECU medic"
	uniform = /obj/item/clothing/under/rank/security/officer/urban_camo
	glasses = /obj/item/clothing/glasses/hud/health/sunglasses/hecu
	head = /obj/item/clothing/head/helmet/hecu
	suit = /obj/item/clothing/suit/armor/hecu
	gloves = /obj/item/clothing/gloves/combat
	belt = /obj/item/storage/belt/military/assault/hecu
	shoes = /obj/item/clothing/shoes/combat
	l_pocket = /obj/item/reagent_containers/food/drinks/flask
	r_pocket = /obj/item/flashlight/flare
	r_hand = /obj/item/choice_beacon/mesamedic
	back = /obj/item/storage/backpack/hecu
	backpack_contents = list(
		/obj/item/storage/box/survival/radio,
		/obj/item/storage/firstaid/emergency,
		/obj/item/kitchen/knife/combat,
	)

/obj/effect/mob_spawn/human/black_mesa/hecu/leader
	name = "HECU squad leader"
	outfit = /datum/outfit/hecu_leader
	short_desc = "Ты являешься лидером небольшого отряда поддержки HECU"

/datum/outfit/hecu_leader
	name = "HECU squad leader"
	uniform = /obj/item/clothing/under/rank/security/officer/urban_camo
	head = /obj/item/clothing/head/beret/sec
	suit = /obj/item/clothing/suit/armor/hecu
	gloves = /obj/item/clothing/gloves/tackler/combat/insulated
	belt = /obj/item/storage/belt/military/assault/hecu
	shoes = /obj/item/clothing/shoes/combat
	l_pocket = /obj/item/grenade/smokebomb
	r_pocket = /obj/item/binoculars
	r_hand = /obj/item/gun/ballistic/automatic/mp5
	back = /obj/item/storage/backpack/hecu
	backpack_contents = list(
		/obj/item/storage/box/survival/radio,
		/obj/item/storage/firstaid/emergency,
		/obj/item/kitchen/knife/combat,
		/obj/item/book/granter/martial/cqc,
		/obj/item/gun/ballistic/automatic/pistol/deagle,
		/obj/item/ammo_box/magazine/m50,
	)


/obj/item/storage/belt/military/assault/hecu/engi/PopulateContents()
	new /obj/item/screwdriver/power(src)
	new /obj/item/crowbar/power(src)
	new /obj/item/weldingtool/experimental(src)
	new /obj/item/multitool/tricorder(src)
	new /obj/item/stack/cable_coil(src,30,pick("red","yellow","orange"))
	new /obj/item/extinguisher/mini(src)

/obj/effect/mob_spawn/human/black_mesa/hecu/lost
	name = "HECU lost grunt"
	outfit = /datum/outfit/losthecu
	short_desc = "Ты являешься, скорее всего, одним из немногих обычных пехотинцев, оставшихся в секторе H без какой либо поддержки со стороны правительства."
	flavour_text = "Ты был отправлен в Чёрную Мезу для выполнения особо важной миссии, но во время начала инструктажа на ваш конвой напали. Ты и немногие выжившие бежали, пока, в конце концов, все, кроме тебя, были убиты местной фауной и чёрными оперативниками. Оставшись один в полуразрушенном туннеле с минимумом боеприпасов и провианта, ты увидел яркий свет. Кажется, это твой шанс покинуть это место... Или нет?."
	important_info = "(ПРИ ИСПОЛЬЗОВАНИИ АКТУАЛИЗАТОРА СТРОГО ЗАПРЕЩЕНО ВЫБИРАТЬ ЛЮБУЮ ДРУГУЮ РАСУ КРОМЕ ЧЕЛОВЕКА. ПРИ НАРУШЕНИЯХ ИЛИ ОШИБКАХ ПРОСЬБА ОБРАТИТСЯ К АДМИНИСТРАЦИИ) Вы можете начать исследовать свою локацию только по прошествию десяти минут (Начиная с начала смены). Но заходить дальше Гейтвея до того, как вы встретили исследователей, запрещено. Конфликтовать нежелательно, но если вы решили напасть на исследователей, то вам будет запрещено покинуть гейт и исследовать его дальше. Персонаж НИЧЕГО не знает о приказе на устранение свидетелей."
	roundstart = FALSE
	death = FALSE
	density = TRUE
	category = "offstation"
	antagonist_type = /datum/antagonist/ghost_role/losthecu

/obj/effect/mob_spawn/human/black_mesa/hecu/lost/special(mob/living/carbon/human/spawned_human)
	. = ..()
	spawned_human.grant_language(/datum/language/modular_sand/solcommon, source = LANGUAGE_MIND)
	spawned_human.grant_language(/datum/language/old_codes, source = LANGUAGE_MIND)
	spawned_human.grant_language(/datum/language/signlanguage, source = LANGUAGE_MIND)

/datum/outfit/losthecu
	name = "Lost HECU grunt"
	uniform = /obj/item/clothing/under/rank/security/officer/urban_camo
	mask = /obj/item/clothing/mask/gas/hecu
	head = /obj/item/clothing/head/helmet/nvg/hecu
	suit = /obj/item/clothing/suit/armor/hecu
	gloves = /obj/item/clothing/gloves/combat
	belt = /obj/item/storage/belt/military/assault/hecu
	shoes = /obj/item/clothing/shoes/combat
	l_pocket = /obj/item/reagent_containers/food/drinks/flask
	r_pocket = /obj/item/flashlight/flare
	r_hand = /obj/item/gun/ballistic/automatic/m16a4/mesa
	back = /obj/item/storage/backpack/hecu
	backpack_contents = list(
		/obj/item/storage/box/survival/radio,
		/obj/item/storage/ifak,
		/obj/item/kitchen/knife/combat,
		/obj/item/ammo_box/magazine/m16,
		/obj/item/ammo_box/magazine/m16,
		/obj/item/ammo_box/magazine/m16,
	)

//трупы

/obj/effect/mob_spawn/human/hlscientist
	name = "black mesa scientist"
	outfit = /datum/outfit/science_team

/obj/effect/mob_spawn/human/hlguard
	name = "black mesa guard"
	outfit = /datum/outfit/security_guard

/obj/effect/mob_spawn/human/deadhecu
	name = "hecu grunt"
	outfit = /datum/outfit/hecudead

/datum/outfit/hecudead
	name = "dead hecu grunt"
	uniform = /obj/item/clothing/under/rank/security/officer/urban_camo
	mask = /obj/item/clothing/mask/gas/hecu
	head = /obj/item/clothing/head/helmet/hecu
	suit = /obj/item/clothing/suit/armor/hecu
	gloves = /obj/item/clothing/gloves/combat
	belt = /obj/item/storage/belt/military/assault/hecu
	shoes = /obj/item/clothing/shoes/combat
	l_pocket = /obj/item/reagent_containers/food/drinks/flask
	r_pocket = /obj/item/flashlight/flare
	back = /obj/item/storage/backpack/hecu
	backpack_contents = list(
		/obj/item/storage/box/survival/radio,
		/obj/item/storage/firstaid/emergency,
	)

//Чёрные оперативники

/obj/effect/mob_spawn/human/black_mesa/hecu/blackops
	name = "Black operative"
	icon = 'icons/obj/machines/sleeper.dmi'
	icon_state = "sleeper_s"
	density = TRUE
	roundstart = FALSE
	death = FALSE
	faction = list(FACTION_BLACKOPS)
	outfit = /datum/outfit/blackops
	short_desc = "Ты являешься чудом попавшим в сектор H чёрным оперативником"
	flavour_text = "Ваш отряд был отправлен для зачистки оставшихся отрядов HECU, но в один момент почти все ваши напарники были устранены. Теперь вас только двое, и вы буквально виживаете среди всего того происходящего хаоса, что окружает этот клятый сектор. Вам в любом случае плевать на весь этот низший персонал, если они только не будут угрожать вашей жизни."
	important_info = "(ПРИ ИСПОЛЬЗОВАНИИ АКТУАЛИЗАТОРА СТРОГО ЗАПРЕЩЕНО ВЫБИРАТЬ ЛЮБУЮ ДРУГУЮ РАСУ КРОМЕ ЧЕЛОВЕКА. ПРИ НАРУШЕНИЯХ ИЛИ ОШИБКАХ ПРОСЬБА ОБРАТИТСЯ К АДМИНИСТРАЦИИ) Не пытайтесь исследовать карту далее основного атриума, комнат с туррелями ( не ломайте стены в комнаты, закрытые ключ картами/заболтироваными дверьми ). Вы можете покинуть гейт/исследовать его ТОЛЬКО В ТОМ СЛУЧАЕ, когда договоритесь с исследовательской командой. Если вы решили враждовать с исследователями, то вам после этого запрещено покидать гейт и как либо пытатся продвигатся далее по локации"
	category = "offstation"
	antagonist_type = /datum/antagonist/ghost_role/black_mesa

/obj/effect/mob_spawn/human/black_mesa/hecu/special(mob/living/carbon/human/spawned_human)
	. = ..()
	spawned_human.grant_language(/datum/language/modular_sand/solcommon, source = LANGUAGE_MIND)
	spawned_human.grant_language(/datum/language/old_codes, source = LANGUAGE_MIND)
	spawned_human.grant_language(/datum/language/signlanguage, source = LANGUAGE_MIND)
	spawned_human.remove_language(/datum/language/common)

/datum/outfit/blackops
	name = "male black operative"
	uniform = /obj/item/clothing/under/syndicate/combat
	mask = /obj/item/clothing/mask/balaclava/breath
	glasses = /obj/item/clothing/glasses/night/blackops
	suit = /obj/item/clothing/suit/blackops
	gloves = /obj/item/clothing/gloves/combat
	belt = /obj/item/storage/belt/military/assault/hecu/black/blackops
	shoes = /obj/item/clothing/shoes/combat
	l_pocket = /obj/item/reagent_containers/food/drinks/flask
	r_pocket = /obj/item/flashlight/flare
	back = /obj/item/gun/ballistic/automatic/m16a4
	r_hand = /obj/item/book/granter/martial/cqc

/obj/item/storage/belt/military/assault/hecu/black/blackops/PopulateContents()
	new /obj/item/ammo_box/magazine/m16(src)
	new /obj/item/ammo_box/magazine/m16(src)
	new /obj/item/ammo_box/magazine/m16(src)
	new /obj/item/reagent_containers/hypospray/combat/omnizine(src)
	new /obj/item/storage/box/survival/radio(src,30,pick("red","yellow","orange"))
	new /obj/item/kitchen/knife/combat(src)
