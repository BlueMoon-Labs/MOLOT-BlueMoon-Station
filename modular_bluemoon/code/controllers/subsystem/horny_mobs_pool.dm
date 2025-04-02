/* UNTICKED
SUBSYSTEM_DEF(horny_mobs_pool)
	name = "Horny Mobs Pool"
	flags = SS_KEEP_TIMING | SS_NO_INIT
	priority = FIRE_PRIORITY_NPC
	runlevels = RUNLEVEL_GAME | RUNLEVEL_POSTGAME

	var/list/horny_mobs = list()
	/// catches sleeping
	var/invoking = FALSE
	/// Invoke start time
	var/invoke_start = 0

/datum/controller/subsystem/horny_mobs_pool/stat_entry(msg)
	var/list/activelist = horny_mobs[AI_ON]
	msg = "Horny Mobs:[length(activelist)]"
	return ..()

/datum/controller/subsystem/horny_mobs_pool/fire(resumed = FALSE)
	while(horny_mobs.len)
		var/mob/living/simple_animal/hostile/tentacles/T = horny_mobs[horny_mobs.len]
		--horny_mobs.len

		invoking = TRUE
		invoke_start = world.time
		INVOKE_ASYNC(src, PROC_REF(invoke_process), T)
		if(invoking)
			stack_trace("WARNING: [T] ([T.type]) slept during Horny Mobs Pool processing.")
			invoking = FALSE

		if (MC_TICK_CHECK)
			return

/datum/controller/subsystem/horny_mobs_pool/proc/invoke_process(mob/living/simple_animal/hostile/tentacles/T)
	T.do_lewd_action(T.target_sex)
*/
