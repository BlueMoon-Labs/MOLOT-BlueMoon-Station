/obj/machinery/rnd/production/protolathe/bioaegis
	name = "Experimental Bio-Organical Printer"
	desc = "Experimental printer that can print advanced biological designs. Ruled illegal in several sectors under Nanotrasen banner."
	icon = 'modular_bluemoon/icons/obj/machines/research.dmi'
	icon_state = "protolathe"
	circuit = /obj/item/circuitboard/machine/protolathe/bioaegis
	categories = list(
								"Baseline Designs", //Very simple organs.
								"Advanced Designs", //Somewhat useful when you have resources.
								"Experimental Designs", //High-end stuff for extended with 7+ hours.
								"Xenochimeric Designs", //Xeno
								"Species-specific Designs", //Can be used for species with 'issues'.
								"Dangerous Designs" //High-risk, high-reward. If you die - it is on you. I will make some in the future, since otherwise project will be too big to be even released.
								)
	production_animation = "protolathe_n"
	allowed_buildtypes = BIOAEGIS
	console_link = FALSE
	requires_console = FALSE

/obj/item/circuitboard/machine/protolathe/bioaegis //Very experimental piece of tech, with heavy reliance on cutting-edge parts.
	name = "Bio-organical Printer (Machine Board)"
	icon_state = "abductor_mod"
	build_path = /obj/machinery/rnd/production/protolathe/bioaegis
	req_components = list(
		/obj/item/stack/cable_coil = 25,
		/obj/item/stock_parts/matter_bin/darkmatter = 5,
		/obj/item/stock_parts/manipulator/atto = 5,
		/obj/item/stock_parts/micro_laser/super_quadultra = 5,
		/obj/item/stock_parts/capacitor/giga = 2,
		/obj/item/reagent_containers/glass/beaker/ultimate = 2,
		/obj/item/stock_parts/scanning_module/unilatera_triphasic = 2)
