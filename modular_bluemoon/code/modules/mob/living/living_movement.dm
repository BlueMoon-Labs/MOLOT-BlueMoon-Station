// Дополняет /mob/living/proc/update_pull_movespeed() в code\modules\mob\living\living_movement.dm
// PULL_SLOWDOWN
/datum/movespeed_modifier/pull_slowdown
	variable = TRUE
	blacklisted_movetypes = (FLYING|FLOATING)
