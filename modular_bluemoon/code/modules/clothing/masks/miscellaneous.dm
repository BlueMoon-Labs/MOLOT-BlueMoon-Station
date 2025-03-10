/obj/item/clothing/mask/durak
	name = "Fools Village Clown Mask"
	desc = "For the Samogon!"
	icon_state = "durak"
	item_state = "durak"

/obj/item/clothing/mask/kindle
	name = "Kindred`s mask"
	desc = "Wooden mask with strange blue glow"
	icon = 'modular_bluemoon/icons/obj/clothing/masks.dmi'
	mob_overlay_icon = 'modular_bluemoon/icons/mob/clothing/masks.dmi'
	icon_state = "kindle"

/obj/item/clothing/mask/balaclava/breath/hijab
	name = "Polychromic Hijab"
	desc = "Inshallah"
	icon_state = "hijab_he"
	item_state = "hijab"
	icon = 'modular_bluemoon/icons/obj/clothing/masks.dmi'
	mob_overlay_icon = 'modular_bluemoon/icons/mob/clothing/masks.dmi'
	anthro_mob_worn_overlay = 'modular_bluemoon/icons/mob/clothing/mask_muzzled.dmi'
	flags_inv = HIDEFACE|HIDEFACIALHAIR|HIDEEARS|HIDEHAIR
	visor_flags_inv = HIDEFACE|HIDEFACIALHAIR
	mutantrace_variation = STYLE_MUZZLE|STYLE_NO_ANTHRO_ICON
	clothing_flags = ALLOWINTERNALS
	actions_types = list(/datum/action/item_action/adjust)
	var/list/poly_colors = list("#ffffff")

/obj/item/clothing/mask/balaclava/breath/hijab/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/polychromic, poly_colors, 1)

/obj/item/clothing/mask/muzzle/mouthring
	name = "Mouth ring"
	desc = "Provides oral plessure without partner`s consent."
	icon = 'modular_bluemoon/icons/obj/clothing/masks.dmi'
	mob_overlay_icon = 'modular_bluemoon/icons/mob/clothing/masks.dmi'
	anthro_mob_worn_overlay = 'modular_bluemoon/icons/mob/clothing/mask_muzzled.dmi'
	icon_state = "mouthring"
	item_state = "mouthring"
	flags_cover = null // рот открыт
