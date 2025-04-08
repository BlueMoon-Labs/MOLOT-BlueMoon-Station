/mob/living/simple_animal/hostile/malf_drone/Life(seconds, times_fired)
	. = ..()
	if(.) // mob is alive. We check this just in case Life() can fire for qdel'ed mobs.
		if(times_fired % 15 == 0) // every 15 cycles, aka 30 seconds, 50% chance to switch between modes
			scramble_settings()
	if(health / maxHealth < 0.5)
		damage_coeff = list(BRUTE = 0.9, BURN = 1.1, TOX = 1, CLONE = 0, STAMINA = 0, OXY = 0)
	if(health / maxHealth >= 0.5)
		damage_coeff = list(BRUTE = 1.3, BURN = 0.8, TOX = 0, CLONE = 0, STAMINA = 0, OXY = 0)
