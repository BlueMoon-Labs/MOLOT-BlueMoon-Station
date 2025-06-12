/datum/interaction/handshake
	description = "Пожать руку."
	simple_message = "USER пожимает руку TARGET."
	required_from_user = INTERACTION_REQUIRE_HANDS
	required_from_target = INTERACTION_REQUIRE_HANDS
	interaction_sound = 'sound/weapons/thudswoosh.ogg'

/datum/interaction/pat
	description = "Похлопать по плечу."
	simple_message = "USER хлопает TARGET по плечу."
	required_from_user = INTERACTION_REQUIRE_HANDS
	interaction_sound = 'sound/weapons/thudswoosh.ogg'

/datum/interaction/cheer
	description = "Подбодрить!"
	required_from_user = INTERACTION_REQUIRE_MOUTH
	simple_message = "USER подбадривает TARGET радостными выкриками!"
	interaction_flags = NONE

/datum/interaction/highfive
	description = "Дать пять!"
	simple_message = "USER даёт пять TARGET!"
	interaction_sound = 'modular_sand/sound/interactions/slap.ogg'
	required_from_user = INTERACTION_REQUIRE_HANDS
	required_from_target = INTERACTION_REQUIRE_HANDS

/datum/interaction/headpat
	description = "Погладить по голове"
	simple_message = "USER headpats TARGET!"
	required_from_user = INTERACTION_REQUIRE_HANDS
	interaction_sound = 'sound/weapons/thudswoosh.ogg'

	p13target_emote = PLUG13_EMOTE_BASIC
	p13target_strength = PLUG13_STRENGTH_LOW_PLUS
	p13target_duration = PLUG13_DURATION_SHORT

/datum/interaction/fistbump
	description = "Удариться кулачками!"
	simple_message = "USER бьётся кулачком о кулачком TARGET! О да!"
	required_from_user = INTERACTION_REQUIRE_HANDS
	required_from_target = INTERACTION_REQUIRE_HANDS

/datum/interaction/pinkypromise
	description = "Пообещать что-то на мизинчиках."
	simple_message = "USER хватается своим мизинчиком за мизинчик TARGET! Клятва Мизинчиками! Давно пора!"
	required_from_user = INTERACTION_REQUIRE_HANDS
	required_from_target = INTERACTION_REQUIRE_HANDS

/datum/interaction/holdhand
	description = "Взяться за руку."
	simple_message = "USER хватается за руку TARGET."
	required_from_user = INTERACTION_REQUIRE_HANDS
	required_from_target = INTERACTION_REQUIRE_HANDS

/datum/interaction/salute
	description = "Исполнить Воинское Приветствие!"
	simple_message = "USER исполняет воинское приветствие при виде TARGET!"
	required_from_user = INTERACTION_REQUIRE_HANDS
	interaction_sound = 'sound/voice/salute.ogg'
	max_distance = 25
	interaction_flags = NONE

/datum/interaction/handwave
	description = "Помахать рукой."
	simple_message = "USER приветливо машет TARGET."
	required_from_user = INTERACTION_REQUIRE_HANDS
	max_distance = 25
	interaction_flags = NONE

/datum/interaction/bird
	description = "Показать Средний Палец"
	simple_message = "USER демонстрирует TARGET средний палец!"
	required_from_user = INTERACTION_REQUIRE_HANDS
	max_distance = 25
	interaction_flags = NONE
