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
	desc = "A syndicate jacket."
	icon = 'modular_bluemoon/fluffs/icons/obj/clothing/suit.dmi'
	mob_overlay_icon = 'modular_bluemoon/fluffs/icons/mob/clothing/suit.dmi'
	mutantrace_variation = STYLE_DIGITIGRADE | STYLE_NO_ANTHRO_ICON
	icon_state = "noonar"
	item_state = "noonar"
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
