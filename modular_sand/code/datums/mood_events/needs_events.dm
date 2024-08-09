/datum/mood_event/quenched
	mood_change = 6

/datum/mood_event/quenched/add_effects(param)
	. = ..()
	var/mob/living/carbon/human/owner_mob = owner_mob()
	description = "<span class='nicegreen'>Я недавно попил[owner_mob.ru_a()].</span>\n"

/datum/mood_event/thirsty
	description = "<span class='warning'>Я начинаю испытывать жажду.</span>\n"
	mood_change = -8

/datum/mood_event/dehydrated
	description = "<span class='boldwarning'>У меня обезвоживание!</span>\n"
	mood_change = -15
