/* - REDMOON REMOVAL START - убираем отвратительные эмоуты
/datum/emote/sound/human/fart/run_emote(mob/living/user, params, type_override, intentional)
	. = ..()
	if(!farted_on_something)
		if(HAS_TRAIT(user, TRAIT_CLUMSY) && prob(50))
			confettigibs(user)
			user.adjustToxLoss(-2)
			for(var/A in user.reagents.reagent_list)
				var/datum/reagent/reagent = A
				user.reagents.remove_reagent(reagent.type, 2)
- REDMOON REMOVAL END*/

/proc/confettigibs(atom/location)
	new /obj/effect/gibspawner/confetti(get_turf(location))

/obj/effect/gibspawner/confetti
	gibtypes = list(/obj/effect/decal/cleanable/confetti, /obj/effect/decal/cleanable/confetti, /obj/effect/decal/cleanable/confetti, /obj/effect/decal/cleanable/confetti)
	gibamounts = list(3, 2, 1, 1)
	sound_to_play = 'sound/items/party_horn.ogg'
	sound_vol = 30

/obj/effect/gibspawner/confetti/New()
	gibdirections = list(GLOB.alldirs, GLOB.alldirs, GLOB.alldirs, list())
	..()
