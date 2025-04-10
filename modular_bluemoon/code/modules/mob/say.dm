/mob/verb/whisper_typing_indicator()
	set name = "whisper_indicator"
	set hidden = TRUE
	set category = "Say"
	client?.last_activity = world.time
	display_typing_indicator(isSay = TRUE)
	var/message = input(src, "", "whisper") as text|null
	clear_typing_indicator()
	if(!length(message))
		return
	return whisper_verb(message)
