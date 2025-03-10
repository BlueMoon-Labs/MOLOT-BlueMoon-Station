/obj/item/choice_beacon/ert_mech
	name = "ERT mech beacon"
	desc = "To summon your own steel titan."

/obj/item/choice_beacon/ert_mech/generate_display_names()
	var/static/list/ert_mech_list = list("Marauder" = /obj/vehicle/sealed/mecha/combat/marauder/loaded,
		"Seraph" = /obj/vehicle/sealed/mecha/combat/marauder/seraph)
	if(!ert_mech_list)
		ert_mech_list = list()
		var/list/templist = typesof(/obj/item/storage/box/hero) //we have to convert type = name to name = type, how lovely!
		for(var/V in templist)
			var/atom/A = V
			ert_mech_list[initial(A.name)] = A
	return ert_mech_list

/obj/item/choice_beacon/nri_mech
	name = "NRI mech beacon"
	desc = "To summon your own steel titan. For the Emperor!"

/obj/item/choice_beacon/nri_mech/generate_display_names()
	var/static/list/nri_mech_list = list("TU-802 Solntsepyok" = /obj/vehicle/sealed/mecha/combat/durand/tu802,
		"Savannah-Ivanov" = /obj/vehicle/sealed/mecha/combat/savannah_ivanov/loaded)
	if(!nri_mech_list)
		nri_mech_list = list()
		var/list/templist = typesof(/obj/item/storage/box/hero) //we have to convert type = name to name = type, how lovely!
		for(var/V in templist)
			var/atom/A = V
			nri_mech_list[initial(A.name)] = A
	return nri_mech_list

/obj/item/choice_beacon/sol_mech
	name = "SolFed mech beacon"
	desc = "Feel the power of the tesla. Glory to the Humanity!"

/obj/item/choice_beacon/sol_mech/generate_display_names()
	var/static/list/sol_mech_list = list("Zeus" = /obj/vehicle/sealed/mecha/combat/durand/zeus)
	if(!sol_mech_list)
		sol_mech_list = list()
		var/list/templist = typesof(/obj/item/storage/box/hero) //we have to convert type = name to name = type, how lovely!
		for(var/V in templist)
			var/atom/A = V
			sol_mech_list[initial(A.name)] = A
	return sol_mech_list
