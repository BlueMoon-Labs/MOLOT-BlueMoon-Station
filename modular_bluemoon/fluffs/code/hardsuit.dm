// stasdvrz T-51 sec hardsuit reskin
/obj/item/clothing/head/helmet/space/hardsuit/security/t51power
	name = "T-51 Power Armor Helmet"
	desc = "Шлем силовой брони еще со старых времён, разработанный с довольно герметичной для нулевого давления, имеет встроенный фонарь \
	и внутренний дисплей показателей состояние брони. Технология довольно устарела и модификации какие либо уже невозможны."
	icon = 'modular_bluemoon/fluffs/icons/obj/clothing/head.dmi'
	mob_overlay_icon = 'modular_bluemoon/fluffs/icons/mob/clothing/head.dmi'
	anthro_mob_worn_overlay = 'modular_bluemoon/fluffs/icons/mob/clothing/head_muzzled.dmi'
	icon_state = "hardsuit0-sec_t51"
	item_state = "hardsuit0-sec_t51"
	hardsuit_type = "sec_t51"

/obj/item/clothing/head/helmet/space/hardsuit/security/t51power/reskin_obj(mob/user)
	if(current_skin == "T-60")
		hardsuit_type = "sec_t60"

/obj/item/clothing/suit/space/hardsuit/security/t51power
	name = "T-51 Power Armor"
	desc = "Силовая броня старого образца, довольно редко уже можно такой увидеть в рабочем состоянии однако те, что еще на ходу, \
	не уступают с современными моделями. Броня герметична и защищает от низкого давления и сохраняет температуру в оптимальном при \
	штатной работе в космосе, а ядерный блок что ранее питал экзоскелет брони, заменен на блюспейсовую батарею реакторного типа или же БСР. \
	Технология довольно устарела и модификации какие либо уже невозможны. "
	icon = 'modular_bluemoon/fluffs/icons/obj/clothing/suit.dmi'
	mob_overlay_icon = 'modular_bluemoon/fluffs/icons/mob/clothing/suit.dmi'
	anthro_mob_worn_overlay = 'modular_bluemoon/fluffs/icons/mob/clothing/suit_digi.dmi'
	taur_mob_worn_overlay = 'modular_bluemoon/fluffs/icons/mob/large-worn-icons/32x64/suit_taur.dmi'
	icon_state = "hardsuit-sec_t51"
	item_state = "hardsuit-sec_t51"
	tail_state = "syndicate-winter"
	hardsuit_type = "sec_t51"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/security/t51power
	unique_reskin = list(
		"T-60" = list(
			"name" = "T-60 Power Armor",
			RESKIN_ICON_STATE = "hardsuit-sec_t60",
			RESKIN_ITEM_STATE = "hardsuit-sec_t60",
		),
		"T-51" = list(
			RESKIN_ICON_STATE = "hardsuit-sec_t51",
			RESKIN_ITEM_STATE = "hardsuit-sec_t51",
		)
	)

/obj/item/clothing/suit/space/hardsuit/security/t51power/reskin_obj(mob/user)
	if(current_skin == "T-60")
		mutantrace_variation = STYLE_DIGITIGRADE|STYLE_SNEK_TAURIC
		tail_state = "hos"
		if(helmet)
			var/obj/item/clothing/head/helmet/space/hardsuit/Helm = helmet
			Helm.hardsuit_type = "sec_t60"
			Helm.name = "T-60 Power Armor Helmet"
			Helm.update_icon_state()

/obj/item/modkit/t51armor_kit
	name = "Old Power Armor Kit"
	desc = "A modkit for making a security hardsuit into a T-51 Power Armor."
	product = /obj/item/clothing/suit/space/hardsuit/security/t51power
	fromitem = list(/obj/item/clothing/suit/space/hardsuit/security)

////////////////////////////////////////////////////////////////

/obj/item/clothing/head/helmet/space/hardsuit/engine/fluff_praxil_seven
	name = "Praxil-7 Mark II suit"
	desc = "A robust, cutting-edge space suit designed for arirals, that are working in hazardous environments. \
			It features reinforced armor plating, modular tools for maintenance and construction, and a power-assisted \
			frame that enhances the wearer's strength and endurance. Ideal for high-risk operations in space or industrial zones, \
			the suit offers protection against extreme temperatures, radiation, and debris."
	icon_state = "hardsuit0-praxil_seven"
	icon = 'modular_bluemoon/fluffs/icons/obj/clothing/head.dmi'
	mob_overlay_icon = 'modular_bluemoon/fluffs/icons/mob/clothing/head.dmi'
	hardsuit_type = "praxil_seven"

/obj/item/clothing/suit/space/hardsuit/engine/fluff_praxil_seven
	name = "Praxil-7 Mark II  helm"
	desc = "The ariral helmet is a sleek, high-tech design with an integrated visor that offers 360-degree vision and advanced HUD display. \
			Equipped with a filtration system for breathable air in toxic atmospheres, it also has reinforced shielding against impacts and radiation. \
			The helmet is compatible with a communication system for secure, real-time team coordination."
	icon = 'modular_bluemoon/fluffs/icons/obj/clothing/suit.dmi'
	mob_overlay_icon = 'modular_bluemoon/fluffs/icons/mob/clothing/suit.dmi'
	tail_suit_worn_overlay = 'modular_bluemoon/fluffs/icons/mob/clothing/tails_digi.dmi'
	icon_state = "praxil_seven_engi"
	tail_state = "praxil_seven_engi"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/engine/fluff_praxil_seven
	mutantrace_variation = NONE

/obj/item/modkit/fluff_praxil_seven_kit
	name = "Praxil-7 Mark II engi Kit"
	desc = "A modkit for making a engineering hardsuit into a Praxil-7 Mark II."
	product = /obj/item/clothing/suit/space/hardsuit/engine/fluff_praxil_seven
	fromitem = list(/obj/item/clothing/suit/space/hardsuit/engine)
