/obj/item/clothing/neck/SMART_fabric_boatcloak
	name = "SMART-fabric boatcloak"
	desc = "The tissue is capable of changing its structure by reading small nerve impulses from the body."
	icon_state = "general"
	item_state = "general"
	icon = 'modular_bluemoon/fluffs/icons/obj/clothing/neck.dmi'
	mob_overlay_icon = 'modular_bluemoon/fluffs/icons/mob/clothing/neck.dmi'
	anthro_mob_worn_overlay = 'modular_bluemoon/fluffs/icons/mob/clothing/neck.dmi'
	actions_types = list(/datum/action/item_action/adjust)
	var/list/SMART_fabric_boatcloak_designs = list()


/obj/item/clothing/neck/SMART_fabric_boatcloak/Initialize(mapload)
	. = ..()
	SMART_fabric_boatcloak_designs = list(
		"Roboticist" = image(icon = src.icon, icon_state = "roboticist"),
		"Scientist" = image(icon = src.icon, icon_state = "scienist"),
		"Atmos" = image(icon = src.icon, icon_state = "atmos"),
		"Engineer" = image(icon = src.icon, icon_state = "engineer"),
		"General" = image(icon = src.icon, icon_state = "general"),
		)

/obj/item/clothing/neck/SMART_fabric_boatcloak/ui_action_click(mob/user)
	if(!istype(user) || user.incapacitated())
		return

	var/static/list/options = list("Roboticist" = "roboticist", "Scientist" = "scienist", "Atmos" = "atmos",
							"Engineer" = "engineer", "General" = "general")

	var/choice = show_radial_menu(user, src, SMART_fabric_boatcloak_designs, custom_check = FALSE, radius = 36, require_near = TRUE)

	if(src && choice && !user.incapacitated() && in_range(user,src))
		icon_state = options[choice]
		user.update_inv_neck()
		for(var/X in actions)
			var/datum/action/A = X
			A.UpdateButtons()
		to_chat(user, "<span class='notice'>Your SMART-fabric boatcloak now has a [choice] design!</span>")
		return TRUE
