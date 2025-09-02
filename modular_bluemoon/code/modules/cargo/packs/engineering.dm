/datum/supply_pack/engineering/gasminer
	name = "Gas miner"
	desc = "Here's a gas miner circuitboard, that can generate any of four next gases - oxygen, nitrogen, plasma and carbon dioxide. Requires activated pyroclastic anomaly core."
	cost = 5000
	contains = list(/obj/item/circuitboard/machine/gas_miner)
	crate_name = "gas miner circuitboard"
	crate_type = /obj/structure/closet/crate/secure/engineering

/datum/supply_pack/engineering/bfl
	name = "BFL assembly crate"
	cost = 10
	special = TRUE
	contains = list(
					/obj/item/circuitboard/machine/bfl_emitter,
					/obj/item/circuitboard/machine/bfl_receiver
					)
	crate_name = "BFL assembly crate"
	// required_tech = list("engineering" = 5, "powerstorage" = 4, "bluespace" = 6, "plasmatech" = 6)

/datum/supply_pack/engineering/bfl_lens
	name = "BFL High-precision lens"
	cost = 50
	special = TRUE
	contains = list(
					/obj/machinery/bfl_lens
					)
	crate_name = "BFL High-precision lens"
	// required_tech = list("materials" = 7, "bluespace" = 4)

/datum/supply_pack/engineering/bfl_goal
	name = "BFL Mission goal"
	cost = 10
	special = TRUE
	contains = list(
					/obj/structure/toilet/golden_toilet/bfl_goal
					)
	crate_name = "Goal crate"
