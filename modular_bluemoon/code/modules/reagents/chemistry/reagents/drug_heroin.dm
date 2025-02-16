/datum/reagent/drug/heroin
	name = "Героин"
	description = "Сильный опиоид"
	color = "#EFE5CB"
	reagent_state = LIQUID
	taste_description = "bitter"
	var/obj/effect/hallucination/simple/zavisimost/slova
	var/list/trip_types = list("prihod")
	var/current_trip
	overdose_threshold = 10
	addiction_threshold = 5
	metabolization_rate = 0.15
	metabolizing = FALSE

/datum/chemical_reaction/heroin
	name = "Героин"
	id = /datum/reagent/drug/heroin
	results = list(/datum/reagent/drug/heroin = 3)
	required_reagents = list(/datum/reagent/medicine/morphine = 1, /datum/reagent/consumable/ethanol = 2, /datum/reagent/medicine/sal_acid = 1, /datum/reagent/medicine/charcoal = 0.1)
	mix_message = "Смесь бурно реагирует, оставляя после себя молочного цвета порошок."
	required_temp = 390




/datum/reagent/drug/heroin/overdose_process(mob/living/M)
	if(prob(10))
		var/picked_option = rand(1,3)
		switch(picked_option)
			if(1)
				M.adjustToxLoss(rand(5,20), 0)
				. = TRUE
			if(2)
				M.losebreath += 10
				M.adjustOxyLoss(rand(5,15), 0)
				. = TRUE
			if(3)
				to_chat(M, "<b><big>Должно быть скоро все закончится...</big></b>")
				M.adjustOrganLoss(ORGAN_SLOT_HEART, 30)
				. = TRUE
	return ..() || .

/datum/reagent/drug/heroin/addiction_act_stage1(mob/living/M)
	var/datum/component/mood/mood = M.GetComponent(/datum/component/mood)
	mood.setSanity(min(mood.sanity, SANITY_DISTURBED))
	if(prob(10))
		M.emote(pick("twitch","shiver","frown"))
	..()

/datum/reagent/drug/heroin/addiction_act_stage2(mob/living/M)
	var/datum/component/mood/mood = M.GetComponent(/datum/component/mood)
	mood.setSanity(min(mood.sanity, SANITY_UNSTABLE))
	M.Jitter(5)
	if(prob(20))
		create_zavisimost(M)
	if(prob(20))
		M.emote(pick("twitch","shiver","frown"))
	..()

/datum/reagent/drug/heroin/addiction_act_stage3(mob/living/M)
	var/datum/component/mood/mood = M.GetComponent(/datum/component/mood)
	mood.setSanity(min(mood.sanity, SANITY_CRAZY))
	ADD_TRAIT(M, TRAIT_UNSTABLE, type)
	M.Jitter(15)
	if(prob(50))
		create_zavisimost(M)
	if(prob(40))
		M.emote(pick("twitch","gasp","frown"))
	..()

/datum/reagent/drug/heroin/addiction_act_stage4(mob/living/carbon/human/M)
	var/datum/component/mood/mood = M.GetComponent(/datum/component/mood)
	mood.setSanity(SANITY_INSANE)
	ADD_TRAIT(M, TRAIT_UNSTABLE, type)
	M.Jitter(20)
	if(prob(80))
		create_zavisimost(M)
	if(prob(10))
		M.losebreath+= 10
		M.adjustOxyLoss(5, 0)
	if(prob(50))
		M.emote(pick("twitch","drool", "gasp","realagony","frown"))
	..()
	. = 1




/datum/reagent/drug/heroin/on_mob_metabolize(mob/living/M)
	. = ..()

	M.add_client_colour(/datum/client_colour/heroin)
	SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "heroin", /datum/mood_event/heroin, name)
	var/datum/component/mood/mood = M.GetComponent(/datum/component/mood)
	mood.setSanity(SANITY_NEUTRAL)
	ADD_TRAIT(M, TRAIT_PAINKILLER, PAINKILLER_MORPHINE)
	M.throw_alert("painkiller", /atom/movable/screen/alert/painkiller)
	M.overlay_fullscreen("depression", /atom/movable/screen/fullscreen/scaled/depression, 3)
	M.clear_fullscreen("depression", 3000)
	M.overlay_fullscreen("flash", /atom/movable/screen/fullscreen/tiled/flash)
	M.clear_fullscreen("flash", 60)
	shake_camera(M, 30, 1)
	SEND_SOUND(M, sound('modular_bluemoon/sound/hallucinations/heroin/PhotoFlash.ogg', volume = 100))
	SEND_SOUND(M, sound(pick('modular_bluemoon/sound/hallucinations/heroin/HeroinRing2.ogg','modular_bluemoon/sound/hallucinations/heroin/HeroinRing1.ogg', \
	'modular_bluemoon/sound/hallucinations/heroin/HeroinRing3.ogg'),  volume = 70))
	to_chat(M, "<span class='warning'>В ушах начинает сильно гудеть!</span>")
	M.blur_eyes(60)
	M.Paralyze(30)

	..()
	. = 1

