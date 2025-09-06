// check PROCESSING_SUBSYSTEM_DEF(aura)
#define BONFIRE_HEALING_POWER_SMALL 0.17	// ~ 0.5 hp per second
#define BONFIRE_HEALING_POWER_MEDIUM 0.33  	// ~ 1 hp per second
#define BONFIRE_HEALING_POWER_HIGH 0.5 		// ~ 1.5 hp per second

/obj/structure/bonfire/prelit/ash
	name = "ashen bonfire"
	desc = "Томно тлеющий меч, вонзенный в умиротворенно горящую кучу вулканического пепла. Сам по себе удивителен тот факт, что она так хорошо горит. \
			Вблизи пламени этого необычного костровища ощущается безопасность и покой."
	icon = 'modular_bluemoon/icons/obj/structures/ashen_bonfire.dmi'
	icon_state = "ashen_bonfire"
	burn_icon = "ashen_bonfire"
	max_integrity = 100
	var/obj/item/melee/smith/coiled_sword/sword
	var/legendary_sword = FALSE
	var/healing_power = BONFIRE_HEALING_POWER_MEDIUM

/obj/structure/bonfire/prelit/ash/Initialize(mapload, obj/item/melee/smith/coiled_sword/S)
	. = ..()
	if(istype(S))
		S.forceMove(src)
		sword = S
	else
		sword = new(src)
	begin_restoration()

/obj/structure/bonfire/prelit/ash/Destroy()
	visible_message("<i>Пепел затухает навсегда, теряя свои необычные свойства, а меч покрывается еле-заметными трещинами.</i>")
	for(var/i = 1 to 5)
		new /obj/effect/decal/cleanable/ash(get_turf(src))
	if(istype(sword) && !QDELETED(sword))
		sword.forceMove(drop_location())
		sword.take_damage(sword.max_integrity/3, sound_effect = 0)
		if(QDELETED(sword))
			visible_message(span_warning("Хрупкий витой меч рассыпается в прах."))
	. = ..()

/obj/structure/bonfire/prelit/ash/examine(mob/user)
	. = ..()
	if(legendary_sword)
		. += span_engradio("Раскаленный до красна клинок ярко переливается в густых языках пламени!")
	else
		switch(healing_power)
			if(BONFIRE_HEALING_POWER_SMALL)
				. += span_engradio("Слабое пламя едва колышется от малейшего дуновения ветра...")
			if(BONFIRE_HEALING_POWER_MEDIUM)
				. += span_engradio("Умеренное пламя ощущается стабильным и спокойным.")
			if(BONFIRE_HEALING_POWER_HIGH)
				. += span_engradio("Пышные языки пламени бурно возносятся вверх!")

/obj/structure/bonfire/prelit/ash/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/stack/rods))
		return
	else
		. = ..()

/obj/structure/bonfire/prelit/ash/proc/begin_restoration()
	if(QDELETED(sword))
		return
	var/mutable_appearance/sword_underlay = mutable_appearance('modular_bluemoon/icons/obj/structures/ashen_bonfire.dmi', "sword_inserted")
	sword_underlay.pixel_y = 16
	underlays += sword_underlay
	for(var/mob/living/L in view(src, 1))
		to_chat(L, span_engradio("<span class='italics'>Ты ощущаешь необычное спокойствие и умиротворение от теплого костра..."))
	// quality ranges in /dofinish() intercept and are really awfully organized.
	if(isnull(sword.quality)) // simply spawned
		healing_power = BONFIRE_HEALING_POWER_MEDIUM
	else if(sword.quality <= 1) // awful - normal
		healing_power = BONFIRE_HEALING_POWER_SMALL
	else if(1 < sword.quality && sword.quality < 7.5) // above-average - excellent
		healing_power = BONFIRE_HEALING_POWER_MEDIUM
	else if(7.5 <= sword.quality && sword.quality < 10) // masterwork
		healing_power = BONFIRE_HEALING_POWER_HIGH
	else if(10 <= sword.quality) //legendary
		healing_power = BONFIRE_HEALING_POWER_HIGH
		legendary_sword = TRUE
		var/mutable_appearance/big_fire_overlay = mutable_appearance('icons/obj/hydroponics/equipment.dmi', "bonfire_on_fire_intense", ABOVE_OBJ_LAYER)
		big_fire_overlay.pixel_y = 8
		add_overlay(big_fire_overlay)
	AddComponent( \
					/datum/component/aura_healing, \
					range = 1, \
					brute_heal = healing_power, \
					burn_heal = healing_power, \
					toxin_heal = healing_power, \
					suffocation_heal = healing_power, \
					stamina_heal = healing_power, \
					blood_heal = healing_power, \
					organ_healing = list(ORGAN_SLOT_BRAIN = healing_power), \
					simple_heal = healing_power, \
					healing_color = COLOR_ORANGE, \
					stackable = FALSE, \
				)

/obj/structure/bonfire/prelit/ash/process()
	if(legendary_sword && prob(10))
		for(var/mob/living/carbon/human/H in view(src, 1))
			var/datum/wound/W = pick(H.all_wounds)
			if(W)
				W.remove_wound()
				to_chat(H, span_engradio("Тепло пламени костра трепетно затягивает твои раны."))
				break
	. = ..()

/obj/structure/bonfire/prelit/ash/StartBurning()
	. = ..()
	if(!burning)
		visible_message(span_danger("[src] не смог разгореться."))
		addtimer(CALLBACK(src, PROC_REF(extinguish)), 1 SECONDS, TIMER_DELETE_ME)

/obj/structure/bonfire/prelit/ash/extinguish()
	. = ..()
	qdel(src)

#undef BONFIRE_HEALING_POWER_SMALL
#undef BONFIRE_HEALING_POWER_MEDIUM
#undef BONFIRE_HEALING_POWER_HIGH
