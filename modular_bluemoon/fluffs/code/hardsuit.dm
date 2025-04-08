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
