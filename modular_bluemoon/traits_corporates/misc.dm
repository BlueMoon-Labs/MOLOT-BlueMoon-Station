/datum/language/corpspeak
	name = "Corpspeak"
	desc = "NT corporative language to allow communication between employees, can be learned only by special nanorobots insertion."
	key = "_"
	default_priority = 0
	flags =  LANGUAGE_HIDE_ICON_IF_NOT_UNDERSTOOD // TONGUELESS_SPEECH bluemoon change
	icon_state = "corpspeak"
	icon = 'modular_bluemoon/icons/misc/language.dmi'
	syllables = list(
		"money", "profit", "stocks", "corp", "goi", "gold", "trade", "shares", "employees",
		"ja", "no", "zer", "gre", "klag", "nio", "tr", "gur", "der", "tod", "org", "com",
		"log", "mar", "ver", "str", "gu", "ru", "la", "da", "g", "z", "j", "r", "u", "o"
	)

/datum/quirk/proc/give_item(obj/item/item_path, mob/living/carbon/human/H)
	var/list/slots = list(
		"backpack" = ITEM_SLOT_BACKPACK,
		"left pocket" = ITEM_SLOT_LPOCKET,
		"right pocket" = ITEM_SLOT_RPOCKET
	)

	var/T = new item_path(H)
	var/item_name = initial(item_path.name)
	var/where = H.equip_in_one_of_slots(T, slots, critical = TRUE)
	if(!where)
		to_chat(H, "<span class='userdanger'>Unfortunately, you weren't able to get a [item_name]. This is very bad and you should adminhelp immediately (press F1).</span>")
		return FALSE
	else
		to_chat(H, "<span class='danger'>You have a [item_name] in your [where].</span>")
		if(where == "backpack")
			SEND_SIGNAL(H.back, COMSIG_TRY_STORAGE_SHOW, H)
		return TRUE
