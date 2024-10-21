/obj/item/clothing/suit/donator/bm
	icon = 'modular_bluemoon/fluffs/icons/obj/clothing/suit.dmi'
	mob_overlay_icon = 'modular_bluemoon/fluffs/icons/mob/clothing/suit.dmi'

/obj/item/clothing/suit/donator/bm/lightning_holocloak
	name = "lightning holo-cloak"
	desc = "When equipped, a strange hologram is activated, and the fabric of the cloak itself disappears, and lightning starts projecting all over the body."
	icon_state = "lightning_holo"
	item_state = "welding-g"
	mutantrace_variation = STYLE_DIGITIGRADE | STYLE_NO_ANTHRO_ICON
	unique_reskin = list(
		"Blue" = list(
			"icon_state" = "lightning_holo_blue",
			"item_state" = "lightning_holo_blue",
			"name" = "blue lightning holo-cloak"
		),
		"Pink" = list(
			"icon_state" = "lightning_holo_pink",
			"item_state" = "lightning_holo_pink",
			"name" = "pink lightning holo-cloak"
		),
		"Red" = list(
			"icon_state" = "lightning_holo_red",
			"item_state" = "lightning_holo_red",
			"name" = "red lightning holo-cloak"
		),
		"Yellow" = list(
			"icon_state" = "lightning_holo_yellow",
			"item_state" = "lightning_holo_yellow",
			"name" = "yellow lightning holo-cloak"
		)
	)

/obj/item/clothing/suit/donator/bm/cerberus_suit
	name = "Cerberus Coat"
	desc = "Бронированое пальто болотного цвета с кучей пуговиц. Ходят слухи, что новых уже давно не делают, а те что имеются - снимают с трупов для дальнейшего ношения. От него пованивает тухлым мясом."
	mutantrace_variation = STYLE_DIGITIGRADE | STYLE_NO_ANTHRO_ICON
	icon_state = "cerberussuit_mob"
	item_state = "greatcoat"

/obj/item/clothing/suit/donator/bm/bishop_mantle
	name = "Bishop Mantle"
	desc = "Несмотря на бирку с ценником в девяноста девять, выглядит достаточно убедительно, чтобы считать носителя проповедником."
	mutantrace_variation = STYLE_DIGITIGRADE | STYLE_NO_ANTHRO_ICON
	icon_state = "bishop_mantle"
	item_state = "greatcoat"

/obj/item/clothing/suit/donator/bm/censor_fem_suit
	name = "censor coat"
	desc = "Бронированная шинель... Или то что от неё осталось? Наручи и поножи отсутствуют, хотя должны иметься в комплекте. На всю грудь раскинуто красное полотно с рисунком чёрной птицы на нём."
	icon = 'modular_bluemoon/krashly/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_bluemoon/krashly/icons/mob/clothing/suits.dmi'
	icon_state = "censor_fem"
	item_state = "censor_fem"

/obj/item/modkit/Dina_Kit
	name = "Kikimora Suit Kit"
	desc = "A modkit for making a Elite Syndicate Hardsuit into a Kikimora MK1."
	product = /obj/item/clothing/suit/space/hardsuit/security/kikimora
	fromitem = list(/obj/item/clothing/suit/space/hardsuit/security)

/obj/item/clothing/head/helmet/space/hardsuit/security/kikimora
	name = "ACS.Kikimora-MK2 Helmet"
	desc = "Модифицированный штатный Бронескафандр Лорданианских пилотов для ВКД даже в боевых условиях. Выполняет все необходимые от него функции."
	icon_state = "hardsuit0-kikimora"
	hardsuit_type = "kikimora"
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON

/obj/item/clothing/suit/space/hardsuit/security/kikimora
	name = "ACS.Kikimora-MK2 Hardsuit"
	desc = "Модифицированный штатный Бронескафандр Лорданианских пилотов для ВКД даже в боевых условиях. Выполняет все необходимые от него функции."
	icon_state = "hardsuit0-kikimora"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/security/kikimora
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON

