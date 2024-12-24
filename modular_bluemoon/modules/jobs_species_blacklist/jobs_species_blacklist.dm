/datum/config_entry/flag/xeno_supremacy //forbids command positions for humans

/datum/job/New()
	if(CONFIG_GET(flag/xeno_supremacy))
		if(title in (GLOB.command_positions | GLOB.security_positions))
			species_blacklist += list(SPECIES_HUMAN)
	. = ..()
