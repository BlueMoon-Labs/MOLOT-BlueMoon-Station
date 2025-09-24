//Jessie Added this
/datum/design/bluespace_cell_reactor
	name = "Bluespace Reactor P. Cell (DANGER: Radioactive)"
	desc = "A power cell that holds 10 MJ of energy."
	id = "bluespace_cell_reactor"
	build_type = PROTOLATHE | MECHFAB
	materials = list(/datum/material/iron = 1200, /datum/material/gold = 260, /datum/material/glass = 360, /datum/material/diamond = 560, /datum/material/titanium = 600, /datum/material/bluespace = 1200, /datum/material/uranium = 2600)
	reagents_list = list(/datum/reagent/bluespace = 10)
	construction_time=100
	build_path = /obj/item/stock_parts/cell/bluespacereactor
	category = list("Misc","Power Designs")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/vortex_cell
	build_type = PROTOLATHE
	category = list("Power Designs")
