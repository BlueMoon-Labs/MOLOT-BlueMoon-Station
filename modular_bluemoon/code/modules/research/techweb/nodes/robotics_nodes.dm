// Исследование для крутых роботехнических штук
/datum/techweb_node/superior_robotics
	id = "sup_robotics"
	display_name = "Superior Robotics"
	description = "Glory to Omnissiah!"
	prereq_ids = list("adv_biotech", "adv_bluespace", "adv_robotics")
	design_ids = list("roboliq")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 3500)

/datum/techweb_node/synthcooler_advanced
	id = "cooler_adv"
	display_name = "Advanced PCU"
	description = "Now with uranium elements for your needs."
	prereq_ids = list("adv_power", "adv_robotics")
	design_ids = list("cooler_advanced")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 3500)