/datum/reagent/drug/heroin/on_mob_life(mob/living/M)
	var/list/screens = list(M.hud_used.plane_masters["[FLOOR_PLANE]"], M.hud_used.plane_masters["[GAME_PLANE]"], M.hud_used.plane_masters["[LIGHTING_PLANE]"])
	if(prob(85))
		var/rotation = max(min(round(current_cycle/4), 10),20)
		for(var/atom/movable/screen/plane_master/whole_screen in screens)
			if(prob(60))
				animate(whole_screen, transform = turn(matrix(), rand(1,rotation)), time = 150, easing = CIRCULAR_EASING)
				animate(transform = turn(matrix(), -rotation), time = 100, easing = CIRCULAR_EASING)
			if(prob(30))
				whole_screen.filters += filter(type="wave", x=20*rand() - 20, y=20*rand() - 20, size=rand()*0.1, offset=rand()*0.5, flags = WAVE_BOUNDED)
				animate(whole_screen, transform = matrix()*2, time = 40, easing = BOUNCE_EASING)
				addtimer(VARSET_CALLBACK(whole_screen, filters, list()), 1200)
			addtimer(VARSET_CALLBACK(whole_screen, filters, list()), 600)
	if(prob(10))
		M.Jitter(35)
		SEND_SOUND(M, sound(pick('modular_bluemoon/sound/hallucinations/heroin/HeroinPrihodRing.ogg', 'modular_bluemoon/sound/hallucinations/heroin/HeroinPrihodRing2.ogg', \
		'modular_bluemoon/sound/hallucinations/heroin/HeroinPrihodRing3.ogg','modular_bluemoon/sound/hallucinations/heroin/HeroinPrihodRing4.ogg'), volume = 100))
		M.emote(pick("twitch","drool","moan","realagony","gasp"))
		M.overlay_fullscreen("prihod", /atom/movable/screen/fullscreen/heroin, rand(1, 9))
		M.clear_fullscreen("prihod", rand(15, 60))
		M.client.ToggleFullscreen()
	M.adjustStaminaLoss(5, 0)
	REMOVE_TRAIT(M, TRAIT_UNSTABLE, type)
	var/high_message = pick("Ты в полном порядке","Ты чувствуешь себя спокойно","Вся боль в твоей жизни ушла","Будто бы можно жить дальше","Хорошо","Нормально")
	if(prob(5))
		to_chat(M, span_notice("<i> ... [high_message] ... </i>"))
	..()

/datum/reagent/drug/heroin/on_mob_end_metabolize(mob/living/M)
	var/list/screens = list(M.hud_used.plane_masters["[FLOOR_PLANE]"], M.hud_used.plane_masters["[GAME_PLANE]"], M.hud_used.plane_masters["[LIGHTING_PLANE]"])
	for(var/atom/movable/screen/plane_master/whole_screen in screens)
		animate(whole_screen, transform = matrix(), pixel_x = 0, pixel_y = 0, time = 200, easing = ELASTIC_EASING)
		addtimer(VARSET_CALLBACK(whole_screen, filters, list()), 200)
	M.remove_client_colour(/datum/client_colour/heroin)
	REMOVE_TRAIT(M, TRAIT_PAINKILLER, PAINKILLER_MORPHINE)
	M.clear_alert("painkiller", /atom/movable/screen/alert/painkiller)
	DIRECT_OUTPUT(M.client, sound(null))
	to_chat(M, "<b><big>Обратно в этот гнилой мир...</big></b>")
	..()




/atom/movable/screen/fullscreen/heroin
	icon = 'modular_bluemoon/icons/screen/heroin_fullscreen.dmi'
	plane = SPLASHSCREEN_PLANE
	screen_loc = "CENTER-7,SOUTH"
	icon_state = ""

/datum/client_colour/heroin
	colour = list(rgb(255, 40, 40), rgb(40, 255, 40), rgb(40, 40, 255), rgb(0, 0, 0))
	priority = 6




/obj/effect/hallucination/simple/zavisimost
	name = "А-оо"
	desc = "НЕЕЕТ!"
	image_icon = 'modular_bluemoon/icons/effects/heroin_phrases.dmi'
	image_state = "eshe1"
	var/list/states = list("dose1", "dose2", "dose3", "eshe1", "eshe2", "eshe3", "need1", \
		"need2", "need3", "want1", "want2", "want3", "more1", "more2", "more3", \
		"dozu1", "dozu2", "dozu3", "dai1", "dai2", "vmaz", "proshu")

/datum/reagent/drug/heroin/proc/create_zavisimost(mob/living/carbon/M)
	for(var/turf/T in orange(14,M))
		if(prob(3))
			if(!(locate(slova) in T.contents))
				slova = new(T, M)

/obj/effect/hallucination/simple/zavisimost/New(turf/location_who_cares_fuck, mob/living/carbon/M, forced = TRUE)
	image_state = pick(states)
	. = ..()
	SpinAnimation(rand(5, 40), TRUE, prob(50))
	pixel_x = (rand(-16, 16))
	pixel_y = (rand(-16, 16))
	animate(src, color = color_matrix_rotate_hue(rand(0, 360)), transform = matrix()*rand(1,3), time = 200, pixel_x = rand(-64,64), pixel_y = rand(-64,64), easing = CIRCULAR_EASING)
	QDEL_IN(src, rand(40, 200))




/datum/mood_event/heroin
	mood_change = 3
	timeout = 3600

/datum/mood_event/heroin/add_effects(param)
	description = "<span class='boldwarning'>Мне хорошо.</span>\n"




/obj/item/reagent_containers/syringe/heroin
	name = "syringe (heroin)"
	desc = "Contains heroin - a strong opioid."
	list_reagents = list(/datum/reagent/drug/heroin = 15)
