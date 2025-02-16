/mob/living/verb/subtler_indicatored()
	set name = "Subtler Anti-Ghost (Indicator)"
	set category = "Say"
	// Check if say is disabled
	if(GLOB.say_disabled)
		// Warn user and return
		to_chat(usr, span_danger("Speech is currently admin-disabled."))
		return

	// Display typing indicator
	display_typing_indicator(isMe = TRUE)

	// Prompt user for text input
	var/input_message = input(usr, "Введите сообщение, которое увидят персонажи в упор к вам. Призраки его не увидят.", "Введите скрытое сообщение") as message|null

	// Remove typing indicator
	clear_typing_indicator()

	// Run subtle emote with input
	usr.emote("subtler", message = input_message)

// Добавляем в IC панель для хуманов
/mob/living/carbon/human/Initialize(mapload)
	add_verb(src, /mob/living/verb/subtler_indicatored)
	. = ..()

// Хоткей
/datum/keybinding/client/communication/subtler_indicatored
	hotkey_keys = list("Unbound")
	name = "Subtler (Indicatored)"
	full_name = "Subtler Anti-Ghost Emote (with indicator)"
	clientside = "subtler-anti-ghost-indicatored"
