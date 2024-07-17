/datum/design/fusion_core
	name = "Fusion core"
	desc = "A high-tech energy source based on the principle of nuclear fusion. Mostly used in power armors."
	id = "fusion_core"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 10000, /datum/material/uranium = 15000, /datum/material/bluespace = 2500, /datum/material/plastic = 3000 )
	build_path = /obj/item/fusion_core
	category = list("Misc","Power Designs")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE
	min_security_level = SEC_LEVEL_BLUE
