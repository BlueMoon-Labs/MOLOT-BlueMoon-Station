#define BLOOD_STATE_POO			"poo"
#define BLOOD_COLOR_POO			"#572e00"




/obj/item/reagent_containers/food/snacks/poo
	name = "shit"
	desc = "Something brown... EWW!!"
	icon = 'modular_bluemoon/icons/obj/poop.dmi'
	icon_state = "poop2"
	filling_color = "#572e00"
	list_reagents = list(/datum/reagent/consumable/poo = 10)
	var/splat_type = /obj/effect/decal/cleanable/poo
	var/vapetime = FALSE

/obj/item/reagent_containers/food/snacks/poo/Initialize()
	name = pick(list("shit","turd","poop","crap","brownie","jobbie","log","trunk","doodie"))
	icon_state = pick(list("poop1", "poop2", "poop3","poop4","poop5","poop6","poop7"))
	. =..()

/obj/item/reagent_containers/food/snacks/poo/process()
	vapetime++
	var/turf/T = get_turf(src)
	if(vapetime > rand(5, 10))
		new /obj/effect/particle_effect/smoke/miasm(T)
		vapetime = 0

/obj/item/reagent_containers/food/snacks/poo/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	. = ..()
	if(!.)
		splat(hit_atom)

/obj/item/reagent_containers/food/snacks/poo/proc/splat(atom/movable/hit_atom)
	if(isliving(loc)) //someone caught us!
		return
	var/turf/T = get_turf(hit_atom)
	new/obj/effect/decal/cleanable/poo(T)
	if(ishuman(hit_atom))
		var/mob/living/carbon/human/H = hit_atom
		var/mutable_appearance/poooverlay = mutable_appearance('modular_bluemoon/icons/effects/pooeffect.dmi')
		poooverlay.icon_state = "poo_normal_1"
		H.adjust_blurriness(1)
		H.visible_message("<span class='warning'>[H] is smeared by [src]!</span>", "<span class='userdanger'>You've been smeared by [src]!</span>")
	playsound(T, 'sound/misc/splort.ogg', 50, TRUE)
	if(prob(70))
		qdel(src)



/datum/reagent/consumable/poo
	name = "Feces"
	description = "It's poo."
	reagent_state = LIQUID
	color = "#643200"
	taste_description = "literal shit"
	var/decal_path = /obj/effect/decal/cleanable/poo

/datum/reagent/consumable/poo/reaction_turf(var/turf/T)
	if(isturf(T))
		new /obj/effect/decal/cleanable/poo(T)



/obj/effect/particle_effect/smoke/miasm
	lifetime = 5
	color = "#758f40ff"
	alpha = 64

/obj/effect/particle_effect/smoke/miasm/smoke_mob(mob/living/carbon/M)
	if(prob(15))
		M.emote(pick("frown","grumble"))
	if(prob(0.5))
		to_chat(M, "<span class='userdanger'>КАК ЖЕ ВОНЯЕТ!!! Я БОЛЬШЕ НЕ МОГУ!!!</span>")
		M.vomit(10, distance = 3)
	SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "poo", /datum/mood_event/poo, name)

/datum/effect_system/smoke_spread/miasm
	effect_type = /obj/effect/particle_effect/smoke/miasm



/obj/effect/decal/cleanable/poo
	name = "poo stain"
	desc = "Gross..."
	icon = 'modular_bluemoon/icons/effects/pooeffect.dmi'
	icon_state = "floor1"
	random_icon_states = list("floor1","floor2","floor3","floor4","floor5","floor6","floor7","floor8")
	layer = ABOVE_NORMAL_TURF_LAYER
	blood_state = BLOOD_STATE_POO
	bloodiness = BLOOD_AMOUNT_PER_DECAL
	beauty = -100
	persistent = TRUE
	var/vapetime = FALSE

/obj/effect/decal/cleanable/poo/Initialize(mapload)
	. = ..()
	reagents.add_reagent(/datum/reagent/consumable/poo, 10)
	var/turf/T = get_turf(src)
	if(prob(1))
		new /obj/item/reagent_containers/food/snacks/poo(T)
	START_PROCESSING(SSobj, src)

/obj/effect/decal/cleanable/poo/process()
	vapetime++
	var/turf/T = get_turf(src)
	if(vapetime > rand(5, 10))
		new /obj/effect/particle_effect/smoke/miasm(T)
		vapetime = 0



/datum/mood_event/poo
	mood_change = -3
	timeout = 1 MINUTES

/datum/mood_event/poo/add_effects(param)
	description = "<span class='warning'>Фу! Воняет говном!</span>\n"

