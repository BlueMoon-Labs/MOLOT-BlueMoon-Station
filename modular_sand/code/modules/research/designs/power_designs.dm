/datum/design/vortex_cell
	name = "Vortex Power Cell"
	desc = "A power cell that holds 60 MJ of energy and slowly recharge itself."
	id = "vortex_cell"
	build_type = PROTOLATHE | MECHFAB
	materials = list(/datum/material/iron = 800, /datum/material/gold = 3200, /datum/material/glass = 160, /datum/material/diamond = 1600, /datum/material/titanium = 300, /datum/material/bluespace = 750)
	construction_time=180
	build_path = /obj/item/stock_parts/cell/vortex/empty
	reagents_list = list(/datum/reagent/liquid_dark_matter = 15, /datum/reagent/bluespace = 15, /datum/reagent/teslium/energized_jelly = 30)
	category = list("Misc","Power Designs")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_ENGINEERING
