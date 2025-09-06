/obj/structure/closet/crate/secure/radiation
	desc = "A crate with a lock on it and with radiation sign on it to store all of your uranium rods."
	name = "secure radiation crate"
	icon = 'modular_bluemoon/icons/obj/crates.dmi'
	icon_state = "radiation_secure_crate"
	rad_flags = RAD_PROTECT_CONTENTS | RAD_NO_CONTAMINATE

/obj/structure/closet/crate/secure/engineering/bfl/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_NO_TELEPORT, INNATE_TRAIT)