/obj/item/clothing/suit/donator/bm/angelo
	name = "angelo's trenchcoat"
	desc = "Thick leather trench coat with stitched red edges on the collar. The right shoulder is decorated with an aiguillette. On the sleeves, patterns in the form of a three-headed hydra can be distinguished. Without a doubt, this cloak went to the owner as a reward from the higher command, as confirmation of his status. Interesting."
	icon_state = "angelo"
	item_state = "angelo"
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON

/obj/item/clothing/suit/donator/bm/flektarn_montur
	name = "flektarn montur"
	desc = "A five-color, -explosive- uniform in camouflage colors, decorated with gold shoulder straps and various combat awards. Initials tell you that it belongs to Koruhaundo Adoriana O."
	mutantrace_variation = STYLE_DIGITIGRADE | STYLE_NO_ANTHRO_ICON
	icon_state = "flektarn_montur"
	item_state = "flektarn_montur"

/obj/item/clothing/suit/donator/bm/SH_jacket
	name = "Shiro's Samurai Jacket"
	desc = "Iconic jacket of the Shiro Silverhand he wore in his Samurai days."
	mutantrace_variation = STYLE_DIGITIGRADE | STYLE_NO_ANTHRO_ICON
	icon_state = "SH_jacket"
	item_state = "SH_jacket"
	unique_reskin = list(
		"Default" = list("icon_state" = "SH_jacket"),
		"Black" = list("icon_state" = "SH_jacket_B")
	)

/obj/item/clothing/suit/toggle/noonar // Наследуем от suit/toggle, чтобы можно было переключать состояние
	name = "Syndicate Jacket"
	desc = "A syndicate jacket"
	icon = 'modular_bluemoon/fluffs/icons/obj/clothing/suit.dmi'
	mob_overlay_icon = 'modular_bluemoon/fluffs/icons/mob/clothing/suit.dmi'
	mutantrace_variation = STYLE_DIGITIGRADE | STYLE_NO_ANTHRO_ICON
	icon_state = "noonar"
	item_state = "noonar"
	togglename = "buttons"

/obj/item/clothing/suit/toggle/noonarlong
	name = "A longer version of syndicate Jacket"
	desc = "A long syndicate jacket"
	icon = 'modular_bluemoon/fluffs/icons/obj/clothing/suit.dmi'
	mob_overlay_icon = 'modular_bluemoon/fluffs/icons/mob/clothing/suit.dmi'
	mutantrace_variation = STYLE_DIGITIGRADE | STYLE_NO_ANTHRO_ICON
	icon_state = "noonarlong"
	item_state = "noonarlong"
	togglename = "buttons"

/obj/item/clothing/suit/donator/bm/sports_jacket
	name = "Sports Jacket"
	desc = "It's yellow."
	mutantrace_variation = STYLE_DIGITIGRADE | STYLE_NO_ANTHRO_ICON
	icon_state = "sports_jacket"
	item_state = "sports_jacket"

/////

/obj/item/modkit/harness_kit
	name = "Harness Armor Kit"
	desc = "A modkit for making an armor vest into a Harness Armor."
	product = /obj/item/clothing/suit/armor/vest/harness
	fromitem = list(/obj/item/clothing/suit/armor/vest/peacekeeper, /obj/item/clothing/suit/armor/vest/alt)


/obj/item/clothing/suit/armor/vest/harness // Наследуем от armor/vest, модифицируется только из комплекта для брони при клике по жилету
	name = "Harness Armor"
	desc = "A Modified armored vest."
	icon_state = "harness_armor"
	item_state = "harness_armor"
	dog_fashion = null
	icon = 'modular_bluemoon/fluffs/icons/obj/clothing/suit.dmi'
	mob_overlay_icon = 'modular_bluemoon/fluffs/icons/mob/clothing/suit.dmi'

/obj/item/clothing/suit/donator/bm/ellys_hoodie
	name = "Ellys Mantle"
	desc = "A hoodie in grey and white colors."
	mutantrace_variation = STYLE_DIGITIGRADE | STYLE_NO_ANTHRO_ICON
	icon_state = "ellys_hoodie"
	item_state = "hostrench"

