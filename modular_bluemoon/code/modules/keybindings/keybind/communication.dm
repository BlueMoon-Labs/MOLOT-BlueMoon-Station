/datum/keybinding/client/communication/activity
	hotkey_keys = list("ShiftM")
	name = "set_activity"
	full_name = "Set Activity"

/datum/keybinding/client/communication/activity/down(client/user)
	var/mob/living/L = user.mob
	L.set_activity()
	return TRUE

/datum/keybinding/client/communication/whisper_with_indicator
	hotkey_keys = list("Y")
	name = "whisper_with_indicator"
	full_name = "Whisper with Typing Indicator"

/datum/keybinding/client/communication/whisper_with_indicator/down(client/user)
	var/mob/M = user.mob
	M.whisper_typing_indicator()
	return TRUE
