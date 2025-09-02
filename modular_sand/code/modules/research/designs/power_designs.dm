/datum/design/vortex_cell
	name = "Vortex Power Cell"
	desc = "A power cell that holds 60 MJ of energy and slowly recharge itself."
	id = "vortex_cell"
	build_type = PROTOLATHE | MECHFAB
	materials = list(/datum/material/iron = 800, /datum/material/gold = 120, /datum/material/glass = 160, /datum/material/diamond = 160, /datum/material/titanium = 300, /datum/material/bluespace = 300)
	construction_time=180
	build_path = /obj/item/stock_parts/cell/vortex/empty
	reagents_list = list(/datum/reagent/liquid_dark_matter = 5, /datum/reagent/bluespace = 5, /datum/reagent/teslium/energized_jelly = 10)
	category = list("Misc","Power Designs")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_ENGINEERING
