/turf/open/water
	gender = PLURAL
	name = "water"
	desc = "Shallow water."
	icon = 'icons/turf/floors.dmi'
	icon_state = "riverwater_motion"
	baseturfs = /turf/open/chasm/lavaland
	initial_gas_mix = LAVALAND_DEFAULT_ATMOS
	planetary_atmos = TRUE
	slowdown = 1
	bullet_sizzle = TRUE
	bullet_bounce_sound = null //needs a splashing sound one day.

	footstep = FOOTSTEP_WATER
	barefootstep = FOOTSTEP_WATER
	clawfootstep = FOOTSTEP_WATER
	heavyfootstep = FOOTSTEP_WATER

/turf/open/water/safe
	initial_gas_mix = OPENTURF_DEFAULT_ATMOS
	planetary_atmos = FALSE

/turf/open/water/safe/electric
	name = "electric water"
	baseturfs = /turf/open/water/safe/electric
	initial_gas_mix = OPENTURF_DEFAULT_ATMOS
	color = COLOR_TEAL
	light_range = 2
	light_color = COLOR_TEAL

/turf/open/water/safe/electric/Entered(atom/movable/arrived, atom/old_loc, list/atom/old_locs)
	. = ..()
	if(isliving(arrived))
		var/mob/living/unlucky_mob = arrived
		unlucky_mob.Stun(1.5 SECONDS)
		unlucky_mob.Knockdown(10 SECONDS)
		unlucky_mob.adjustFireLoss(15)
		var/datum/effect_system/lightning_spread/s = new /datum/effect_system/lightning_spread
		s.set_up(5, 1, unlucky_mob.loc)
		s.start()
		unlucky_mob.visible_message(span_danger("[unlucky_mob.name] is shocked by [src]!"), \
		span_userdanger("You feel a powerful shock course through your body!"), \
		span_hear("You hear a heavy electrical crack!"))
