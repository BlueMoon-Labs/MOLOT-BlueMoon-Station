// Custom flags were added for logic actions - lying should not prevent ~98% of all actions

/datum/action/item_action/toggle_helmet_light
	required_mobility_flags = NONE

/datum/action/item_action/toggle_helmet_mode
	required_mobility_flags = NONE

/datum/action/item_action/toggle_helmet
	required_mobility_flags = NONE

/datum/action/item_action/set_internals
	required_mobility_flags = NONE

/datum/action/item_action/toggle_gunlight
	required_mobility_flags = NONE

/datum/action/item_action/toggle_welding_screen
	required_mobility_flags = NONE
	icon_icon = 'icons/obj/clothing/hats.dmi'
	button_icon_state = "weldvisor" 			// for easier indication

/datum/action/item_action/toggle_hood
	required_mobility_flags = NONE
