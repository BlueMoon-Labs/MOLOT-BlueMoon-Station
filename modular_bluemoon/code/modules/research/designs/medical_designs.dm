/datum/design/cyberimp_mantis
	name = "Mantis Blade Implant"
	desc = "A long, sharp, mantis-like blade installed within the forearm, acting as a deadly self defense weapon."
	id = "ci-mantis"
	build_type = PROTOLATHE
	materials = list (/datum/material/iron = 3500, /datum/material/glass = 1500, /datum/material/silver = 1500)
	construction_time = 200
	build_path = /obj/item/organ/cyberimp/arm/mantis_blade
	category = list("Medical Designs")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY //No, this 'weapon' is exclusive to the security department unless the mainteiners change their opinion.

/datum/design/cyberimp_scanner
	name = "Internal Medical Analyzer"
	desc = "This implant interfaces with a host's body, sending detailed readouts of the vessel's condition on command via the mind."
	id = "ci-scanner"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 5000, /datum/material/glass = 2500, /datum/material/silver = 2000, /datum/material/gold = 1500)
	build_path = /obj/item/organ/internal/cyberimp/chest/scanner
	category = list("Medical Designs")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/cyberimphealerext
	name = "External Healing Implant"
	desc = "This implant will slowly mend localized damage that it can find. This version mends only brute and fire injures!"
	id = "ci-healerext"
	build_type = PROTOLATHE
	construction_time = 40
	materials = list(/datum/material/iron = 10000, /datum/material/glass = 10000, /datum/material/silver = 6000, /datum/material/gold = 6000, /datum/material/diamond = 6000)
	build_path = /obj/item/organ/cyberimp/chest/healer
	category = list("Medical Designs")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY //To prevent scientist going rogue.

/datum/design/cyberimphealerint
	name = "Internal Healing Implant"
	desc = "This implant will slowly mend localized damage that it can find. This version filters out toxins, as well as considers any lack of oxygen in the bloodstream! "
	id = "ci-healerint"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 10000, /datum/material/glass = 10000, /datum/material/silver = 6000, /datum/material/gold = 6000, /datum/material/diamond = 6000)
	build_path = /obj/item/organ/cyberimp/chest/healertoxoxy
	category = list("Medical Designs")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/cyberimphealercortex
	name = "Revitalizing Cortex Implant"
	desc = "This attachable to the torso cortex optimizes the body's processes in order to preserve the body. Provides overall basic mending."
	id = "ci-cortex"
	build_type = PROTOLATHE
	construction_time = 40
	materials = list(/datum/material/iron = 10000, /datum/material/glass = 10000, /datum/material/silver = 6000, /datum/material/gold = 6000, /datum/material/diamond = 6000, /datum/material/bluespace = 6000)
	build_path = /obj/item/organ/cyberimp/chest/revitilzer
	category = list("Medical Designs")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/cyberimp_nutrimentpumpextreme
	name = "Nutriment pump implant EXTREME"
	desc = "This implant will synthesize and pump into your bloodstream a small amount of nutriment when you are hungry. This version of the pump also provides a proper water supply."
	id = "ci-pumpextreme"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 5000, /datum/material/glass = 5000, /datum/material/silver = 5000, /datum/material/gold = 5000)
	build_path = /obj/item/organ/cyberimp/chest/nutrimentextreme
	category = list("Medical Designs")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/binolenses
	name = "Binocular Lenses"
	desc = "A pair of binocular lenses, that can be attached to the eyes!"
	id = "ci-binolenses"
	build_type = PROTOLATHE | MECHFAB
	construction_time = 40
	materials = list(/datum/material/iron = 5000, /datum/material/glass = 6000, /datum/material/silver = 2000, /datum/material/diamond = 2000)
	build_path = /obj/item/organ/cyberimp/arm/lenses
	category = list("Medical Designs")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL | DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_SECURITY //Mmm, i don't see the reason not to give it to basically everyone.

//DATA CHIP. Expensive stuff for good chips.
/datum/design/medicalbrainchip
	name = "Advanced medical data chip"
	desc = "Special implant that was designed to help field operators with medical care for their fallen brethren. Allows advanced surgical procedures outside of the sterile conditions."
	id = "chip-medical"
	build_type = PROTOLATHE
	construction_time = 100
	materials = list(/datum/material/iron = 30000, /datum/material/glass = 30000, /datum/material/silver = 6000, /datum/material/gold = 6000, /datum/material/diamond = 6000, /datum/material/bluespace = 6000)
	build_path = /obj/item/organ/cyberimp/brainchip/medical
	category = list("Medical Designs")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL

/datum/design/engibrainchip
	name = "Advanced electrical data chip"
	desc = "Special implant that was designed to provide a quick learning for field engineers and inadept electricians."
	id = "chip-engi"
	build_type = PROTOLATHE
	construction_time = 100
	materials = list(/datum/material/iron = 30000, /datum/material/glass = 30000, /datum/material/silver = 6000, /datum/material/gold = 6000, /datum/material/diamond = 6000, /datum/material/bluespace = 6000)
	build_path = /obj/item/organ/cyberimp/brainchip/engi
	category = list("Medical Designs")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/roboticalbrainchip
	name = "Advanced robotical data chip"
	desc = "Special implant that was designed to provide a quick learning for inadept roboticians and on-field crew."
	id = "chip-robotic"
	build_type = PROTOLATHE
	construction_time = 100
	materials = list(/datum/material/iron = 30000, /datum/material/glass = 30000, /datum/material/silver = 6000, /datum/material/gold = 6000, /datum/material/diamond = 6000, /datum/material/bluespace = 6000)
	build_path = /obj/item/organ/cyberimp/brainchip/robotic
	category = list("Medical Designs")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE
