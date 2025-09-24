/obj/item/clothing/gloves/toggled
	actions_types = list(/datum/action/item_action/toggle_gloves)
	var/active = FALSE
	var/active_overlay_color = "#FF0000"
	var/desc_ability = "Has ability to do nothing"

/obj/item/clothing/gloves/toggled/proc/toggle(mob/living/carbon/human/user)
	active = !active
	if(user && user.gloves == src)
		use_buffs(user, active)
	update_icon_state()
	update_icon()

/obj/item/clothing/gloves/toggled/update_overlays()
	. = ..()
	var/mutable_appearance/active_overlay = mutable_appearance('modular_bluemoon/fluffs/icons/obj/misc.dmi', "active")
	active_overlay.color = active_overlay_color
	cut_overlay(active_overlay)
	if(active)
		add_overlay(active_overlay)

/obj/item/clothing/gloves/toggled/ui_action_click(mob/user, actiontype)
	. = ..()
	if(!ishuman(user))
		return
	var/datum/action/item_action/button = actiontype
	if(!button || button.type != /datum/action/item_action/toggle_gloves)
		return
	toggle(user)

/obj/item/clothing/gloves/toggled/CtrlClick(mob/user)
	. = ..()
	if(isturf(loc) || !ishuman(user))
		return
	toggle(user)

/obj/item/clothing/gloves/toggled/equipped(mob/user, slot)
	. = ..()
	if(slot == ITEM_SLOT_GLOVES && active)
		use_buffs(user, TRUE)

/obj/item/clothing/gloves/toggled/dropped(mob/user)
	. = ..()
	if(active)
		use_buffs(user, FALSE)

// What effect will apply
/obj/item/clothing/gloves/toggled/proc/use_buffs(mob/living/carbon/human/user, buff)
	if(!user)
		return FALSE

/obj/item/clothing/gloves/toggled/examine(mob/user)
	. = ..()
	. += span_notice("Ctrl-click to [active ? "activate" : "deactivate"] ability.")
	. += span_notice(desc_ability)

/obj/item/clothing/gloves/toggled/hug
	desc_ability = "You can activate the built-in micro-drives, allowing you to quickly pet creatures, but safety protocols will not allow you to attack anyone and use weapons."
	active_overlay_color = "#00FF00"

/obj/item/clothing/gloves/toggled/hug/use_buffs(mob/living/carbon/human/user, buff)
	. = ..()
	if(. == FALSE)
		return .
	if(buff)
		ADD_TRAIT(user, TRAIT_NOGUNS, GLOVE_TRAIT)
		ADD_TRAIT(user, TRAIT_PACIFISM, GLOVE_TRAIT)
	else
		REMOVE_TRAIT(user, TRAIT_NOGUNS, GLOVE_TRAIT)
		REMOVE_TRAIT(user, TRAIT_PACIFISM, GLOVE_TRAIT)

/obj/item/clothing/gloves/toggled/hug/Touch(mob/target, proximity = TRUE)
	if(!isliving(target))
		return

	var/mob/living/M = loc

	if(M.a_intent != INTENT_HELP)
		return FALSE
	if(target.stat != CONSCIOUS) //Can't hug people who are dying/dead
		return FALSE
	else
		M.SetNextAction(CLICK_CD_RAPID)

	return NO_AUTO_CLICKDELAY_HANDLING | ATTACK_IGNORE_ACTION
