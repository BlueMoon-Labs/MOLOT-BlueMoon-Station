//Copypaste from clothing/suit/toggle but for underwear.

/obj/item/clothing/underwear/shirt/toggle //it should allow us to use togglename(questionmark)
    icon = 'icons/obj/clothing/suits.dmi'
    name = "This item should never be used. Ahelp if you somehow found this."
    var/togglename = null
    var/suittoggled = FALSE

/obj/item/clothing/underwear/shirt/toggle/AltClick(mob/user)
    . = ..()
    if(!user.canUseTopic(src, BE_CLOSE, ismonkey(user)))
        return
    suit_toggle(user)
    return TRUE

/obj/item/clothing/underwear/shirt/toggle/proc/on_toggle(mob/user) // override this, not suit_toggle, which does checks
    to_chat(usr, "<span class='notice'>You toggle [src]'s [togglename].</span>")

/obj/item/clothing/underwear/shirt/toggle/ui_action_click()
    suit_toggle()

/obj/item/clothing/underwear/shirt/toggle/proc/suit_toggle()
    set src in usr

    if(!can_use(usr))
        return FALSE

    on_toggle(usr)
    if(src.suittoggled)
        src.icon_state = "[initial(icon_state)]"
        src.suittoggled = FALSE
    else if(!src.suittoggled)
        src.icon_state = "[initial(icon_state)]_t"
        src.suittoggled = TRUE
    usr.update_inv_wear_suit()
    for(var/X in actions)
        var/datum/action/A = X
        A.UpdateButtons()

/obj/item/clothing/underwear/shirt/toggle/examine(mob/user)
    . = ..()
    . += "Alt-click on [src] to toggle the [togglename]."

//Copypaste ends

/obj/item/clothing/underwear/shirt/shoulderless_shirt
	name = "shoulderless shirt"
	desc = "Really shoulderless shirt."
	icon = 'modular_bluemoon/icons/obj/clothing/underwear.dmi'
	mob_overlay_icon = 'modular_bluemoon/icons/mob/clothing/underwear.dmi'
	icon_state = "shoulderless_shirt"
	item_state = "shoulderless_shirt"

/obj/item/clothing/underwear/shirt/garland_bra
	name = "garland bra"
	desc = "X-mas garland bra."
	icon = 'modular_bluemoon/icons/obj/clothing/underwear.dmi'
	mob_overlay_icon = 'modular_bluemoon/icons/mob/clothing/underwear.dmi'
	mutantrace_variation = STYLE_NO_ANTHRO_ICON
	icon_state = "garland_shirt"
	item_state = "garland_shirt"
