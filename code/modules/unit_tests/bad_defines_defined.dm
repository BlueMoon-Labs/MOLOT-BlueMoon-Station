/datum/unit_test/bad_defines_used/Run()
	var/force_map_check = FALSE
	#ifdef FORCE_MAP
	force_map_check = TRUE
	#endif
	var/lowmemorymode_check = FALSE
	#ifdef LOWMEMORYMODE
	lowmemorymode_check = TRUE
	#endif
	TEST_ASSERT_EQUAL(force_map_check + lowmemorymode_check, 0, "used [force_map_check ? "define FORCE_MAP" : ""][lowmemorymode_check ? "define LOWMEMORYMODE " : ""]. UNDEFINE THEM")
