//Done by ckey: Tamamo-Noe Mae, all suggestions via BYOND DMs. Yes, even Victor, but i forgot the account's password so the new one(like 4'th probably)
/datum/map_template/shelter/victor //We have an entire alphabet, but i must make sure it will not overlap with the SPLURT's future updates.
	name = "Shelter Victor"
	shelter_id = "shelter_victor"
	description = "An extremely luxurious self-contained pressurized shelter, with \
		built-in pool, entertainment, vendors and a \
		sleeping area! Provided by KinkMate Corporation!"
	mappath = "modular_bluemoon/_maps/templates/shelter_510.dmm" //They won't make +510 shelters, right?

/datum/map_template/shelter/victor/New() //Default code for shelters to make sure it won't succumb to something 'weird'. Pasted to other capsules in order to prevent 'weirdness'
	. = ..()
	whitelisted_turfs = typecacheof(/turf/closed/mineral)
	banned_objects = typecacheof(/obj/structure/stone_tile)

/datum/map_template/shelter/arena //General gimmick: arena + pit to fight
	name = "Arena Shelter"
	shelter_id = "shelter_arena"
	description = "Syndicate-issued shelter pod for combat and training. Useful for training and pit fights!"
	mappath = "modular_bluemoon/_maps/templates/shelter_arena.dmm"

/datum/map_template/shelter/arena/New()
	. = ..()
	whitelisted_turfs = typecacheof(/turf/closed/mineral)
	banned_objects = typecacheof(/obj/structure/stone_tile)

/datum/map_template/shelter/pill //General gimmick: shelter so small you will no longer feel issues about the size
	name = "Pill Shelter"
	shelter_id = "shelter_pill"
	description = "The smallest capsule provided by NT department for 'research purposes'." //How much pill capsules does it take to stop 900x900 black powder detonation?
	mappath = "modular_bluemoon/_maps/templates/shelter_pill.dmm"

/datum/map_template/shelter/pill/New()
	. = ..()
	whitelisted_turfs = typecacheof(/turf/closed/mineral)
	banned_objects = typecacheof(/obj/structure/stone_tile)

/datum/map_template/shelter/greatest //General gimmick: The biggest and the overpriced-ish capsule
	name = "Greatest Shelter"
	shelter_id = "shelter_greatest"
	description = "Biggest capsule out here!"
	mappath = "modular_bluemoon/_maps/templates/shelter_greatest.dmm"

/datum/map_template/shelter/greatest/New()
	. = ..()
	whitelisted_turfs = typecacheof(/turf/closed/mineral)
	banned_objects = typecacheof(/obj/structure/stone_tile)

/*/datum/map_template/shelter/sexdom //General gimmick: Fuckdorm for futanari lmao
	name = "Dorm Shelter"
	shelter_id = "shelter_sexdom"
	description = "Lustwish-issued shelter capsule, for 'relaxation' during off-duty."
	mappath = "modular_bluemoon/_maps/templates/shelter_sexdom.dmm"

/datum/map_template/shelter/sexdom/New()
	. = ..()
	whitelisted_turfs = typecacheof(/turf/closed/mineral)
	banned_objects = typecacheof(/obj/structure/stone_tile)*/
