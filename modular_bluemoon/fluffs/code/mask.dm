/obj/item/clothing/mask/magickitsune/equipped(mob/user, slot)
	. = ..()
	for(var/mob/living/M in get_hearers_in_view(4, user))
		if(!pickupsound)
			return
		if(!ishuman(user))
			return
		if(slot == ITEM_SLOT_MASK)
			if(!firstpickup)
				SEND_SOUND(M, sound('sound/magic/Smoke.ogg', volume = 50))
			else
				firstpickup = FALSE
				SEND_SOUND(M, sound('sound/magic/Smoke.ogg', volume = 50))
	return

/datum/component/fluff
	var/message_equip = "Kitsune magic appears!"
	var/message_drop = "Kitsune magic dissapears!"

/datum/component/fluff/Initialize(message_equip="Kitsune magic appears!", message_drop="Kitsune magic dissapears!", playsound_equip="/sound/magic/ForceWall.ogg", playsound_drop="/sound/magic/ForceWall.ogg")
	if(isitem(parent))
		RegisterSignal(parent, COMSIG_ITEM_EQUIPPED, PROC_REF(on_equip))
		RegisterSignal(parent, COMSIG_ITEM_DROPPED, PROC_REF(on_drop))
	else
		return COMPONENT_INCOMPATIBLE

/datum/component/fluff/proc/on_equip(datum/source, mob/equipper, slot)
	equipper.visible_message("<span class='warning'> [message_equip]</span>")

/datum/component/fluff/proc/on_drop(datum/source, mob/user)
	user.visible_message("<span class='warning'> [message_drop]</span>")

/obj/item/clothing/mask/paper/underhair
	name = "The paper mask"
	alternate_worn_layer = BACK_LAYER

/obj/item/clothing/mask/gas/syndicate/cool_version/mihana_mask
	name = "Andromeda Mask"
	desc = "A close-fitting tactical mask that can be connected to an air supply."
	icon_state = "mihana_mask"
