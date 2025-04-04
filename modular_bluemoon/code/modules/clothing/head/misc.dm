/obj/item/clothing/head/npc_questhuh_hat
	name = "NPC Hat"
	desc = "The hat that looks like a big question..."
	icon = 'modular_bluemoon/icons/obj/clothing/hats.dmi'
	mob_overlay_icon = 'modular_bluemoon/icons/mob/clothing/large-worn-icons/32x48/head.dmi'
	icon_state = "huh"
	item_state = "huh"

/obj/item/clothing/head/npc_questhey_hat
	name = "NPC Hat"
	desc = "The hat that looks like a big exclamation mark..."
	icon = 'modular_bluemoon/icons/obj/clothing/hats.dmi'
	mob_overlay_icon = 'modular_bluemoon/icons/mob/clothing/large-worn-icons/32x48/head.dmi'
	icon_state = "hey"
	item_state = "hey"

/obj/item/clothing/head/hcaberet
	name = "HCA beret"
	desc = "A black beret with a silver sun, around which rays spread. The symbol of the Triad of the Sun - the main idea of the political party Human Commonwealth. Glory to Humanity!"
	icon_state = "hcaberetitem"
	item_state = "hcaberetitem"
	icon = 'modular_bluemoon/icons/obj/clothing/hats.dmi'
	mob_overlay_icon = 'modular_bluemoon/icons/mob/clothing/hats.dmi'
	strip_delay = 60
	dog_fashion = null

/obj/item/clothing/head/beret/chronos
	name = "new mecca beret"
	desc = "But burning those villages, watching those naked peasants cry..."
	icon = 'modular_bluemoon/icons/obj/clothing/hats.dmi'
	mob_overlay_icon = 'modular_bluemoon/icons/mob/clothing/hats.dmi'
	icon_state = "torch_beret"

/obj/item/clothing/head/turban
	name = "Polychromic Turban"
	desc = "Идёт караван из Ирана.."
	icon = 'modular_bluemoon/icons/obj/clothing/hats.dmi'
	mob_overlay_icon = 'modular_bluemoon/icons/mob/clothing/hats.dmi'
	icon_state = "turban_he"
	item_state = "turban"
	var/list/poly_colors = list("#ffffff")

/obj/item/clothing/head/turban/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/polychromic, poly_colors, 1)

/obj/item/clothing/head/cracked_pot
	name = "Cracked pot"
	desc = "It looks extremely stupid, but for some reason wearing it makes you feel proud."
	flags_inv = HIDEHAIR|HIDEFACIALHAIR|HIDEEARS|HIDESNOUT
	icon = 'modular_bluemoon/icons/obj/clothing/hats.dmi'
	mob_overlay_icon = 'modular_bluemoon/icons/mob/clothing/hats.dmi'
	icon_state = "cracked_pot"
