/obj/item/clothing/accessory/ring/syntech/winterschock
	name = "Ouroboros"
	desc = "An expensive and personally customized version of the normalizer ring with few modifications"
	icon = 'modular_bluemoon/fluffs/icons/obj/clothing/gloves.dmi'
	icon_state = "ouroboros"
	var/current_normalized_size = 1
	var/max_normalized_size = 1
	var/min_normalized_size = 0.25

/obj/item/clothing/accessory/ring/syntech/winterschock/clothing_size_normalize(mob/living/user, slot, slot_to_check, owner)
	if(slot_to_check && slot != slot_to_check)
		return FALSE

	if(HAS_TRAIT(user, TRAIT_BLUEMOON_ANTI_NORMALIZER) && owner != user)
		to_chat(user, "<span class='warning'>\The [src] buzzes, as nothing changes.</span>")
		playsound(src, 'sound/machines/buzz-sigh.ogg', 50, 1)
		return FALSE

	if(user.GetComponent(/datum/component/size_normalized))
		to_chat(user, "<span class='warning'>\The [src] buzzes, being overwritten by another accessory.</span>")
		playsound(src, 'sound/machines/buzz-sigh.ogg', 50, 1)
		return FALSE

	user.AddComponent(/datum/component/size_normalized, wear=src, size_to_use = current_normalized_size)

/obj/item/clothing/accessory/ring/syntech/winterschock/proc/try_update_size(mob/living/carbon/human/user, force)
	var/datum/component/size_normalized/size_norm = user.GetComponent(/datum/component/size_normalized)
	if(!istype(size_norm) || !istype(user))
		return TRUE
	if(size_norm.attached_wear != src || size_norm.parent != user)
		return TRUE
	// Изменение размера если кольцо нацеплено
	var/mob/living/wearer = size_norm.parent
	size_norm.UnregisterSignal(wearer, COMSIG_MOB_RESIZED)	// Just in case
	if(!force)
		playsound(wearer, 'sound/effects/magic.ogg', 50, 1)
		wearer.flash_lighting_fx(3, 3, LIGHT_COLOR_PURPLE)
	wearer.update_size(current_normalized_size)
	size_norm.RegisterSignal(wearer, COMSIG_MOB_RESIZED, TYPE_PROC_REF(/datum/component/size_normalized, normalize_size))	// Just in case
	// Изменение размера если кольцо нацеплено end

/obj/item/clothing/accessory/ring/syntech/winterschock/AltClick(mob/user)
	. = ..()
	if(!user.canUseTopic(src, BE_CLOSE, ismonkey(user)))
		return
	var/size_select = tgui_input_number(usr, "Set prefered size ([min_normalized_size * 100]-[max_normalized_size * 100]%).", "Set Size", current_normalized_size * 100, max_normalized_size * 100, min_normalized_size * 100)
	if(!size_select) return
	current_normalized_size = clamp((size_select/100), max_normalized_size, min_normalized_size)
	to_chat(usr, "<span class='notice'>You set the size to [current_normalized_size * 100]%</span>")
	if(do_after(user, 10 SECONDS, user))
		try_update_size(user, FALSE)
	return TRUE
