/datum/emote/sound/human/alien/gnarl
	key = "aliengnarl"
	key_third_person = "gnarls"
	message = "gnarls and shows its teeth..."

/datum/emote/sound/human/alien/hiss
	key = "alienhiss"
	key_third_person = "hisses"
	message = "шипит!"
	message_alien = "hisses."
	message_larva = "hisses softly."
	emote_cooldown = 2 SECONDS

/datum/emote/sound/human/alien/hiss/run_emote(mob/user, params)
	. = ..()
	if(. && isalienadult(user))
		playsound(user.loc, "hiss", 40, 1, 1)

/datum/emote/sound/human/alien/roar
	key = "alienroar"
	key_third_person = "roars"
	message_alien = "roars."
	message_larva = "softly roars."
	emote_type = EMOTE_AUDIBLE
	emote_cooldown = 5 SECONDS

/datum/emote/sound/human/alien/roar/run_emote(mob/user, params)
	. = ..()
	if(. && isalienadult(user))
		playsound(user.loc, 'sound/voice/hiss5.ogg', 40, 1, 1)
