//Rating 5

/obj/item/stock_parts/capacitor/giga
	name = "giga capacitor"
	desc = "A capacity capacitor mixed with xenobio power storage breakthrough, used in the construction of a variety of devices."
	icon = 'modular_bluemoon/icons/obj/stock_parts.dmi'
	icon_state = "giga_capacitor"
	rating = 5
	custom_materials = list(/datum/material/iron=50, /datum/material/glass=50)

/obj/item/stock_parts/scanning_module/unilatera_triphasic
	name = "unilatera triphasic scanning module"
	desc = "A compact, unilatera ultra resolution triphasic scanning module made with bluespace compression and plasma phase shifting. Used in the construction of certain devices."
	icon = 'modular_bluemoon/icons/obj/stock_parts.dmi'
	icon_state = "unilatera_triphasic_scan_module"
	rating = 5
	custom_materials = list(/datum/material/iron=50, /datum/material/glass=20)

/obj/item/stock_parts/manipulator/atto
	name = "atto-manipulator"
	desc = "A joint engineered tiny manipulator, using plasma and alien designs for the most affective manipulation. Used in the construction of certain devices."
	icon = 'modular_bluemoon/icons/obj/stock_parts.dmi'
	icon_state = "atto_mani"
	rating = 5
	custom_materials = list(/datum/material/iron=30)

/obj/item/stock_parts/micro_laser/super_quadultra
	name = "super-quad-ultra micro-laser"
	icon = 'modular_bluemoon/icons/obj/stock_parts.dmi'
	icon_state = "super_quadultra_micro_laser"
	desc = "A tiny laser used in certain devices. It's laser being the finest point and high wattage is due to the breakthroughs in xenobio and bluespace storage."
	rating = 5
	custom_materials = list(/datum/material/iron=10, /datum/material/glass=20)

/obj/item/stock_parts/matter_bin/darkmatter
	name = "dark-matter bin"
	desc = "A container designed to hold compressed matter awaiting reconstruction."
	icon = 'modular_bluemoon/icons/obj/stock_parts.dmi'
	icon_state = "dark_matter_bin"
	rating = 5
	custom_materials = list(/datum/material/iron=80)

// Makeshift stock parts, manages to be worse than the default ones

/obj/item/stock_parts/matter_bin/makeshift
	name = "Makeshift matter bin"
	desc = "Some crude metal box."
	rating = 0.5

/obj/item/stock_parts/manipulator/makeshift
	name = "makeshift-manipulator"
	desc = "A metal device with a crude electro-magnetic coil made from cable."
	rating = 0.5