/obj/item/clothing/suit/bm/monolith_armor
	name = "Granite M1"
	desc = "The vest of the jumpsuit Granite M1 from the Monolith group, the manufacturer is unknown. "
	icon = 'modular_bluemoon/fluffs/icons/obj/clothing/suit.dmi'
	mob_overlay_icon = 'modular_bluemoon/fluffs/icons/mob/clothing/suit.dmi'
	icon_state = "monolith_armor"
	item_state = "monolith_armor"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON

/obj/item/clothing/suit/armor/rsa12
	name = "R-SA-12"
	desc = "The saboteur's lightweight armor is designed to provide sufficient protection while maintaining a high degree of freedom of movement and stealth, which is important for missions involving subversion, espionage, or stealthy infiltration. Once owned by the Asmalgan Church, but now bears the Rohai emblem on the chest."
	icon = 'modular_bluemoon/fluffs/icons/obj/clothing/suit.dmi'
	mob_overlay_icon = 'modular_bluemoon/fluffs/icons/mob/clothing/suit.dmi'
	icon_state = "rsa12"
	item_state = "rsa12"
	blood_overlay_type = "armor"
	body_parts_covered = CHEST
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON

/obj/item/clothing/head/helmet/sec/rhsa12
	name = "R-HSA-12"
	desc = "A helmet from a saboteur light armor. Has a semi-transparent visor to conceal the identity of the saboteur with almost no loss in protective properties. It has a flashlight mount on the side."
	icon = 'modular_bluemoon/fluffs/icons/obj/clothing/hats.dmi'
	mob_overlay_icon = 'modular_bluemoon/fluffs/icons/mob/clothing/acrador_helmet_32x48.dmi'
	icon_state = "rhsa12"
	item_state = "rhsa12"

/obj/item/clothing/under/rank/security/officer/acradorsuit
	name = "Underarmor suit"
	desc= "A dark, tight suit for wearing underneath hard plates. It does not restrict movement and protects the body from rubbing by armor plates."
	icon = 'modular_bluemoon/fluffs/icons/obj/clothing/under.dmi'
	mob_overlay_icon = 'modular_bluemoon/fluffs/icons/mob/clothing/under.dmi'
	icon_state = "acradorsuit"
	item_state = "acradorsuit"
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON
	can_adjust = FALSE

/obj/item/clothing/suit/bm/syndie_jacket
	name = "Cybertechnical Jacket"
	desc = "A cybernetic jacket for civilians from a certain circle of the De'Sante family. Convenience, luxury, technology, brutality."
	icon = 'modular_bluemoon/fluffs/icons/obj/clothing/suit.dmi'
	mob_overlay_icon = 'modular_bluemoon/fluffs/icons/mob/clothing/suit.dmi'
	icon_state = "syndie_jacket"
	item_state = "syndie_jacket"
	body_parts_covered = CHEST
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON

/obj/item/clothing/suit/bm/nri_mundir
	name = "Old mundir NRI"
	desc = "Desc: Old mundir of the New Russian Empire. Worn out but still ready for battle just like in the old days... The name is embroidered on it - Zlatchek."
	icon = 'modular_bluemoon/fluffs/icons/obj/clothing/suit.dmi'
	mob_overlay_icon = 'modular_bluemoon/fluffs/icons/mob/clothing/suit.dmi'
	icon_state = "nrimundir"
	item_state = "nrimundir"
	body_parts_covered = CHEST
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON

/obj/item/clothing/suit/armor/hos/dread_armor
	name = "Броня Судьи"
	desc = "Стандартный  бронежилет судьи из Мега-Города Солнечной Федерации. Броня покрывает плечи и большую часть тела. На наплечниках красуются орлы из скорее всего золота как и на левой части груди с ремнём где красуется значок с потертым именем Дредд. Вам кажется это имя знакомым. Эта броня так и веет чуством что вас защищает Закон."
	icon_state = "dread_armor"
	item_state = "dread_armor"
	icon = 'modular_bluemoon/fluffs/icons/obj/clothing/suit.dmi'
	mob_overlay_icon = 'modular_bluemoon/fluffs/icons/mob/clothing/suit.dmi'
