/obj/item/clothing/under/donator/bm
	icon = 'modular_bluemoon/fluffs/icons/obj/clothing/under.dmi'
	mob_overlay_icon = 'modular_bluemoon/fluffs/icons/mob/clothing/under.dmi'
	anthro_mob_worn_overlay = 'modular_bluemoon/fluffs/icons/mob/clothing/under_digi.dmi'

/obj/item/clothing/under/donator/bm/gorka
	name = "OMON Turtleneck"
	desc = "Special Police Detachment uniform. Consists of an UBAC shirt combined with olive camouflage pattern pants. You can see some flags on uniform's shoulders, looks eerily familiar. Probably one of many human states."
	icon_state = "omon"
	item_state = "omon"
	can_adjust = TRUE
	unique_reskin = list(
		"Default" = list("icon_state" = "omon"),
		"Woodland" = list("icon_state" = "omonwd"),
		"E2" = list("icon_state" = "omone")
	)

/obj/item/clothing/under/donator/bm/modern_suit
	name = "Modern Suit"
	desc = "A costume in red and black colors. It includes shorts, suspenders, and a tie. On the chest, you can see the inscription 'Epoque limited collection 2563, made specially for Tex'."
	icon_state = "modern_suit"
	item_state = "bl_suit"
	mutantrace_variation = STYLE_DIGITIGRADE | STYLE_NO_ANTHRO_ICON
	can_adjust = TRUE

/obj/item/clothing/under/donator/bm/utilgen
	name = "GG-66"
	desc = "Aramid made uniform of a rising private defense company, with a purple planet(?) on the back and 6's on the shoulders"
	icon_state = "utilgen"
	item_state = "utilgen"
	mutantrace_variation = STYLE_DIGITIGRADE | STYLE_NO_ANTHRO_ICON
	can_adjust = FALSE

/obj/item/clothing/under/donator/bm/multicam
	name = "Multicam"
	desc = "A camouflage pattern designed for use in a wide range of environments and conditions which was specifically developed and is produced by SolFed company Crye Precision"
	icon_state = "multicam"
	item_state = "multicam"
	can_adjust = TRUE

/obj/item/clothing/under/plasmaman/security/reaper
	name = "Security Plasma Envirosuit"
	desc = "Plasmaman Envirosuit, retrofitted for combat exposure. There a purple planet on the back, with energy flowing in it."
	icon = 'modular_bluemoon/fluffs/icons/obj/clothing/under.dmi'
	mob_overlay_icon = 'modular_bluemoon/fluffs/icons/mob/clothing/under.dmi'
	icon_state = "gg_envirosuit"


/obj/item/clothing/under/donator/bm/nri_drg // civil variant of nri antagonist uniform
	name = "covert ops tactical uniform"
	desc = "A non-descript and slightly suspicious looking uniform."
	icon_state = "nri_drg"
	item_state = "nri_drg"
	icon = 'modular_bluemoon/kovac_shitcode/icons/rus/obj_drg.dmi'
	mob_overlay_icon = 'modular_bluemoon/kovac_shitcode/icons/rus/mob_drg.dmi'
	anthro_mob_worn_overlay = 'modular_bluemoon/kovac_shitcode/icons/rus/mob_drg_digi.dmi'
	can_adjust = FALSE
	unique_reskin = list(
		"Camo" = list("icon_state" = "nri_drg"),
		"Turtleneck" = list("icon_state" = "nri_drg_alt")
	)

/obj/item/clothing/under/donator/bm/battle_coat
	name = "battle coat"
	desc = "A Tatical uniform with hood."
	icon_state = "battle_coat"
	item_state = "bl_suit"

/obj/item/clothing/under/donator/bm/ellys_suit
	name = "Ellys Suit"
	desc = "A costume in white and black colors."
	icon_state = "ellys_uniform"
	item_state = "white_suit"
	mutantrace_variation = STYLE_DIGITIGRADE | STYLE_NO_ANTHRO_ICON
	can_adjust = FALSE

/obj/item/clothing/under/donator/bm/booma
	name = "Boomah Turtleneck"
	desc = "Водолазка выполненная под специальный заказ для служащих в группировке Бустеров. Выполнена в кремово-белом исполнении, с нанесенным характерным логотипом группировки."
	icon_state = "booma"
	item_state = "booma"
	can_adjust = TRUE

/obj/item/clothing/under/donator/bm/silky_body
	name = "Silky Body"
	desc = "A perfectly tailored bodysuit that fits the body and does not constrain you in any movements. Ties are visible on the sides so that you can adjust the force with which it fits your body."
	icon_state = "silky_body"
	item_state = "bl_suit"
	mutantrace_variation = STYLE_DIGITIGRADE
	can_adjust = FALSE

/obj/item/clothing/under/donator/bm/Frieren_skirt
    name = "Frieren skirt"
    desc = "Изысканный эльфийский наряд, что выполнен из нежной ткани и украшен золотыми нитями."
    icon_state = "Elf_skirt"
    item_state = "Elf_skirt"

/obj/item/clothing/under/donator/bm/Prosecutor_suit
    name = "Prosecutor_suit"
    desc = "Невероятный фиолетовый костюм, что бросается в ваши глаза выглядит довольно качественным, на него явно было потрачено не одна сотня тысяч кредитов, присмотревшись вы видите на кайме пиджака аккуратно пришита именная бирка 'Berly Blight'."
    icon_state = "Prosecutor_suit"
    item_state = "Prosecutor_suit"

/obj/item/clothing/under/donator/bm/monolith_uniform
	name = "Granite M1 ''Monolith'' uniform"
	desc = "The jumpsuit of the stalker from the Monolith group, the manufacturer is unknown. We thank you for the boon bestowed upon your servants. The monolith has shown us the sacred path, the path of unity with the monolith. We are all united in our faith. As long as we are united, we are invincible, damn the infidels who reject his path, for they are blind in their desires. Strength is in the unity of our brothers, blessed be the eternal strength given to us by the monolith in fulfillment of his will. Let's establish eternal order in the zone, brothers and sisters, and may eternal unity with the monolith come. GLORY TO THE MONOLITH."
	icon_state = "monolith"
	item_state = "monolith"
	can_adjust = FALSE
	lefthand_file = 'modular_bluemoon/fluffs/icons/mob/inhands/clothing_right.dmi'
	righthand_file = 'modular_bluemoon/fluffs/icons/mob/inhands/clothing_right.dmi'
